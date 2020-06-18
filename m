Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE8FC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:34:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E8A206C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KMGpjqyZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sc2Q/pV3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E8A206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8pyPoVQGu9M6FsY/iWyst+4YVle3moh9M3SO/rZyss=; b=KMGpjqyZq/F3Fn
	YjMMQHriqI+R/yvZ/qrUzpR0VXQfQPpJqyJM/DNf8t3Xo578nJar5ivbaT2R0r1pdyB5rePQDnkjV
	rLOvZwFiTCtF94X5TYtiAKAEss5YWUKhM6moiSxee0uUZmx29Lr+3a0BbCu/TAmMRLaNUQUboDcBl
	9pSC4e8pA5/B6t0v3xxvigc1INT9H9geZgHfNkKuIiWdqjd3defRZDCKSzXZ2xTqAGRAvqMeDWlBr
	cATHeUELNBonMTB2njYxHB2qkC7ArjfcepTnvG+ptU5hd7OW91DFVQDuu9/pI3XapqriEQj9sp/li
	7Zkl+G5ArzStieoNm2rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlsoP-0008TS-Qi; Thu, 18 Jun 2020 11:34:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlsoC-0008FO-GC; Thu, 18 Jun 2020 11:34:17 +0000
X-UUID: 3823626af74141f195f9991c2f1b8534-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hw1Pb8jVQk9FC4VBMjRDMJKfMp8kJn7O5WM3f/NAK3Y=; 
 b=sc2Q/pV320OfrmW8HqdxmtNmKtaZW8dmL0ofVKpkMGFriyYj1M6MGXgAXRTNg3AdV5cEjZZoaTXH7r0kIIqJEqmmt6uWkvF9uXXDdyG3axGi6dB93aDfxu9UVrPlGmRxpH31GJWi7Tr1Ox6EsZWIEy05vDZDHYROl3RL+tbuzrQ=;
X-UUID: 3823626af74141f195f9991c2f1b8534-20200618
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 123669692; Thu, 18 Jun 2020 03:33:59 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 04:34:09 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 19:34:02 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Jun 2020 19:34:02 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH v6 3/7] pinctrl: mediatek: avoid virtual gpio trying to set reg
Date: Thu, 18 Jun 2020 19:33:34 +0800
Message-ID: <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_043416_547946_21773F24 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Mars Cheng <mars.cheng@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

for virtual gpios, they should not do reg setting and
should behave as expected for eint function.

Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |   25 ++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |    1 +
 drivers/pinctrl/mediatek/pinctrl-paris.c         |    7 ++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index b77b18f..c53e2c3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -243,6 +243,28 @@ static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
 	return EINT_NA;
 }
 
+/*
+ * Virtual GPIO only used inside SOC and not being exported to outside SOC.
+ * Some modules use virtual GPIO as eint (e.g. pmif or usb).
+ * In MTK platform, external interrupt (EINT) and GPIO is 1-1 mapping
+ * and we can set GPIO as eint.
+ * But some modules use specific eint which doesn't have real GPIO pin.
+ * So we use virtual GPIO to map it.
+ */
+
+bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
+{
+	const struct mtk_pin_desc *desc;
+	bool virt_gpio = false;
+
+	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
+
+	if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
+		virt_gpio = true;
+
+	return virt_gpio;
+}
+
 static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 			     unsigned int *gpio_n,
 			     struct gpio_chip **gpio_chip)
@@ -295,6 +317,9 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
 	if (err)
 		return err;
 
+	if (mtk_is_virt_gpio(hw, gpio_n))
+		return 0;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
 
 	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 27df087..bd079f4f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -315,4 +315,5 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 *val);
 
+bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n);
 #endif /* __PINCTRL_MTK_COMMON_V2_H */
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 90a432b..a23c182 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -769,6 +769,13 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
+	/*
+	 * "Virtual" GPIOs are always and only used for interrupts
+	 * Since they are only used for interrupts, they are always inputs
+	 */
+	if (mtk_is_virt_gpio(hw, gpio))
+		return 1;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
 
 	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
