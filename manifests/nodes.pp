node "app" {
  include git
  include mysql
  include apache2
  include passenger
  include massiveapp
}
