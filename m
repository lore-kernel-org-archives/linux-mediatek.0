Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3312DC5320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0Y49421o26rcCf8ZZEfegWNV3ygVt5Ja66ucYZbhF4=; b=SuI6eIUHZBc+K3kVhlDC9m5SVM
	UVo6jVOhTAg+X7aGly0zZfD4tItmUNwrpzSaDOkVbYIGX07o1gPwxOiDv6LKIyoakrdTe/Aox2Awq
	6gO6P9oX0JxBnAOJ5OsRgCxI+RHuYYOxm1T54as1LyrMUl0EbNNxKy5y1rpumX7S9BymyNKAGB6kZ
	qtjp/ub3HByxMlePkWRpohT7h0GXCkdIgA6MvWXqqZTa2l9gE27reLIqPy/RZn9yKDmonyWx26EYX
	ZsISp+tB5DWSaKT97c3QLgu1pgtHJ8cenlCWgR2tqz/X6tilOT+P7LJkjcHL9OcaM67Wue8jaasjK
	nQcSo8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh4MK-0000000CIVW-3PgW;
	Thu, 22 Aug 2024 09:44:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh4Jy-0000000CHmA-1srE;
	Thu, 22 Aug 2024 09:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42966611FA;
	Thu, 22 Aug 2024 09:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D057C32782;
	Thu, 22 Aug 2024 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724319693;
	bh=XmnZdW+1lBMIquZrckRJYdsNtcm0aTzKiw9Pu3Y23YI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=okAMnoybVZyD7vBwfBLA107bgtJK/ftuJUBXt/UZRPlMZdpMeCdbR54SqL1afbJkV
	 EG9HNkVi9BILQh1vf+hUgStdDOOqk5xHsVIZplQxZwbmN1vpOIpOhBJeyGCvShYy2m
	 K6Awx0Bep0rUMdlFfONWvJentxyj5b+zcmsvRjFmaiO/v58Lff3t4mbE3vYNj1YZ7q
	 zEST2z0ZEwbgNnexY3SM4ER25Lsq6thEUknV8CNQ10DZUF9YRGd+hjz0T1hAwiUeJN
	 XnEVOTiqGcz2i2J/ZUqksU/cJeZ1NT/VqC+ZbIsU2rPA9h3kJhUvR3N+5Kr4g7Bj2X
	 r6bJueX1w84+A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Aug 2024 11:40:52 +0200
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
In-Reply-To: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_024134_693611_D575573F 
X-CRM114-Status: GOOD (  13.33  )
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

Introduce device-tree binding documentation for Airoha EN7581 pinctrl
controller.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    | 454 +++++++++++++++++++++
 1 file changed, 454 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
new file mode 100644
index 000000000000..a4b58bc30416
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -0,0 +1,454 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,en7581-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's EN7581 Pin controller is used to control SoC pins.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    enum:
+      - airoha,en7581-pinctrl
+
+  reg:
+    items:
+      - description: IOMUX base address
+      - description: LED IOMUX base address
+      - description: GPIO flash mode base address
+      - description: GPIO flash mode extended base address
+      - description: IO pin configuration base address
+      - description: PCIE reset open-drain base address
+      - description: GPIO bank0 register base address
+      - description: GPIO bank0 second control register base address
+      - description: GPIO bank1 second control register base address
+      - description: GPIO bank1 register base address
+
+  reg-names:
+    items:
+      - const: iomux
+      - const: led-iomux
+      - const: gpio-flash-mode
+      - const: gpio-flash-mode-ext
+      - const: ioconf
+      - const: pcie-rst-od
+      - const: gpio-bank0
+      - const: gpio-ctrl1
+      - const: gpio-ctrl2
+      - const: gpio-bank1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description:
+      Number of cells in GPIO specifier. Since the generic GPIO binding is
+      used, the amount of cells must be specified as 2. See the below mentioned
+      gpio binding representation for description of particular cells.
+
+  gpio-ranges:
+    maxItems: 1
+    description:
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
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^.*mux.*$':
+        type: object
+        additionalProperties: false
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
+                   phy3_led1, phy4_led1]
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  enum: [pon]
+          - if:
+              properties:
+                function:
+                  const: tod_1pps
+            then:
+              properties:
+                groups:
+                  enum: [pon_tod_1pps, gsw_tod_1pps]
+          - if:
+              properties:
+                function:
+                  const: sipo
+            then:
+              properties:
+                groups:
+                  enum: [sipo, sipo_rclk]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts, uart4,
+                           uart5]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c1]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag_udi, jtag_dfd]
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [pcm1, pcm2]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi_quad, spi_cs1]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                           pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
+                           pcm_spi_cs4]
+                  maxItems: 7
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: emmc
+            then:
+              properties:
+                groups:
+                  enum: [emmc]
+          - if:
+              properties:
+                function:
+                  const: pnand
+            then:
+              properties:
+                groups:
+                  enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: pcie_reset
+            then:
+              properties:
+                groups:
+                  enum: [pcie_reset0, pcie_reset1, pcie_reset2]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                         gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio33, gpio34, gpio35, gpio42]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio33, gpio34, gpio35, gpio42]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio33, gpio34, gpio35, gpio42]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio33, gpio34, gpio35, gpio42]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio43, gpio44, gpio45, gpio46]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio43, gpio44, gpio45, gpio46]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio43, gpio44, gpio45, gpio46]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio43, gpio44, gpio45, gpio46]
+
+      '^.*conf.*$':
+        type: object
+        additionalProperties: false
+        description:
+          pinconf configuration nodes.
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
+                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
+                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
+                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
+                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
+                     pcie_reset0, pcie_reset1, pcie_reset2]
+            minItems: 1
+            maxItems: 58
+
+          bias-disable: true
+          bias-pull-up: true
+          bias-pull-down: true
+          input-enable: true
+          output-enable: true
+          output-low: true
+          output-high: true
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
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
+
+      pio: pinctrl@1fa20214 {
+        compatible = "airoha,en7581-pinctrl";
+        reg = <0x0 0x1fa20214 0x0 0x30>,
+              <0x0 0x1fa2027c 0x0 0x8>,
+              <0x0 0x1fbf0234 0x0 0x4>,
+              <0x0 0x1fbf0268 0x0 0x4>,
+              <0x0 0x1fa2001c 0x0 0x50>,
+              <0x0 0x1fa2018c 0x0 0x4>,
+              <0x0 0x1fbf0200 0x0 0x18>,
+              <0x0 0x1fbf0220 0x0 0x4>,
+              <0x0 0x1fbf0260 0x0 0x8>,
+              <0x0 0x1fbf0270 0x0 0x28>;
+        reg-names = "iomux", "led-iomux",
+                    "gpio-flash-mode", "gpio-flash-mode-ext",
+                    "ioconf", "pcie-rst-od",
+                    "gpio-bank0", "gpio-ctrl1",
+                    "gpio-ctrl2", "gpio-bank1";
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 13 47>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+        pcie1-rst-pins {
+          conf {
+            pins = "pcie_reset1";
+            drive-open-drain = <1>;
+          };
+        };
+
+        pwm-pins {
+          mux {
+            function = "pwm";
+            groups = "gpio18";
+          };
+        };
+
+        spi-pins {
+          mux {
+            function = "spi";
+            groups = "spi_quad", "spi_cs1";
+          };
+        };
+
+        uart2-pins {
+          mux {
+            function = "uart";
+            groups = "uart2", "uart2_cts_rts";
+          };
+        };
+
+        uar5-pins {
+          mux {
+            function = "uart";
+            groups = "uart5";
+          };
+        };
+
+        mmc-pins {
+          mux {
+            function = "emmc";
+            groups = "emmc";
+          };
+        };
+
+        mdio-pins {
+          mux {
+            function = "mdio";
+            groups = "mdio";
+          };
+
+          conf {
+            pins = "gpio2";
+            output-enable;
+          };
+        };
+
+        gswp1-led0-pins {
+          mux {
+            function = "phy1_led0";
+            groups = "gpio33";
+          };
+        };
+
+        gswp2-led1-pins {
+          mux {
+            function = "phy2_led1";
+            groups = "gpio44";
+          };
+        };
+      };
+    };

-- 
2.46.0


