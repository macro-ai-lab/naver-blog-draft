# naver-blog-draft v0.1.5 설치 호환성

2026-10-23. 공통 설치 정책 2026-10-23.1을 daily-vlog v017과 함께 적용합니다. macOS·네이티브 Windows x64 × Codex·로컬 Claude Code 네 경우를 지원하는 설치 코드를 제공합니다. 프로젝트/사용자 설치, 개인 지침·수정본·설치 기록·잠금 보호를 같은 템플릿에서 생성합니다. 계정·폴더 소유자 이름이 CodexSandbox라는 이유만으로 선제 거부하지 않습니다. 실제 파일 생성·쓰기·잠금 결과로 판단하고 ACL·소유권은 바꾸지 않습니다.

| 경우 | 자동 검사 | 실제 세션/계정 상태 |
| --- | --- | --- |
| macOS · Codex | 최종 ZIP 파일 설치·재실행·개인 지침/수정본 보호 | 네이버 UI·첨부·임시저장 미검증 |
| macOS · Claude Code | 같은 OS 검사와 .claude 경로 검사 | 실제 Claude Code 세션 미검증 |
| Windows x64 · Codex | GitHub 네이티브 OS 검사 제공 | 블로그의 실제 Windows 에이전트 세션 미검증 |
| Windows x64 · Claude Code | GitHub 네이티브 OS 검사 제공 | 실제 Claude Code 세션 미검증 |

검사 결과는 해당 커밋의 Installation matrix와 아티팩트에서 확인합니다. CI는 설치 경로의 client 값을 명시하는 검사이며 Codex/Claude Code 모델 계정으로 로그인하지 않습니다. 영상용 런타임·doctor/smoke는 이 제품에 필요하지 않으며 Python을 설치하지 않습니다. 파일 설치만으로 컴퓨터 유즈·파일 첨부·네이버 로그인이 추가되지 않습니다.

브이로그 Windows 실기 성공 보고를 이 블로그의 실계정 성공으로 확대하지 않습니다. 설치 점검만을 위해 네이버에 접속하거나 사진을 업로드하지 않습니다. 일반 Claude 채팅·Cowork·WSL·모바일 단독 UI 자동화는 이 설치 계약의 대상 밖입니다. 새 채팅의 스킬 인식, 다른 계정 접근, 네이버 작성·첨부·임시저장·재열람은 별도 시험입니다.
