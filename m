Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8DEC433EC
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 12:58:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47159208C7
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 12:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t50BloFN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XEP8mGwi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47159208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jKVn7cWETBKlp4NjDJeDxMVUvSCKPa0tP+NovY4Q6J0=; b=t50BloFNQV0g5NOW6mn+vbl9J
	r+K6Oz6VzlcH9JGKiSHxeUDur+g00Aej7QH6Y6OLR+SGJCZ7znQWGgBdvgpHg5AbydlWpGGIkFX27
	PLNpJiP0duHlq4RTUv+LMZGkmhB3gqpM0/Fdepqpc1zhTsqKDPLo0GjvPfD4Wv8UFoE8ghxc/E5jy
	/LgqIbtjh08R/m8Zg7jDgGC49OzReEBuyuh1Y6BYpSY7s+1NRfz5M8pFBXEvczHE+d1p2WxW7v7VI
	bq63Bo6EqZsu+P161d3UQGh8/J1dMxgrYr0B5+4micSvUsvqCxa2Gf8AroBP3yw3/GmYsT7IPM6CQ
	OJXLkp5bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqyn4-0007Xd-K0; Thu, 02 Jul 2020 12:58:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqyme-0007Ki-Qg; Thu, 02 Jul 2020 12:57:46 +0000
X-UUID: 7efaebf36d40482c805ddcad9dfa300c-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tMxPrAuRgQcv50pznl997i6gMsLXz/8w7JFwvpKq1Cg=; 
 b=XEP8mGwiNV0twA5bIS2Vh2VESA8O6uzw7s8GKwW4aK3ThsnimSQqM4514xEYYcyincj74cTUqWjskD4Iow2deJBzto+mVa5xcAPidIPQb0K8H2pra5CB5yWey7nQ8O9PXwTn0hC2WoCONqn9q+AF+6EeOjokdLW75t8vxP1wymI=;
X-UUID: 7efaebf36d40482c805ddcad9dfa300c-20200702
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1298995639; Thu, 02 Jul 2020 04:57:35 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 05:57:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 20:57:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Jul 2020 20:57:25 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH v7 2/7] dt-bindings: pinctrl: add bindings for MediaTek MT6779
 SoC
Date: Thu, 2 Jul 2020 20:57:05 +0800
Message-ID: <1593694630-26604-4-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_085745_140476_2C0F13EE 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Andy Teng <andy.teng@mediatek.com>

Add devicetree bindings for MediaTek MT6779 pinctrl driver.

Signed-off-by: Andy Teng <andy.teng@mediatek.com>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  210 ++++++++++++++++++++
 1 file changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
new file mode 100644
index 0000000..3a9fc4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+      GPIO base register names. The names are "gpio", "iocfg_rm",
+      "iocfg_br", "iocfg_lm", "iocfg_lb", "iocfg_rt", "iocfg_lt",
+      "iocfg_tl", "eint";
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
+    description: |
+      Specifies the summary IRQ.
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
+  '-[0-9]*$':
+    type: object
+    patternProperties:
+      '-pins*$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input schmitt.
+
+        properties:
+          pinmux:
+            description:
+              integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are defined
+              as macros in boot/dts/<soc>-pinfunc.h directly.
+
+          bias-disable:
+            type: boolean
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          input-enable:
+            type: boolean
+
+          input-disable:
+            type: boolean
+
+          output-low:
+            type: boolean
+
+          output-high:
+            type: boolean
+
+          input-schmitt-enable:
+            type: boolean
+
+          input-schmitt-disable:
+            type: boolean
+
+          mediatek,pull-up-adv:
+            description: |
+              Pull up setings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Pull down settings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - enum: [0, 1, 2, 3]
+
+          drive-strength:
+            description: |
+              Selects the drive strength for the specified pins in mA.
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint32
+              - enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+additionalProperties: false
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
+        mmc0_pins_default: mmc0-0 {
+            cmd-dat-pins {
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
+            clk-pins {
+                pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
+                mediatek,pull-down-adv = <2>;
+            };
+            rst-pins {
+                pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
+                mediatek,pull-up-adv = <0>;
+            };
+        };
+    };
+
+    mmc0 {
+       pinctrl-0 = <&mmc0_pins_default>;
+       pinctrl-names = "default";
+    };
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
