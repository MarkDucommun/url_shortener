class CssHelper

  def self.nav_bar(title, links)
    nav = "<nav class='left-bar'>
            <div class='margins'>
              <div class='site_name'>
                <h2>#{title}</h2>
              </div>

              <ul>"
    
    links.each { |list| nav << "<li><a href='#{list[:link]}'>#{list[:display]}</a></li>" }
    
    nav += "</ul></div></nav>"
  end

  def self.authentication(user = nil)
    auth = "<div class='authentication'><ul>"
    
    unless user
    
      auth += "<form action='/sign_in' method='post'>
                 <li><input type='text' name='email' placeholder='Enter email'></li>
                 <li><input type='password' name='password' placeholder='Enter password'></li>
                 <li><input class='button' type='submit' value='Sign In'>
               </form>
               <form action='/sign_up' method='get'>
                 <li><input class='button' type='submit' value='Sign Up'></li>
               </form>"
    else
     
      auth += "<form action='/sign_out' method='get'>
                 <li><input class='button' type='submit' value='Sign Out'></li>
               </form>
                 <li>Hello, #{ user.name }</li>"
    end
    
    auth += "</ul></div>"
  end
end