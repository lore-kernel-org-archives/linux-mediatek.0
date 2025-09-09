Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D629CA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfVsXcyRTPM0823GsALirp0A0UZxDbq+MOQO0Rm+6MM=; b=Yu5NKi71muICTqpNNGbVAJTYql
	t8MZzmA0w6zC5MODmXBN/qtXC7AVedpsnmewzP/iWAUyTjILbOWuGfmbstaDoSms2NxQj7TsxaWQh
	wXGkVKPrPqxBOs2SDkQt0TpA4M0QwRJVUercPV/9oxrjk3vFe6OZ41TKNtpocYl9Ys1beqfs/ISGf
	Be2cvywgK26/GxcWNjrG7Edmn61MuY+ZYRXtQMO1ZvZDdfZ+SY3kgRUD4mOZ5hNKwkm0smsK6ZP27
	Iw5JwaLlG96wR3cbWxEkIyKa1jeT1PdWm7W5McR7RCCoAgE5LhVb+zcvBj47ldAOR1f+Wra9fK6PO
	oalos5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Ps-000000088AP-19vb;
	Tue, 09 Sep 2025 15:37:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuS7-00000005sZv-238T
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45dda7d87faso26253235e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409350; x=1758014150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfVsXcyRTPM0823GsALirp0A0UZxDbq+MOQO0Rm+6MM=;
        b=vAhMzLWnPq4yLd6mCRFrboEhsFrGvFccksDRp3cn/2qaC60dXFlfFNIpgmvcv+Ex3n
         pJH659L9ishn572IBj+tBcD4ObQ1te/YHGMhial7n0xqNhaGZaCma6ZdbJmKvM7l3r44
         gQHdYG8hTTGTm/afSK7imMEpGYr0aAQGNRxy0Dw7Its1MLxvbJwFiekCl2EJcOtMUw99
         L9pbuJWZo8W8/ZP3ILP+tdQGC7oIqwf3+z2WXwzwXSmUghV5EyC8rrZWmdEhlCtp7SNQ
         7Hh2YKf3v1QTQzuLVTsDetpAI1U7afc4YVmJWVv1ef1PinSwucOBmcd5PYXF8ygO5lPJ
         yiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409350; x=1758014150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfVsXcyRTPM0823GsALirp0A0UZxDbq+MOQO0Rm+6MM=;
        b=YkTn4U3E33niKY6yRv00EsjZXO0xt85CIMMpAxWC5jv1vGcED0WSO3OU5b5uscuyRJ
         Argmj6TMfkkwpULzcX7jDojXjErYgyGUPRBg5V8MMkC92kMYSUCZZncqYXrb5fH/ZgXY
         mPjJ8SNib1dzHCgKDm4zYguL45gprb0jmcCC+YYA5+XoJAocWs2S32rxGLxpeEogVJKE
         suHcGnoZ5oTxG6YOBieN9LA+e5j64g2kscuzTJIn9haLwD1w9IrJbWeGFFV47IibEEnu
         2xOtW4OP0Ao/STQWl6Zk+T5tC7/a6OGB5Xp2I+Cq1r91wMnyo07GinGc0N0zb70m1Zmn
         wrpg==
X-Forwarded-Encrypted: i=1; AJvYcCWmXDD5XyUh4EgHqKfoFgjsfTfL3cIf4jU/ekz/dQjgKAs5TzAxQWrJgsOjryUOLtczFz3HXrACGxUyVk4MKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvRow59U7UWd8a6yz8p65q9wdLH9JuM+gYqTGhQAxnGH+1+7Hl
	FgRPh+aRQbzjlT+3ldnHRCpPj9+kPifsypy7KNtrThHSXnOHkT03qfwkjYYLlDdkSvo=
X-Gm-Gg: ASbGncviMKiQaJ5HaEXI90ApZPVoPhFpOk1qoPTv7TG/mFpaAKOUkE6D9JpOt8w20ie
	6EhqvWXgX+61oZfNYBr4R/9xrl9QgEcNtZ14daaLIhKk7hFz+TH1HqljC7n+EKj6Xry57bjULwj
	YLL699RxkB6El/pcC8tEDcvY3BQYezRtc81RCQiMs2nb5HLIREvvtKyEkne3xCuBDMQVeQDWdTo
	vuo+yX2omXIEe6G86YEFa29C210DOQIBuVGJl+7idtqVoge6cZ2zIBRAhrp0LbAMd1lh5Ehnw8v
	7HVkI4wvzd8tFpz1jRzPIxQyyY6r1CRlOZO7wGmHv8GQbuPR6he4Q7iEVu5ai1PujkZo+Q+qcAz
	XkL6Kcqm7Z00Xpyoocw==
X-Google-Smtp-Source: AGHT+IFWuFmitLzvuFEhGEXuEuX7h1gnAXktOXE047kf9ZXksjM66NyEnLgZClefDTe7m/DeVUPeow==
X-Received: by 2002:a05:600c:6304:b0:45b:43cc:e558 with SMTP id 5b1f17b1804b1-45dddef818cmr82339105e9.35.1757409349756;
        Tue, 09 Sep 2025 02:15:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:31 +0200
Subject: [PATCH 04/15] gpio: ath79: use new generic GPIO chip API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-4-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4596;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KmFRStxrtBvgq9SHCuo+p5UvH6qsrW0hcSZujIjU2hM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A3uBuQUbggrZea4yqPMYEhQc7SR2SyAu4FG
 dnGFptiCCCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNwAKCRARpy6gFHHX
 cn7KEAC75xLioRo7Kh1dAfxq+uodLO/+7Wk5UsHsHIvgNKgcWkuWxxBBlb5yTHgZY8lOfw01MAv
 HLoSw+kRGn25m6kndbzXFcCkeAazbboy8tacIA34T9zLdqqiwNpQ6savUwoWwvQkJCe0Zd1sqyI
 X0+vuDS5bIpm+F1QnjiLMe0Sbb5PdipzpKDn9Qwvnh9Q1eKdnSW7fzabnl+ZttJSyqO9c77+dlW
 vo0l5G1dhMiwMY22CWhQs+0Gf2yPiwTZNH2IZggwTy5Na4Y7W6g8ioYaRYaAVsV7JVE+2sagt1b
 7Z6NrRm51Mjd01e8i9/OaOH/o3nrWYM3/CETm+sekj8hOtYGtazwGUB8hHTtSy1++BBuRVvn1w5
 8rHU8b0ScSiXUkEMSJ+BcGNF15jH3HfKtRCJN3+oO9GO/zHO96i5/v9gIeW/n/B5ivuN9QYHj3H
 2A2/MveLQWeuYS6pJTiDY0LW+Ca84OmZDAL7rXXHxhhBR2GGAsU7R+G/J9V54uK7wxEpV29NbAJ
 ZhSbTRuR8KfbBPHNHz4dMXLnfg3POU4uZ9gTYS4Hj4W2nq7UIAFdcqefi4dcZ4isDmpX37sSQN9
 7tu6A1Uoe8feo2JitwhMJoDwuuxnvLFgCKh3IiC+gesr2EEf4/dOHoE2K9kLjL3LpOHzh3r2b96
 UGm1jx/g7L4nGcg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021551_555433_3442E3AE 
X-CRM114-Status: GOOD (  17.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index de4cc12e5e0399abcef61a89c8c91a1b203d20fb..1b2a59ddbec4088c95fb766277bb94ffff8692b2 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -10,6 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mod_devicetable.h>
@@ -28,7 +29,7 @@
 #define AR71XX_GPIO_REG_INT_MASK	0x24
 
 struct ath79_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	raw_spinlock_t lock;
 	unsigned long both_edges;
@@ -37,8 +38,9 @@ struct ath79_gpio_ctrl {
 static struct ath79_gpio_ctrl *irq_data_to_ath79_gpio(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 
-	return container_of(gc, struct ath79_gpio_ctrl, gc);
+	return container_of(gen_gc, struct ath79_gpio_ctrl, chip);
 }
 
 static u32 ath79_gpio_read(struct ath79_gpio_ctrl *ctrl, unsigned reg)
@@ -72,7 +74,7 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	gpiochip_enable_irq(&ctrl->gc, irqd_to_hwirq(data));
+	gpiochip_enable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
@@ -87,7 +89,7 @@ static void ath79_gpio_irq_mask(struct irq_data *data)
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-	gpiochip_disable_irq(&ctrl->gc, irqd_to_hwirq(data));
+	gpiochip_disable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 }
 
 static void ath79_gpio_irq_enable(struct irq_data *data)
@@ -187,8 +189,9 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct ath79_gpio_ctrl *ctrl =
-		container_of(gc, struct ath79_gpio_ctrl, gc);
+		container_of(gen_gc, struct ath79_gpio_ctrl, chip);
 	unsigned long flags, pending;
 	u32 both_edges, state;
 	int irq;
@@ -224,6 +227,7 @@ MODULE_DEVICE_TABLE(of, ath79_gpio_of_match);
 
 static int ath79_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ath79_gpio_ctrl *ctrl;
 	struct gpio_irq_chip *girq;
@@ -253,21 +257,26 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(ctrl->base);
 
 	raw_spin_lock_init(&ctrl->lock);
-	err = bgpio_init(&ctrl->gc, dev, 4,
-			ctrl->base + AR71XX_GPIO_REG_IN,
-			ctrl->base + AR71XX_GPIO_REG_SET,
-			ctrl->base + AR71XX_GPIO_REG_CLEAR,
-			oe_inverted ? NULL : ctrl->base + AR71XX_GPIO_REG_OE,
-			oe_inverted ? ctrl->base + AR71XX_GPIO_REG_OE : NULL,
-			0);
+
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = ctrl->base + AR71XX_GPIO_REG_IN,
+		.set = ctrl->base + AR71XX_GPIO_REG_SET,
+		.clr = ctrl->base + AR71XX_GPIO_REG_CLEAR,
+		.dirout = oe_inverted ? NULL : ctrl->base + AR71XX_GPIO_REG_OE,
+		.dirin = oe_inverted ? ctrl->base + AR71XX_GPIO_REG_OE : NULL,
+	};
+
+	err = gpio_generic_chip_init(&ctrl->chip, &config);
 	if (err) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize generic GPIO chip\n");
 		return err;
 	}
 
 	/* Optional interrupt setup */
 	if (device_property_read_bool(dev, "interrupt-controller")) {
-		girq = &ctrl->gc.irq;
+		girq = &ctrl->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &ath79_gpio_irqchip);
 		girq->parent_handler = ath79_gpio_irq_handler;
 		girq->num_parents = 1;
@@ -280,7 +289,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_simple_irq;
 	}
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->chip.gc, ctrl);
 }
 
 static struct platform_driver ath79_gpio_driver = {

-- 
2.48.1


