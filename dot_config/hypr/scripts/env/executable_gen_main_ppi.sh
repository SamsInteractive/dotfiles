#!/usr/bin/env bash
set -euo pipefail

ws=1
out="$HOME/.config/hypr/settings/primary-ppi.conf"
ref_ppi=165.54

# Reference values from your 27" 4K monitor config
ref_input_w=250
ref_input_h=60
ref_input_outline=2
ref_input_x=0
ref_input_y=50

ref_time_font=90
ref_time_x=0
ref_time_y=400

ref_date_font=25
ref_date_x=0
ref_date_y=320

mon="$(
  hyprctl workspacerules | awk -v ws="$ws" '
    $1=="Workspace" && $3==(ws ":") { in_rule=1; next }
    /^Workspace rule/               { in_rule=0 }
    in_rule && $1=="monitor:"       { print $2; exit }
  '
)"

if [[ -z "${mon:-}" ]]; then
  echo "Failed to find monitor for workspace $ws" >&2
  exit 1
fi

read -r wpx hpx wmm hmm < <(
  hyprctl monitors | awk -v mon="$mon" '
    $1=="Monitor" && $2==mon { in_mon=1; next }
    $1=="Monitor"            { in_mon=0 }

    in_mon {
      if ($0 ~ /[0-9]+x[0-9]+@/) {
        line = $0
        sub(/^[[:space:]]*/, "", line)
        split(line, a, /[x@ ]+/)
        w = a[1]
        h = a[2]
      }

      if ($0 ~ /physical size \(mm\): [0-9]+x[0-9]+/) {
        line = $0
        sub(/.*physical size \(mm\): /, "", line)
        split(line, a, /x/)
        print w, h, a[1], a[2]
        exit
      }
    }
  '
)

if [[ -z "${wpx:-}" || -z "${hpx:-}" || -z "${wmm:-}" || -z "${hmm:-}" ]]; then
  echo "Failed to parse monitor data for $mon" >&2
  exit 1
fi

awk \
  -v wpx="$wpx" -v hpx="$hpx" -v wmm="$wmm" -v hmm="$hmm" -v ref_ppi="$ref_ppi" \
  -v ref_input_w="$ref_input_w" -v ref_input_h="$ref_input_h" \
  -v ref_input_outline="$ref_input_outline" \
  -v ref_input_x="$ref_input_x" -v ref_input_y="$ref_input_y" \
  -v ref_time_font="$ref_time_font" -v ref_time_x="$ref_time_x" -v ref_time_y="$ref_time_y" \
  -v ref_date_font="$ref_date_font" -v ref_date_x="$ref_date_x" -v ref_date_y="$ref_date_y" \
'
function iround(x) {
  return int(x + 0.5)
}

function clamp_min(x, minv) {
  return (x < minv ? minv : x)
}

BEGIN {
  diag_px = sqrt((wpx * wpx) + (hpx * hpx))
  diag_in = sqrt((wmm * wmm) + (hmm * hmm)) / 25.4
  ppi = diag_px / diag_in
  scale = ppi / ref_ppi

  if (scale > 0.999 && scale < 1.001)
    scale = 1

  input_w       = clamp_min(iround(ref_input_w * scale), 1)
  input_h       = clamp_min(iround(ref_input_h * scale), 1)
  input_outline = clamp_min(iround(ref_input_outline * scale), 1)
  input_x       = iround(ref_input_x * scale)
  input_y       = iround(ref_input_y * scale)

  time_font     = clamp_min(iround(ref_time_font * scale), 1)
  time_x        = iround(ref_time_x * scale)
  time_y        = iround(ref_time_y * scale)

  date_font     = clamp_min(iround(ref_date_font * scale), 1)
  date_x        = iround(ref_date_x * scale)
  date_y        = iround(ref_date_y * scale)

  printf "$SCALE = %.3f\n", scale
  printf "$INPUT_W = %d\n", input_w
  printf "$INPUT_H = %d\n", input_h
  printf "$INPUT_OUTLINE = %d\n", input_outline
  printf "$INPUT_X = %d\n", input_x
  printf "$INPUT_Y = %d\n", input_y
  printf "$TIME_FONT = %d\n", time_font
  printf "$TIME_X = %d\n", time_x
  printf "$TIME_Y = %d\n", time_y
  printf "$DATE_FONT = %d\n", date_font
  printf "$DATE_X = %d\n", date_x
  printf "$DATE_Y = %d\n", date_y
}
' > "$out"
