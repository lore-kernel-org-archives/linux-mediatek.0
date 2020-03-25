Return-Path: <SRS0=43xy=5K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDFCC54FD5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 09:32:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A678620714
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 09:32:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FhH3KqcU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Wu8SAnxj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A678620714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+tSejKByEDpS42ITvWDNikgI4XYItzO1Xl0zouPFA0=; b=FhH3KqcUzwl65h
	wGTBbbNIIH4y6rl+M2LYchq6Yxf1N65UrUn9ei9omkpNm0/uPNvody2E+nYSXNsePrpv9+LlGzNGw
	6OXd1lvt3j+Q0jFh82OYtoyRnpEE1uvf2l78TDJcvxjaBvlt2wN2LU2ssVYoyrKq4omsykMkpJD97
	PE3GHfNhG7rHAG8/G2VLCMlFMqM8IBBuvXt92r7Q8WvXKXonfXe0TPd8V+S51VztqB1W77N4aYhqY
	W4OMdeu3/npULJYT+l/j+qkfSDNklGbLSX57NCZ0yH1EyKymEnj/6dSpkGx2/YK86L9SF9rXw7QGX
	6IUjWUQtJBE9anWYC56A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH2OB-0006rc-2E; Wed, 25 Mar 2020 09:31:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH2O5-0006kx-Ad
 for linux-mediatek@lists.infradead.org; Wed, 25 Mar 2020 09:31:51 +0000
X-UUID: 4b994493ae134731930627623a35bb64-20200325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=q0jQ2JrEnzgPHTyuflRkXV3wTTDS9SOVA2mErt2RTmw=; 
 b=Wu8SAnxj1IEQFeuOIGOCcHsdzX2gv6kQO3Q4hmcwxzNvQenWhcqJzaaw46MyWfA+ixDC38PK6BFS8szevbADPd02ITI0NMi6mMs8yIH/xyW9qJDoXF4SBQW5O5GOJBK3QeZxlzl1LUVHfmVNNbohFQ6wn0ii7HBpEut3USIGQQg=;
X-UUID: 4b994493ae134731930627623a35bb64-20200325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 899102110; Wed, 25 Mar 2020 01:31:45 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Mar 2020 02:31:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Mar 2020 17:31:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 25 Mar 2020 17:31:41 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v5 1/6] dt-bindings: pinctrl: add bindings for MediaTek MT6779
 SoC
Date: Wed, 25 Mar 2020 17:31:29 +0800
Message-ID: <1585128694-13881-2-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
References: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_023149_386462_AA711652 
X-CRM114-Status: GOOD (  13.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Andy Teng <andy.teng@mediatek.com>

Add devicetree bindings for MediaTek MT6779 pinctrl driver.

Signed-off-by: Andy Teng <andy.teng@mediatek.com>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  208 ++++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
new file mode 100644
index 0000000..5f9bbf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6779 Pin Controller Device Tree Bindings
+
+maintainers:
+  - Andy Teng <andy.teng@mediatek.com>
+
+description: |+
+  The pin controller node should be the child of a syscon node with the
+  required property:
+  - compatible: "syscon"
+
+properties:
+  compatible:
+    const: mediatek,mt6779-pinctrl
+
+  reg:
+    minItems: 9
+    maxItems: 9
+    description: |
+      physical address base for gpio-related control registers.
+
+  reg-names:
+    description: |
+      GPIO base register names.
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
+    minItems: 1
+    maxItems: 4
+    description: |
+      The interrupt outputs to sysirq.
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
+  - gpio-ranges
+  - interrupt-controller
+  - interrupts
+  - "#interrupt-cells"
+
+patternProperties:
+  '^pins*$':
+    type: object
+    description: |
+      A pinctrl node should contain at least one subnodes representing the
+      pinctrl groups available on the machine. Each subnode will list the
+      pins it needs, and how they should be configured, with regard to muxer
+      configuration, pullups, drive strength, input enable/disable and input schmitt.
+
+    properties:
+      pinmux:
+        description:
+          integer array, represents gpio pin number and mux setting.
+          Supported pin number and mux varies for different SoCs, and are defined
+          as macros in boot/dts/<soc>-pinfunc.h directly.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32-array
+      bias-disable:
+        type: boolean
+
+      bias-pull-up:
+        oneOf:
+          - type: boolean
+          - $ref: /schemas/types.yaml#/definitions/uint32
+
+      bias-pull-down:
+        oneOf:
+          - type: boolean
+          - $ref: /schemas/types.yaml#/definitions/uint32
+
+      input-enable:
+        type: boolean
+
+      input-disable:
+        type: boolean
+
+      output-low:
+        type: boolean
+
+      output-high:
+        type: boolean
+
+      input-schmitt-enable:
+        type: boolean
+
+      input-schmitt-disable:
+        type: boolean
+
+      mediatek,pull-up-adv:
+        description: |
+          Pull up setings for 2 pull resistors, R0 and R1. User can
+          configure those special pins. Valid arguments are described as below:
+          0: (R1, R0) = (0, 0) which means R1 disabled and R0 disable.
+          1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+          2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+          3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 2, 3]
+
+      mediatek,pull-down-adv:
+        description: |
+          Pull down settings for 2 pull resistors, R0 and R1. User can
+          configure those special pins. Valid arguments are described as below:
+          0: (R1, R0) = (0, 0) which means R1 disabled and R0 disable.
+          1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+          2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+          3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [0, 1, 2, 3]
+
+      drive-strength:
+        description: |
+          Selects the drive strength for the specified pins in mA.
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+    required:
+      - pinmux
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt6779-pinfunc.h>
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6779-pinctrl";
+        reg = <0 0x10005000 0 0x1000>,
+            <0 0x11c20000 0 0x1000>,
+            <0 0x11d10000 0 0x1000>,
+            <0 0x11e20000 0 0x1000>,
+            <0 0x11e70000 0 0x1000>,
+            <0 0x11ea0000 0 0x1000>,
+            <0 0x11f20000 0 0x1000>,
+            <0 0x11f30000 0 0x1000>,
+            <0 0x1000b000 0 0x1000>;
+        reg-names = "gpio", "iocfg_rm",
+          "iocfg_br", "iocfg_lm",
+          "iocfg_lb", "iocfg_rt",
+          "iocfg_lt", "iocfg_tl",
+          "eint";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 210>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+
+        mmc0_pins_default: mmc0default {
+            pins_cmd_dat {
+                pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
+                    <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
+                    <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
+                    <PINMUX_GPIO177__FUNC_MSDC0_DAT3>,
+                    <PINMUX_GPIO170__FUNC_MSDC0_DAT4>,
+                    <PINMUX_GPIO173__FUNC_MSDC0_DAT5>,
+                    <PINMUX_GPIO171__FUNC_MSDC0_DAT6>,
+                    <PINMUX_GPIO174__FUNC_MSDC0_DAT7>,
+                    <PINMUX_GPIO167__FUNC_MSDC0_CMD>;
+                input-enable;
+                mediatek,pull-up-adv = <1>;
+            };
+            pins_clk {
+                pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
+                mediatek,pull-down-adv = <2>;
+            };
+            pins_rst {
+                pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
+                mediatek,pull-up-adv = <0>;
+            };
+        };
+
+        mmc0 {
+          pinctrl-0 = <&mmc0_pins_default>;
+          pinctrl-names = "default";
+        };
+    };
+
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
