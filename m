Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E43C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 09:29:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD2D61360
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 09:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CD2D61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EOX6PZGmk3iJtHjen3tB4TXKxEn4l9DafURprEBEG7c=; b=ZUMXJNZR7ZuS1z
	iAikfpztkwG3aiLOsvT06w4liv0Y71zLNUZ89EpxmtXI9YMfETS7WMG4JXwdDodiB3U9qD0zf6fJd
	Z67yYwSyTtTowD9jBJEo7Pzo+UpktZrzB+6UW0C4WPFa0yI0/xdjpcE+oIDYMUNAaSQzZXsgmFGUa
	ailrGG3Mt4QitetNv72gebyREwAFMUfvOAmtLfNk88AjNSqHyBMd8zhbvI4UlkdUw+W40I14W+5Wp
	vpjp0ODA6Cafpo2UhY7i1VugrEjHSEm7R4c0HzVPa3abp8btRUh+SbQsCdGkFaF3sIBpfXOYO9pGa
	4gak8MC6JK+9VP4cQLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mISkJ-002Jnq-LF; Tue, 24 Aug 2021 09:29:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mISkD-002Jm8-Uh; Tue, 24 Aug 2021 09:29:25 +0000
X-UUID: 13e9af91f0a34f7599d0485aa17a4f82-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=dJNLkFJkh9E+MA1ISak4ARAnebZdiLxL3OxH5l33LtE=; 
 b=muB2rj1dkPmA82sKvWyQ9kuFY2EcHk5KQEwyVDI6GeV80x9NPPk9OKY7nyhkhPaqyn7Yn4YgJ+Nu4Gu2sLPa5AY1ffiZT+iUw1qzfe4bFFyrWW3+iYA9/EQhvsKJt5wDgLsjl7AsRvbrKOLF5QzBEoUOQ3vzWtSZzqTcFWzM0ok=;
X-UUID: 13e9af91f0a34f7599d0485aa17a4f82-20210824
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1662616948; Tue, 24 Aug 2021 02:29:19 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 02:29:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 17:29:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 24 Aug 2021 17:29:15 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-clk@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [v3,
 04/12] pinctrl: mediatek: moore: check if pin_desc is valid before use
Date: Tue, 24 Aug 2021 17:29:03 +0800
Message-ID: <20210824092904.25439-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_022922_044263_44553FBC 
X-CRM114-Status: GOOD (  14.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Certain SoC are missing the middle part gpios in consecutive pins,
it's better to check if mtk_pin_desc is a valid pin for the extensibility

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Acked-by: Sean Wang <sean.wang@mediatek.com>

---
v3: added an Acked-by tag.
v2: applied the comment suggested by reviewers:
    - for the pins not ballout, we can fill .name in struct mtk_pin_desc
      as NULL and return -ENOTSUPP in gpio/pinconf ops.
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 3a4a23c40a71..ad3b67163973 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -60,6 +60,8 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		int pin = grp->pins[i];
 
 		desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+		if (!desc->name)
+			return -ENOTSUPP;
 
 		mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
 				 pin_modes[i]);
@@ -76,6 +78,8 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
 				hw->soc->gpio_m);
@@ -89,6 +93,8 @@ static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	/* hardware would take 0 as input direction */
 	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, !input);
@@ -103,6 +109,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -218,6 +226,8 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	int cfg, err = 0;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
 		param = pinconf_to_config_param(configs[cfg]);
@@ -435,6 +445,8 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	int value, err;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
 	if (err)
@@ -449,6 +461,10 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	const struct mtk_pin_desc *desc;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
+	if (!desc->name) {
+		dev_err(hw->dev, "Failed to set gpio %d\n", gpio);
+		return;
+	}
 
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
@@ -490,6 +506,8 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	u32 debounce;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
+	if (!desc->name)
+		return -ENOTSUPP;
 
 	if (!hw->eint ||
 	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE ||
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
