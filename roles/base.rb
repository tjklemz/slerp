name "base"

run_list( "recipe[apt]",
          "recipe[git]",
          "recipe[build-essential]",
          "recipe[python]",
          "recipe[ruby_build]",
          "recipe[nginx]",
          "recipe[mysql]"
        )

