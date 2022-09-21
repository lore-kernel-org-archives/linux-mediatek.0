Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A045DC6FA90
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 15:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cw2WFK5oE+1VMyjk+WDBom5kmV2q/a6VhTKF2aMbhA=; b=GyfBzs2rS51ttV+BjKc5SjDebb
	viziT7bREK5/AW8K+Ys8Ioz8/Ww7HmLCqJHfy236cX8zo0CShRCpuffll1GlNE+UsixycZSKyq63C
	tc+qcNX0sTpUVapV8dJR5GFBwWgXdakQwS8Zqbc7WkdmOswXyMDZm96V9MysdRD1O3/RqKhxi0Rp2
	q+wdkyQynMZLWZfwmk0cn19viQmnFSZzgw/F4YCP3l+u+K1G+iC0GkocUmjjeM1OhmpeLhiIPG5fX
	p2jOVLSFD2//KltpIbmnoy8Zi4kMyMSB7rUMaftI8wOIsRtQVRr9EKnB/N4FFgeS51ozSTAlM0yRY
	0pl3X0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob23R-00Bqaj-FF; Wed, 21 Sep 2022 15:54:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob237-00BqSY-Ol; Wed, 21 Sep 2022 15:54:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6554AB830CA;
	Wed, 21 Sep 2022 15:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8DFC43145;
	Wed, 21 Sep 2022 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663775646;
	bh=ltWOdhCi4WgafmHd2YL/5444t2bzTYe2PF/tCbDgrRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uj6ouWhjMM79xQw/X53kttXs6kHQiif0w/BFN3Pyh72MLSQ64ma0qImilI9EcxVEa
	 pfRbCGGYnT10lRH5bi45huLFzWcVci047a8gKF1EQ6O4JqBhXnPGinzQrlZMM9WxUF
	 x1pyGSqDNLKv3OdnnowFzQLQGg5wiWsult/2GZFOoTPoGwiyKY3euCJfscGRcNUPgC
	 MWts7ZoPvi1/MFUCHyEkNJmE/werNLBLGGzcnb5e953hoA6DDdqZECOGI11IkP34Qo
	 x/3H+lfKtQIjAd0X9BSpAeDu8gRLQnnjxk9oDoVeSy3DQQ1/7v44UcEbidqqxUY3/8
	 ITNyaXs2Nd4Wg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sasha Levin <sashal@kernel.org>,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.19 16/16] gpio: mt7621: Make the irqchip immutable
Date: Wed, 21 Sep 2022 11:53:32 -0400
Message-Id: <20220921155332.234913-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155332.234913-1-sashal@kernel.org>
References: <20220921155332.234913-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_085410_115037_21B5C1A1 
X-CRM114-Status: GOOD (  14.82  )
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

From: Sergio Paracuellos <sergio.paracuellos@gmail.com>

[ Upstream commit 09eed5a1ed3c752892663976837eb4244c2f1984 ]

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips.  Following this change the following warnings
are now observed for the mt7621 driver:

gpio gpiochip0: (1e000600.gpio-bank0): not an immutable chip, please consider fixing it!
gpio gpiochip1: (1e000600.gpio-bank1): not an immutable chip, please consider fixing it!
gpio gpiochip2: (1e000600.gpio-bank2): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the mt7621 driver immutable.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-mt7621.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index d8a26e503ca5..f163f5ca857b 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -112,6 +112,8 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 rise, fall, high, low;
 
+	gpiochip_enable_irq(gc, d->hwirq);
+
 	spin_lock_irqsave(&rg->lock, flags);
 	rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
 	fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
@@ -143,6 +145,8 @@ mediatek_gpio_irq_mask(struct irq_data *d)
 	mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
 	mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
 	spin_unlock_irqrestore(&rg->lock, flags);
+
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static int
@@ -204,6 +208,16 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
 	return gpio % MTK_BANK_WIDTH;
 }
 
+static const struct irq_chip mt7621_irq_chip = {
+	.name		= "mt7621-gpio",
+	.irq_mask_ack	= mediatek_gpio_irq_mask,
+	.irq_mask	= mediatek_gpio_irq_mask,
+	.irq_unmask	= mediatek_gpio_irq_unmask,
+	.irq_set_type	= mediatek_gpio_irq_type,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int
 mediatek_gpio_bank_probe(struct device *dev, int bank)
 {
@@ -238,11 +252,6 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		return -ENOMEM;
 
 	rg->chip.offset = bank * MTK_BANK_WIDTH;
-	rg->irq_chip.name = dev_name(dev);
-	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
-	rg->irq_chip.irq_mask = mediatek_gpio_irq_mask;
-	rg->irq_chip.irq_mask_ack = mediatek_gpio_irq_mask;
-	rg->irq_chip.irq_set_type = mediatek_gpio_irq_type;
 
 	if (mtk->gpio_irq) {
 		struct gpio_irq_chip *girq;
@@ -262,7 +271,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		}
 
 		girq = &rg->chip.irq;
-		girq->chip = &rg->irq_chip;
+		gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;
-- 
2.35.1


