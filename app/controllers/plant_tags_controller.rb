class PlantTagsController < ApplicationController

  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    # take the tag_id from the hash of parmas that is permitted (strong params) :
    @plant_tag = PlantTag.new(plant_tag_params)
    # Find the correct plant with plant_id that is in the url
    @plant = Plant.find(params[:plant_id])
    # Assign this plant to the plant_tag we are trying to create
    @plant_tag.plant = @plant
    # From here the plant_tag has tag_id AND a plant_id
    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new
    end

    # BookmarksController

    # def create
    #   WE NEED MOVIE_ID + LIST_ID

    #   post '/lists/:list_id/bookmarks'

    #   FETCHING LIST_ID FROM URL + FIND LIST IN DB
    #   @list = List.find(params[:list_id])

    #   CREATE OUR BOOKMARK WITH INFO FROM FORM >> MOVIE_ID
    #   @bookmark = Bookmark.new(bookmark_params)

    #   ASSIGN CORRECT LIST TO OUR BOOKMARK
    #   @bookmark.list = @list

    #   FROM HERE WE HAVE MOVIE_ID AND LIST_ID
    #   -----------------
    #   RAISE HERE IF YOU ARE STUCK >>> in the browser @bookmark.valid? @bookmark.errors.messages
    #   -----------------
    #   if @bookmark.save
    #     redirect_to list_path(@list)
    #   else
    #     render :new
    #   end
    # end

    # Bookmark needs list_id and a movie_id
    # We get the list from the list_id in the url
    # We need to assign that list to the bookmark we are trying to create
    # We get the movie_id from the params of the form (strong_params)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
