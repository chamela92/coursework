import 'package:newsapp/models/category_model.dart';

List<CategoryModel>getCategories(){

  List<CategoryModel> category = [];
  CategoryModel categoryModel =  new CategoryModel();

  categoryModel.categoryName ="Business";
  categoryModel.image ="assets/busi.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName ="Entertainment";
  categoryModel.image ="assets/entertain.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName ="General";
  categoryModel.image ="assets/gene.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName ="Health";
  categoryModel.image ="assets/health.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName ="Sports";
  categoryModel.image ="assets/sports.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}