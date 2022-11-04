package com.design.factory;

public abstract class Factory {
	public final Product create(String serialNumber) {
		Product product = createProduct(serialNumber);
		registerProduct(product);

		return product;
	}

	protected abstract Product createProduct(String serialNumber);

	protected abstract void registerProduct(Product product);
}