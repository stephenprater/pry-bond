class Pry::Bond::DisableCommand < Pry::ClassCommand
  match 'disable-bond!'
  group 'bond'
  description 'disable input completion through the `bond` rubygem.'
  banner <<-BANNER
    Usage: disable-bond!
    disable input completion through the `bond` rubygem by restoring the
    pry default.
  BANNER

  def process
    _pry_.config.completer = default.completer
    output.puts heading("bond input completion has been disabled and the pry default has been restored.")
  end

private
  def default
    Pry.config.default
  end
  Pry.commands.add_command(self)
end
