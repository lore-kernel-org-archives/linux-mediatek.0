Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6FF60A5BDA
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JoscB6ZS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yNqHB55L9wyhYqbwzUo9xt2jQ2/+/jNNHhym+aocquw=; b=JoscB6ZSWrumId
	p7Vj8M94rG9mrBiqT0sTd8f5DCzMKLpZZYb0CEzK7MR9e78r30Z2UUS1s006z1rhQGRrBtIIojAy4
	7yKXtIp5n15gPJct5z7trIgfXfvqYtrVcw2bCQ7HZXYvPDLK5mmQaNyqoFLmisYPsvw4nnYW1TR+C
	04NdODg9lR2QMKBiIJnt4/R3h/lfOM17O1j0d8asPED26Ew0yxnv1qMnacg679k645j4ZhX2edRRL
	b8DSW0NGRluSnVd4LvSygnbdhcZWL+Je5iFYgrVzHfUzF/VDvIYlYYBnrFx5FuqXfzS8zZnshdEVB
	If7cgbMHJvDX6+/oBLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa1q-0000000AuVs-3N9Y;
	Thu, 12 Nov 2026 19:00:11 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa1f-0000000AuMm-0V86
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 19:00:01 +0000
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRa1V-002Xgt-33;
	Thu, 12 Nov 2026 19:59:50 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v2 5/7] dt-bindings: pinctrl: airoha: add AN7589
Date: Thu, 12 Nov 2026 19:59:39 +0100
Message-Id: <20261112185941.1316112-6-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185941.1316112-1-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105959_575116_3C51BAB4 
X-CRM114-Status: GOOD (  18.98  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the AN7589 pin controller and the GPIO system controller it
lives under. The pin controller selects functions through a separate
IOMUX syscon, referenced by the airoha,iomux phandle, and every pin is
a GPIO in mode 0.

The AN7589 has no chip SCU dependency and the vendor SDK carries no
pull or drive registers for it. Groups follow the SDK naming without
its _grp suffix. As in the other Airoha pin controller bindings, a
function names a block type, such as uart or i2c, and the group selects
the instance. The PON groups keep the working mode only: the SDK
encodes the driver reset sequence as extra pinctrl states, which
belongs in the consumer driver.

The pwm function routes a PWM channel to one of GPIO0 to GPIO15, with
one group per pin. The pin also needs its GPIO output enabled, so conf
nodes allow the GPIO direction and output level. Pull and drive
properties are not allowed, as no registers for them are known.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v2:
- One function per block type, with the group selecting the
  instance, as in the other Airoha pin controller bindings (Conor).
- List the valid groups for the groups property (Conor).

 .../mfd/airoha,an7589-gpio-sysctl.yaml        |  66 ++++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/airoha,an7589-pinctrl.yaml        | 354 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 4 files changed, 423 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
new file mode 100644
index 000000000000..0785b61bdda3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an7589-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7589 GPIO System Controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+description:
+  Airoha AN7589 SoC GPIO system controller which provides a register map
+  for controlling the GPIO and pins of the SoC.
+
+properties:
+  compatible:
+    items:
+      - const: airoha,an7589-gpio-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/airoha,an7589-pinctrl.yaml
+    description:
+      Child node definition for AN7589 Pin controller
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    system-controller@1fbf0200 {
+      compatible = "airoha,an7589-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x1fbf0200 0x100>;
+
+      pinctrl {
+        compatible = "airoha,an7589-pinctrl";
+        airoha,iomux = <&iomux>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        mmc-pins {
+          mux {
+            function = "emmc";
+            groups = "emmc";
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index dae706ca7642..e87158d42e87 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -24,6 +24,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - airoha,an7589-iomux
               - airoha,en7581-pbus-csr
               - al,alpine-sysfabric-service
               - allwinner,sun8i-a83t-system-controller
diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
new file mode 100644
index 000000000000..57e79e550caf
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
@@ -0,0 +1,354 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,an7589-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7589 Pin Controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+description:
+  The Airoha AN7589 pin controller is used to control SoC pins. Pin
+  functions are selected through a separate IOMUX register block, one
+  mode field per pin. Every pin is a GPIO in mode 0.
+
+properties:
+  compatible:
+    const: airoha,an7589-pinctrl
+
+  airoha,iomux:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the IOMUX syscon holding the per pin mode fields.
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - airoha,iomux
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [uart, i2c, spi, pcm, pcm_spi, i2s, mdio, mdcs, mdios, emmc,
+                   pcie, pon, sgpio, watchdog, shiftmux_spi, tod, sync_e, jtag,
+                   pwm]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+            items:
+              enum: [uart1, uart2, uart3, uart3_alt, uart4, uart5, uart5_alt,
+                     uart5_full, uart6, uart6_full, i2c0, i2c1, i2c2, i2c3,
+                     i2c4, spi0, ext_spi0_full, ext_spi1, ext_spi1_full,
+                     ext_spi2, ext_spi2_full, ext_spi3, ext_spi3_full, pcm1,
+                     pcm2, pcm_spi, pcm_spi_cs, pcm_ctrl, i2s, mdio0, mdio1,
+                     mdio2, mdcs, mdios, emmc, pcie0_rst, pcie0_clkreq,
+                     pcie0_wake, pcie1_rst, pcie1_clkreq, pcie1_wake, pcie2_rst,
+                     pcie2_clkreq, pcie2_wake, pon1, pon2, sgpio0, sgpio1,
+                     watchdog, shiftmux_spi, tod, sync_e, cpu_jtag,
+                     cpu_jtag_alt, npu_jtag, ibex_jtag, pma50eth_jtag,
+                     ainpu_jtag, pma50pon_jtag, gpio0, gpio1, gpio2, gpio3,
+                     gpio4, gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
+                     gpio12, gpio13, gpio14, gpio15]
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart1, uart2, uart3, uart3_alt, uart4, uart5,
+                           uart5_alt, uart5_full, uart6, uart6_full]
+                  maxItems: 10
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [i2c0, i2c1, i2c2, i2c3, i2c4]
+                  maxItems: 5
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi0, ext_spi0_full, ext_spi1, ext_spi1_full,
+                           ext_spi2, ext_spi2_full, ext_spi3, ext_spi3_full]
+                  maxItems: 8
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm1, pcm2]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_cs, pcm_ctrl]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: i2s
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [mdio0, mdio1, mdio2]
+                  maxItems: 3
+          - if:
+              properties:
+                function:
+                  const: mdcs
+            then:
+              properties:
+                groups:
+                  enum: [mdcs]
+          - if:
+              properties:
+                function:
+                  const: mdios
+            then:
+              properties:
+                groups:
+                  enum: [mdios]
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
+                  const: pcie
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcie0_rst, pcie0_clkreq, pcie0_wake, pcie1_rst,
+                           pcie1_clkreq, pcie1_wake, pcie2_rst, pcie2_clkreq,
+                           pcie2_wake]
+                  maxItems: 9
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pon1, pon2]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: sgpio
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [sgpio0, sgpio1]
+                  maxItems: 2
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
+                  const: shiftmux_spi
+            then:
+              properties:
+                groups:
+                  enum: [shiftmux_spi]
+          - if:
+              properties:
+                function:
+                  const: tod
+            then:
+              properties:
+                groups:
+                  enum: [tod]
+          - if:
+              properties:
+                function:
+                  const: sync_e
+            then:
+              properties:
+                groups:
+                  enum: [sync_e]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [cpu_jtag, cpu_jtag_alt, npu_jtag, ibex_jtag,
+                           pma50eth_jtag, ainpu_jtag, pma50pon_jtag]
+                  maxItems: 7
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                           gpio14, gpio15]
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              pattern: '^gpio([0-9]|[1-6][0-9]|7[0-3])$'
+            minItems: 1
+            maxItems: 74
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl {
+      compatible = "airoha,an7589-pinctrl";
+      airoha,iomux = <&iomux>;
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      gpio-ranges = <&pinctrl 0 0 74>;
+
+      mmc-pins {
+        mux {
+          function = "emmc";
+          groups = "emmc";
+        };
+      };
+
+      pcie0-pins {
+        mux {
+          function = "pcie";
+          groups = "pcie0_rst", "pcie0_clkreq", "pcie0_wake";
+        };
+      };
+
+      uart5-pins {
+        mux {
+          function = "uart";
+          groups = "uart5", "uart5_full";
+        };
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d37dd..2041a8aed28f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22137,6 +22137,8 @@ PIN CONTROLLER - AIROHA
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
+F:	Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
 F:	drivers/pinctrl/airoha/pinctrl-airoha.c
 
-- 
2.34.1


