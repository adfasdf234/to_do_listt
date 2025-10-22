투두리스트앱

할 일을 적어서 시간 활용을 도와주는 앱입니다
    
    할 일 목록이 비어있으면 할 일을 추가해달라는 텍스트와 이미지가 존재합니다
    아래에 있는 플로팅 버튼을 눌러 할 일을 추가할 수 있습니다
    생성된 리스트를 누르면 상세페이지로 이동합니다
    상세페이지에서 즐겨찾기를 수정하면 리스트에 반영되고 수정아이콘을 누르면 수정페이지로 이동합니다
    수정페이지에서 수정한 정보는 업데이트되서 모든 화면에 반영됩니다.

앱을 이용해 시간 활용에 도움이 되었으면 좋겠습니다.

----전체적인 프로세스 설명----

    to_do_entity.dart파일에서 리스트에 저장할 요소 선언 main.dart에서(List<ToDoEntity> 선언, 메모장 주인 이름 선언, 아이콘 눌렀을 때 동작할 함수 선언) List<ToDoEntity>가 비어있으면 메모장 name 정보를 넘겨줘서 empty_screen화면 구현 비어있지 않으면
    ListView.builder로 화면 구성 -> 리스트 내용과 동작할 함수, 인덱스 정보를 to_do_view.dart로 넘겨줌
    플로팅 버튼을 누르면 바텀시트 올리기 -> 바텀시트에서는 내용 입력창을 구성(텍스트 필드 내용을 각각 구분하기 위해 컨트롤러 선언, 저장 버튼을 누르면 컨트롤러에 입력된 텍스트를 받아와서 List<ToDoEntity>에 저장)
    index수 만큼 위젯 생성, ListView.builder가 생성될 때 to_do_view.dart에 toDo, onToggleFavorite, onToggleDone, index 네임드 파라미트를 넘겨줘 구성한 ui로 화면 구성
    to_do_view.dart의 항목을 클릭하면 detailpage.dart로 이동 이동할 때 toDo.isFavorite, toDo.title, toDo.description을 넘겨줌
    detailpage.dart에서 받아온 값을 토대로 화면 구성 edit을 누르면 edit page로 이동 editpage.dart로 넘어갈 때 detailpage.dart에서 title, isFavorite, description 값을 받아와 화면 구성
    텍스트 필드에서 컨트롤러를 사용해 수정하고 완료를 누르면 detailpage.dart로 수정된 값 전달 수정된 값이 전달되면 setState를 이용하여 값 업데이트
    detailpage.dart에서 수정된 정보가 있으면 to_do_view.dart도 setState를 통해 값 업데이트