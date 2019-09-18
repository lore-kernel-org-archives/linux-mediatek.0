From: Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH v5 1/5] pinctrl: mediatek: Check gpio pin number and use binary  search in mtk_hw_pin_field_lookup()
Date: Wed, 18 Sep 2019 10:39:04 +0800
Message-ID: <1568774348-24363-1-git-send-email-light.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, sean.wang@kernel.org, Light Hsieh <light.hsieh@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

1. Check if gpio pin number is in valid range to prevent from get invalid
   pointer 'desc' in the following code:
	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];

2. Use binary search in mtk_hw_pin_field_lookup()
   Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
   search.

---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 +++++++++++++++++++-----
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 20e1c89..4687f63 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -68,7 +68,7 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 {
 	const struct mtk_pin_field_calc *c, *e;
 	const struct mtk_pin_reg_calc *rc;
-	u32 bits;
+	u32 bits, start = 0, end, found = 0, check;
 
 	if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
 		rc = &hw->soc->reg_cal[field];
@@ -79,21 +79,32 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 		return -ENOTSUPP;
 	}
 
+	end = rc->nranges - 1;
 	c = rc->range;
 	e = c + rc->nranges;
 
-	while (c < e) {
-		if (desc->number >= c->s_pin && desc->number <= c->e_pin)
+	while (start <= end) {
+		check = (start + end) >> 1;
+		if (desc->number >= rc->range[check].s_pin
+		 && desc->number <= rc->range[check].e_pin) {
+			found = 1;
 			break;
-		c++;
+		} else if (start == end)
+			break;
+		else if (desc->number < rc->range[check].s_pin)
+			end = check - 1;
+		else
+			start = check + 1;
 	}
 
-	if (c >= e) {
+	if (!found) {
 		dev_dbg(hw->dev, "Not support field %d for pin = %d (%s)\n",
 			field, desc->number, desc->name);
 		return -ENOTSUPP;
 	}
 
+	c = rc->range + check;
+
 	if (c->i_base > hw->nbase - 1) {
 		dev_err(hw->dev,
 			"Invalid base for field %d for pin = %d (%s)\n",
@@ -182,6 +193,9 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 	if (err)
 		return err;
 
+	if (value < 0 || value > pf.mask)
+		return -EINVAL;
+
 	if (!pf.next)
 		mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
 			(value & pf.mask) << pf.bitpos);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 923264d..28b4951 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -693,6 +693,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
@@ -708,6 +711,9 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
@@ -722,6 +728,9 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
+	if (gpio > hw->soc->npins)
+		return;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
@@ -729,12 +738,22 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
 	return pinctrl_gpio_direction_input(chip->base + gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
 	mtk_gpio_set(chip, gpio, value);
 
 	return pinctrl_gpio_direction_output(chip->base + gpio);
-- 
1.8.1.1.dirty
