# naver-blog-draft

사진·영상과 대화로 네이버 블로그 글을 만들고, 컴퓨터 유즈로 스마트에디터 ONE에 옮겨 **임시저장까지** 진행하는 Codex·Claude Code 스킬 초안입니다.

**상태: v0.1.5 초안. 실제 네이버 계정에서의 업로드·임시저장·재열람은 아직 검증하지 않았습니다.** 자동 발행·예약 발행·반복 게시 기능은 포함하지 않습니다. `daily-vlog`와 독립적으로 사용할 수 있으며, 완성된 브이로그를 첨부 자료로 받을 수 있습니다.

## 설치

파일과 명령 실행을 지원하는 Codex 또는 Claude Code에서 작업할 프로젝트를 열고, 아래 내용을 그대로 보내세요. 운영체제 선택이나 Python·Git 사전 설치는 필요 없습니다.

> https://github.com/macro-ai-lab/naver-blog-draft
>
> README를 읽고 이 기능을 설치해줘. 내 실행 환경과 폴더 권한을 확인해서 맞는 방법으로 진행하고, 기존 파일과 개인 지침은 보존해줘. 설치 후 실제 사용 가능한 도구까지 점검해줘. 네이버 글 작성이나 업로드는 아직 하지 마.

에이전트가 [설치 절차](INSTALLATION.md)에 따라 환경·허용 경로·기존 설치를 확인합니다. 설치 범위와 실제 점검 결과를 알려주며, 프로젝트에 설치했다면 이후에도 그 프로젝트에서 사용합니다. 설치 과정에 필요한 접근 승인은 앱 안내에 따라 확인합니다.

ZIP을 사용하는 경우에도 **[설치 ZIP](https://github.com/macro-ai-lab/naver-blog-draft/releases/latest/download/naver-blog-draft-install.zip)**을 풀고 폴더를 현재 에이전트에 전달해 같은 문장으로 요청하면 됩니다. 설치 파일을 운영체제별로 직접 고를 필요가 없습니다. 공개 다운로드에는 GitHub 계정이 필요 없으며 Codex·Claude Code 설치·로그인과 이용 요금은 별개입니다.

Windows에서도 계정·폴더 소유자가 CodexSandbox라는 이름만으로 설치를 거부하지 않습니다. 기존 설치·수정본·개인 지침·설치 기록·잠금 보호는 유지하고 실제 권한 오류가 발생한 단계를 보고합니다. 사용자에게 별도 CMD 실행을 요구한 것을 자동 설치 성공으로 표시하지 않습니다. 이 블로그 기능은 편집 런타임이 없어 Python이 필요 없습니다.

**파일 설치만으로 컴퓨터 유즈·파일 첨부 권한이나 네이버 로그인이 추가되지는 않습니다.** 실행 도구 자체가 실패하면 재설치를 반복하지 않고 실패 단계를 구분합니다. 컴퓨터 유즈를 사용할 수 없으면 원고 작성까지만 가능합니다.

스킬이 인식되면 다음처럼 자연어로 요청합니다. 직접 호출할 때 Codex는 `$naver-blog-draft`, Claude Code는 `/naver-blog-draft`를 사용합니다.

> 이 사진들로 주말 일기를 같이 만들자. 글이 정리되면 네이버 블로그에 옮겨서 임시저장해줘.

사용 환경에는 네이버 웹 에디터를 조작하고 로컬 파일을 첨부할 수 있는 컴퓨터·브라우저 도구가 필요합니다. 이 저장소 자체가 브라우저를 실행하는 독립 프로그램은 아닙니다. 로그인이나 추가 인증은 사용자가 진행합니다. 원고 상담만 할 때에는 브라우저가 필요하지 않습니다.

개인 지침은 스킬 폴더 밖의 `<클라이언트 설정 폴더>/naver-blog-draft/preferences.md`에 저장합니다. 기본 경로는 Codex `~/.codex/naver-blog-draft/preferences.md`, Claude Code `~/.claude/naver-blog-draft/preferences.md`입니다. 이번 요청이 개인 지침보다 우선하며, 개인 지침은 배포 기본값보다 우선합니다. 업데이트할 때에는 스킬 폴더만 교체하고 개인 지침은 유지합니다.

## 검증 계획

검증 당일 [수동 검증 항목](VALIDATION.md)에 따라 테스트합니다. Mac 설치기는 임시 설치 경로에서 신규 설치·재실행·수정본 보호·개인 지침 보존을 검증했습니다. 설치기는 공통 템플릿을 사용하며 계정·폴더 소유자 이름에 따른 선제 차단을 제거했습니다. 실제 파일 생성·쓰기·잠금 결과로 판단합니다. Windows 실제 에이전트 세션의 재검증은 별도로 기록합니다. [설치 검증 기록](INSTALLATION-VALIDATION.md)을 참고하세요. 설치 검사와 스킬 형식 검사는 컴퓨터 유즈와 네이버 저장 성공을 의미하지 않습니다.

개인 사진, 원고, 계정 정보, 브라우저 세션, 실제 작업 기록은 배포물에 포함하지 않습니다.

## 지원 클라이언트

자동 설치 대상은 **Codex와 로컬 Claude Code**입니다. 같은 설치 요청을 보내면 에이전트가 자기 클라이언트·운영체제·폴더 권한에 맞는 설치기를 실행합니다. 프로젝트 설치는 Codex의 `.agents/skills`, Claude Code의 `.claude/skills`로 나뉩니다. 사용자 범위는 각각 `CODEX_HOME/skills`(기본 `~/.codex/skills`), `CLAUDE_CONFIG_DIR/skills`(기본 `~/.claude/skills`)입니다. 클라이언트 설정 폴더를 직접 지정했다면 절대경로를 사용합니다.

설치 기록으로 다음 실행에서도 클라이언트와 범위를 찾습니다. 개인 지침은 각 클라이언트의 설정 폴더 안, 스킬 폴더 밖에 따로 보존합니다. 다른 클라이언트의 개인 지침을 자동으로 가져오거나 설정 파일·전역 PATH를 바꾸지 않습니다.

일반 Claude 채팅·Cowork는 이번 자동 설치 대상에 포함하지 않습니다. [환경별 점검 결과](COMPATIBILITY.md)에서 자동 설치 코드 검증과 실제 클라이언트 실행 검증을 구분해 확인하세요. 실제 Claude Code의 스킬 탐색·호출, Windows 실기 및 네이버 실계정 작업은 아직 검증 전입니다.

근거: [Claude Code 스킬 설치 범위](https://code.claude.com/docs/en/skills), [Claude Code 설정 폴더](https://code.claude.com/docs/en/claude-directory).

## 설치기 유지보수

두 프로젝트는 같은 [설치·배포 스킬](_maintenance/skill-distribution/SKILL.md)과 템플릿을 사용합니다. 새 기능을 배포할 때도 네 경우의 설치와 최종 ZIP을 검사합니다. 사용자는 이 관리 스킬을 별도로 설치할 필요가 없습니다. [GitHub 설치 검사](https://github.com/macro-ai-lab/naver-blog-draft/actions/workflows/installation.yml)는 macOS·Windows 네이티브에서 Codex·Claude Code용 경로의 프로젝트/사용자 설치를 검사합니다. 실제 에이전트 세션의 스킬 인식·이미지 열람·계정 작업 검증과는 구분합니다.
