Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EACC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHVO61sMpRHTxKeTwC3bQjHXnh5eWGHHpN5gb6vKtgc=; b=fATpI2w1tJ2wk1
	hnGmp035TbkNwHcpfcpXD5FeGmnnGW4pQbP/5c6H31JLgZ0pJUrHq+C6IeEEDAYjzvJwWqjHTzS0l
	jt/sewYHMieezZU5OpWzww0UFXZ8hy6NXE61CChzjZEwOBaNB/R2toCbDRN3vNzdm02b/KbluCrYE
	jQAUgsUQ+2cqepd9/TVnunD6vF7kEQsGEPrcCAV3TTAJdaqQRibXMMKB1AZvSzTzixzZbU6oCYffd
	JyH14LNuL6qQDtnUwfBxioVaeocBMK2C0ePEedON0bd/OWeij72QG+MVWuRRm3ce/D72gYl0ciKHJ
	8cMKrEyORksDS6J3X7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orEsA-0068ol-9D; Sat, 05 Nov 2022 08:49:50 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orErh-0068dn-QQ; Sat, 05 Nov 2022 08:49:24 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 2A4295FC59;
	Sat,  5 Nov 2022 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667638156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHVO61sMpRHTxKeTwC3bQjHXnh5eWGHHpN5gb6vKtgc=;
	b=dlXu0jSWNQwNTQJIZrwdsITPltGvR3rP+HMF9m7a1iDRR4Wbc0IpY55eH2PjQBa0twnde/
	WiWUuZA53S0GO0CiO8lbUeXN5MtjdhuO67gPL5tRRKEvypbMlxFdEhIYB5qQCyKUBzI+GF
	PYawopFRghqx8B0FOLpx0rlwzRBwGKA=
Received: from frank-G5.. (fttx-pool-217.61.159.50.bambit.de [217.61.159.50])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 706811003E5;
	Sat,  5 Nov 2022 08:49:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/4] dt-bindings: pinctrl: mt7986: add generic bias-pull* support
Date: Sat,  5 Nov 2022 09:49:02 +0100
Message-Id: <20221105084905.9596-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221105084905.9596-1-linux@fw-web.de>
References: <20221105084905.9596-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e97ff404-521a-4664-9485-df946569a965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_014922_030865_1C978933 
X-CRM114-Status: GOOD (  10.66  )
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


