Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5591ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 02:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U4+PCOuj/w68gWRNwzxwm8S+vumfYGUtGnRflHT686s=; b=1K0wQ1hDIGxPYoPPo+wB7ucllC
	cxGwnFtct5LRrIxqDY7whpmBpeGh6m/bdyA7JCgHLdtyHiSiYUGxle8YBDmeiLfXi6sRarWxW9Nri
	AH4aAuEDLQheGsZ9xPCo/BO4/OJnn8sTCNfJTtrGmBH8AWJvDZyQO8VWSCwUOoQ8aujw+FwydXxx0
	d58xPklRSH98PwqItpxaGdY0PHchqyNgknXB6K0fVtsnKvCI+KacZrUxbAqEqdaKkIhygssSpGiF4
	eFBLnwNpMVM7+9prapweUfxOieqQqMoq42mCz8upVEbYMEJrF6sol/G2idsN7GhRnhLLCXIIAwzLy
	ve66AjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTwm2-00H5hC-Ao; Fri, 02 Sep 2022 02:51:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTwly-00H5fH-2Z; Fri, 02 Sep 2022 02:51:12 +0000
X-UUID: fca7eb8794004b2f8fa433716edd6615-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=U4+PCOuj/w68gWRNwzxwm8S+vumfYGUtGnRflHT686s=;
	b=ehMnkfjcij7u1jux4cFeoGztBNVH1LRx+psZ5w0Hz1xcxjTEZQePWMa1nSDhv7oXx1QvDQXqlIFdbVnasduM32+HmwNhw0P6B2X/bAVcoZgwMQ22/LtN/dfQNozjihyFo1P0Wa/1L8phLCUyFPycorW5HULnvK9YRCAktIwjHPE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:7f07017d-8969-4f15-b5cf-6e1901fa2b18,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:ff5964d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fca7eb8794004b2f8fa433716edd6615-20220901
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1541133890; Thu, 01 Sep 2022 19:48:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 10:47:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 10:47:34 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>
Subject: [PATCH] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date: Fri, 2 Sep 2022 10:47:19 +0800
Message-ID: <20220902024719.31943-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_195110_145064_B9D0EEE5 
X-CRM114-Status: GOOD (  11.69  )
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

Add wifi pins in the description and set groups to string-array to support
multiple groups in a node.

Reviewed-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 48 +++++++++++--------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 4eadea55df10..b08a0a8076e0 100644
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
+                  $ref: /schemas/types.yaml#/definitions/string-array
+                  items:
+                    enum: [wf_2g, wf_5g, wf_dbdc]
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
+            $ref: /schemas/types.yaml#/definitions/string-array
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
 
           bias-disable: true
 
-- 
2.18.0


