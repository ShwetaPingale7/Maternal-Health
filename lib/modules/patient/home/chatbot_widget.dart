import 'package:flutter/material.dart';
import '../../../app_state.dart';

// ── Language codes ──────────────────────────────────────────────────────────
enum ChatLanguage { english, hindi, marathi }

// ── Data model ───────────────────────────────────────────────────────────────
class FaqItem {
  final String questionEn;
  final String questionHi;
  final String questionMr;
  final String answerEn;
  final String answerHi;
  final String answerMr;
  final List<String> keywords; // lowercase English keywords for matching

  const FaqItem({
    required this.questionEn,
    required this.questionHi,
    required this.questionMr,
    required this.answerEn,
    required this.answerHi,
    required this.answerMr,
    required this.keywords,
  });

  String question(ChatLanguage lang) {
    switch (lang) {
      case ChatLanguage.hindi:
        return questionHi;
      case ChatLanguage.marathi:
        return questionMr;
      case ChatLanguage.english:
        return questionEn;
    }
  }

  String answer(ChatLanguage lang) {
    switch (lang) {
      case ChatLanguage.hindi:
        return answerHi;
      case ChatLanguage.marathi:
        return answerMr;
      case ChatLanguage.english:
        return answerEn;
    }
  }
}

// ── FAQ database ─────────────────────────────────────────────────────────────
const List<FaqItem> _faqs = [
  FaqItem(
    questionEn: 'What should I eat in the first month of pregnancy?',
    questionHi: 'पहले महीने में क्या खाना चाहिए?',
    questionMr: 'गर्भावस्थेच्या पहिल्या महिन्यात काय खावे?',
    answerEn:
        'In the first month of pregnancy, eat vitamin B6-rich foods like nuts, salmon, and bananas.',
    answerHi:
        'गर्भावस्था के पहले महीने में विटामिन B6 से भरपूर खाद्य पदार्थ जैसे नट्स, सैल्मन मछली और केले खाना अच्छा होता है।',
    answerMr:
        'गर्भावस्थेच्या पहिल्या महिन्यात व्हिटॅमिन B6 समृद्ध अन्न जसे काजू, सॅल्मन मासे आणि केळी खाणे चांगले आहे।',
    keywords: ['first month', 'first', 'month', 'eat', 'food', 'diet', 'vitamin', 'b6', 'banana', 'nuts', 'salmon'],
  ),
  FaqItem(
    questionEn: 'How many calories do I need per day?',
    questionHi: 'एक दिन में कितनी कैलोरी चाहिए?',
    questionMr: 'दिवसात किती कॅलरी हव्यात?',
    answerEn:
        'Pregnant women need 300 extra calories a day, so anywhere between 2,200 and 2,900 calories per day is good.',
    answerHi:
        'गर्भवती महिलाओं को प्रतिदिन 300 अतिरिक्त कैलोरी की आवश्यकता होती है। इसलिए 2200 से 2900 कैलोरी के बीच सेवन उचित है।',
    answerMr:
        'गर्भवती महिलांना दररोज 300 जास्त कॅलरी लागतात. म्हणजेच 2200 ते 2900 कॅलरी दरम्यान योग्य आहे.',
    keywords: ['calorie', 'calories', 'how many', 'day', 'energy', '300', '2200', '2900'],
  ),
  FaqItem(
    questionEn: 'What to eat or drink for morning sickness?',
    questionHi: 'मॉर्निंग सिकनेस में क्या खाएं या पिएं?',
    questionMr: 'सकाळच्या उलट्यांसाठी काय खावे किंवा प्यावे?',
    answerEn:
        'Electrolyte drinks, water, and ginger ale can help relieve the symptoms of morning sickness.',
    answerHi:
        'इलेक्ट्रोलाइट पेय, पानी और अदरक वाला पेय मॉर्निंग सिकनेस के लक्षणों को कम करने में मदद कर सकते हैं।',
    answerMr:
        'इलेक्ट्रोलाइट पेये, पाणी आणि आल्याचे पेय मॉर्निंग सिकनेसची लक्षणे कमी करण्यास मदत करू शकतात.',
    keywords: ['morning sickness', 'nausea', 'vomit', 'sick', 'ginger', 'electrolyte', 'drink', 'morning'],
  ),
  FaqItem(
    questionEn: 'Is rice good during pregnancy?',
    questionHi: 'क्या गर्भावस्था में चावल खाना ठीक है?',
    questionMr: 'गर्भावस्थेत तांदूळ खाणे चांगले आहे का?',
    answerEn:
        'Yes, consuming rice in moderate amounts is okay. Rice contains resistant starch which supports healthy gut bacteria and bowel movements.',
    answerHi:
        'हाँ, गर्भावस्था में मध्यम मात्रा में चावल खाना ठीक है। चावल में प्रतिरोधी स्टार्च होता है जो पेट में स्वस्थ बैक्टीरिया के विकास में मदद करता है।',
    answerMr:
        'होय, गर्भावस्थेत मध्यम प्रमाणात तांदूळ खाणे ठीक आहे. तांदळात रेझिस्टंट स्टार्च असतो जो पोटात निरोगी जीवाणूंच्या वाढीस मदत करतो.',
    keywords: ['rice', 'thandool', 'starch', 'bowel', 'digestion', 'carb'],
  ),
  FaqItem(
    questionEn: 'What foods help the baby grow in the womb?',
    questionHi: 'गर्भ में बच्चे की वृद्धि के लिए क्या खाएं?',
    questionMr: 'गर्भातील बाळाच्या वाढीसाठी कोणते अन्न चांगले?',
    answerEn:
        'Protein-rich foods like eggs, well-cooked seafood, lean meat, and poultry help the baby grow in the womb.',
    answerHi:
        'प्रोटीन से भरपूर खाद्य पदार्थ जैसे अंडे, अच्छी तरह पका हुआ समुद्री भोजन, दुबला मांस और पोल्ट्री गर्भ में बच्चे के विकास में मदद करते हैं।',
    answerMr:
        'अंडी, चांगले शिजवलेले सीफूड, दुबळे मांस आणि पोल्ट्री यासारखे प्रथिनयुक्त पदार्थ गर्भातील बाळाच्या वाढीसाठी मदत करतात.',
    keywords: ['baby grow', 'baby', 'womb', 'grow', 'protein', 'egg', 'seafood', 'meat', 'poultry', 'fish'],
  ),
  FaqItem(
    questionEn: 'Which biscuit is good during pregnancy?',
    questionHi: 'गर्भावस्था में कौन सा बिस्कुट खाना अच्छा है?',
    questionMr: 'गर्भावस्थेत कोणते बिस्किट खाणे चांगले?',
    answerEn:
        'Biscuits made from whole grain or whole wheat are good choices during pregnancy.',
    answerHi:
        'गर्भावस्था के दौरान साबुत अनाज या साबुत गेहूं से बने बिस्कुट खाए जा सकते हैं।',
    answerMr:
        'गर्भावस्थेत संपूर्ण धान्य किंवा संपूर्ण गव्हापासून बनवलेले बिस्किट खाणे योग्य आहे.',
    keywords: ['biscuit', 'cookie', 'whole grain', 'wheat', 'snack'],
  ),
  FaqItem(
    questionEn: "How can I improve my baby's brain during pregnancy?",
    questionHi: 'गर्भावस्था में बच्चे का दिमाग कैसे तेज करें?',
    questionMr: 'गर्भावस्थेत बाळाचा मेंदू कसा सुधारायचा?',
    answerEn:
        '• Eat a healthy, well-balanced diet\n• Stay fit and active\n• Take supplements regularly\n• Gently massage your tummy daily\n• Keep your thyroid levels in check',
    answerHi:
        '• स्वस्थ और संतुलित आहार लें\n• सक्रिय रहें\n• नियमित रूप से सप्लीमेंट लें\n• प्रतिदिन पेट की मालिश करें\n• थायरॉइड स्तर की जांच करते रहें',
    answerMr:
        '• निरोगी आणि संतुलित आहार घ्या\n• सक्रिय राहा\n• नियमितपणे सप्लिमेंट्स घ्या\n• दररोज पोटाची मालिश करा\n• थायरॉईड पातळी तपासत राहा',
    keywords: ['brain', 'baby brain', 'intelligence', 'smart', 'thyroid', 'supplement', 'massage', 'tummy'],
  ),
  FaqItem(
    questionEn: 'Are seasonal fruits good during pregnancy?',
    questionHi: 'क्या मौसमी फल गर्भावस्था में अच्छे हैं?',
    questionMr: 'गर्भावस्थेत मोसमी फळे चांगली असतात का?',
    answerEn:
        'Yes! Seasonal fruits are rich in vitamins, minerals, and fiber. They boost energy and are great for your hair and skin during pregnancy.',
    answerHi:
        'हाँ! मौसमी फल विटामिन, खनिज और फाइबर से भरपूर होते हैं। वे ऊर्जा बढ़ाते हैं और गर्भावस्था में बालों और त्वचा के लिए भी अच्छे हैं।',
    answerMr:
        'होय! मोसमी फळे जीवनसत्त्वे, खनिजे आणि फायबरने समृद्ध असतात. ती ऊर्जा वाढवतात आणि केस व त्वचेसाठी उत्तम असतात.',
    keywords: ['fruit', 'fruits', 'seasonal', 'mango', 'banana', 'vitamin', 'mineral', 'fiber', 'energy', 'skin', 'hair'],
  ),
  FaqItem(
    questionEn: 'Which vegetables are good for pregnancy?',
    questionHi: 'गर्भावस्था में कौन सी सब्जियाँ अच्छी हैं?',
    questionMr: 'गर्भावस्थेत कोणत्या भाज्या चांगल्या असतात?',
    answerEn:
        'Broccoli, lettuce, spinach, tomatoes, carrots, and bitter gourd are great vegetables during pregnancy.',
    answerHi:
        'ब्रोकोली, लेट्यूस, पालक, टमाटर, गाजर और करेला गर्भावस्था के लिए अच्छी सब्जियाँ हैं।',
    answerMr:
        'ब्रोकोली, लेट्यूस, पालक, टोमॅटो, गाजर आणि कारली या गर्भावस्थेसाठी चांगल्या भाज्या आहेत.',
    keywords: ['vegetable', 'vegetables', 'broccoli', 'spinach', 'carrot', 'tomato', 'lettuce', 'bitter', 'greens'],
  ),
];

// ── Chat message model ────────────────────────────────────────────────────────
class _ChatMessage {
  final String text;
  final bool isUser;

  const _ChatMessage({required this.text, required this.isUser});
}

// ── Main chatbot button + overlay ─────────────────────────────────────────────
class ChatbotWidget extends StatefulWidget {
  const ChatbotWidget({super.key});

  @override
  State<ChatbotWidget> createState() => _ChatbotWidgetState();
}

class _ChatbotWidgetState extends State<ChatbotWidget>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  final List<_ChatMessage> _messages = [];
  final TextEditingController _inputCtrl = TextEditingController();
  final ScrollController _scrollCtrl = ScrollController();
  late AnimationController _animCtrl;
  late Animation<double> _scaleAnim;

  // Helper to sync local language enum with global app language
  ChatLanguage get _lang {
    switch (AppState.instance.language) {
      case AppLanguage.hindi:
        return ChatLanguage.hindi;
      case AppLanguage.marathi:
        return ChatLanguage.marathi;
      case AppLanguage.english:
      default:
        return ChatLanguage.english;
    }
  }

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOutBack);
    _addBotMessage(_greeting(_lang));
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _inputCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  // ── Helpers ────────────────────────────────────────────────────────────────
  String _greeting(ChatLanguage lang) {
    switch (lang) {
      case ChatLanguage.hindi:
        return 'नमस्ते! 🌸 मैं आपकी गर्भावस्था सहायक हूँ। नीचे से कोई प्रश्न चुनें या सीधे टाइप करें।';
      case ChatLanguage.marathi:
        return 'नमस्कार! 🌸 मी तुमची गर्भावस्था सहाय्यक आहे. खाली कोणता प्रश्न निवडा किंवा थेट टाइप करा.';
      case ChatLanguage.english:
        return 'Hello! 🌸 I\'m your pregnancy assistant. Pick a question below or type your own.';
    }
  }

  String _noAnswerText(ChatLanguage lang) {
    switch (lang) {
      case ChatLanguage.hindi:
        return 'मुझे इसका उत्तर नहीं पता। कृपया नीचे दिए गए प्रश्नों में से एक चुनें या अपनी ASHA कार्यकर्ता से संपर्क करें।';
      case ChatLanguage.marathi:
        return 'मला याचे उत्तर माहित नाही. कृपया खाली दिलेल्या प्रश्नांपैकी एक निवडा किंवा तुमच्या ASHA कार्यकर्त्याशी संपर्क करा.';
      case ChatLanguage.english:
        return 'I don\'t have an answer for that. Please choose from the FAQ list below or contact your ASHA worker.';
    }
  }

  void _addBotMessage(String text) {
    setState(() {
      _messages.add(_ChatMessage(text: text, isUser: false));
    });
    _scrollToBottom();
  }

  void _addUserMessage(String text) {
    setState(() {
      _messages.add(_ChatMessage(text: text, isUser: true));
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _onFaqTap(FaqItem faq) {
    _addUserMessage(faq.question(_lang));
    Future.delayed(const Duration(milliseconds: 400), () {
      _addBotMessage(faq.answer(_lang));
    });
  }

  void _onSend() {
    final query = _inputCtrl.text.trim();
    if (query.isEmpty) return;
    _inputCtrl.clear();
    _addUserMessage(query);

    // Keyword matching
    final lower = query.toLowerCase();
    FaqItem? match;
    int bestScore = 0;
    for (final faq in _faqs) {
      int score = 0;
      for (final kw in faq.keywords) {
        if (lower.contains(kw)) score++;
      }
      if (score > bestScore) {
        bestScore = score;
        match = faq;
      }
    }

    Future.delayed(const Duration(milliseconds: 400), () {
      if (match != null && bestScore > 0) {
        _addBotMessage(match.answer(_lang));
      } else {
        _addBotMessage(_noAnswerText(_lang));
      }
    });
  }

  void _toggleChat() {
    setState(() {
      _isOpen = !_isOpen;
      // When opening, reset to a fresh greeting in current language
      if (_isOpen) {
        _messages.clear();
        _messages.add(_ChatMessage(text: _greeting(_lang), isUser: false));
      }
    });
    if (_isOpen) {
      _animCtrl.forward();
    } else {
      _animCtrl.reverse();
    }
  }

  // ── Build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Chat panel
        if (_isOpen)
          ScaleTransition(
            scale: _scaleAnim,
            alignment: Alignment.bottomRight,
            child: _buildChatPanel(context),
          ),

        // FAB
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: _toggleChat,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: _isOpen ? Colors.grey.shade600 : const Color(0xFFFF8B94),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF8B94).withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                _isOpen ? Icons.close : Icons.chat_bubble_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatPanel(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    return Container(
      width: 340,
      height: screenH * 0.62,
      margin: const EdgeInsets.only(bottom: 72),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildMessageList()),
          _buildFaqChips(),
          const Divider(height: 1),
          _buildInputRow(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: Color(0xFFFF8B94),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 18,
            child: Icon(Icons.pregnant_woman, color: Color(0xFFFF8B94), size: 22),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pregnancy Assistant',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'गर्भावस्था सहायक • गर्भावस्था सहाय्यक',
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.circle, color: Color(0xFF90EE90), size: 8),
                const SizedBox(width: 4),
                Text(AppState.instance.translate('Online', 'ऑनलाइन', 'ऑनलाइन'), style: const TextStyle(color: Colors.white, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildMessageList() {
    return ListView.builder(
      controller: _scrollCtrl,
      padding: const EdgeInsets.all(14),
      itemCount: _messages.length,
      itemBuilder: (context, i) {
        final msg = _messages[i];
        return _buildBubble(msg);
      },
    );
  }

  Widget _buildBubble(_ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        constraints: const BoxConstraints(maxWidth: 260),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: msg.isUser ? const Color(0xFFFF8B94) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(msg.isUser ? 18 : 4),
            bottomRight: Radius.circular(msg.isUser ? 4 : 18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          msg.text,
          style: TextStyle(
            color: msg.isUser ? Colors.white : const Color(0xFF3D3D3D),
            fontSize: 13.5,
            height: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildFaqChips() {
    return Container(
      color: const Color(0xFFFFF9F9),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      height: 88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 6),
            child: Text(
              'Quick Questions:',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _faqs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final faq = _faqs[i];
                return GestureDetector(
                  onTap: () => _onFaqTap(faq),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD3B6).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFFF8B94).withOpacity(0.3)),
                    ),
                    child: Text(
                      faq.question(_lang),
                      style: const TextStyle(fontSize: 12, color: Color(0xFF4A4A4A)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputCtrl,
              onSubmitted: (_) => _onSend(),
              decoration: InputDecoration(
                hintText: _lang == ChatLanguage.hindi
                    ? 'कुछ पूछें...'
                    : _lang == ChatLanguage.marathi
                        ? 'काही विचारा...'
                        : 'Type your question...',
                hintStyle: const TextStyle(fontSize: 13),
                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                filled: true,
                fillColor: const Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 13),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _onSend,
            child: Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Color(0xFFFF8B94),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
