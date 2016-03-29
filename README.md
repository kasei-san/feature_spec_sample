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











# 参考

- [Feature spec - Feature specs - RSpec Rails - RSpec - Relish](https://www.relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec#specify-creating-a-widget-by-driving-the-application-with-capybara)
