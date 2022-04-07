# ImageSearchAppUsingSpecificAPI

# Introduction

**이미지 검색 RestApi를 이용**해 검색어가 입력되면 해당 검색어를 쿼리로하여 지정된 숫자만큼의 데이터 요청과 추가 데이터 요청이 가능하고 데이터 요청 결과에 담긴 내용을 그리드 형태로 표시하는 앱입니다. 

# 사용한 기술

| UI | SwiftUI |
| --- | --- |
| 네트워킹 | Combine, URLSession, Alamofire |
| 아키텍처 | MVVM |
| 라이브러리 | KingFisher |

---

# 구현 사항

- ~~검색어가 입력되고 1초 뒤 검색 시작~~
- ~~검색어 변경 시 목록이 리셋된 후 다시 데이터를 표시.~~
- ~~데이터는 30개씩 페이징 처리합니다.~~
- ~~30개 데이터를 가져온 후 스크롤 시 30개의 데이터를 추가로 가져와서 Grid(3 x 3)형태로 표시합니다.~~
- ~~검색 결과가 없을 경우 화면에 안내 문구를 표시합니다.(='검색 결과가 없습니다.')~~
- ~~검색 결과 목록 중 하나를 탭했을 때 전체 화면으로 이미지를 표시합니다. 이때, 좌우 여백은 0이고, 이미지 비율은 유지합니다.~~
- ~~이미지가 세로로 길 경우 스크롤 됩니다.~~
- ~~response데이터에 데이터 출처'display_sitename', 문서 작성시간 'datetime'이 있을 경우 전체 화면 이미지 밑에 표시해 줍니다.~~



# 구현 화면
- 검색어 입력 후 1초 뒤 검색 시작 + 목록 리셋 

| 검색어 입력 후 1초 뒤 검색 시작 + 목록 리셋 | 검색 결과 없을 때 문구 표시 및 검색어 재입력 시 검색 결과 다시 표시 |
|--- | ---|
|![ImageSearch_gif1](https://user-images.githubusercontent.com/39648822/162135975-f6e48805-7a88-4f7b-969f-3ddde4cac84b.gif)| ![ImageSearch_gif2](https://user-images.githubusercontent.com/39648822/162135927-e83ff5bc-12ca-4b81-be0c-7596bb6ac1e3.gif) |



- 이미지 탭할 경우 상세 화면으로 이동 + 이미지 비율 유지 + 좌우 여백 0


![ImageSearch_gif3](https://user-images.githubusercontent.com/39648822/162135933-49788379-3bca-4837-a37f-d2971e25e235.gif) 


- 키보드 처리 + 목록 리셋

![ImageSearch_gif4](https://user-images.githubusercontent.com/39648822/162135938-fc34808b-7638-4a3e-a79e-af9c689a6f17.gif)


- 페이징 처리

![ImageSearch_gif5](https://user-images.githubusercontent.com/39648822/162260864-2a8a9661-2358-49bf-9aed-65c63742b4ac.gif)

- display_sitename과 datetime이 있을 경우 이미지 하단에 표시


![ImageSearch_gif6](https://user-images.githubusercontent.com/39648822/162264388-0412b35d-ca64-4b52-8d7a-f34efc5b887e.gif)

---

# 핵심 경험
### 검색어 입력 후 1초뒤 검색

### 페이징 처리

### 이미지 비율 유지 및 스크롤뷰

### SwiftUI에서의 MVVM

### URLSession과 Combine을 통한 네트워크 통신

### Alamofire와 Combine을 통한 네트워크 통신

### Combine의 passthrouhSubject를 통한 이벤트처리

### 라이브러리 사용(Kingfisher, Alamofire(페이징 처리에 사용 시도 중)


