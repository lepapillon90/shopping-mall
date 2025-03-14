import 'dart:io'; //파일, 소켓, HTTP, 기타 입출력 등의 기능을 제공

class Product { // 상품 정의 클래스
  String name; // 상품 이름
  int price; // 상품 가격
  Product(this.name, this.price); // 생성자
}
class ShoppingMall { // 쇼핑몰 정의 클래스
  List<Product> products; // 상품 목록
  Map<Product, int> cart = {}; // 상품과 갯수를 정함함
  int total = 0; // 총 금액
  ShoppingMall(this.products); // 생성자
  void showProducts() // 상품 목록 출력 메서드
  {
    for (int i = 0; i < products.length; i++) { //상품의 리스트를 확인 후 순차대로 출력
      print('[${i + 1}] ${products[i].name} / ${products[i].price}원'); //상품의 이름과 가격을 출력
    }
  }
  void addToCart() { // 장바구니에 상품 추가 메서드
    showProducts();// 상품 목록 보여주기
    print('장바구니에 추가할 상품의 이름을 입력하세요:');// 상품 이름 입력 받기
    String? productName = stdin.readLineSync(); //stdin.readLineSync()를 사용하여 콘솔에서 입력을 받고, productName 변수에 저장
    Product? selectedProduct; // 선택한 상품을 저장할 변수생성성
    for (Product product in products) { // 상품 목록products을 하나씩 확인
      if (product.name == productName) { // 사용자가 입력한 상품 이름과 비교
        selectedProduct = product; //만약 입력한 상품이 상품 목록에 있으면 selectedProduct 변수에 저장
        break; // 상품을 찾으면 반복문 종료
      }
    }
    if (selectedProduct == null) { //상품 목록에 없는 경우 selectedProduct는 null 값
      print('입력값이 올바르지 않아요!'); //오류메시지 출력력
      return; //상품 목록에 없는 상품을 입력하면 오류 메시지를 출력하고 함수 종료
    }
      print('추가할 상품 개수를 입력하세요:'); // 상품 개수 입력 받기
      String? quantityInput = stdin.readLineSync();  //stdin.readLineSync()를 사용하여 콘솔에서 입력을 받고, quantityInput 변수에 저장
    try {
      int quantity = int.parse(quantityInput!); //int.parse()를 이용해 입력값을 숫자로 변환

      if (quantity <= 0) { //0이하는 갯수 관련 예외 오류류
        print('0개보다 많은 개수의 상품만 담을 수 있어요!'); //0개 이하는 상품 오류메시지 출력
        return; //개수가 0 이하이면 오류 메시지를 출력하고 함수 종료
      }
      // 장바구니에 상품 추가
      if (cart.containsKey(selectedProduct)) {
        cart[selectedProduct] = cart[selectedProduct]! + quantity; //이미 장바구니에 있는 상품이면 개수 추가
      } else {
        cart[selectedProduct] = quantity; //새로운 상품이면 장바구니에 추가
      }
      total += selectedProduct.price * quantity; //상품 가격 × 개수를 계산하여 총 금액 업데이트
      print('장바구니에 상품이 담겼어요!'); //장바구니에 담겼다는 메시지를 출력
    } catch (e) {
      print('입력값이 올바르지 않아요!'); //int.parse()에서 숫자로 변환할 수 없는 경우 예외가 발생하면 오류 메시지를 출력하고 함수 종료
    }
  }
  void showTotal() // 장바구니 총 가격 메서드
  {
      print(' 장바구니에 ${total}원 어치를 담으셨네요!'); //장바구니 총 금액 메시지 출력력
  }
}
void main() {
  List<Product> products = [  // 상품 목록 생성
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];
  ShoppingMall mall = ShoppingMall(products); // 객체 생성
  bool isRunning = true; // 프로그램 실행 여부 변수

  while (isRunning) {
    print('------------------------------------------------------------------------------------------------');
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print('------------------------------------------------------------------------------------------------');
    String? input = stdin.readLineSync(); //stdin.readLineSync()를 사용하여 콘솔에서 입력을 받고, input 변수에 저장

    if (input == '1') { //1을 입력 하였을때
      mall.showProducts(); // 상품 목록 보기
    } else if (input == '2') { //2를 입력 하였을때
      mall.addToCart(); // 장바구니에 상품 추가
    } else if (input == '3') { //3을 입력 하였을때
      mall.showTotal(); // 장바구니 총 가격 보기
    } else if (input == '4') { //4를 입력 하였을때
      print('이용해 주셔서 감사합니다~ 안녕히 가세요!'); //종료 메시지 출력
      isRunning = false; // 프로그램 종료
    } else { //이외의 값을 입력했을때
      print('지원하지 않는 기능입니다! 다시 시도해 주세요..'); //이외의 값을 입력했을때 메시지 출력력
    }
  }
}
