Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0ADC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 13:31:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED580206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 13:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cucYQsvQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q+n721//"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED580206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bUQLvgqXe/ht7E7p0h38IzR6JeyJPkU4QP6LqgoacSQ=; b=cucYQsvQ+n6MjqxZ9Mg2jKDjx
	TCM0Q8rK/Z0BTkbgw0UD6DCZRUsAAyxAub7tzAuSILILMtMk+Hql3P7D2rWmPU06vsAWRKYqbT6G5
	Qudmkj7PK52FtiZCBcqkLv9027cD9uZJUH5NVW4kjYTlEB/fw4ZJYJlZezLGd7WVDwsUpyJ4GFQxl
	2jPowK+3m+2VLH0PrdZ6QiQvHv4qJUmEbgP/syJ38yUqJUMjjpHTSPHNxRTy/pUG4dIIEKtq49uiH
	ckjVEYfYvunnlHITCCV2kg586ILgsTI4aByd9BqaSRr1lV35RnYl5ox8blWJtdreFlAGI0/gbwMPM
	TEMoh6F9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k18e3-0004BM-V0; Thu, 30 Jul 2020 13:30:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k18dr-00046R-Pd; Thu, 30 Jul 2020 13:30:41 +0000
X-UUID: d6d0bed2a2c741478d3711ef76159f0c-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=j/sDT7SY2FsdxCnPb8oKpm2FGAyYICTsFKrnaf+xjro=; 
 b=q+n721//kP2sqAb6pCwoIJ5WDduEDnF5DHwDmmwhp5SzeeMTWa64fOmRZtEUUBk7kIWE8lIglOgUesMY/JEP3aWKE8fudkRUfqb0uC4hN+LokgDifixvwvsaHz7CMalKZfDMxGg+zm6wPOKcraZSmUTMwj1XPeL4VX4jNS1D0gA=;
X-UUID: d6d0bed2a2c741478d3711ef76159f0c-20200730
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2059268777; Thu, 30 Jul 2020 05:30:20 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 06:30:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 21:30:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Jul 2020 21:30:15 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v10 1/3] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Date: Thu, 30 Jul 2020 21:30:14 +0800
Message-ID: <1596115816-11758-2-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 60B3C0A2016D9C45A92EF6B13C4129F947663C6FCB9B7A8DB7AB254757149FE02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_093040_000338_194C7B16 
X-CRM114-Status: GOOD (  17.64  )
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
 Andy Teng <andy.teng@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Loda Chou <loda.chou@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Andy Teng <andy.teng@mediatek.com>

Add devicetree bindings for MediaTek MT6779 pinctrl driver.

Signed-off-by: Andy Teng <andy.teng@mediatek.com>
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 202 ++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
new file mode 100644
index 000000000000..152c151c27ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -0,0 +1,202 @@
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
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pio: pinctrl@10005000 {
+            compatible = "mediatek,mt6779-pinctrl";
+            reg = <0 0x10005000 0 0x1000>,
+                <0 0x11c20000 0 0x1000>,
+                <0 0x11d10000 0 0x1000>,
+                <0 0x11e20000 0 0x1000>,
+                <0 0x11e70000 0 0x1000>,
+                <0 0x11ea0000 0 0x1000>,
+                <0 0x11f20000 0 0x1000>,
+                <0 0x11f30000 0 0x1000>,
+                <0 0x1000b000 0 0x1000>;
+            reg-names = "gpio", "iocfg_rm",
+              "iocfg_br", "iocfg_lm",
+              "iocfg_lb", "iocfg_rt",
+              "iocfg_lt", "iocfg_tl",
+              "eint";
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pio 0 0 210>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+
+            mmc0_pins_default: mmc0-0 {
+                cmd-dat-pins {
+                    pinmux = <PINMUX_GPIO168__FUNC_MSDC0_DAT0>,
+                        <PINMUX_GPIO172__FUNC_MSDC0_DAT1>,
+                        <PINMUX_GPIO169__FUNC_MSDC0_DAT2>,
+                        <PINMUX_GPIO177__FUNC_MSDC0_DAT3>,
+                        <PINMUX_GPIO170__FUNC_MSDC0_DAT4>,
+                        <PINMUX_GPIO173__FUNC_MSDC0_DAT5>,
+                        <PINMUX_GPIO171__FUNC_MSDC0_DAT6>,
+                        <PINMUX_GPIO174__FUNC_MSDC0_DAT7>,
+                        <PINMUX_GPIO167__FUNC_MSDC0_CMD>;
+                    input-enable;
+                    mediatek,pull-up-adv = <1>;
+                };
+                clk-pins {
+                    pinmux = <PINMUX_GPIO176__FUNC_MSDC0_CLK>;
+                    mediatek,pull-down-adv = <2>;
+                };
+                rst-pins {
+                    pinmux = <PINMUX_GPIO178__FUNC_MSDC0_RSTB>;
+                    mediatek,pull-up-adv = <0>;
+                };
+            };
+        };
+
+        mmc0 {
+           pinctrl-0 = <&mmc0_pins_default>;
+           pinctrl-names = "default";
+        };
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
