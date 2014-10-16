
node[:deploy].each do |app, deploy|
  template "#{deploy[:deploy_to]}/app/etc/local.xml" do
    source "myconfig.xml.erb"
    mode 0644
    # maybe change these to www-data or apache? maybe doesn't matter
    owner "deploy"
    group "www-data"
    variables({
        # take variables from node and pass them to template engine
        # "node" contains all deploy variables, including the defaults variable (attributes/default.rb), then applies CustomJSON over that.
        # to override the default value of foo, set it in the CustomJSON for the Stack.
        # This allows multiple stacks (QA, Prod, etc) to use the same recipes, and only change the values in CustomJSON as needed.
        :foo   => node[:foo]
    })
  end
end
