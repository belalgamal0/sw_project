const rootRoute = "/";

const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";



const signUpPageDisplayName = "SignUp";
const signupPageRoute = "/signup";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(overviewPageDisplayName, overviewPageRoute),
 MenuItem(signUpPageDisplayName, signupPageRoute),
 MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
