//
//  main.m
//  Hello World
//
//  Created by 大久保将広 on 2017/12/15.
//  Copyright © 2017年 大久保将広. All rights reserved.


/*
 * 参考になる記事一覧
 * Objective-C プログラミング言語( https://developer.apple.com/jp/documentation/ProgrammingWithObjectiveC.pdf )
 * 型とポインタのおさらい ( http://vivacocoa.jp/objective-c3e/chapter1b.html )
 * 配列からポインタへ！ (3/5) ( http://libro.tuyano.com/index3?id=543007&page=3 )
 * ポインタについて ( http://obc-fight.blogspot.jp/2012/05/blog-post_13.html )
 * オブジェクトのメモリ管理で気をつけること2つだけ ( https://qiita.com/yuch_i/items/0d56abe51b82e6d54e63 )
 * Objective-C のプロパティ属性のガイドライン ( https://qiita.com/uasi/items/80660f9aa20afaf671f3 )
 * [iOS][Objective-C] @property の基本まとめ ( https://www.ecoop.net/memo/archives/objective-c-property-basics.html )
 * */





#import <Foundation/Foundation.h>

NSString *name = @"Jack";


/*
 * @propaty に関するわかりやすい記事
 * LINK ->  https://www.ecoop.net/memo/archives/objective-c-property-basics.html
 *
 *
 * @propaty は  メンバ変数を外部から参照、代入するためのアクセサのこと(getter/setter)
 * @propatyには ( nonatomic, copy )のようにカッコ内に指定するキーワードがある
 * 属性は自動生成されるgetter/setterの挙動を定義するもので、
 *
 * アトミック性を決める属性
 * 利用するアクセさの種類や名前を決める属性
 * メモリ管理属性
 *
 * の3つのタイプがる
 *
 *
 * アトミック性属性 -> アトミック性を決める属性は2つしかない
 *
 * 1つめは -> atomic で省略した時にデフォルト指定される。syschronized でスレッドセーフしたgetter/setterを生成
 * 2つめは -> nonatomic でスレッドセーフでない単純なgetter/setterを生成
 * iOSではパフォーマンスの問題からほとんどの場合nonatomicにすべきらしい
 *
 *
 * アクセサ属性
 *
 * readonly -> getterのみを生成
 *
 * readwrite -> デフォルト。getter/setter両方を生成
 *
 * getter=メソッド名 -> getterの名前を指定する。デフォルトはプロパティ名と同じで、BOOL型のプロパティの名前を is ~ とするとわかりやすくなる
 *
 *setter=メソッド名 -> setterの名前を設定する。デフォルトは「setプロパティ名」。あまり使われないらしい
 *
 *
 *
 * メモリ管理属性
 * メモリ管理属性はARCが有効かどうか、Objective-cのオブジェクト(NSObject)かどうかによりデフォルトが異なります。
 *
 *
 * assign
 * 非オブジェクト型のデフォルト。NSIntegerなどの値型、C由来の型などメモリ管理が必要ないものにしよう。
 * オブジェクト型の場合はassignでなくweakかunsafe_unretainedが推奨される。
 *
 * strong
 * オブジェクト型のARC環境デフォルト。setterで代入前のものをreleaseし、新たに代入するものをretainする。
 * 非オブジェクト型には使用できない
 *
 * retain
 * strongと全く同じ
 *
 * weak
 * オブジェクト型の非ARC環境デフォルト。代入時にreatai/releaseを行いません。メモリアクセスエラーを避けるために
 * 参照先が解放されたnullになります。strongと同様、非オブジェクト型には使用できません。
 *
 *
 * unsafe_unretained
 * weakと似ていますが、releaseされてもnilになりません。assignと同じだが、こちらはオブジェクト型を対象としています
 *
 * copy
 * retain/releaseする点はstrongと同じだが、代入時にsetterで引数のオベジェクトをretainせずに、新たなオブジェクトとして
 * コピー(_value = [ value copy ]) してからretainする。
 * 用途としてはNSStringなどmutable な型(NSMutableString) が子クラスとして存在するものについて、
 * 代入時に外部からの値の変更を防ぐためにstrongの代わりにcopyします。


*/
int main(int argc, const char *argv[]) {
    // @autoreleasepool はコンパイラのところ
    // boolean はないが、objective-cは基本的に 0もしくは1  で判断を下しているらしい

    @autoreleasepool {
        // insert code here...
        // @マークはstring を表示するために必要らしい。

        // * マークは オブジェクトであり、ポインターという意味らしい
        NSString *name = @"Joe";
        {
            NSLog(@"Your letter is  %@", name);
            NSLog(@"The value is %@", name);
        }


        NSLog(@"Hello, World!");
    }
    return 0;
}
