# SummarAIzer

**A PHP-based Text Summarization Web Application with Machine Learning Integration**

Final Project for ITEP 308 - System Integration and Architecture I  
First Semester, Academic Year 2025-2026

---

## 📋 Project Overview

SummarAIzer is a web application that uses Machine Learning to automatically summarize long texts into concise, readable summaries. The application leverages PHP-ML library to implement TF-IDF (Term Frequency-Inverse Document Frequency) based extractive summarization, making it easier for students and researchers to quickly understand lengthy documents.

### Problem Statement

Students and researchers often struggle with processing large amounts of text efficiently. Reading lengthy articles, research papers, and study materials can be time-consuming. There is a need for a tool that can quickly extract key information and present it in a digestible format.

### Purpose

SummarAIzer enables users to:
- Quickly summarize long texts into shorter, focused summaries
- Choose between paragraph or bullet point formats
- Adjust summary length (short, medium, long)
- Save time on reading and note-taking
- Extract key points from research materials

---

## 👥 Team Members

1. **Tolentino, Cathlene A.**
2. **Tolentino, Lawrence Dave P.**
3. **Valenzuela, John Oliver R.**

---

## 🚀 Features

- **ML-Powered Summarization**: Uses TF-IDF algorithm from PHP-ML library
- **Multiple Output Modes**: 
  - Paragraph format
  - Bullet points format
- **Adjustable Summary Length**: Short, Medium, or Long summaries
- **Modern UI/UX**: Clean, responsive design with dark mode support
- **Real-time Word Count**: Track input text length
- **Copy to Clipboard**: Easy sharing of summaries

---

## 🛠️ Technology Stack

- **Backend**: PHP 7.2+
- **ML Library**: [php-ai/php-ml](https://packagist.org/packages/php-ai/php-ml) (v0.9.0)
- **Dependency Management**: Composer
- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Architecture**: Client-Server with RESTful API

---

## 📦 Installation

### Prerequisites

- PHP 7.2 or higher
- Composer (PHP dependency manager)
- Web server (Apache/Nginx) or PHP built-in server

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <your-github-repo-url>
   cd summarAIzer
   ```

2. **Install dependencies**
   ```bash
   composer install
   ```

3. **Configure web server**
   - Point your web server document root to the `public` directory
   - Or use PHP built-in server:
     ```bash
     php -S localhost:8000 -t public
     ```

4. **Access the application**
   - Open your browser and navigate to `http://localhost:8000`

---

## 🏗️ System Architecture

### Architecture Diagram

```
┌─────────────────┐
│   Web Browser   │
│   (Frontend)    │
└────────┬────────┘
         │ HTTP POST
         │ (text, mode, ratio)
         ▼
┌─────────────────┐
│  index.html     │
│  script.js      │
│  styles.css     │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────┐
│      summarize.php              │
│  (Backend Processing)           │
│                                 │
│  ┌───────────────────────────┐  │
│  │  PHP-ML Integration      │  │
│  │  - WordTokenizer         │  │
│  │  - StopWords (English)   │  │
│  │  - TokenCountVectorizer  │  │
│  │  - TfIdfTransformer      │  │
│  └───────────────────────────┘  │
└────────┬────────────────────────┘
         │
         │ ML Processing:
         │ 1. Tokenize sentences
         │ 2. Remove stop words
         │ 3. Create feature vectors
         │ 4. Calculate TF-IDF scores
         │ 5. Rank sentences
         │
         ▼
┌─────────────────┐
│  Summary Result │
│  (HTML Response)│
└─────────────────┘
```

### Data Flow

1. **Input**: User enters text in the textarea
2. **Preprocessing**: Text is split into sentences
3. **ML Processing**:
   - Sentences are tokenized using `WordTokenizer`
   - Stop words are removed using `StopWords\English`
   - Feature vectors are created using `TokenCountVectorizer`
   - TF-IDF scores are calculated using `TfIdfTransformer`
4. **Scoring**: Sentences are scored based on TF-IDF values and position
5. **Selection**: Top-ranked sentences are selected based on ratio
6. **Output**: Summary is formatted and returned to the user

### ML Integration Details

The application uses the following ML components from PHP-ML:

- **WordTokenizer**: Splits text into individual words/tokens
- **StopWords\English**: Filters out common English stop words
- **TokenCountVectorizer**: Converts text into numerical feature vectors
- **TfIdfTransformer**: Calculates TF-IDF scores to identify important terms

**Algorithm**: Extractive summarization using TF-IDF (Term Frequency-Inverse Document Frequency)
- TF (Term Frequency): How often a word appears in a sentence
- IDF (Inverse Document Frequency): How rare a word is across all sentences
- Higher TF-IDF scores indicate more important sentences

---

## 📸 Screenshots

### Light Mode
![Light Mode Interface](screenshots/light-mode.png)
*Clean, modern interface with light theme*

### Dark Mode
![Dark Mode Interface](screenshots/dark-mode.png)
*Dark mode for comfortable reading*

### Summary Result
![Summary Result](screenshots/summary-result.png)
*Example of summarized text output*

> **Note**: Add your actual screenshots to the `screenshots/` directory and update the paths above.

---

## 🌐 Deployment

### Deployed Application

🔗 **Live Demo**: [Add your deployed URL here]
- Example: `https://your-app.infinityfree.com`
- Example: `https://your-app.000webhostapp.com`

### Deployment Platforms

This application can be deployed on any free hosting platform that supports PHP:
- [InfinityFree](https://www.infinityfree.net/)
- [000WebHost](https://www.000webhost.com/)
- [Vercel](https://vercel.com/) (with PHP runtime)
- [Railway App](https://railway.app/)
- [Render.com](https://render.com/)
- [FreeHosting.com](https://www.freehosting.com/)

### Deployment Steps

1. Upload all project files to your hosting provider
2. Ensure `composer.json` and `composer.lock` are included
3. Run `composer install --no-dev` on the server
4. Configure web server to point to `public` directory
5. Test the application

---

## 🎥 Video Presentation

📹 **10-Minute Presentation Video**: [Add your video link here]
- YouTube: `https://youtube.com/watch?v=...`
- Google Drive: `https://drive.google.com/...`
- Other: `https://...`

### Video Structure

1. **Introduction (1 min)**
   - Project title: SummarAIzer
   - Problem definition: Time-consuming text reading
   - Purpose: Quick text summarization for students

2. **Design Thinking (3 mins)**
   - **Hills**: Enable users to quickly summarize long texts into concise summaries
   - **Sponsor User**: College students and researchers who need to process large amounts of text
   - **Playback**: Feedback from initial users led to improvements in UI/UX and summary quality

3. **System Architecture (2 mins)**
   - Architecture diagram
   - Data flow explanation
   - ML library integration (PHP-ML)
   - TF-IDF algorithm overview

4. **System Demonstration (4 mins)**
   - Key features walkthrough
   - ML functionality demonstration
   - Input → Process → Output flow
   - Different modes and length options

---

## 📊 PowerPoint/Canva Presentation

📄 **Presentation Link**: [Add your Canva/PowerPoint link here]
- Canva: `https://www.canva.com/design/...` (view-only link)
- PowerPoint: Upload to Google Drive/OneDrive and share link
- Other: `https://...`

### Presentation Contents

1. Title Page
2. Problem Statement
3. Design Thinking (Hills, Sponsor User, Playback)
4. System Architecture
5. Screenshots of Web App
6. ML Integration Explanation

---

## 🧠 Design Thinking

### Hills

**What the system enables users to do:**
- Summarize lengthy texts into concise, readable summaries in seconds
- Extract key information without reading entire documents
- Choose between different summary formats (paragraph or bullet points)
- Adjust summary length based on their needs

### Sponsor User

**Representative Primary User:**
- **Profile**: College student, 20 years old, studying Computer Science
- **Needs**: 
  - Quickly understand research papers and articles
  - Create study guides from long texts
  - Save time on reading assignments
- **Pain Points**: 
  - Overwhelmed by lengthy reading materials
  - Difficulty identifying key points
  - Time constraints

### Playback

**Feedback Gathered:**
- Initial users found the interface confusing
- Requested dark mode for better readability
- Needed clearer indication of processing status
- Wanted ability to copy summaries easily

**Improvements Made:**
- ✅ Redesigned UI with clearer layout and better visual hierarchy
- ✅ Added dark mode toggle
- ✅ Improved loading states and user feedback
- ✅ Added copy-to-clipboard functionality
- ✅ Enhanced word count display
- ✅ Better error handling and validation messages

---

## 📚 Libraries Used

### PHP-ML (php-ai/php-ml)

**Version**: 0.9.0  
**Source**: [Packagist](https://packagist.org/packages/php-ai/php-ml)  
**License**: MIT

**Components Used:**
- `Phpml\Tokenization\WordTokenizer` - Text tokenization
- `Phpml\FeatureExtraction\StopWords\English` - Stop word removal
- `Phpml\FeatureExtraction\TokenCountVectorizer` - Feature vector creation
- `Phpml\FeatureExtraction\TfIdfTransformer` - TF-IDF calculation

---

## 🧪 Testing

### Manual Testing

1. **Basic Functionality**
   - Enter text and click "Summarize"
   - Verify summary is generated
   - Test different modes (paragraph/bullet)
   - Test different lengths (short/medium/long)

2. **Edge Cases**
   - Empty input
   - Very short text
   - Very long text
   - Special characters

3. **UI/UX**
   - Dark mode toggle
   - Copy functionality
   - Word count display
   - Responsive design

---

## 📝 Important Notes

- Always verify the summary - context checking is recommended
- The ML algorithm uses extractive summarization (selects existing sentences)
- Summary quality depends on input text structure
- Best results with well-structured, multi-paragraph texts

---

## 🔧 Troubleshooting

### Common Issues

1. **Composer dependencies not loading**
   - Run `composer install` again
   - Check PHP version (requires 7.2+)

2. **ML library not found**
   - Verify `vendor/autoload.php` exists
   - Check `composer.json` includes `php-ai/php-ml`

3. **Summary not generating**
   - Check PHP error logs
   - Verify text input is not empty
   - Ensure proper sentence structure in input

---

## 📄 License

This project is created for educational purposes as part of ITEP 308 course requirements.

---

## 🙏 Acknowledgments

- PHP-ML library developers
- Composer and Packagist community
- ITEP 308 instructors

---

## 📧 Contact

For questions or issues, please contact the development team or create an issue in the GitHub repository.

---

**FINAL PROJECT IN ITEP 308 - System Integration and Architecture I**

