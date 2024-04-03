## Meta Repo

이 레포지토리를 clone 하여 여러 레포지토리를 관리할 수 있습니다

### 1. meta 모듈을 로컬 시스템에 설치합니다

```
npm i -g meta
```

### 2. 레포지토리를 새로 만들거나 연결합니다

- 새로 만들기
    - `meta project create [folder] [repo url]`
- 기존 레포지토리 연결하기
    - `meta project import [folder] [repo url]`

### 3. 연결했다면 .meta 파일에 연결 정보가 추가된 것을 확인할 수 있습니다

```
meta project import stop_bang_main https://github.com/STOPBANG/stop_bang
meta project import stop_bang_login_logout https://github.com/STOPBANG/stop_bang_login_logout
```

명령어를 위와 같이 사용한 경우 아래와 같이 내용이 구성됩니다


```
{
  "projects": {
    "stop_bang_main": "https://github.com/STOPBANG/stop_bang",
    "stop_bang_login_logout": "https://github.com/STOPBANG/stop_bang_login_logout"
  }
}
```

### 4. meta 명령어를 통해 레포지토리를 한 번에 pull 받거나 status를 볼 수 있습니다

```
meta git update
meta git fetch
meta git pull
meta git push
meta git status
...
```

출력 결과

```
user@pc stop_bang_msa % meta git push

/path/to/stop_bang_msa:
Everything up-to-date
/path/to/stop_bang_msa ✓

stop_bang_main:
Everything up-to-date
stop_bang_main ✓

stop_bang_login_logout:
Everything up-to-date
stop_bang_login_logout ✓
```

### 📚 참고

https://github.com/mateodelnorte/meta