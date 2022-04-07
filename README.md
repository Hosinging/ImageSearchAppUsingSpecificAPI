# ImageSearchAppUsingSpecificAPI

# TheosImageSearchApp


# Introduction

**다음 이미지 검색 RestApi를 이용**해 검색어가 입력되면 해당 검색어를 쿼리로하여 데이터를 요청하고 response에 담긴 내용을 그리드 형태로 표시하는 앱입니다. 


# 사용한 기술

| UI | SwiftUI |
| --- | --- |
| 네트워킹 | Combine |
| 아키텍처 | MVVM |
| 라이브러리 | KingFisher |

---

# 구현 사항

- ~~검색어가 입력되고 1초 뒤 검색 시작~~
- ~~검색어 변경 시 목록이 리셋된 후 다시 데이터를 표시.~~
- 데이터는 30개씩 페이징 처리합니다. (X. 현재 30개 표시는 되나 페이징 처리는 구현 시도 중)
- 30개 데이터를 가져온 후 스크롤 시 30개의 데이터를 추가로 가져와서 Grid(3 x 3)형태로 표시합니다. (X, 현재는 30게 데이터를 보여주개함. 페이징 처리 구현 시도 후 맞게 수정 예정)
- ~~검색 결과가 없을 경우 화면에 안내 문구를 표시합니다.(='검색 결과가 없습니다.')~~
- ~~검색 결과 목록 중 하나를 탭했을 때 전체 화면으로 이미지를 표시합니다. 이때, 좌우 여백은 0이고, 이미지 비율은 유지합니다.~~
- ~~이미지가 세로로 길 경우 스크롤 됩니다.~~
- response데이터에 데이터 출처'display_sitename', 문서 작성시간 'datetime'이 있을 경우 전체 화면 이미지 밑에 표시해 줍니다.(X, 페이징 처리 후 추가 예정)



# 구현 화면
- 검색어 입력 후 1초 뒤 검색 시작 + 목록 리셋 + 검색 결과가 없을 경우 안내문구 표시

| | |
|--- | ---|
|![imageSearch_gif1](https://user-images.githubusercontent.com/39648822/162124451-800c5973-c795-4123-8357-d7ddbb366c1a.gif)| ![ImageSearch_gif3](https://user-images.githubusercontent.com/39648822/162126715-8dc66bde-24f3-482f-a816-ebdc60fb0f11.gif) |



- 이미지 탭할 경우 상세 화면으로 이동 + 이미지 비율 유지 + 좌우 여백 0


![ImageSearch_gif2](https://user-images.githubusercontent.com/39648822/162124737-efbb8be8-514d-4411-82c7-21ae161d8c40.gif)



---

# 핵심 경험
## 검색어 입력 후 1초뒤 검색

## 스크롤 발생시 추가 데이터 로딩

## 데이터 페이징 처리

## 이미지 비율 유지 및 스크롤뷰

## SwiftUI에서의 MVVM

## Combine을 통한 네트워크 통신

## 라이브러리 사용(Kingfisher, Alamofire(페이징 처리에 사용 시도 중)


