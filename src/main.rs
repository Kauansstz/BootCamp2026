use std::collections::HashMap;

#[derive(Clone)]
struct Asset {
    symbol: String,
    price: f64,
}

struct Position {
    asset: Asset,
    quantity: f64,
}

struct Portfolio {
    positions: HashMap<String, Position>,
    cash: f64,
}

impl Portfolio {
    fn new(cash: f64) -> Self {
        Self {
            positions: HashMap::new(),
            cash,
        }
    }

    fn buy(&mut self, asset: Asset, quantity: f64) -> Result<(), String> {
        let cost = asset.price * quantity;

        if cost > self.cash {
            return Err("Insufficient cash".to_string());
        }

        self.cash -= cost;

        self.positions
            .entry(asset.symbol.clone())
            .and_modify(|p| p.quantity += quantity)
            .or_insert(Position { asset, quantity });

        Ok(())
    }

    fn sell(&mut self, symbol: &str, quantity: f64) -> Result<(), String> {
        let position = self.positions.get_mut(symbol);

        match position {
            Some(p) => {
                if p.quantity < quantity {
                    return Err("Insufficient asset quantity".to_string());
                }

                p.quantity -= quantity;
                self.cash += p.asset.price * quantity;

                if p.quantity == 0.0 {
                    self.positions.remove(symbol);
                }

                Ok(())
            }
            None => Err("Asset not found".to_string()),
        }
    }

    fn total_value(&self) -> f64 {
        let mut total = self.cash;

        for p in self.positions.values() {
            total += p.asset.price * p.quantity;
        }

        total
    }

    fn summary(&self) {
        println!("Cash: {}", self.cash);

        for p in self.positions.values() {
            println!(
                "{} -> qty: {} | price: {} | total: {}",
                p.asset.symbol,
                p.quantity,
                p.asset.price,
                p.asset.price * p.quantity
            );
        }

        println!("Total portfolio value: {}", self.total_value());
    }
}

fn main() {
    let mut portfolio = Portfolio::new(10000.0);

    let btc = Asset {
        symbol: "BTC".to_string(),
        price: 30000.0,
    };

    let eth = Asset {
        symbol: "ETH".to_string(),
        price: 2000.0,
    };

    let _ = portfolio.buy(btc, 0.2);
    let _ = portfolio.buy(eth, 2.0);
    let _ = portfolio.sell("ETH", 1.0);

    portfolio.summary();
}