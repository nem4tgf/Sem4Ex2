package model;

import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Laptop", 1000, "Powerful gaming laptop"));
        productList.add(new Product(2, "Smartphone", 500, "Latest model smartphone"));
    }

    public static List<Product> getAllProducts() {
        return productList;
    }

    public static Product getProductById(int id) {
        return productList.stream().filter(p -> p.getId() == id).findFirst().orElse(null);
    }

    public static void addProduct(Product product) {
        productList.add(product);
    }

    public static void updateProduct(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == product.getId()) {
                productList.set(i, product);
                return;
            }
        }
    }

    public static void deleteProduct(int id) {
        productList.removeIf(p -> p.getId() == id);
    }
}
