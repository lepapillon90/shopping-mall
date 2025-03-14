import 'dart:io';

// 상품 정의 클래스
class Product {
  String name; // 상품 이름
  int price; // 상품 가격

  Product(this.name, this.price); // 생성자
}

// 쇼핑몰 정의 클래스
class ShoppingMall {
  List<Product> products; // 상품 목록
  List<Product> cart = []; // 장바구니 목록
  int total = 0; // 총 금액

  ShoppingMall(this.products); // 생성자

  // 상품 목록 출력 메서드
  void showProducts() {
    for (int i = 0; i < products.length; i++) {
      print("${products[i].name} / ${products[i].price}원");
    }
  }

  // 장바구니에 상품 추가 메서드
  void addToCart() {}

  // 장바구니 총 가격 메서드
  void showTotal() {}
  }

void main() {
  // 상품 목록 생성
  List<Product> products = [
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 5000),
  ];
  ShoppingMall mall = ShoppingMall(products); // 객체 생성

  while (true) {
    print("-------------------------------------------------------------------------------------------------");
    print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료");
    print("-------------------------------------------------------------------------------------------------");
    String? input = stdin.readLineSync();

    if (input == '1') // 1입력 시 상품 목록 보기
    {
      mall.showProducts(); // 상품 불러오기

    } else if (input == '2') {
      print("입력값이 올바르지 않아요!");
      print("0개보다 많은 개수의 상품만 담을 수 있어요!");
      print("장바구니에 상품이 담겼어요!");

    } else if (input == '3') // 총 금액 불러오기
    {
      mall.showTotal(); 
    }
    while (input == '4') // 4입력 시 쇼핑몰을 종료
    {
      print("이용해 주셔서 감사합니다~ 안녕히 가세요!");
    }
  }
}
