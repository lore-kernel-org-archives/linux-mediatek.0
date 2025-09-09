Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29DFCA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNyb/s8rhsBAw5oMG7jCFkP07jFHaAfhwIfXxzBcLE0=; b=4ekf6ebE6bzV1w5glKSkG/8Rlu
	2xnWjjRAIQXqoe0dE774dljy8y2EDgV0xGbAV9YbeVy/Aakl8XmCMggRs7ZlMKtt/8Rno46PmNh0G
	9GbvXcvKXRwdUBg0Ecn/nj/FQTPXLUdCs6+yFObDxit8jQYiv9cLqW23ILSM4nKo2iLTZwelsvxGv
	cZ3RfraEnSFFZ4RzT1qKsLNcwmEbWtA5q9WNIgUqOehBKQeVxVAo14Mr2c1JGj/FZWPH3AsJQm7vQ
	0a3a4e8QSLPDXbeZhNKSTAQ5zGaMb3q2Br5ePZDDgkfyD5iaqK3Xb46FJARB624bJwRgAIZpPgAcn
	wz7OPyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwUA-00000006iV7-2jBW;
	Tue, 09 Sep 2025 11:26:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuS9-00000005sbg-1tkK
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:15:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45de6415102so16929085e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409352; x=1758014152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNyb/s8rhsBAw5oMG7jCFkP07jFHaAfhwIfXxzBcLE0=;
        b=UOlKz5iYq4l1zLZv3aACzsSNF43Cc7b3RviSyBqC4K00Y2jX5VGKHhn+tjMb6HgT2k
         m835llTursMFYuvezHC4ONqSrLVNTMCVgczCSr6r2eA9+b0tYQ9Z9FgkaJ3vOBegeE3g
         msJtiw/kvIN+n3IS+H7mExOshWtdarOncPydcHFT07AR2LFqauJGKCVnFJ+ClZX/ysZQ
         zyAwV5X6CeeFPb13U3hLV0BqkJFVhsBv1mJWWAIHPNmu1xwL8zxGOrBddIBOBiR1SozW
         Np/OEshD6tGlC51G7bXIgNlqceTY1ihznUuOFeQ3pCREuMTtwAY/UbRLI5av1pbxdC3k
         ahqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409352; x=1758014152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNyb/s8rhsBAw5oMG7jCFkP07jFHaAfhwIfXxzBcLE0=;
        b=ggFbsapZNYJJRgQM9So0RN9Gd3cTT13P9U9OXu8soDPGFO5TwCQy3S4xQWSu3a7+QQ
         Zy78qE6CkXy6Yky+xRY8fMVYQpJ0PJbVXg9t0xHy7VG1e6WSRwtefso65qaiO7xTGMLr
         hzvB2akM07pBRv5yKkVZLd2dCJ2UiMjSR+/sexa3Gjidr6bkqJ6o/vBZqB6p3whxmrby
         EY+bmIRKvaBhfQAnJdjLEO7/WWlR/8qKOX9KaALfSB6iUNlEocaC6iXWMw7DXgU6YnA1
         /mtwnshyGFpenUYlhtRQQ0rmwMnZ5kUy9P6UDynTo28oHetUnonqX26Mv3XTXXj8SbA2
         f1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEu9//BIpHRP+MSzTio4tmkyYI3/XB7WkOokI3bT38gYBPGmMc+Ysvpeo7z/PoSP2qTc1qUq7flY3erfAc9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfWgwnckYdSQ23P5gl0DRir48C/12BZgnMEv9+lShh9KYzrc2E
	yR0iIVWvx8w2WFKf58Tr6fAQi1FUd5qSJ4szd2c939pfiDdGtI8fcszwjoW5qXrpPoE=
X-Gm-Gg: ASbGncuQnX5+cn1W+QEFY3a47RUkRPvEh+figaboC9Tr2fjiODMGUPyI7rG28yv9/XJ
	rCAl5z+nVhVONtbNSYgNNvwuX1BIXETIEoGxYs4azjK2IJ538enUEu1b6Jk+qoLj7IQi2TqoXUw
	j81Ydq6swwcYdNiNTizxDpKPkIVYvHFnDShzHB6vl5dbvt4AwYSu6yT2MDaQP7G8Oj9xMZUMKwv
	Bd2qAk5lGSR+Qs0MSW8RbJosoMDItIpXpMGwFXRHLY9PKb3solHi6lip0iKW8Hyf1zfLVgbEP31
	uQb/X/vP+t6O6RVuCMeQK/vGdOvjyWM+k5JbrB7YAcGRhYrnmvYaLP+ZecW1vlGVGr2fLTbYBsk
	CbxMoLm95iA+Yc/Z5Q7WHk7G1y30Mfx6u04fxM8k=
X-Google-Smtp-Source: AGHT+IH7uav1IGVrER9dF4PIYsOMNVrb5nwXYkyZEzGGA0F6yjDXZab7m4d2f1saSDymZ1SvoB+UGw==
X-Received: by 2002:a05:600c:4f4e:b0:45d:d13f:6061 with SMTP id 5b1f17b1804b1-45df12e35efmr10405945e9.30.1757409351787;
        Tue, 09 Sep 2025 02:15:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:32 +0200
Subject: [PATCH 05/15] gpio: ath79: use the generic GPIO chip lock for IRQ
 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-5-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5431;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wEUGfBQ2UNxF7/X679yAoQw1e/9zTBMrjziqIk7+UbI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A3rUn0axD0jqdCFa1rrDC0FyUulthioK0bV
 kzSvPlTeQiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNwAKCRARpy6gFHHX
 cj5IEAC93Ew7Nap6XkKixHXb8mM7E7WAQwY12FXIbaAQ3/zHlili51XHOWjWy6W0b/hG+b3cdyz
 flhBhVFWTBh7gYvARJNn1QcUi8VMWqMd498eNSoKzxs/zcTYuqR/fz+YJLQTOIE1hI73iQiQNJz
 ACHbxiRCtfcv5xxo0k8Dr4LlKgxZ2yzEjXyCPBp8ba9QuZffZ46y5r3NNuIMUzEOwkJtU2nQ24p
 Ka39Mq10yb7hjNe9iAubmhlHN0Q5jFZKuK0UZ5rG6JGgnYfRSiwmLOFxXDeDCbgPHMLdwy5W3eH
 1DdThWaN3Alnc0POqBRA2LNuUrQkUp7plh7P0A9FUZTDNii7LGARLOkjyJm6iJKPFG/MzLB/uPd
 TNUtjyiOw0o4J2UM4bsHSvoWCZl/zK6Az0fppMrHEFrl9Xqk3mKZKp6H+JYu1xBUFzPDYBwyaEl
 VfyRFoeaR3XQAZzVvCXq3znCPJOQGzp8Y6nCMKSutM37jxi9VcUtr/fX46IagulYISBKOWl4+fq
 aa4+9tadu04IcOzyjmkAku8D+39RruxxdigQqZ9Ij+CQqEBHO5HKc/R/ExQZTaYdLMVAwdjZJ7T
 JSb7oJhUdEBGsKTnSxzrw6JLAGFtikjqEZ5jQy4QoE4OsgtPQI8VtFynvDHdyo6YHRHKGSS9+IB
 ibJ40dH4keBex6w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_021553_518045_8A386019 
X-CRM114-Status: GOOD (  16.89  )
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

This driver uses its own raw spinlock in interrupt routines while the
generic GPIO chip callbacks use a separate one. This is, of course, racy
so use the fact that the lock in generic GPIO chip is also a raw
spinlock and convert the interrupt handling functions in this module to
using the provided generic GPIO chip locking API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 51 ++++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 1b2a59ddbec4088c95fb766277bb94ffff8692b2..75c9e3bf7db1b5fbfede960dd1c0b3a76d2ecb8f 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -31,7 +31,6 @@
 struct ath79_gpio_ctrl {
 	struct gpio_generic_chip chip;
 	void __iomem *base;
-	raw_spinlock_t lock;
 	unsigned long both_edges;
 };
 
@@ -72,23 +71,22 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
 	gpiochip_enable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
+
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_mask(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
-	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip)
+		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
+
 	gpiochip_disable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 }
 
@@ -96,24 +94,20 @@ static void ath79_gpio_irq_enable(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_disable(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, 0);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static int ath79_gpio_irq_set_type(struct irq_data *data,
@@ -122,7 +116,6 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
 	u32 type = 0, polarity = 0;
-	unsigned long flags;
 	bool disabled;
 
 	switch (flow_type) {
@@ -144,7 +137,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 
 	if (flow_type == IRQ_TYPE_EDGE_BOTH) {
 		ctrl->both_edges |= mask;
@@ -169,8 +162,6 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		ath79_gpio_update_bits(
 			ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-
 	return 0;
 }
 
@@ -192,26 +183,24 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct ath79_gpio_ctrl *ctrl =
 		container_of(gen_gc, struct ath79_gpio_ctrl, chip);
-	unsigned long flags, pending;
+	unsigned long pending;
 	u32 both_edges, state;
 	int irq;
 
 	chained_irq_enter(irqchip, desc);
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip) {
+		pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
 
-	pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
-
-	/* Update the polarity of the both edges irqs */
-	both_edges = ctrl->both_edges & pending;
-	if (both_edges) {
-		state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
-		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
-				both_edges, ~state);
+		/* Update the polarity of the both edges irqs */
+		both_edges = ctrl->both_edges & pending;
+		if (both_edges) {
+			state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
+			ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
+					       both_edges, ~state);
+		}
 	}
 
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-
 	for_each_set_bit(irq, &pending, gc->ngpio)
 		generic_handle_domain_irq(gc->irq.domain, irq);
 
@@ -256,8 +245,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-	raw_spin_lock_init(&ctrl->lock);
-
 	config = (typeof(config)){
 		.dev = dev,
 		.sz = 4,

-- 
2.48.1


