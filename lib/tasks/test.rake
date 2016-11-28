namespace :test do
  desc "TODO"
  task populate_db: :environment do
    puts "Generating post objects"
    
    p0 = Post.new text: "Hello World", likes: 0
    p1 = Post.new text: "Hello World, again", likes: 0

    p0.save
    p1.save

    puts "Objects created"

  end

  task update_posts: :environment do
    puts "Updating post objects"
    
    p0 = Post.first
    p1 = Post.last

    p0.text = "Hello World, this is an update"
    p0.save

    p0.likes += 1
    p0.save
    
    p0.likes += 23
    p0.save

    p1.likes += 5
    p1.save

    puts "Objects created"

  end

  task log_versions: :environment do
    puts "Logging Versions"
    puts Post.paper_trail.enabled?
    
    p0 = Post.first
    p1 = Post.last

    # For model querying check this  out, note the date queries
    # https://github.com/airblade/paper_trail#3a-reverting-and-undeleting-a-model

    puts "Post 0 versions:"
    for v in p0.versions
      puts "\ttext: #{p0.paper_trail.version_at(v).text}, likes: #{p0.paper_trail.version_at(v).likes}"
      puts "\t\tVersion index: #{v.index}"
      puts "\t\tVersion event: #{v.event}"
    end

  end

end
