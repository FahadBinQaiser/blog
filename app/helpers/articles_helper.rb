module ArticlesHelper
  def article_bg_gradient
      "relative bg-gradient-to-br from-emerald-50 to-green-100 dark:from-gray-900 dark:to-gray-800 rounded-3xl p-8 shadow-xl hover:scale-105 hover:-translate-y-10 transition-transform duration-500 flex flex-col h-full"
  end
  def article_heading_color
      "text-2xl font-bold text-gray-900 dark:text-white mb-2 group-hover:text-emerald-700 dark:group-hover:text-emerald-400 transition-colors"
  end
  def article_subheading_color
      "text-gray-700 dark:text-gray-300 text-base mb-6 line-clamp-3"
  end
  def article_date_color
      "inline-block bg-emerald-500/10 text-emerald-700 dark:text-emerald-300 px-3 py-1 rounded-full text-xs font-semibold"
  end
end
