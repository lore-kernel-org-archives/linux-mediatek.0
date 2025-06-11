Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC8BC71133
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/XNNifl471C5Gj5Z74tlpg5uINvJ7cxGXpUhY5qwHw=; b=hk9018m4lloDPvoa/Es/35505M
	z7gKhqylvhbidBLk+KheofltIbYj50MvO9uRU5tK/iQCvQGAPsAfpOWBjkBPw3XR9b2+jz/nlNpPo
	I+oHj1qI8RJoWV6oRC/Aqwl/vAJsL3mod3vexb02yNoaRFuTaCYzUEblXFc/fAk6FuBmuRUiT4Bd1
	cX2rB1CNMtBxwpfLFKVLVQtazrPwYi6kOoNxhcHJE9yYbHNWYoiipgiKDDt5DIfD4RzkakSo2Q9Cm
	uC+czeryaNqebQ+RaKsNpanzFJkHxQnRPYkiYXiztFUi3nEHAcKvUjmY+ATjrSsIl+Os7oSCRKVIy
	63ZiIgtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmM-0000000ATPP-34pS;
	Wed, 11 Jun 2025 15:54:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIwf-00000009e6K-31Wb;
	Wed, 11 Jun 2025 10:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66F30448E3;
	Wed, 11 Jun 2025 10:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AB5C4CEF3;
	Wed, 11 Jun 2025 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638677;
	bh=DFXb2Sd1AviR0meTWbNWr6As2FJfbh6fzCtv+oFGSEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxwd/KZPJJwG9Ywjh1/PhRGVdKW45Lk0qDePpntE/WGmu+0Cu+8m9ZsJhmwrjm15d
	 pp0KgriTv6qpadEyjMj9KerrndYQbYAhprMi5SKtSuNmYGWRXdacFwBDwWd+S6CccU
	 xqi2pRmxylUOrjjpZnm+QhpDOWYtok/3ghf8eiB3i2CckpHXr7l28hWPvOvng9giI8
	 JHOqZZcVOEFSSG8xZdAYrrin2Ng2c/TGFsm72zZ6S7anjMveDsnWgTBpYoeS9KcUFk
	 /O093vWRxY02LXlWByH+fKEDXWdRDV8IEaUzWwsu2fRxDZeuVcNLncmyA7dlrHU7Bu
	 thZbbZf5ZCDFQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] pinctrl: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:45 +0200
Message-ID: <20250611104348.192092-17-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_034437_805165_8D7B560D 
X-CRM114-Status: GOOD (  14.35  )
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

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

--

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/pinctrl/mediatek/mtk-eint.c   | 4 ++--
 drivers/pinctrl/pinctrl-at91-pio4.c   | 6 +++---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index d906a5e4101f..9f175c73613f 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -561,8 +561,8 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 			goto err_eint;
 	}
 
-	eint->domain = irq_domain_create_linear(of_fwnode_handle(eint->dev->of_node),
-						eint->hw->ap_num, &irq_domain_simple_ops, NULL);
+	eint->domain = irq_domain_create_linear(dev_fwnode(eint->dev), eint->hw->ap_num,
+						&irq_domain_simple_ops, NULL);
 	if (!eint->domain)
 		goto err_eint;
 
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index ca8a54a43ff5..57f105ac962d 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1212,9 +1212,9 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 		dev_dbg(dev, "bank %i: irq=%d\n", i, ret);
 	}
 
-	atmel_pioctrl->irq_domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
-			atmel_pioctrl->gpio_chip->ngpio,
-			&irq_domain_simple_ops, NULL);
+	atmel_pioctrl->irq_domain = irq_domain_create_linear(dev_fwnode(dev),
+							     atmel_pioctrl->gpio_chip->ngpio,
+							     &irq_domain_simple_ops, NULL);
 	if (!atmel_pioctrl->irq_domain)
 		return dev_err_probe(dev, -ENODEV, "can't add the irq domain\n");
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index bf8612d72daa..a090d78a3413 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1646,7 +1646,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 		}
 	}
 
-	pctl->domain = irq_domain_create_linear(of_fwnode_handle(node),
+	pctl->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev),
 						pctl->desc->irq_banks * IRQ_PER_BANK,
 						&sunxi_pinctrl_irq_domain_ops, pctl);
 	if (!pctl->domain) {
-- 
2.49.0


