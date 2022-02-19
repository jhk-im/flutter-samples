# flutter-samples

## Git Commit 관리

### Commit Message 구조

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### type : 제목

-> [build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test]

### Git Hooks

```text
* pre-commit : 커밋 메시지를 작성하기 전에 실행하기
* prepare-commit-msg : 커밋 메시지 생성 후 편집기 실행전에 실행하기
* commit-msg : 커밋 메시지와 관련된 명령을 넣을 때 실행하기
* post-commit : 커밋이 완료되면 실행하기
* pre-push : 푸시가 실행되기 전에 실행하기 / 푸시 중단
```

#### husky : git hooks 를 편리하게 사용할 수 있음

```bash
npx husky-init && npm install       # npm
npx husky-init && yarn              # Yarn 1
yarn dlx husky-init --yarn2 && yarn # Yarn 2

npx husky add .husky/commit-msg 'npx --no-install commitlint --edit "$1"'
```
