Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E425CEACFA
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 18:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFMXMLQ6lFF0qgU2rtg9WVigm1pbRm/0jE2U1sujrno=; b=XZQ8wr5vpaCS4jvhc+keyVRgMc
	d2PP7kYQydX5njLFy60QKYKI6JvtG+RueHEyO2N0g+pp7+5XUIVxIc2eHCfZqFwtgnaagTTaRsYFh
	aooBs+RAEf0A+rMsdpR82uwsU6mSRfm1lBqTsAoc3Dk0TSollLcNjEpY0GHbZlVkLnLUYklkTnE9o
	7JsmMzbfuh9ODah4BKJ6LG0OKDzJ+N2MkfWDuYAevcQu8EeAgqzCauNvyTNenoVsPzFMdaYIDTz2+
	oWiKY2sKLEM6nd20Ozu8qMtH/jP/rqq6nx7SeSh+Fr1L9TYlBhnBSKmYpLtAvI8REOIgUtqe7MX4k
	4hoCFwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svhtb-00000003oK2-1Qd9;
	Tue, 01 Oct 2024 18:46:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svghS-00000003f0J-1P0I;
	Tue, 01 Oct 2024 17:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E0305C4CFF;
	Tue,  1 Oct 2024 17:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D66FC4CEC6;
	Tue,  1 Oct 2024 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727803812;
	bh=LEZyAoNOe3CF4ATi61earZoKSlWYBk3kLfNQMu3VuH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ckjmSVEWkNja4G3F3XUQXa6KhjuBiRq6wlaKJacSRk7TKxQNlzfedpK11lBvPp9Kv
	 6gexgpCMjySukPfaFh4FDcx9Kuhx39qfX/Q4l3mpU+hu9t7rX5QR+8QxuicdDjTH25
	 SJipqy2LxaaDE8/v3R2BRAPb+VHmPwKaFGD+Bx+wW3PZa4jiwRFyEtRFPQ1Mx9v8Hu
	 quTDtMvMid1wFRhFZRCZRBPSdIixJbfv3DkEv3/pJlxdrIeXnDGwODoMFqen8+UuHY
	 /r1CyGsx8uhSKiGbml7PuwR/Ej0Np0+6LB/l0KAtjfAwTeIlOMjO632w0x8JSSa7ME
	 zvtrqhvJuTXvQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 01 Oct 2024 19:29:31 +0200
Subject: [PATCH v5 2/5] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-en7581-pinctrl-v5-2-dc1ce542b6c6@kernel.org>
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
In-Reply-To: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
 linux-pwm@vger.kernel.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_103014_673484_F9AA8720 
X-CRM114-Status: GOOD (  13.16  )
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

From: Christian Marangi <ansuelsmth@gmail.com>

Add support for Airoha EN7581 GPIO System Controller which provide a
register map for controlling the GPIO, pinctrl and PWM of the SoC.

Schema define cells for both gpio/interrupt controller and PWM.
Moreover it provides a dedicated pinctrl node for pins and config
definitions.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 433 +++++++++++++++++++++
 1 file changed, 433 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
new file mode 100644
index 000000000000..98396db40e67
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
@@ -0,0 +1,433 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,en7581-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 GPIO System Controller
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  Airoha EN7581 SoC GPIO system controller which provided a register map
+  for controlling the GPIO, pins and PWM of the SoC.
+
+properties:
+  compatible:
+    const: airoha,en7581-gpio-sysctl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  "#pwm-cells":
+    const: 3
+
+  pinctrl:
+    type: object
+
+    $ref: /schemas/pinctrl/pinctrl.yaml
+
+    patternProperties:
+      '-pins$':
+        type: object
+
+        patternProperties:
+          '^mux(-|$)':
+            type: object
+
+            description:
+              pinmux configuration nodes.
+
+            $ref: /schemas/pinctrl/pinmux-node.yaml
+
+            properties:
+              function:
+                description:
+                  A string containing the name of the function to mux to the group.
+                enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+                       pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                       phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
+                       phy3_led1, phy4_led1]
+
+              groups:
+                description:
+                  An array of strings. Each string contains the name of a group.
+
+            required:
+              - function
+              - groups
+
+            allOf:
+              - if:
+                  properties:
+                    function:
+                      const: pon
+                then:
+                  properties:
+                    groups:
+                      enum: [pon]
+              - if:
+                  properties:
+                    function:
+                      const: tod_1pps
+                then:
+                  properties:
+                    groups:
+                      enum: [pon_tod_1pps, gsw_tod_1pps]
+              - if:
+                  properties:
+                    function:
+                      const: sipo
+                then:
+                  properties:
+                    groups:
+                      enum: [sipo, sipo_rclk]
+              - if:
+                  properties:
+                    function:
+                      const: mdio
+                then:
+                  properties:
+                    groups:
+                      enum: [mdio]
+              - if:
+                  properties:
+                    function:
+                      const: uart
+                then:
+                  properties:
+                    groups:
+                      items:
+                        enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts, uart4,
+                               uart5]
+                      maxItems: 2
+              - if:
+                  properties:
+                    function:
+                      const: i2c
+                then:
+                  properties:
+                    groups:
+                      enum: [i2c1]
+              - if:
+                  properties:
+                    function:
+                      const: jtag
+                then:
+                  properties:
+                    groups:
+                      enum: [jtag_udi, jtag_dfd]
+              - if:
+                  properties:
+                    function:
+                      const: pcm
+                then:
+                  properties:
+                    groups:
+                      enum: [pcm1, pcm2]
+              - if:
+                  properties:
+                    function:
+                      const: spi
+                then:
+                  properties:
+                    groups:
+                      items:
+                        enum: [spi_quad, spi_cs1]
+                      maxItems: 2
+              - if:
+                  properties:
+                    function:
+                      const: pcm_spi
+                then:
+                  properties:
+                    groups:
+                      items:
+                        enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                               pcm_spi_cs2_p156, pcm_spi_cs2_p128, pcm_spi_cs3,
+                               pcm_spi_cs4]
+                      maxItems: 7
+              - if:
+                  properties:
+                    function:
+                      const: i2c
+                then:
+                  properties:
+                    groups:
+                      enum: [i2s]
+              - if:
+                  properties:
+                    function:
+                      const: emmc
+                then:
+                  properties:
+                    groups:
+                      enum: [emmc]
+              - if:
+                  properties:
+                    function:
+                      const: pnand
+                then:
+                  properties:
+                    groups:
+                      enum: [pnand]
+              - if:
+                  properties:
+                    function:
+                      const: pcie_reset
+                then:
+                  properties:
+                    groups:
+                      enum: [pcie_reset0, pcie_reset1, pcie_reset2]
+              - if:
+                  properties:
+                    function:
+                      const: pwm
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                             gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                             gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                             gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                             gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                             gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                             gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+              - if:
+                  properties:
+                    function:
+                      const: phy1_led0
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio33, gpio34, gpio35, gpio42]
+              - if:
+                  properties:
+                    function:
+                      const: phy2_led0
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio33, gpio34, gpio35, gpio42]
+              - if:
+                  properties:
+                    function:
+                      const: phy3_led0
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio33, gpio34, gpio35, gpio42]
+              - if:
+                  properties:
+                    function:
+                      const: phy4_led0
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio33, gpio34, gpio35, gpio42]
+              - if:
+                  properties:
+                    function:
+                      const: phy1_led1
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio43, gpio44, gpio45, gpio46]
+              - if:
+                  properties:
+                    function:
+                      const: phy2_led1
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio43, gpio44, gpio45, gpio46]
+              - if:
+                  properties:
+                    function:
+                      const: phy3_led1
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio43, gpio44, gpio45, gpio46]
+              - if:
+                  properties:
+                    function:
+                      const: phy4_led1
+                then:
+                  properties:
+                    groups:
+                      enum: [gpio43, gpio44, gpio45, gpio46]
+
+            additionalProperties: false
+
+          '^conf(-|$)':
+            type: object
+
+            description:
+              pinconf configuration nodes.
+
+            $ref: /schemas/pinctrl/pincfg-node.yaml
+
+            properties:
+              pins:
+                description:
+                  An array of strings. Each string contains the name of a pin.
+                items:
+                  enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
+                         spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
+                         gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                         gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
+                         gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
+                         gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
+                         gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
+                         pcie_reset0, pcie_reset1, pcie_reset2]
+                minItems: 1
+                maxItems: 58
+
+              bias-disable: true
+
+              bias-pull-up: true
+
+              bias-pull-down: true
+
+              input-enable: true
+
+              output-enable: true
+
+              output-low: true
+
+              output-high: true
+
+              drive-open-drain: true
+
+              drive-strength:
+                description:
+                  Selects the drive strength for MIO pins, in mA.
+                enum: [2, 4, 6, 8]
+
+            required:
+              - pins
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mfd@1fbf0200 {
+        compatible = "airoha,en7581-gpio-sysctl";
+        reg = <0x1fbf0200 0xc0>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        #pwm-cells = <3>;
+
+        pinctrl {
+            pcie1-rst-pins {
+                conf {
+                    pins = "pcie_reset1";
+                    drive-open-drain = <1>;
+                };
+            };
+
+            pwm-pins {
+                mux {
+                    function = "pwm";
+                    groups = "gpio18";
+                };
+            };
+
+            spi-pins {
+                mux {
+                    function = "spi";
+                    groups = "spi_quad", "spi_cs1";
+                };
+            };
+
+            uart2-pins {
+                mux {
+                    function = "uart";
+                    groups = "uart2", "uart2_cts_rts";
+                };
+            };
+
+            uar5-pins {
+                mux {
+                    function = "uart";
+                    groups = "uart5";
+                };
+            };
+
+            mmc-pins {
+                mux {
+                    function = "emmc";
+                    groups = "emmc";
+                };
+            };
+
+            mdio-pins {
+                mux {
+                    function = "mdio";
+                    groups = "mdio";
+                };
+
+                conf {
+                    pins = "gpio2";
+                    output-enable;
+                };
+            };
+
+            gswp1-led0-pins {
+                mux {
+                    function = "phy1_led0";
+                    groups = "gpio33";
+                };
+            };
+
+            gswp2-led1-pins {
+                mux {
+                    function = "phy2_led1";
+                    groups = "gpio44";
+                };
+            };
+        };
+    };
+
+...

-- 
2.46.2


