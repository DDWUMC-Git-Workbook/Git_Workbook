#git이란?
- **파일의 변경 기록을 저장해 줌(파일 내 변화를 기록하고 찾아주는 것)**
- **예전 버전으로 되돌릴 수 있음**
- **여러 사람이 같이 작업해도 충돌 없이 관리 가능(여러 명이 한 파일(또는 폴더)에 접근해 개별적으로 작업하고, 작업 결과를 기록으로서 반영하는 시스템)**

#Working directory/Staging Area/Local Repository
1. Working directory: 내가 현재 작업하고 있는 공간(폴더), 워킹 디렉토리 내의 파일의 변경사항은 추적됨(.gitignore로 추적 제외될 파일 지정가능)

2. Staging Area: 파일의 변경사항을 반영
추적되는 파일의 상태
(1) 변경 없음(unmodified): 변경되지 않은 파일
(2) 변경됨(modified): 변경된 파일
(3) 스테이지됨(staged): commit을 위한 준비 단계, modified된 파일 중 선택적으로 해당 파일을 stage해서 해당 파일만 커밋할 수 있도록 하는 것(+commit: 변경 사항이 생긴 modified 상태일 때 체크포인트를 만드는 일/add:modified된 파일을 stage하는 것)

3. Local Repository:  commit을 통해 파일의 변경 사항을 기록하는 곳(반영하고 싶은 변경 사항을 add를 통해 staged 상태로 만들고, 이후 commit을 통해 최종적으로 local repository에 반영)
->로컬에서 반영된 변경사항은 push를 통해 원격 레포지토리에 반영

#브랜치란?
- **작업하는 독립적인 영역**
- **개발자들이 동시에 작업하지만 서로에게 영향을 끼치지 않도록 처리해주는 것**
##브랜치 생성 및 이동
생성: git branch (브랜치 이름)
이동: git checkout (브랜치 이름)/git switch (브랜치 이름)(switch 사용 권고)

#커밋 기록 확인하기
1. git log: 커밋들의 기록을 살펴보기(커밋 로그 살펴보기)
2. HEAD: 현재 브랜치의 최신 커밋를 참조하는 값으로, 현재 내가 위치하고 있는 브랜치의 최신 커밋을 포인터로 가리키고 있음
- **HEAD는 현재 내가 바라보고 있는 브랜치의 가장 최신 commit을 가리킴**
- **commit 691ceb4268ec2c5b2d1afd79dd41f5783dcfac46 (HEAD -> tardy): HEAD는 tardy 브랜치의 commit 691ceb4268ec2c5b2d1afd79dd41f5783dcfac46 커밋을 가리키고 있다는 뜻**

#Issue와 PR이란?
##Issue
팀원들과 프로젝트의 작업 진행 현황과 기능 구현, 버그 수정, 리팩토링 등을 공유하기 위해 Issue를 생성
###Issue의 구성요소
- **이슈 제목: 작업 태그(feature/fix...)와 대략적인 작업 요약 등등**
- **이슈 내용: 작업할 브랜치, to-do 등등**
- **Assignees: 이슈를 작업할 담당자 할당**
- **Labels: 작업 태그 할당**
- **Projects, Milestone**
- **Development: 이슈와 연결된 브랜치 또는 PR을 연결**
##PR(Pull Request)
메인 브랜치에게 Pull을 받아줄 것을 요청(Request)하는 것
작업한 내용을 메인 브랜치로 반영을 위해 작성
