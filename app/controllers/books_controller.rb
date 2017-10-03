class BooksController < ApplicationController

  # books#create action
  post '/books' do

    # {
    #   "goodreads_id"=>"248301630",
    #   "title"=>"The Illustrated Man",
    #   "author"=>"Ray Bradbury",
    #   "image_url"=>"https://images.gr-assets.com/books/1374049820m/24830.jpg",
    #   "publication_date"=>"1951",
    #   "average_rating"=>"4.13",
    #   "ratings_count"=>"58782",
    #   "reviews_count"=>"2691",
    #   "book_shelve"=> {
    #     "name"=>"reading"
    #   },
    #   "submit"=>"save"
    # }

    result = Book.all.find do |book|
      book.goodreads_id == params[:goodreads_id].to_i
    end
    if !result
      # save book object
      book = Book.new(
        goodreads_id: params[:goodreads_id],
        title: params[:title],
        author: params[:author],
        image_url: params[:image_url],
        year_published: params[:publication_date],
        ratings_average: params[:average_rating],
        ratings_count: params[:ratings_count],
        book_shelf_name: params[:book_shelf_name],
        reviews_count: params[:reviews_count]
      )

      # send success/filaure messages back to ajax request
      if book.save
        response.body = "#{params[:goodreads_id]}-Book successfully saved"
      else
        response.body = "#{params[:goodreads_id]}-Error saving book"
      end
    else
      response.body = "#{params[:goodreads_id]}-Book has been previously saved"
    end

  end

end
