기본 Git 명령어
저장소 생성 및 복제

git init: 새로운 Git 저장소 초기화

git clone [url]: 원격 저장소 복제

변경사항 관리

git add [파일명]: 특정 파일의 변경사항을 스테이징 영역에 추가

git add .: 모든 변경사항을 스테이징 영역에 추가

git commit -m "[메시지]": 스테이징된 변경사항을 커밋

브랜치 관리

git branch: 브랜치 목록 확인

git branch [브랜치명]: 새 브랜치 생성

git checkout [브랜치명] 또는 git switch [브랜치명]: 브랜치 전환

git merge [브랜치명]: 현재 브랜치에 다른 브랜치 병합

원격 저장소 작업

git push origin [브랜치명]: 로컬 변경사항을 원격 저장소에 푸시

git pull: 원격 저장소의 변경사항을 로컬로 가져와 병합

상태 확인

git status: 워킹 디렉토리 상태 확인

git log: 커밋 히스토리 조회

기타

git diff: 변경사항 비교

touch .gitignore: .gitignore 파일 생성 (추적 제외 파일 관리)