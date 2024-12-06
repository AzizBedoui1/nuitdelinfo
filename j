import { useState } from "react";
import "./App.css";

// Import des images
import image1 from "./assets/image/1.jpg";
import image2 from "./assets/image/2.jpg";
import image3 from "./assets/image/3.jpg";
import image4 from "./assets/image/4.jpg";
import image5 from "./assets/image/5.jpg";
import image6 from "./assets/image/6.jpg";
import image7 from "./assets/image/7.jpg";
import image8 from "./assets/image/8.jpg";
import image9 from "./assets/image/9.jpg";
import image10 from "./assets/image/10.jpg";
import image11 from "./assets/image/11.jpg";
import image12 from "./assets/image/12.jpg";

function App() {
  const [showModal, setShowModal] = useState(false);
  const [showAlbum, setShowAlbum] = useState(false);
  const [selectedImage, setSelectedImage] = useState(null);

  const openModal = () => setShowModal(true);
  const closeModal = () => setShowModal(false);

  const openAlbum = () => setShowAlbum(true);
  const closeAlbum = () => setShowAlbum(false);

  const openImage = (image) => setSelectedImage(image);
  const closeImage = () => setSelectedImage(null);

  const images = [
    image1, image2, image3, image4, image5, image6,
    image7, image8, image9, image10, image11, image12,
  ];

  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>Welcome Kiddy</h1>
      <div className="buttonContainer">
        <button>Play Game</button>
        <button onClick={openModal}>Watch Video</button>
        <button onClick={openAlbum}>View Album</button>
        <button>Learn Alphabet</button>
      </div>

      {/* Modal pour afficher la vidéo */}
      {showModal && (
        <div className="modal">
          <div className="modal-content">
            <span className="close" onClick={closeModal}>
              ×
            </span>
            <iframe
              src="https://www.youtube.com/embed/lYY-t_fGIGI?autoplay=1&loop=1&playlist=lYY-t_fGIGI"
              title="YouTube video player"
              frameBorder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowFullScreen
            ></iframe>
          </div>
        </div>
      )}

      {/* Album photo */}
      {showAlbum && (
        <div className="album">
          <div className="album-content">
            <span className="close" onClick={closeAlbum}>
              ×
            </span>
            <h2>Photo Album</h2>
            <div className="gallery">
              {images.map((img, index) => (
                <img
                  key={index}
                  src={img}
                  alt={`Story Image ${index + 1}`}
                  onClick={() => openImage(img)}
                />
              ))}
            </div>
          </div>
        </div>
      )}

      {/* Lightbox pour afficher l'image en plein écran */}
      {selectedImage && (
        <div className="modal">
          <div className="modal-content">
            <span className="close" onClick={closeImage}>
              ×
            </span>
            <img src={selectedImage} alt="Selected" style={{ width: "100%" }} />
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
