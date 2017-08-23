Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


<%if current_user.DA?%>
  <h1 class="text-center">Tous les acteurs</h1>
    <div class="container">
      <div class="row">
        <% @users.actor.each do |user| %>
        <div class="col-xs-12 col-sm-4">
          <div class="flip-container" ontouchstart="this.classList.toggle('hover');">
            <div class="flipper">
              <div class="front">
                <div class="card-index text-center">
                        <div class="photo-index"><%if user.photos?%>
                          <%=cl_image_tag user.photos.first.path, :width=>75, :height=>75, :gravity=>"face", :radius=>"max", :effect=>"sharpen", :crop=>"thumb"%>
                        <%else%>
                          <div class="card-header" style="background-image: url('http://www.clubpoker.net/forum-poker/uploads/1292350273/gallery_44176_461_45151.png')">
                          </div>
                        <%end%>
                        </div>
                          <div class="text">
                           <span><%=user.first_name%> <%=user.last_name%></span> - <span class="text-voice">Voix: <%=user.voice_attribute%></span>
                          </div>
                </div>
            </div>
             <div class="back text-center">
                  <p><%=link_to "Voir cet acteur", user_path(user) %></p>
             </div>
          </div>
        </div>
      </div>
      <%end%>
    </div>
 <%else%>
 <div class="container-form" >
  <h1>Vous devez être directeur artistique pour accéder à cette page</h1><br>
  </div>
  <div class="card-mort" style="background-image: url('http://corigif.free.fr/tetemort/img/tetemort_011.gif')">
  </div>

</div>
<%end%>



.card-index {
  // background: #F7F7F7;
  margin-bottom: 10px;
  border-radius: 5px;
  position: relative;
  height:88px;
  background-image: linear-gradient(to top, #cfd9df 0%, #e2ebf0 100%);
}

.card-header {
  height: 150px;
  background-size: cover;
}

.photo-index {
  position: absolute;
  right:10px;
  top: 5px;
}

.text {
  position: absolute;
  font-weight: lighter;
  text-transform: capitalize;
  left:10px;
  bottom:10px;
  color: black;
}

.text-voice {
  font-weight:lighter;
  color: black;
}

  /* flip the pane when hovered */
  .flip-container:hover .flipper, .flip-container.hover .flipper {
    transform: rotateY(180deg);
  }

.flip-container, .front, .back {
  width: 370px;
  height: 100px;
}

/* flip speed goes here */
.flipper {
  transition: 0.6s;
  transform-style: preserve-3d;
  position: relative;
}

/* hide back of pane during swap */
.front, .back {
  backface-visibility: hidden;
  position: absolute;
  top: 0;
  left: 0;
}

/* front pane, placed above back */
.front {
  z-index: 2;
  /* for firefox 31 */
  transform: rotateY(0deg);
}

/* back, initially hidden pane */
.back p{
  transform: rotateY(180deg);
  padding: 30px;
  font-weight: lighter !important;
  color:black !important;
  font-size: 25px !important;
  text-decoration: none;
}

.card-mort {
  height: 200px;
}



