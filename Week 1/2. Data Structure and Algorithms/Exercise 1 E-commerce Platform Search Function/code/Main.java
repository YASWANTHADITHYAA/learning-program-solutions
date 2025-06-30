import java.util.Arrays;
import java.util.Comparator;

public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(1, "Laptop", "Electronics"),
            new Product(2, "Shirt", "Apparel"),
            new Product(3, "Mobile", "Electronics"),
            new Product(4, "Notebook", "Stationery"),
            new Product(5, "Shoes", "Footwear")
        };

        System.out.println("Linear Search:");
        Product foundLinear = SearchUtility.linearSearch(products, "Mobile");
        System.out.println(foundLinear != null ? foundLinear : "Product not found");

        Arrays.sort(products, Comparator.comparing(Product::getProductName));

        System.out.println("Binary Search:");
        Product foundBinary = SearchUtility.binarySearch(products, "Mobile");
        System.out.println(foundBinary != null ? foundBinary : "Product not found");
    }
}
