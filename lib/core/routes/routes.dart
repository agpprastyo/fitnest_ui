enum RoutesName {
  onboarding('onboarding'),
  introduction('introduction'),
  login('login'),
  register('register'),
  successAuth('success-auth'),
  completeProfile('complete-profile'),
  goals('goals'),
  dashboard('dashboard'),
  home('home'),
  notification('notification');

  const RoutesName(this.name);
  final String name;

  @override
  String toString() => name;
}
