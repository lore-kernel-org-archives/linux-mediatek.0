Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EF3C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 07:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D561960F4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 07:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D561960F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjwyAvIU3w/cDu9pC0cnaSJJuxGBOs9qE6/ruiNq0YQ=; b=ZJ/nrQQNVO+mzB
	g1S5yl3ljGr4PQDPdT3vX4fy2TMhE7PRJzbPSlx9qmvlG266ayvXZB5aqMQJnzUj29Xez0Ih7XiZ+
	bGGxpMNMfTMrSHUqsBd9f4Us2suskoUZ8IJh4MBSWwurYmxb+AQkECuDKxb/0XNVq+3dC2KybAamy
	7bLYiGKBb8as42wKyE9/+RTLCuIuzQBPcMFPxKibVowFIVUhSSb0tkL2LlvuAwRISaklh+aR24z0y
	9r8kmzZL+XPq4CfLEXSAgZxzO3E8cw/AyHoTCUoSU4VHOMgXjIsCnEqyrCfw4IUAFQ6hgReyPG6ty
	1GNBZPuFQA+ANMSNgQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7usV-009sJU-Ci; Mon, 26 Jul 2021 07:18:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7urn-009rzc-Tx; Mon, 26 Jul 2021 07:17:37 +0000
X-UUID: 10ecb17d90fd44e2b17154ecadf09ed9-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UZrEQ1Gueqv3npil/XtvARd4aMi/IIIz2XDd6yD3CHs=; 
 b=vAs+rIw/+RIXjFw0zOPL4euuoO77qnmJTgpkUGB8lGOM2XNQypL9mB3Z9OO/eO/Dsnz8yzj5MXJFUP5mFWIArLklmNFRnGxy5coZdLSKUpnudL5CcCpdTnPhn01/tIrtUiCACi4vEj58I5pCXFSf8y+w2/oLtKLL+IQULaP0jbc=;
X-UUID: 10ecb17d90fd44e2b17154ecadf09ed9-20210726
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 384554014; Mon, 26 Jul 2021 00:17:28 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 00:17:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 15:17:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 26 Jul 2021 15:17:24 +0800
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
Subject: [PATCH 04/12] pinctrl: mediatek: moore: use pin number in
 mtk_pin_desc instead of array index
Date: Mon, 26 Jul 2021 15:14:31 +0800
Message-ID: <20210726071439.14248-5-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210726071439.14248-1-sam.shih@mediatek.com>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_001736_106557_2EC78C2B 
X-CRM114-Status: GOOD (  16.07  )
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
it's better to use pin number in mtk_pin_desc instead of array index
for the extensibility

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 61 ++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 3a4a23c40a71..16206254ec3d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -35,6 +35,19 @@ static const struct pin_config_item mtk_conf_items[] = {
 };
 #endif
 
+static int mtk_pin_desc_lookup(struct mtk_pinctrl *hw, int pin)
+{
+	int idx;
+
+	for (idx = 0 ; idx < hw->soc->npins ; idx++)
+		if (hw->soc->pins[idx].number == pin)
+			break;
+	if (idx < hw->soc->npins)
+		return idx;
+
+	return -EINVAL;
+}
+
 static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned int selector, unsigned int group)
 {
@@ -74,6 +87,13 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
+	int err;
+
+	err = mtk_pin_desc_lookup(hw, pin);
+	if (err >= 0)
+		pin = err;
+	else
+		return err;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
@@ -87,6 +107,13 @@ static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
+	int err;
+
+	err = mtk_pin_desc_lookup(hw, pin);
+	if (err >= 0)
+		pin = err;
+	else
+		return err;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
@@ -102,6 +129,12 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	int val, val2, err, reg, ret = 1;
 	const struct mtk_pin_desc *desc;
 
+	err = mtk_pin_desc_lookup(hw, pin);
+	if (err >= 0)
+		pin = err;
+	else
+		return err;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch (param) {
@@ -217,6 +250,12 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	u32 reg, param, arg;
 	int cfg, err = 0;
 
+	err = mtk_pin_desc_lookup(hw, pin);
+	if (err >= 0)
+		pin = err;
+	else
+		return err;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	for (cfg = 0; cfg < num_configs; cfg++) {
@@ -434,6 +473,12 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
+	err = mtk_pin_desc_lookup(hw, gpio);
+	if (err >= 0)
+		gpio = err;
+	else
+		return err;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
@@ -447,6 +492,15 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
+	int err;
+
+	err = mtk_pin_desc_lookup(hw, gpio);
+	if (err >= 0) {
+		gpio = err;
+	} else {
+		dev_err(hw->dev, "Failed to set gpio %d\n", gpio);
+		return;
+	}
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
@@ -488,6 +542,13 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 	u32 debounce;
+	int err;
+
+	err = mtk_pin_desc_lookup(hw, offset);
+	if (err >= 0)
+		offset = err;
+	else
+		return err;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
 
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
