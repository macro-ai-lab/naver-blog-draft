#!/bin/bash
set -euo pipefail
BUNDLE="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$BUNDLE/naver-blog-draft"
SKILLS="${CODEX_HOME:-$HOME/.codex}/skills"
TARGET="$SKILLS/naver-blog-draft"
STAGE=""
LOCK=""
cleanup() {
  if [[ -n "$STAGE" && -d "$STAGE" ]]; then rm -rf "$STAGE"; fi
  if [[ -n "$LOCK" ]]; then rmdir "$LOCK" 2>/dev/null || true; fi
}
trap cleanup EXIT
if [[ ! -f "$SOURCE/SKILL.md" ]]; then
  echo '스킬 파일이 없습니다. ZIP을 완전히 압축 해제한 뒤 다시 실행하세요.' >&2
  exit 1
fi
mkdir -p "$SKILLS"
if ! mkdir "$SKILLS/.naver-blog-draft-install.lock" 2>/dev/null; then
  echo '다른 설치가 진행 중이거나 이전 설치가 중단되었습니다. Codex에 확인을 요청하세요.' >&2
  exit 1
fi
LOCK="$SKILLS/.naver-blog-draft-install.lock"
if [[ -e "$TARGET" || -L "$TARGET" ]]; then
  if [[ ! -L "$TARGET" && -d "$TARGET" ]] && diff -qr "$SOURCE" "$TARGET" >/dev/null; then
    echo '같은 스킬이 이미 설치되어 있습니다. 새 Codex 채팅에서 사용하세요.'
    exit 0
  fi
  echo '다른 버전 또는 수정된 스킬이 있어 덮어쓰지 않았습니다. Codex에 갱신을 요청하세요.' >&2
  exit 1
fi
STAGE="$(mktemp -d "$SKILLS/.naver-blog-draft-install.XXXXXX")"
cp -R "$SOURCE/." "$STAGE/"
mv "$STAGE" "$TARGET"
STAGE=""
echo '네이버 블로그 스킬 설치 완료!'
echo '새 Codex 채팅에서 사진과 함께 “네이버 블로그 글을 만들고 임시저장해줘”라고 요청하세요.'
