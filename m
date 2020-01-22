Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF14BC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 07:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 919442465B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 07:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FzzW496t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lFTMEXVl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 919442465B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grXrQ+7A6tPxgJpNJWfKA+TjsaDIbpx1DHTjMdzBwKI=; b=FzzW496tlznXM3
	ZN9i6OdcfLwi+tGj3CTtai+w2jgdXK2JEZia90xmAf3Gx1dm7ElzpoegQ1Zn1d3cb+2XcJeIyL0lO
	U1kiyfMizYTWFpt9JT8Ue28FZlzkQWh65d7mFUTeipD7FiS69ukRFqZ1SqVgyP3o9pKfjcKQOrwtp
	Z4oW5zbp2x49UjPU3cvTMOHM4AF3Q4gutvEAyUkVNJ9fM6L4ekcYL36oKi2EKl50JkRFCGc3bJwM7
	JHvvcnd2a7zNj9NqSSA5xmhNKs8+sWiguqi/mVPMzd+Rpz2EXVBavd2QrA0+ic3Dla71N8se86Vgv
	OI7hjHA5X09M16qpAh9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuA2x-000283-BV; Wed, 22 Jan 2020 07:03:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuA2t-000261-Vs
 for linux-mediatek@lists.infradead.org; Wed, 22 Jan 2020 07:03:25 +0000
X-UUID: 554d79960e4b486ab068cdadc689d979-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Bkkv2SlP/58V7+P3Bi8i3ZC64d86zcDO203xGyHiNBg=; 
 b=lFTMEXVlMJsyXXM9Pka6P0VqG6juX++DUWU+D3/25oO25OqA2jQgoRA+zsaekCDW/etkHGAkwXvqTqnyCg1tgKwH0tfoYzfryc1kGrCPeycSRSlDOs9Cqkworb8FtYi4HKwkSwM1Oofb2O6QyFkkEQBZvNRcG46Co+iCorZKc/o=;
X-UUID: 554d79960e4b486ab068cdadc689d979-20200121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 636956114; Tue, 21 Jan 2020 23:03:20 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 22:53:17 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 22 Jan 2020 14:52:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 22 Jan 2020 14:51:57 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v8 1/6] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
Date: Wed, 22 Jan 2020 14:53:09 +0800
Message-ID: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 660429F95FABC97ED3652C11CAB95C6BF2D0D521B77C9A655959A16674A913DA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_230324_030667_FC0471AB 
X-CRM114-Status: GOOD (  12.50  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

1. Check if gpio pin number is in valid range to prevent from get invalid
   pointer 'desc' in the following code:
	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];

2. Improve  mtk_hw_pin_field_lookup()
2.1 Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
     search.
2.2 Correct message after the following check fail:
    if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
		rc = &hw->soc->reg_cal[field];
    The original message is:
    	"Not support field %d for pin %d (%s)\n"
    However, the check is on soc chip level, not on pin level yet.
    So the message is corrected as:
    	"Not support field %d for this soc\n"

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 27 ++++++++++++++++++------
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 25 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 20e1c89..d63e05e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -68,32 +68,44 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 {
 	const struct mtk_pin_field_calc *c, *e;
 	const struct mtk_pin_reg_calc *rc;
+	int start = 0, end, check;
+	bool found = false;
 	u32 bits;
 
 	if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
 		rc = &hw->soc->reg_cal[field];
 	} else {
 		dev_dbg(hw->dev,
-			"Not support field %d for pin %d (%s)\n",
-			field, desc->number, desc->name);
+			"Not support field %d for this soc\n", field);
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
+			found = true;
+			break;
+		} else if (start == end)
 			break;
-		c++;
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
@@ -182,6 +194,9 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 	if (err)
 		return err;
 
+	if (value < 0 || value > pf.mask)
+		return -EINVAL;
+
 	if (!pf.next)
 		mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
 			(value & pf.mask) << pf.bitpos);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 923264d..3e13ae7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -81,6 +81,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	int val, val2, err, reg, ret = 1;
 	const struct mtk_pin_desc *desc;
 
+	if (pin >= hw->soc->npins)
+		return -EINVAL;
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch (param) {
@@ -206,6 +208,10 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	int err = 0;
 	u32 reg;
 
+	if (pin >= hw->soc->npins) {
+		err = -EINVAL;
+		goto err;
+	}
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch ((u32)param) {
@@ -693,6 +699,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
@@ -708,6 +717,9 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
+	if (gpio > hw->soc->npins)
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
@@ -722,6 +734,9 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
+	if (gpio > hw->soc->npins)
+		return;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
@@ -729,12 +744,22 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
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
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
