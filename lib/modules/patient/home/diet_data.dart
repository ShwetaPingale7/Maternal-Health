class MonthDietPlan {
  final int monthIndex;
  final int trimesterIndex;
  final List<String> primaryNutritionalFocus;
  final List<String> primaryNutritionalFocusHi;
  final List<String> primaryNutritionalFocusMr;
  final Map<String, String> mealSchedule;
  final Map<String, String> mealScheduleHi;
  final Map<String, String> mealScheduleMr;

  const MonthDietPlan({
    required this.monthIndex,
    required this.trimesterIndex,
    required this.primaryNutritionalFocus,
    required this.primaryNutritionalFocusHi,
    required this.primaryNutritionalFocusMr,
    required this.mealSchedule,
    required this.mealScheduleHi,
    required this.mealScheduleMr,
  });
}

const List<MonthDietPlan> maternalDietPlans = [
  MonthDietPlan(
    monthIndex: 1,
    trimesterIndex: 1,
    primaryNutritionalFocus: ["Folate (Vitamin B9)", "Nutrient Density"],
    primaryNutritionalFocusHi: ["फोलेट (विटामिन B9)", "पोषक तत्व घनत्व"],
    primaryNutritionalFocusMr: ["फोलेट (व्हिटॅमिन B9)", "पोषक घनता"],
    mealSchedule: {
      "Early Morning": "Warm water with lemon and 4-5 soaked almonds.",
      "Breakfast": "Vegetable Poha with peas, or plain Oats porridge.",
      "Mid-Morning": "Fresh seasonal fruit like Apple or Sweet Lime.",
      "Lunch": "2 Whole wheat rotis, 1 bowl Yellow Moong Dal, 1 bowl Spinach sabzi, small bowl of Curd.",
      "Evening Snack": "Roasted Chana and a cup of ginger water.",
      "Dinner": "Light Vegetable Khichdi with a teaspoon of Ghee.",
      "Bedtime": "Warm milk with a pinch of Turmeric."
    },
    mealScheduleHi: {
      "Early Morning": "नींबू के साथ गर्म पानी और 4-5 भीगे हुए बादाम।",
      "Breakfast": "मटर के साथ वेजीटेबल पोहा, या सादा ओट्स दलिया।",
      "Mid-Morning": "ताजा मौसमी फल जैसे सेब या मौसमी।",
      "Lunch": "2 गेहूं की रोटियां, 1 कटोरी पीली मूंग दाल, 1 कटोरी पालक की सब्जी, एक छोटी कटोरी दही।",
      "Evening Snack": "भुना हुआ चना और एक कप अदरक का पानी।",
      "Dinner": "एक चम्मच घी के साथ हल्का वेजीटेबल खिचड़ी।",
      "Bedtime": "एक चुटकी हल्दी के साथ गर्म दूध।"
    },
    mealScheduleMr: {
      "Early Morning": "लिंबासोबत कोमट पाणी आणि ४-५ भिजवलेले बदाम.",
      "Breakfast": "वाटाणा घालून भाज्यांचा पोहे किंवा साधी ओट्सची लापशी.",
      "Mid-Morning": "सफरचंद किंवा मोसंबी सारखे ताजे हंगामी फळ.",
      "Lunch": "२ गव्हाच्या चपात्या, १ वाटी पिवळी मूंग डाळ, १ वाटी पालकाची भाजी, छोटी वाटी दही.",
      "Evening Snack": "भाजलेले चणे आणि एक कप आले पाणी.",
      "Dinner": "एक चमचा तूप घालून हलकी भाज्यांची खिचडी.",
      "Bedtime": "एक चिमूटभर हळद घालून कोमट दूध."
    },
  ),
  MonthDietPlan(
    monthIndex: 2,
    trimesterIndex: 1,
    primaryNutritionalFocus: ["Organogenesis", "Calcium", "Probiotics"],
    primaryNutritionalFocusHi: ["अंग निर्माण", "कैल्शियम", "प्रोबायोटिक्स"],
    primaryNutritionalFocusMr: ["अवयव निर्मिती", "कॅल्शियम", "प्रोबायोटिक्स"],
    mealSchedule: {
      "Early Morning": "Warm water with a slice of fresh ginger.",
      "Breakfast": "Ragi porridge cooked in milk, or 2 Moong Dal Chillas.",
      "Mid-Morning": "A glass of fresh Buttermilk with a pinch of roasted cumin powder.",
      "Lunch": "Brown rice (1 cup), mixed vegetable curry, 1 bowl of Masoor Dal, fresh cucumber salad.",
      "Evening Snack": "A handful of walnuts and a small banana.",
      "Dinner": "2 Rotis with Paneer Bhurji and a side of green beans.",
      "Bedtime": "Warm milk."
    },
    mealScheduleHi: {
      "Early Morning": "ताजे अदरक के टुकड़े के साथ गर्म पानी।",
      "Breakfast": "दूध में पका हुआ रागी दलिया, या 2 मूंग दाल चिला।",
      "Mid-Morning": "एक चुटकी भुना हुआ जीरा पाउडर के साथ ताज़ा छाछ।",
      "Lunch": "ब्राउन राइस (1 कप), मिक्स वेजीटेबल करी, 1 कटोरी मसूर दाल, ताज़ा ककड़ी सलाद।",
      "Evening Snack": "मुट्ठी भर अखरोट और एक छोटा केला।",
      "Dinner": "पनीर भुर्जी और बीन्स के साथ 2 रोटियां।",
      "Bedtime": "गर्म दूध।"
    },
    mealScheduleMr: {
      "Early Morning": "ताजा आल्याच्या तुकड्यासोबत कोमट पाणी.",
      "Breakfast": "दुधात शिजवलेली नाचणीची लापशी किंवा २ मूग डाळ धिरडे.",
      "Mid-Morning": "भाजलेल्या जिरे पूड घालून ताजी ताक.",
      "Lunch": "ब्राऊन राईस (१ कप), मिक्स व्हेज करी, १ वाटी मसूर डाळ, ताजी काकडी कोशिंबीर.",
      "Evening Snack": "मुठभर अक्रोड आणि एक छोटे केळे.",
      "Dinner": "पनीर भुर्जी आणि हिरव्या फरसबी सोबत २ चपात्या.",
      "Bedtime": "कोमट दूध."
    },
  ),
  MonthDietPlan(
    monthIndex: 3,
    trimesterIndex: 1,
    primaryNutritionalFocus: ["Iron", "Vitamin C"],
    primaryNutritionalFocusHi: ["आयरन", "विटामिन सी"],
    primaryNutritionalFocusMr: ["लोह", "व्हिटॅमिन सी"],
    mealSchedule: {
      "Early Morning": "1 Amla murabba or fresh amla juice.",
      "Breakfast": "Vegetable Upma loaded with carrots and peas, coconut chutney.",
      "Mid-Morning": "Fresh pomegranate juice or a bowl of sliced guava.",
      "Lunch": "2 Rotis, 1 bowl of Rajma, 1 bowl of grated beetroot and carrot salad with lemon juice.",
      "Evening Snack": "Sprouted Moong chaat with a squeeze of lemon.",
      "Dinner": "Vegetable Pulao with a side of mixed lentil soup.",
      "Bedtime": "Warm milk with a small piece of Jaggery."
    },
    mealScheduleHi: {
      "Early Morning": "1 आंवला मुरब्बा या ताजा आंवला जूस।",
      "Breakfast": "गाजर और मटर के साथ वेजीटेबल उपमा, नारियल की चटनी।",
      "Mid-Morning": "ताजा अनार का जूस या अमरूद का एक कटोरा।",
      "Lunch": "2 रोटियां, 1 कटोरी राजमा, नींबू के रस के साथ कद्दूकस किया हुआ चुकंदर और गाजर का सलाद।",
      "Evening Snack": "नींबू के रस के साथ अंकुरित मूंग चाट।",
      "Dinner": "दाल सूप के साथ वेजीटेबल पुलाव।",
      "Bedtime": "गुड़ के एक छोटे टुकड़े के साथ गर्म दूध।"
    },
    mealScheduleMr: {
      "Early Morning": "१ आवळा मुरंबा किंवा ताजे आवळ्याचा रस.",
      "Breakfast": "गाजर आणि वाटाणा घालून व्हेज उपमा, ओल्या नारळाची चटणी.",
      "Mid-Morning": "ताजे डाळिंबाचा रस किंवा पेरूची फोडी.",
      "Lunch": "२ चपात्या, १ वाटी राजमा, लिंबाचा रस घालून किसलेले बीट आणि गाजर कोशिंबीर.",
      "Evening Snack": "लिंबू पिळून मोड आलेली मूग चाट.",
      "Dinner": "वरण किंवा डाळीच्या सूपसोबत व्हेज पुलाव.",
      "Bedtime": "गुळाच्या लहान तुकड्यासोबत कोमट दूध."
    },
  ),
  // ... Simplified for other months to keep code manageable but demonstrate full support
  MonthDietPlan(
    monthIndex: 4,
    trimesterIndex: 2,
    primaryNutritionalFocus: ["Healthy Fats", "Omega-3"],
    primaryNutritionalFocusHi: ["स्वस्थ वसा", "ओमेगा-3"],
    primaryNutritionalFocusMr: ["आरोग्यदायी चरबी", "ओमेगा-३"],
    mealSchedule: {
      "Early Morning": "Soaked walnuts and almonds.",
      "Breakfast": "2 stuffed Parathas (minimal oil) with a bowl of Curd.",
      "Mid-Morning": "Fresh Coconut Water.",
      "Lunch": "1.5 cups of Rice, 1 bowl of thick Dal, 1 bowl of dry vegetable sabzi, cucumber raita.",
      "Evening Snack": "Roasted Makhana tossed in half a teaspoon of Ghee.",
      "Dinner": "2 Rotis with Palak Paneer.",
      "Bedtime": "Milk boiled with a pinch of cardamom."
    },
    mealScheduleHi: {
      "Early Morning": "भीगे हुए अखरोट और बादाम।",
      "Breakfast": "दही के साथ 2 भरवां परांठे।",
      "Mid-Morning": "ताजा नारियल पानी।",
      "Lunch": "1.5 कप चावल, 1 कटोरी गाढ़ी दाल, 1 कटोरी सूखी सब्जी, ककड़ी रायता।",
      "Evening Snack": "आधा चम्मच घी में भुना हुआ मखाना।",
      "Dinner": "पालक पनीर के साथ 2 रोटियां।",
      "Bedtime": "चुटकी भर इलायची के साथ उबला हुआ दूध।"
    },
    mealScheduleMr: {
      "Early Morning": "भिजवलेले अक्रोड आणि बदाम.",
      "Breakfast": "एक वाटी दह्यासोबत २ भरलेले पराठे.",
      "Mid-Morning": "ताजे शहाळ्याचे पाणी.",
      "Lunch": "१.५ कप भात, १ वाटी घट्ट वरण, १ वाटी सुकी भाजी, काकडी रायता.",
      "Evening Snack": "अर्धा चमचा तूप घालून भाजलेले मखाणे.",
      "Dinner": "पालक पनीर सोबत २ चपात्या.",
      "Bedtime": "वेलची पूड घालून उकळलेले दूध."
    },
  ),
  // Month 5-9 follows similar pattern... truncated for brevity in demonstration but can be expanded
  MonthDietPlan(
    monthIndex: 5,
    trimesterIndex: 2,
    primaryNutritionalFocus: ["High-Quality Protein"],
    primaryNutritionalFocusHi: ["उच्च गुणवत्ता प्रोटीन"],
    primaryNutritionalFocusMr: ["उच्च प्रतीचे प्रथिने"],
    mealSchedule: { "Early Morning": "Seeds", "Breakfast": "Idli Sambhar", "Mid-Morning": "Ripe Papaya", "Lunch": "Chole Curry", "Evening Snack": "Boiled Egg", "Dinner": "Wheat Dosa", "Bedtime": "Warm Milk" },
    mealScheduleHi: { "Early Morning": "बीज", "Breakfast": "इडली सांभर", "Mid-Morning": "पका पपीता", "Lunch": "छोले करी", "Evening Snack": "उबला अंडा", "Dinner": "गेहूं डोसा", "Bedtime": "गर्म दूध" },
    mealScheduleMr: { "Early Morning": "बियाणे", "Breakfast": "इडली सांबर", "Mid-Morning": "पिकलेले पपई", "Lunch": "छोले करी", "Evening Snack": "उकडलेले अंडे", "Dinner": "गव्हाचा डोसा", "Bedtime": "कोमट दूध" },
  ),
  MonthDietPlan(
    monthIndex: 6,
    trimesterIndex: 2,
    primaryNutritionalFocus: ["Fiber", "Hydration"],
    primaryNutritionalFocusHi: ["फाइबर", "जलयोजन"],
    primaryNutritionalFocusMr: ["फायबर", "हायड्रेशन"],
    mealSchedule: { "Early Morning": "Soaked raisins", "Breakfast": "Oatmeal", "Mid-Morning": "Lemon water", "Lunch": "Lauki sabzi", "Evening Snack": "Veg Sandwich", "Dinner": "Dalia", "Bedtime": "Turmeric Milk" },
    mealScheduleHi: { "Early Morning": "भीगी किशमिश", "Breakfast": "ओटमील", "Mid-Morning": "नींबू पानी", "Lunch": "लौकी की सब्जी", "Evening Snack": "वेज सैंडविच", "Dinner": "दलिया", "Bedtime": "हल्दी दूध" },
    mealScheduleMr: { "Early Morning": "भिजवलेले मनुके", "Breakfast": "ओटमील लापशी", "Mid-Morning": "लिंबू पाणी", "Lunch": "दुधी भोपळ्याची भाजी", "Evening Snack": "व्हेजिटेबल सँडविच", "Dinner": "दालिया", "Bedtime": "हळदीचे दूध" },
  ),
  MonthDietPlan(
    monthIndex: 7,
    trimesterIndex: 3,
    primaryNutritionalFocus: ["Protein", "Omega-3", "Calcium"],
    primaryNutritionalFocusHi: ["प्रोटीन", "ओमेगा-3", "कैल्शियम"],
    primaryNutritionalFocusMr: ["प्रथिने", "ओमेगा-३", "कॅल्शियम"],
    mealSchedule: { "Early Morning": "Walnuts", "Breakfast": "Paneer Paratha", "Mid-Morning": "Fruit chaat", "Lunch": "Soya chunks", "Evening Snack": "Makhana", "Dinner": "Khichdi", "Bedtime": "Warm milk" },
    mealScheduleHi: { "Early Morning": "अखरोट", "Breakfast": "पनीर पराठा", "Mid-Morning": "फ्रूट चाट", "Lunch": "सोया चंक्स", "Evening Snack": "मखाना", "Dinner": "खिचड़ी", "Bedtime": "गर्म दूध" },
    mealScheduleMr: { "Early Morning": "अक्रोड", "Breakfast": "पनीर पराठा", "Mid-Morning": "फ्रूट चाट", "Lunch": "सोया चंक्स", "Evening Snack": "मखाणे", "Dinner": "खिचड़ी", "Bedtime": "कोमट दूध" },
  ),
  MonthDietPlan(
    monthIndex: 8,
    trimesterIndex: 3,
    primaryNutritionalFocus: ["Low-Sodium", "Comfort"],
    primaryNutritionalFocusHi: ["कम सोडियम", "आराम"],
    primaryNutritionalFocusMr: ["कमी सोडियम", "आराम"],
    mealSchedule: { "Early Morning": "Coconut water", "Breakfast": "plain Dosa", "Mid-Morning": "Veg soup", "Lunch": "Rice & Dal", "Evening Snack": "Apple", "Dinner": "Gourd sabzi", "Bedtime": "Cold milk" },
    mealScheduleHi: { "Early Morning": "नारियल पानी", "Breakfast": "सादा डोसा", "Mid-Morning": "वेज सूप", "Lunch": "चावल और दाल", "Evening Snack": "सेब", "Dinner": "कद्दू की सब्जी", "Bedtime": "ठंडा दूध" },
    mealScheduleMr: { "Early Morning": "शहाळ्याचे पाणी", "Breakfast": "सादा डोसा", "Mid-Morning": "व्हेज सूप", "Lunch": "वरण-भात", "Evening Snack": "सफरचंद", "Dinner": "भोपळ्याची भाजी", "Bedtime": "थंड दूध" },
  ),
  MonthDietPlan(
    monthIndex: 9,
    trimesterIndex: 3,
    primaryNutritionalFocus: ["Labor Preparation"],
    primaryNutritionalFocusHi: ["प्रसव की तैयारी"],
    primaryNutritionalFocusMr: ["बाळंतपणाची तयारी"],
    mealSchedule: { "Early Morning": "Dates", "Breakfast": "Paratha", "Mid-Morning": "Smoothie", "Lunch": "Rice & Dal", "Evening Snack": "Poha", "Dinner": "Paneer curry", "Bedtime": "Ghee milk" },
    mealScheduleHi: { "Early Morning": "खजूर", "Breakfast": "पराठा", "Mid-Morning": "स्मूदी", "Lunch": "चावल और दाल", "Evening Snack": "पोहा", "Dinner": "पनीर करी", "Bedtime": "घी वाला दूध" },
    mealScheduleMr: { "Early Morning": "खजूर", "Breakfast": "पराठा", "Mid-Morning": "स्मूदी", "Lunch": "वरण-भात", "Evening Snack": "पोहे", "Dinner": "पनीर करी", "Bedtime": "तूप घातलेले दूध" },
  ),
];
