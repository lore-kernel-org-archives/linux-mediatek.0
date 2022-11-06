Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97911C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwzgypedxlgZw3WEvEFkcsmGoeorFZCgPtvDphQ59OA=; b=3Y84L2bczPueGk
	+U+EHLhiUmJKYQK3H5g00llKSsms4UgNtTj+Km2p6JNQvcw4fETkxpujsGxls9M4MlLO6Pa5OPNs0
	CosYTigYKJf5NKfimXP4VEEi9b/8ypLFopCr/hqJR2Wb+8HgdmNVn5ZVn7Kc6jdGWt8URukfrxuUw
	vJMlnAi6JV7aOqHeE0FlVwlj9zlMiWxQq6NGQTSkQzsX0Am2cdr87HXNQFUNzRpRXVXfggZprwtUT
	1zzQaMRvRzf9KGkiUbh8rZyJMVXMQRcllq1GUnZKRDUGm/vL/Iee/QcGuIMSNPirdTcMVCRk5pTj6
	3161aw5G8dOdwsMsUvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orach-007eqg-QZ; Sun, 06 Nov 2022 08:03:19 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraaz-007dvD-30; Sun, 06 Nov 2022 08:01:36 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 9637F40408;
	Sun,  6 Nov 2022 08:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667721689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwzgypedxlgZw3WEvEFkcsmGoeorFZCgPtvDphQ59OA=;
	b=Q1LcpD1a9DvJVkic2PdyY7/9bq8Z+sQ/JT691O5PQxBFxUeBGR5+4aOiytuFb1Qs4auaf3
	zQqOQgUWxOuFUg3WqPLLJemF0Xpz9TembtQs4kEum5GrMhI0U1uJUQCRZ7Q8WWyqzj8qgA
	U7s0sJjpMtdqZWvU//C3gaX3b43o8SY=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id E85063608D6;
	Sun,  6 Nov 2022 08:01:28 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/6] dt-bindings: pinctrl: update uart/mmc bindings for MT7986 SoC
Date: Sun,  6 Nov 2022 09:01:09 +0100
Message-Id: <20221106080114.7426-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106080114.7426-1-linux@fw-web.de>
References: <20221106080114.7426-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 3e7652be-892b-4782-86de-b1a45213699a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_010134_625475_7E25648E 
X-CRM114-Status: GOOD (  11.42  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Fix mmc and uart pins after uart splitting.

Some pinmux pins of the mt7986 pinctrl driver is composed of multiple
pinctrl groups, the original binding only allows one pinctrl group
per dts node, this patch sets "maxItems" for these groups and add new
examples to the binding documentation.

Fixes: 65916a1ca90a ("dt-bindings: pinctrl: update bindings for MT7986 SoC")
Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- squashed version from sam
- v2 was ack'd by Krzysztof, but sams patch included updated emmc-names
  and different structure for uart to allow 2 pingroups
v2:
- wrap on col 80
---
 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 46 +++++++++++++++++--
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 75766956cfad..b2b9c01efd70 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -87,6 +87,8 @@ patternProperties:
           "wifi_led"        "led"       1, 2
           "i2c"             "i2c"       3, 4
           "uart1_0"         "uart"      7, 8, 9, 10
+          "uart1_rx_tx"     "uart"      42, 43
+          "uart1_cts_rts"   "uart"      44, 45
           "pcie_clk"        "pcie"      9
           "pcie_wake"       "pcie"      10
           "spi1_0"          "spi"       11, 12, 13, 14
@@ -98,9 +100,11 @@ patternProperties:
           "emmc_45"         "emmc"      22, 23, 24, 25, 26, 27, 28, 29, 30,
                                         31, 32
           "spi1_1"          "spi"       23, 24, 25, 26
-          "uart1_2"         "uart"      29, 30, 31, 32
+          "uart1_2_rx_tx"   "uart"      29, 30
+          "uart1_2_cts_rts" "uart"      31, 32
           "uart1_1"         "uart"      23, 24, 25, 26
-          "uart2_0"         "uart"      29, 30, 31, 32
+          "uart2_0_rx_tx"   "uart"      29, 30
+          "uart2_0_cts_rts" "uart"      31, 32
           "spi0"            "spi"       33, 34, 35, 36
           "spi0_wp_hold"    "spi"       37, 38
           "uart1_3_rx_tx"   "uart"      35, 36
@@ -157,7 +161,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [emmc, emmc_rst]
+                  enum: [emmc_45, emmc_51]
           - if:
               properties:
                 function:
@@ -227,8 +231,12 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [uart1_0, uart1_1, uart1_2, uart1_3_rx_tx,
-                         uart1_3_cts_rts, uart2_0, uart2_1, uart0, uart1, uart2]
+                  items:
+                    enum: [uart1_0, uart1_rx_tx, uart1_cts_rts, uart1_1,
+                           uart1_2_rx_tx, uart1_2_cts_rts, uart1_3_rx_tx,
+                           uart1_3_cts_rts, uart2_0_rx_tx, uart2_0_cts_rts,
+                           uart2_1, uart0, uart1, uart2]
+                  maxItems: 2
           - if:
               properties:
                 function:
@@ -362,6 +370,27 @@ examples:
         interrupt-parent = <&gic>;
         #interrupt-cells = <2>;
 
+        pcie_pins: pcie-pins {
+          mux {
+            function = "pcie";
+            groups = "pcie_clk", "pcie_wake", "pcie_pereset";
+          };
+        };
+
+        pwm_pins: pwm-pins {
+          mux {
+            function = "pwm";
+            groups = "pwm0", "pwm1_0";
+          };
+        };
+
+        spi0_pins: spi0-pins {
+          mux {
+            function = "spi";
+            groups = "spi0", "spi0_wp_hold";
+          };
+        };
+
         uart1_pins: uart1-pins {
           mux {
             function = "uart";
@@ -369,6 +398,13 @@ examples:
           };
         };
 
+        uart1_3_pins: uart1-3-pins {
+          mux {
+            function = "uart";
+            groups = "uart1_3_rx_tx", "uart1_3_cts_rts";
+          };
+        };
+
         uart2_pins: uart2-pins {
           mux {
             function = "uart";
-- 
2.34.1


