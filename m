From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 2/4] mfd: mediatek: int_con and int_status may vary in location
Date: Sun, 10 Jan 2016 17:18:47 +0100
Message-ID: <1452442729-27154-3-git-send-email-blogic@openwrt.org>
References: <1452442729-27154-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1452442729-27154-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

MT6323 has the INT_CON and INT_STATUS located at a different position.
Make the registers locations configurable.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
 drivers/mfd/mt6397-core.c       |   27 +++++++++++++++++----------
 include/linux/mfd/mt6397/core.h |    2 ++
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 1749c1c..75ad0fe 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -69,8 +69,10 @@ static void mt6397_irq_sync_unlock(struct irq_data *data)
 {
 	struct mt6397_chip *mt6397 = irq_data_get_irq_chip_data(data);
 
-	regmap_write(mt6397->regmap, MT6397_INT_CON0, mt6397->irq_masks_cur[0]);
-	regmap_write(mt6397->regmap, MT6397_INT_CON1, mt6397->irq_masks_cur[1]);
+	regmap_write(mt6397->regmap, mt6397->int_con[0],
+		     mt6397->irq_masks_cur[0]);
+	regmap_write(mt6397->regmap, mt6397->int_con[1],
+		     mt6397->irq_masks_cur[1]);
 
 	mutex_unlock(&mt6397->irqlock);
 }
@@ -147,8 +149,8 @@ static irqreturn_t mt6397_irq_thread(int irq, void *data)
 {
 	struct mt6397_chip *mt6397 = data;
 
-	mt6397_irq_handle_reg(mt6397, MT6397_INT_STATUS0, 0);
-	mt6397_irq_handle_reg(mt6397, MT6397_INT_STATUS1, 16);
+	mt6397_irq_handle_reg(mt6397, mt6397->int_status[0], 0);
+	mt6397_irq_handle_reg(mt6397, mt6397->int_status[1], 16);
 
 	return IRQ_HANDLED;
 }
@@ -177,8 +179,8 @@ static int mt6397_irq_init(struct mt6397_chip *mt6397)
 	mutex_init(&mt6397->irqlock);
 
 	/* Mask all interrupt sources */
-	regmap_write(mt6397->regmap, MT6397_INT_CON0, 0x0);
-	regmap_write(mt6397->regmap, MT6397_INT_CON1, 0x0);
+	regmap_write(mt6397->regmap, mt6397->int_con[0], 0x0);
+	regmap_write(mt6397->regmap, mt6397->int_con[1], 0x0);
 
 	mt6397->irq_domain = irq_domain_add_linear(mt6397->dev->of_node,
 		MT6397_IRQ_NR, &mt6397_irq_domain_ops, mt6397);
@@ -203,8 +205,8 @@ static int mt6397_irq_suspend(struct device *dev)
 {
 	struct mt6397_chip *chip = dev_get_drvdata(dev);
 
-	regmap_write(chip->regmap, MT6397_INT_CON0, chip->wake_mask[0]);
-	regmap_write(chip->regmap, MT6397_INT_CON1, chip->wake_mask[1]);
+	regmap_write(chip->regmap, chip->int_con[0], chip->wake_mask[0]);
+	regmap_write(chip->regmap, chip->int_con[1], chip->wake_mask[1]);
 
 	enable_irq_wake(chip->irq);
 
@@ -215,8 +217,8 @@ static int mt6397_irq_resume(struct device *dev)
 {
 	struct mt6397_chip *chip = dev_get_drvdata(dev);
 
-	regmap_write(chip->regmap, MT6397_INT_CON0, chip->irq_masks_cur[0]);
-	regmap_write(chip->regmap, MT6397_INT_CON1, chip->irq_masks_cur[1]);
+	regmap_write(chip->regmap, chip->int_con[0], chip->irq_masks_cur[0]);
+	regmap_write(chip->regmap, chip->int_con[1], chip->irq_masks_cur[1]);
 
 	disable_irq_wake(chip->irq);
 
@@ -237,6 +239,11 @@ static int mt6397_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mt6397->dev = &pdev->dev;
+	mt6397->int_con[0] = MT6397_INT_CON0;
+	mt6397->int_con[1] = MT6397_INT_CON1;
+	mt6397->int_status[0] = MT6397_INT_STATUS0;
+	mt6397->int_status[1] = MT6397_INT_STATUS1;
+
 	/*
 	 * mt6397 MFD is child device of soc pmic wrapper.
 	 * Regmap is set from its parent.
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index 45b8e8a..d678f52 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -60,6 +60,8 @@ struct mt6397_chip {
 	u16 wake_mask[2];
 	u16 irq_masks_cur[2];
 	u16 irq_masks_cache[2];
+	u16 int_con[2];
+	u16 int_status[2];
 };
 
 #endif /* __MFD_MT6397_CORE_H__ */
-- 
1.7.10.4
