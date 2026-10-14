#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TEST_DIR="$ROOT_DIR/tests"
PROGRAMS=(
    "$ROOT_DIR/p.lol"
    "$ROOT_DIR/llm/p1.lol"
    "$ROOT_DIR/llm/p2.lol"
)
LCI="${LCI:-lci}"

if ! command -v "$LCI" >/dev/null 2>&1; then
    printf 'Erreur : interpréteur LOLCODE "%s" introuvable.\n' "$LCI" >&2
    exit 2
fi

if [[ ! -d "$TEST_DIR" ]]; then
    printf 'Erreur : dossier de tests introuvable : %s\n' "$TEST_DIR" >&2
    exit 2
fi

for program in "${PROGRAMS[@]}"; do
    if [[ ! -f "$program" ]]; then
        printf 'Erreur : programme introuvable : %s\n' "$program" >&2
        exit 2
    fi
done

shopt -s nullglob
inputs=("$TEST_DIR"/*.in)

if ((${#inputs[@]} == 0)); then
    printf 'Erreur : aucun fichier .in trouvé dans %s\n' "$TEST_DIR" >&2
    exit 2
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf -- "$tmp_dir"' EXIT

program_failures=()
program_passed=()
for _ in "${PROGRAMS[@]}"; do
    program_failures+=(0)
    program_passed+=(0)
done

for input in "${inputs[@]}"; do
    expected="${input%.in}.out"
    name="${input##*/}"

    if [[ ! -f "$expected" ]]; then
        printf 'ÉCHEC %s : sortie attendue absente (%s)\n' "$name" "${expected##*/}"
        for index in "${!PROGRAMS[@]}"; do
            program_failures[index]=$((program_failures[index] + 1))
        done
        continue
    fi

    for index in "${!PROGRAMS[@]}"; do
        program="${PROGRAMS[index]}"
        program_name="${program##*/}"
        actual="$tmp_dir/${program_name%.lol}_${name%.in}.actual"

        if ! "$LCI" "$program" < "$input" > "$actual"; then
            printf 'ÉCHEC %s / %s : le programme a terminé avec une erreur\n' "$program_name" "$name"
            program_failures[index]=$((program_failures[index] + 1))
            continue
        fi

        if diff -u -- "$expected" "$actual"; then
            printf 'OK     %s / %s\n' "$program_name" "$name"
            program_passed[index]=$((program_passed[index] + 1))
        else
            printf 'ÉCHEC %s / %s : la sortie ne correspond pas à %s\n' "$program_name" "$name" "${expected##*/}"
            program_failures[index]=$((program_failures[index] + 1))
        fi
    done
done

has_failures=0
printf '\nBilan par programme :\n'
for index in "${!PROGRAMS[@]}"; do
    program_name="${PROGRAMS[index]##*/}"
    printf '%s : %d réussite(s), %d échec(s).\n' \
        "$program_name" "${program_passed[index]}" "${program_failures[index]}"
    if ((program_failures[index] > 0)); then
        has_failures=1
    fi
done

if ((has_failures)); then
    exit 1
fi

printf '\nTous les tests sont réussis pour chaque programme.\n'