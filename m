Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OFzUJJ9zHECINDEa7rbBEYAUEgUMsh/e8C5axJU9N2I=; b=fG5SW7LmqOkFsGv3GPPMZoZkk2
	8LNoKt56N9hDPvk17WK/VaWdsq778zT7GwztZl0GxmLZ8o5xI9KgRBeOd4NfndIXJ0rweT2EP5gkD
	VXBvLRYpniTYM8NFloGG6OMaYBMgWJpgOTO1v5jF6cJZpzYIZpVeDWaXFvZxm7kEDZBDs6sXDpblD
	wbJ+BZma4tJ3DTGBzpiTc17/yCTS0LzWtow/hVyJwC3Um+DEjDv8dEjynkkMel53KRnqptiS9AaDe
	TSHv/2/7YcQGi/JUEt9WsUHARk7c3mPRvfgvuxNFANyT1s3Y1KUBP5vPrUU4trhICdxjw36x+sSiG
	rnXTh8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6tD7-00H45V-R7; Thu, 30 Jun 2022 12:23:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6tCv-00H41u-MO; Thu, 30 Jun 2022 12:23:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 879696601952;
	Thu, 30 Jun 2022 13:23:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656591819;
	bh=pRuI3oSvrHw82NBFcjDTrEAhu9UwJal4NerMnIQjBTM=;
	h=From:To:Cc:Subject:Date:From;
	b=eIfbfgMDXzw9VJ8gxnAYh+zc2D1jRwvoedENIECM7J6jAF935Hd3qKV/oMUB1PE7Q
	 myddxKhnwr0TW4ti4Fx6JY/zCvz3ajpZGqPsLCu+B7PX8a2ocv2poiu1rELkkOEdnP
	 53LyfflQ+jeM6Y6DmFLCi3j9wpjsueVqld0SKX2isDFs0N5W/sR0xbzRwgVWySi83d
	 DMsiA7AOuRvjXgzBFvLJweGyZyC5sGdDXQa6G3ON5FTsz6g1/m8jC1jF6Ms5C64V+d
	 W8d8pQ1Jq9+aK/Mnmfc9xzNyZkJT6T58UPzX+lnKS+nEgEJdLa2EC37o/xQr5Dawev
	 RmyRgwguExezw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nfraprado@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: pinctrl: mt8195: Fix name for mediatek,rsel-resistance-in-si-unit
Date: Thu, 30 Jun 2022 14:23:34 +0200
Message-Id: <20220630122334.216903-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_052342_005536_C20E9B43 
X-CRM114-Status: GOOD (  10.58  )
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

When this property was introduced, it contained underscores, but
the actual code wants dashes.

Change it from mediatek,rsel_resistance_in_si_unit to
mediatek,rsel-resistance-in-si-unit.

Fixes: 91e7edceda96 ("dt-bindings: pinctrl: mt8195: change pull up/down description")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Note: No devicetree uses this property as of now.
      Even if any DT did, it wouldn't work, as the pinctrl code checks
      for 'mediatek,rsel-resistance-in-si-unit'.

 .../devicetree/bindings/pinctrl/pinctrl-mt8195.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 15989743afd2..b0fea44403e7 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -51,7 +51,7 @@ properties:
     description: The interrupt outputs to sysirq.
     maxItems: 1
 
-  mediatek,rsel_resistance_in_si_unit:
+  mediatek,rsel-resistance-in-si-unit:
     type: boolean
     description: |
       Identifying i2c pins pull up/down type which is RSEL. It can support
@@ -144,7 +144,7 @@ patternProperties:
               "MTK_PUPD_SET_R1R0_11" define in mt8195.
               For pull down type is RSEL, it can add RSEL define & resistance
               value(ohm) to set different resistance by identifying property
-              "mediatek,rsel_resistance_in_si_unit".
+              "mediatek,rsel-resistance-in-si-unit".
               It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
               & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
               & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
@@ -163,7 +163,7 @@ patternProperties:
               };
               An example of using si unit resistance value(ohm):
               &pio {
-                mediatek,rsel_resistance_in_si_unit;
+                mediatek,rsel-resistance-in-si-unit;
               }
               pincontroller {
                 i2c0_pin {
@@ -192,7 +192,7 @@ patternProperties:
               "MTK_PUPD_SET_R1R0_11" define in mt8195.
               For pull up type is RSEL, it can add RSEL define & resistance
               value(ohm) to set different resistance by identifying property
-              "mediatek,rsel_resistance_in_si_unit".
+              "mediatek,rsel-resistance-in-si-unit".
               It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
               & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
               & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
@@ -211,7 +211,7 @@ patternProperties:
               };
               An example of using si unit resistance value(ohm):
               &pio {
-                mediatek,rsel_resistance_in_si_unit;
+                mediatek,rsel-resistance-in-si-unit;
               }
               pincontroller {
                 i2c0-pins {
-- 
2.35.1


