Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A936C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E416860EFF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E416860EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDLuyegdBSPXBkk8YNLonc4Wm0bUBddpY8vPDDMxFhE=; b=yiwyuA6pPi1xcZ
	9XOpU+FzTs/vNd5buP3mxvto+eq8Fltc5ARfykjf0gIhdn7LtlYvlQG5zhmDjvh2RYU/GEsSPUoBS
	FxsPtiygbDSGwPZSip66oehfTrICAhOGBU17YwDjibP3gbN57gP8Z+HfMV8+7joeTNmILO4zDkw3f
	QX8YwfWZTLeXleVqEX+3HBJ+B/TGhN1grtuGhgARKXS0sV1ukSxtvO2/AkQf/a6VN8BLu2nXHTPPi
	ywYTcaxJzBtb97RJkBOzsK80Q4DDgPnZ6Vbvv9aMyGfUh1lYDKhHoJ4edxP0oExoDniPxeRM3SCvu
	qPUsdj6qta6060wzbsZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcRHr-00FWAs-UP; Mon, 18 Oct 2021 11:58:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcRHF-00FVqt-4g; Mon, 18 Oct 2021 11:58:04 +0000
X-UUID: f770ccb3d9f344dcb1b45a465be7ca03-20211018
X-UUID: f770ccb3d9f344dcb1b45a465be7ca03-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 472339338; Mon, 18 Oct 2021 04:57:58 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 04:47:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 Oct 2021 19:47:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 19:47:54 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v8 1/4] dt-bindings: pinctrl: update bindings for MT7986 SoC
Date: Mon, 18 Oct 2021 19:47:36 +0800
Message-ID: <20211018114739.14026-2-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211018114739.14026-1-sam.shih@mediatek.com>
References: <20211018114739.14026-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_045801_275239_C27EA95A 
X-CRM114-Status: GOOD (  17.98  )
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

This updates bindings for MT7986 pinctrl driver. The
difference of pinctrl between mt7986a and mt7986b is that pin-41 to
pin-65 do not exist on mt7986b

Signed-off-by: Sam Shih <sam.shih@mediatek.com>

---
v8: fixed uart node in yaml dts example
v7: updated pinctcl node binding description, and separate pinctrl
     part into a single patch series

Original thread:
https://lore.kernel.org/all/8348ed3e-c561-ad7e-fe9e-a31ed346d8d0@gmail.com/

v6: fixed yamllint warnings/errors v2
v5: fixed yamllint warnings/errors v1
v4: used yaml format instead of txt format document
v3: make mt7986 pinctrl bindings as a separate file
v2: deleted the redundant description of mt7986a/mt7986b
---
 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 363 ++++++++++++++++++
 1 file changed, 363 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
new file mode 100644
index 000000000000..7602b11e8bce
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -0,0 +1,363 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7986-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT7986 Pin Controller Device Tree Bindings
+
+maintainers:
+  - Sean Wang <sean.wang@kernel.org>
+
+description: |+
+  The MediaTek's MT7986 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7986a-pinctrl
+      - mediatek,mt7986b-pinctrl
+
+  reg:
+    minItems: 8
+    maxItems: 8
+
+  reg-names:
+    items:
+      - const: gpio
+      - const: iocfg_rt
+      - const: iocfg_rb
+      - const: iocfg_lt
+      - const: iocfg_lb
+      - const: iocfg_tr
+      - const: iocfg_tl
+      - const: eint
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO
+      binding is used, the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+
+  gpio-ranges:
+    minItems: 1
+    maxItems: 5
+    description: |
+      GPIO valid number range.
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '.*mux.*':
+        type: object
+        additionalProperties: false
+        description: |
+          pinmux configuration nodes.
+
+          The following table shows the effective values of "group", "function"
+          properties and chip pinout pins
+
+          groups	    function    pins (in pin#)
+          ---------------------------------------------------------------------
+          "watchdog"        "watchdog"  0
+          "wifi_led"        "led"       1, 2
+          "i2c"             "i2c"       3, 4
+          "uart1_0"         "uart"      7, 8, 9, 10
+          "pcie_clk"        "pcie"      9
+          "pcie_wake"       "pcie"      10
+          "spi1_0"          "spi"       11, 12, 13, 14
+          "pwm1_1"          "pwm"       20,
+          "pwm0"            "pwm"       21,
+          "pwm1_0"          "pwm"       22,
+          "snfi"            "flash"     23, 24, 25, 26, 27, 28
+          "spi1_2"          "spi"       29, 30, 31, 32
+          "emmc_45"         "emmc"      22, 23, 24, 25, 26, 27, 28, 29, 30,
+                                        31, 32
+          "spi1_1"          "spi"       23, 24, 25, 26
+          "uart1_2"         "uart"      29, 30, 31, 32
+          "uart1_1"         "uart"      23, 24, 25, 26
+          "uart2_0"         "uart"      29, 30, 31, 32
+          "spi0"            "spi"       33, 34, 35, 36
+          "spi0_wp_hold"    "spi"       37, 38
+          "uart1_3_rx_tx"   "uart"      35, 36
+          "uart1_3_cts_rts" "uart"      37, 38
+          "uart2_1"         "uart"      33, 34, 35, 36
+          "spi1_3"          "spi"       33, 34, 35, 36
+          "uart0"           "uart"      39, 40
+          "pcie_pereset"    "pcie"      41
+          "uart1"           "uart"      42, 43, 44, 45
+          "uart2"           "uart"      46, 47, 48, 49
+          "emmc_51"         "emmc"      50, 51, 52, 53, 54, 55, 56, 57, 57,
+                                        59, 60, 61
+          "pcm"             "audio"     62, 63, 64, 65
+          "i2s"             "audio"     62, 63, 64, 65
+          "switch_int"      "eth"       66
+          "mdc_mdio"        "eth"       67
+
+        $ref: "/schemas/pinctrl/pinmux-node.yaml"
+        properties:
+          function:
+            description: |
+              A string containing the name of the function to mux to the group.
+              There is no "audio", "pcie" functions on mt7986b, you can only use
+              those functions on mt7986a.
+            enum: [audio, emmc, eth, i2c, led, flash, pcie, pwm, spi, uart,
+                   watchdog, wifi]
+          groups:
+            description: |
+              An array of strings. Each string contains the name of a group.
+              There is no "pcie_pereset", "uart1", "uart2" "emmc_51", "pcm",
+              and "i2s" groups on mt7986b, you can only use those groups on
+              mt7986a.
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: audio
+            then:
+              properties:
+                groups:
+                  enum: [pcm, i2s]
+          - if:
+              properties:
+                function:
+                  const: emmc
+            then:
+              properties:
+                groups:
+                  enum: [emmc, emmc_rst]
+          - if:
+              properties:
+                function:
+                  const: eth
+            then:
+              properties:
+                groups:
+                  enum: [switch_int, mdc_mdio]
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c]
+          - if:
+              properties:
+                function:
+                  const: led
+            then:
+              properties:
+                groups:
+                  enum: [wifi_led]
+          - if:
+              properties:
+                function:
+                  const: flash
+            then:
+              properties:
+                groups:
+                  enum: [snfi]
+          - if:
+              properties:
+                function:
+                  const: pcie
+            then:
+              properties:
+                groups:
+                  enum: [pcie_clk, pcie_wake, pcie_pereset]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [pwm0, pwm1_0, pwm1_1]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  enum: [spi0, spi0_wp_hold, spi1_0, spi1_1, spi1_2, spi1_3]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  enum: [uart1_0, uart1_1, uart1_2, uart1_3_rx_tx,
+                         uart1_3_cts_rts, uart2_0, uart2_1, uart0, uart1, uart2]
+          - if:
+              properties:
+                function:
+                  const: watchdog
+            then:
+              properties:
+                groups:
+                  enum: [watchdog]
+          - if:
+              properties:
+                function:
+                  const: wifi
+            then:
+              properties:
+                groups:
+                  enum: [wf_2g, wf_5g, wf_dbdc]
+      '.*conf.*':
+        type: object
+        additionalProperties: false
+        description: |
+          pinconf configuration nodes.
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          pins:
+            description: |
+              An array of strings. Each string contains the name of a pin.
+              There is no PIN 41 to PIN 65 above on mt7686b, you can only use
+              those pins on mt7986a.
+            enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
+                   GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
+                   GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
+                   GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
+                   SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
+                   SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
+                   UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
+                   UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
+                   UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
+                   EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
+                   EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
+                   PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
+                   WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
+                   WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
+                   WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
+                   WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
+                   WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
+                   WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
+                   WF1_HB8]
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          input-disable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          mediatek,pull-up-adv:
+            description: |
+              Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
+              Pull up setings for 2 pull resistors, R0 and R1. Valid arguments
+              are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
+              Pull down setings for 2 pull resistors, R0 and R1. Valid arguments
+              are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+        required:
+          - pins
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      pio: pinctrl@1001f000 {
+        compatible = "mediatek,mt7986a-pinctrl";
+        reg = <0 0x1001f000 0 0x1000>,
+              <0 0x11c30000 0 0x1000>,
+              <0 0x11c40000 0 0x1000>,
+              <0 0x11e20000 0 0x1000>,
+              <0 0x11e30000 0 0x1000>,
+              <0 0x11f00000 0 0x1000>,
+              <0 0x11f10000 0 0x1000>,
+              <0 0x1000b000 0 0x1000>;
+        reg-names = "gpio", "iocfg_rt", "iocfg_rb", "iocfg_lt",
+                    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 100>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-parent = <&gic>;
+        #interrupt-cells = <2>;
+
+        uart1_pins: uart1-pins {
+          mux {
+            function = "uart";
+            groups = "uart1";
+          };
+        };
+
+        uart2_pins: uart2-pins {
+          mux {
+            function = "uart";
+            groups = "uart2";
+          };
+        };
+
+      };
+    };
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
