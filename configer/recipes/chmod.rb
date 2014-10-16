
# Chmod any folders for my app(s).. this kind of assumes every app has the same folders (but more than likely, you just have 1 app)
node[:deploy].each do |app, deploy|
  directory "#{deploy[:deploy_to]}/var" do
    mode 0777
    owner 'deploy'
    group 'www-data'
    action :create
  end
end
