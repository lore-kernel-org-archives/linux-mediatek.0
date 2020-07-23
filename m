Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6619BC433F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:20:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D5B207BB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiopBD7N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r1+ONBRp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D5B207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W88/Ck7uGyo4A1E3FUN9H8dRS1Qe1G5PCcueThk3K38=; b=kiopBD7NJkcGB6KZdTKWneBd9
	AY9nbHible/qp89N5vQIETlpUpsq/GhYMgg7ThmTNEqLsCHg+lWt2eNCAtEIVyazQreXWCmhMPuDh
	uOIgHd+DGN+eFowsVYAEl7Sl2iJu+j7wf2qw97FakfQsPiXCwgmcN4X7hiu9kI/9LoEyVFLABQwgR
	5JpWtaamaDDsB9tGbneRKRDdDrTI12IoF2Q6s2XP5G9/4lig1vob2i8bPWY6YRDJ5Am5S5QQPdr4L
	J3G7M6Sj2tKAtcqN3uzKazJkkKFN5p0bBBMkKu5hwfVXoAoPcRQCbKf8qcIUV4ApngsSOMDxtGYST
	VJBMsyRBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyZHI-00084P-FA; Thu, 23 Jul 2020 11:20:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZGw-0007wL-KJ; Thu, 23 Jul 2020 11:20:24 +0000
X-UUID: c88781a826d14e7fb7f79c6ed27e2f2b-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kX+bodJbs8Q65/7pyybfq5F7WXZbDMKkMR572E0eUyE=; 
 b=r1+ONBRp1IkTgEwgC/E2bKqAMGGaQBzkT4pbuLwlnUvNRdaZtO+1GaTDM5iJFc7xOPg5qu3b4wzxuTu9y86mYgLtcEZn4QzekUoDAJjSavV9lYbllSQh9xiwbkYMgrloLCDPfnDQGe61HTBwWitMX8rMfnmwR/foCWSmvb8JBhg=;
X-UUID: c88781a826d14e7fb7f79c6ed27e2f2b-20200723
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 67886739; Thu, 23 Jul 2020 03:20:13 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 04:20:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:19:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 19:19:59 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH v9 2/7] dt-bindings: pinctrl: add bindings for MediaTek MT6779
 SoC
Date: Thu, 23 Jul 2020 19:19:52 +0800
Message-ID: <1595503197-15246-3-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 23F78DEB57E98BE3C87C36DCDFF4E0E37F012C88F773D8D352B27BFED64CD65F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_072023_222548_D51BC556 
X-CRM114-Status: GOOD (  14.99  )
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
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Andy Teng <andy.teng@mediatek.com>

Add devicetree bindings for MediaTek MT6779 pinctrl driver.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Andy Teng <andy.teng@mediatek.com>
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 197 ++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
new file mode 100644
index 000000000000..2b304fe26d8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -0,0 +1,197 @@
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
+
+  reg-names:
+    items:
+      - const: "gpio"
+      - const: "iocfg_rm"
+      - const: "iocfg_br"
+      - const: "iocfg_lm"
+      - const: "iocfg_lb"
+      - const: "iocfg_rt"
+      - const: "iocfg_lt"
+      - const: "iocfg_tl"
+      - const: "eint"
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
+        $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+        properties:
+          pinmux:
+            description:
+              integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux varies for different SoCs, and are defined
+              as macros in boot/dts/<soc>-pinfunc.h directly.
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
+          output-low: true
+
+          output-high: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          mediatek,pull-up-adv:
+            description: |
+              Pull up setings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
+
+          mediatek,pull-down-adv:
+            description: |
+              Pull down settings for 2 pull resistors, R0 and R1. User can
+              configure those special pins. Valid arguments are described as below:
+              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
+              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
+              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
+              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2, 3]
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
