rspec-rails で js を使った feature テスト

# rspec-railsを使うようにする

https://github.com/rspec/rspec-rails

```
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
end
```

```
bundle install
rails generate rspec:install
```

# 動作確認の為に、cocoon を使った動的フォームを用意

参考 : [cocoon を使って、1フォームで1対多のモデルを動的に編集できるようにする - kasei_sanのブログ](http://kasei-san.hatenablog.com/entry/2016/03/24/222812)

# featureテストを作成する

## featureテストとは

- SIer用語だと、結合・総合テストと呼ばれるものとほぼ同義だと(勝手に)思っている
- feature : 特徴、特色、際立つ所
- アプリの外部から見た振る舞いをテストする

## featureテストのためのgemをインストール

### capybara

[jnicklas/capybara: Acceptance test framework for web applications](https://github.com/jnicklas/capybara)

webアプリケーション用の受入テストのためのテストフレームワーク

### database_cleaner

[DatabaseCleaner/database_cleaner: Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.](https://github.com/DatabaseCleaner/database_cleaner)

- database_cleanerは、テストの前後にDBをクリアしてくれるgem
- `config.use_transactional_fixtures = true` していても、フィーチャーテストではDBに変更がcommitされてしまう
- 参考 : [feature テストで作成されたデータはテスト完了後もDBに残る - 炊きたてのご飯が食べたい](http://takanamishi.hatenablog.jp/entry/2016/01/05/182531)

#### TODO

- フィーチャーテスト以外での、 `use_transactional_fixtures` の true/false で振る舞いを調査

## Gemfile

```
group :test do
  gem 'database_cleaner'
  gem 'capybara'
end
```

## Qtのインストール

C++のフレームワーク
capybaraで使用しているのでインストールが必要

```
brew install qt
```

### 課題

Qtのバージョンについて、capybara-webkitに怒られるので対応する

```
WARNING: The next major version of capybara-webkit will require at least version 5.0 of Qt. You're using version 4.8.7.
```

## フィーチャーテスト生成

```
rails g rspec:feature item
```

spec/features/items_spec.rb

```.ruby
require 'rails_helper'

RSpec.feature "Items", type: :feature do
  pending "add some scenarios (or delete) #{__FILE__}"
end
```

spec/spec_helper.rb

```.ruby
   require 'capybara'
   Capybara.javascript_driver = :webkit
```





# 参考

- [Feature spec - Feature specs - RSpec Rails - RSpec - Relish](https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec#specify-creating-a-widget-by-driving-the-application-with-capybara)
- [RSpecとCapybaraでJavaScript/Ajaxをテストする - Rails 雑感 - Ruby on Rails with OIAX](http://www.oiax.jp/rails/zakkan/testing_javascript_with_rspec_and_capybara.html)
