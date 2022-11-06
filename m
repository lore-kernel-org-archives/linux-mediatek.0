Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC42C43217
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHVO61sMpRHTxKeTwC3bQjHXnh5eWGHHpN5gb6vKtgc=; b=E5uKO2JlXfFnq5
	0XXOLcCBofzM70eBVP1dyDOt8YBy+FOG7hyzWHLaeBV+rBNhVw1VuYNMzIHGJ0e6Hnfd3lPM90rsc
	0LTt/yEm8SuPURwXuhdECe7zYpPKsQJElMFlRAx0wjinG4hXjxqILfvFKEsB8pmen0wSIiSr8HpnG
	eBk4uBFJAHov8w2f5B7I1XE8yeQ+dY7iIv1l3qjv+Pyo7YASWFXagU3tPVNPnQ5PAsRG8Mnf7ruvH
	A6wcnVYPffN+Ws3h9OgPVt7+4RkgII6yhqtlQUpRJ5V07oqDPpwlJHQ+hucai6dU2pUyAJr2L0FE/
	Ggx00o6KAo2C0KNOztnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orabp-007eIC-BY; Sun, 06 Nov 2022 08:02:25 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraaz-007dvM-79; Sun, 06 Nov 2022 08:01:35 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 3D64E604C3;
	Sun,  6 Nov 2022 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667721690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHVO61sMpRHTxKeTwC3bQjHXnh5eWGHHpN5gb6vKtgc=;
	b=YcXi9KioWqywKeslw1CSVwgIpPPBqSnWmU/T/7zpHpkPG70MAcld+jx1xJTNjGw7LIDJ2q
	4tL3cumd7hbidPickQ+sGRYf2v78KQPyNo4H09iYhEHfUr4Wd2r9jXBO30JMicskfNgdcr
	7uRFy33CnM/M29UyC/kY9pTpLu+802c=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 9223A3602A8;
	Sun,  6 Nov 2022 08:01:29 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 3/6] dt-bindings: pinctrl: mt7986: add generic bias-pull* support
Date: Sun,  6 Nov 2022 09:01:10 +0100
Message-Id: <20221106080114.7426-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106080114.7426-1-linux@fw-web.de>
References: <20221106080114.7426-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 5333ed4a-a8b8-42f9-93fa-0fd8ca8d62b3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_010133_626239_CE474E4F 
X-CRM114-Status: GOOD (  10.84  )
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

Since the bias-pull-{up,down} attribute already defines in pinctrl driver
of mediatek MT7986 SoC, this patch updates bindings to support mediatek
common bias-pull* function.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 50 +++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index b2b9c01efd70..216b356cd519 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -292,9 +292,23 @@ patternProperties:
 
           bias-disable: true
 
-          bias-pull-up: true
-
-          bias-pull-down: true
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+                description: normal pull up.
+              - enum: [100, 101, 102, 103]
+                description: |
+                  PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0 defines in
+                  dt-bindings/pinctrl/mt65xx.h.
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+                description: normal pull down.
+              - enum: [100, 101, 102, 103]
+                description: |
+                  PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0 defines in
+                  dt-bindings/pinctrl/mt65xx.h.
 
           input-enable: true
 
@@ -346,6 +360,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt65xx.h>
 
     soc {
       #address-cells = <2>;
@@ -412,5 +427,34 @@ examples:
           };
         };
 
+        mmc0_pins_default: mmc0-pins {
+          mux {
+            function = "emmc";
+            groups = "emmc_51";
+          };
+          conf-cmd-dat {
+            pins = "EMMC_DATA_0", "EMMC_DATA_1", "EMMC_DATA_2",
+                   "EMMC_DATA_3", "EMMC_DATA_4", "EMMC_DATA_5",
+                   "EMMC_DATA_6", "EMMC_DATA_7", "EMMC_CMD";
+            input-enable;
+            drive-strength = <4>;
+            bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+          };
+          conf-clk {
+            pins = "EMMC_CK";
+            drive-strength = <6>;
+            bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+          };
+          conf-ds {
+            pins = "EMMC_DSL";
+            bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+          };
+          conf-rst {
+            pins = "EMMC_RSTB";
+            drive-strength = <4>;
+            bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+          };
+        };
+
       };
     };
-- 
2.34.1


