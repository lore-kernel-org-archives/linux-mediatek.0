Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF77C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEJQGyDJSuh4+z5LtnMFKscBXW0isz3f4WizAj2Jdxw=; b=xumA2jhBMv2Or6
	eZypxf5XWewcgmUzkT6tIFKFC+//uruxfFFIhzu/mZEC0vHqt+MraISODYC53ZExz7LvURgLQJzrU
	+k7ClT5R6o7jP21asFvnjtV2Zv7AmhYzVl/YogIE3frJBFRsAUTm4NDsCdRISXnCEZGOMTb/c27GG
	NXdiIVeRU5Dr5+SYzJs0oRHVHTCIKoNNE9EJ1cFFupyDAZYBR81pK67ks1TmsAAuGEjELrOQ2dGRU
	pbH3tfg4xBWh5skHsq3UOoTw15GKEjFHQV4mhZYqGTYsjilRRF27ebVf1inlgziWZ933knkYmY8YO
	Pfy4FFweAxNJcUYQVNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orabT-007e7R-0b; Sun, 06 Nov 2022 08:02:03 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraay-007dvY-9d; Sun, 06 Nov 2022 08:01:33 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id D830210075B;
	Sun,  6 Nov 2022 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667721690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEJQGyDJSuh4+z5LtnMFKscBXW0isz3f4WizAj2Jdxw=;
	b=YfVPiKnrxVU2Viyjex9h8cVAehrf941Ew8fL0QNs6MbOfVG98t9PNwnDvV3QZdPq5xlNTB
	qWSGPGKcld2uANbuvOw2FptFkWvlaoDxzVINlqvNag5n12Gw5ldGRDNmpoywuDnlduAdDi
	Em2ZGBW5Bh/l2bcaxGwmCB7fwSf2ECo=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 3E916360707;
	Sun,  6 Nov 2022 08:01:30 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/6] pinctrl: mediatek: fix the pinconf register offset of some pins
Date: Sun,  6 Nov 2022 09:01:11 +0100
Message-Id: <20221106080114.7426-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106080114.7426-1-linux@fw-web.de>
References: <20221106080114.7426-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 13d05f96-153e-485d-878b-9d50fa9b3bcd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_010132_506723_7CF59709 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

Correct the bias-pull-up, bias-pull-down and bias-disable register
offset of mt7986 pin-42 to pin-49, in the original driver, the
relative offset value was erroneously decremented by 1.

Fixes: 360de6728064 ("pinctrl: mediatek: add support for MT7986 SoC")
Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 95f32e62e02f..d13c59510468 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -316,10 +316,10 @@ static const struct mtk_pin_field_calc mt7986_pin_pupd_range[] = {
 	PIN_FIELD_BASE(38, 38, IOCFG_LT_BASE, 0x30, 0x10, 9, 1),
 	PIN_FIELD_BASE(39, 40, IOCFG_RB_BASE, 0x60, 0x10, 18, 1),
 	PIN_FIELD_BASE(41, 41, IOCFG_RB_BASE, 0x60, 0x10, 12, 1),
-	PIN_FIELD_BASE(42, 43, IOCFG_RB_BASE, 0x60, 0x10, 22, 1),
-	PIN_FIELD_BASE(44, 45, IOCFG_RB_BASE, 0x60, 0x10, 20, 1),
-	PIN_FIELD_BASE(46, 47, IOCFG_RB_BASE, 0x60, 0x10, 26, 1),
-	PIN_FIELD_BASE(48, 49, IOCFG_RB_BASE, 0x60, 0x10, 24, 1),
+	PIN_FIELD_BASE(42, 43, IOCFG_RB_BASE, 0x60, 0x10, 23, 1),
+	PIN_FIELD_BASE(44, 45, IOCFG_RB_BASE, 0x60, 0x10, 21, 1),
+	PIN_FIELD_BASE(46, 47, IOCFG_RB_BASE, 0x60, 0x10, 27, 1),
+	PIN_FIELD_BASE(48, 49, IOCFG_RB_BASE, 0x60, 0x10, 25, 1),
 	PIN_FIELD_BASE(50, 57, IOCFG_RT_BASE, 0x40, 0x10, 2, 1),
 	PIN_FIELD_BASE(58, 58, IOCFG_RT_BASE, 0x40, 0x10, 1, 1),
 	PIN_FIELD_BASE(59, 59, IOCFG_RT_BASE, 0x40, 0x10, 0, 1),
@@ -354,10 +354,10 @@ static const struct mtk_pin_field_calc mt7986_pin_r0_range[] = {
 	PIN_FIELD_BASE(38, 38, IOCFG_LT_BASE, 0x40, 0x10, 9, 1),
 	PIN_FIELD_BASE(39, 40, IOCFG_RB_BASE, 0x70, 0x10, 18, 1),
 	PIN_FIELD_BASE(41, 41, IOCFG_RB_BASE, 0x70, 0x10, 12, 1),
-	PIN_FIELD_BASE(42, 43, IOCFG_RB_BASE, 0x70, 0x10, 22, 1),
-	PIN_FIELD_BASE(44, 45, IOCFG_RB_BASE, 0x70, 0x10, 20, 1),
-	PIN_FIELD_BASE(46, 47, IOCFG_RB_BASE, 0x70, 0x10, 26, 1),
-	PIN_FIELD_BASE(48, 49, IOCFG_RB_BASE, 0x70, 0x10, 24, 1),
+	PIN_FIELD_BASE(42, 43, IOCFG_RB_BASE, 0x70, 0x10, 23, 1),
+	PIN_FIELD_BASE(44, 45, IOCFG_RB_BASE, 0x70, 0x10, 21, 1),
+	PIN_FIELD_BASE(46, 47, IOCFG_RB_BASE, 0x70, 0x10, 27, 1),
+	PIN_FIELD_BASE(48, 49, IOCFG_RB_BASE, 0x70, 0x10, 25, 1),
 	PIN_FIELD_BASE(50, 57, IOCFG_RT_BASE, 0x50, 0x10, 2, 1),
 	PIN_FIELD_BASE(58, 58, IOCFG_RT_BASE, 0x50, 0x10, 1, 1),
 	PIN_FIELD_BASE(59, 59, IOCFG_RT_BASE, 0x50, 0x10, 0, 1),
@@ -392,10 +392,10 @@ static const struct mtk_pin_field_calc mt7986_pin_r1_range[] = {
 	PIN_FIELD_BASE(38, 38, IOCFG_LT_BASE, 0x50, 0x10, 9, 1),
 	PIN_FIELD_BASE(39, 40, IOCFG_RB_BASE, 0x80, 0x10, 18, 1),
 	PIN_FIELD_BASE(41, 41, IOCFG_RB_BASE, 0x80, 0x10, 12, 1),
-	PIN_FIELD_BASE(42, 43, IOCFG_RB_BASE, 0x80, 0x10, 22, 1),
-	PIN_FIELD_BASE(44, 45, IOCFG_RB_BASE, 0x80, 0x10, 20, 1),
-	PIN_FIELD_BASE(46, 47, IOCFG_RB_BASE, 0x80, 0x10, 26, 1),
-	PIN_FIELD_BASE(48, 49, IOCFG_RB_BASE, 0x80, 0x10, 24, 1),
+	PIN_FIELD_BASE(42, 43, IOCFG_RB_BASE, 0x80, 0x10, 23, 1),
+	PIN_FIELD_BASE(44, 45, IOCFG_RB_BASE, 0x80, 0x10, 21, 1),
+	PIN_FIELD_BASE(46, 47, IOCFG_RB_BASE, 0x80, 0x10, 27, 1),
+	PIN_FIELD_BASE(48, 49, IOCFG_RB_BASE, 0x80, 0x10, 25, 1),
 	PIN_FIELD_BASE(50, 57, IOCFG_RT_BASE, 0x60, 0x10, 2, 1),
 	PIN_FIELD_BASE(58, 58, IOCFG_RT_BASE, 0x60, 0x10, 1, 1),
 	PIN_FIELD_BASE(59, 59, IOCFG_RT_BASE, 0x60, 0x10, 0, 1),
-- 
2.34.1


