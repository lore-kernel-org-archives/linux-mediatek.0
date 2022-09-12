Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486FEECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AZpuDZd6s7XQEx6mFFMWytK+mLYefyhJ9Oq8oES2roM=; b=R9kdj2+y00EJYhAWf8GC1ykNLZ
	iKQNsZJxuWe7Szb1ccalYhqd5nlikDJ2kLlMykzx1089/EIHzlIW/Ts+XNeKciOdLOZKtrZ59M3++
	Cw+9z7eHt3dLC64J0Od4LEBkoodgdmazHenTtYQfbs/6fZKxJqfZhmncCvqDesOFPgKmibD/HQkKs
	GS/F7WVjNDu7xcMvgmIeH/GVWC5qUGydDXbVFShHe9NGvwv7KjXGuRdVQaOUStteVC8DxtuxCCrE/
	hXcZqGJBfwHBLnYOuHnmJ5S8fJiY2pn1HtC9eJwyZSRjaoE9QjE3tcXYFIX9vZZ4g8INFyBMn1+9u
	CSmKP1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXfhf-008Ert-1E; Mon, 12 Sep 2022 09:26:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXfhW-008El2-0k; Mon, 12 Sep 2022 09:26:05 +0000
X-UUID: 112df043aa7a48188c4b8fe0bf425930-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AZpuDZd6s7XQEx6mFFMWytK+mLYefyhJ9Oq8oES2roM=;
	b=sB6fLgvqmW7PFFoRnVDD1Rv77A8udfeXBmMd+2+PVCgZFE3Q3l7T+hRcEUKNF9PRLJPKjQGaIac7Ug1UyKFr7uRQmNy1eskYlWNOA7BZKR1/w/EbZBhe7OwZSRjjmpX3AW3aCp9ZcRAE7MZK3bZs4Li3+aKlnCzMr16GliynrNM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:54da5142-618d-41e3-8f6c-06936fdd0fa1,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:d9be565d-5ed4-4e28-8b00-66ed9f042fbd,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 112df043aa7a48188c4b8fe0bf425930-20220912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1225156549; Mon, 12 Sep 2022 02:25:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 12 Sep 2022 17:25:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 17:25:11 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>
Subject: [PATCH v2] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date: Mon, 12 Sep 2022 17:24:40 +0800
Message-ID: <20220912092440.21011-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_022558_097088_494DFC64 
X-CRM114-Status: GOOD (  11.56  )
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

Add wifi pins in the description and set 'maxItems' for groups and pins.

Reviewed-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
v2:
- Set 'maxItems' for groups and pins.
- Update commit message.
- Remove '$ref: /schemas/types.yaml#/definitions/string-array'.
---
 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 48 +++++++++++--------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 4eadea55df10..06c819ae7d50 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -117,6 +117,10 @@ patternProperties:
           "i2s"             "audio"     62, 63, 64, 65
           "switch_int"      "eth"       66
           "mdc_mdio"        "eth"       67
+          "wf_2g"           "wifi"      74, 75, 76, 77, 78, 79, 80, 81, 82, 83
+          "wf_5g"           "wifi"      91, 92, 93, 94, 95, 96, 97, 98, 99, 100
+          "wf_dbdc"         "wifi"      74, 75, 76, 77, 78, 79, 80, 81, 82, 83,
+                                        84, 85
 
         $ref: "/schemas/pinctrl/pinmux-node.yaml"
         properties:
@@ -234,7 +238,9 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [wf_2g, wf_5g, wf_dbdc]
+                  items:
+                    enum: [wf_2g, wf_5g, wf_dbdc]
+                  maxItems: 3
       '.*conf.*':
         type: object
         additionalProperties: false
@@ -248,25 +254,27 @@ patternProperties:
               An array of strings. Each string contains the name of a pin.
               There is no PIN 41 to PIN 65 above on mt7686b, you can only use
               those pins on mt7986a.
-            enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
-                   GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
-                   GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
-                   GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
-                   SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
-                   SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
-                   UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
-                   UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
-                   UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
-                   EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
-                   EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
-                   PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
-                   WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
-                   WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
-                   WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
-                   WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
-                   WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
-                   WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
-                   WF1_HB8]
+            items:
+              enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
+                     GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
+                     GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
+                     GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
+                     SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
+                     SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
+                     UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
+                     UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
+                     UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
+                     EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
+                     EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
+                     PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
+                     WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
+                     WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
+                     WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
+                     WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
+                     WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
+                     WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
+                     WF1_HB8]
+            maxItems: 101
 
           bias-disable: true
 
-- 
2.18.0


