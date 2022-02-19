# animations_clone

## flutter 구성

### Packages

#### pubspec.yaml

node.js = package.json / java = build.gradle 과 같은 패키지 의존성 관리

```yaml
name: animations_clone
descriptions : A new Flutter project.

# 앱 버전 및 빌드 번호 정의
# 버전은 점으로 구분된 3개의 숫자로 구분되며 +1 과 같이 빌드번호를 표시 
version: 1.0.0+1

environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
    
  # Cupertino 아이콘 폰트 추가
  # IOS 스타일 아이콘으로 CupertinoIcons 클래스를 통해 사용
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^1.0.0

flutter:
  # Material 디자인 추가
  # Android 스타일 아이콘 / Material 클래스를 통해 사용 
  uses-material-design: true
  assets:
    - assets/
```

---

#### analysis_options.yaml

- 린트 규칙을 설정하여 개발속도 향상
- const 를 활용하여 컴파일 타임을 늘려 런타임 줄임
- required 같은 예약어들의 에러를 컴파일 타임에서 발견할 수 있음 

```yaml
include: ../analysis_options.yaml

linter:
  rules:
    # Required because of the numbered sources in  lib/src/basics
    file_names: false
```

---

#### project_name.iml

안드로이드 스튜디오에서 생성한 프로젝트 내부 파일 

---