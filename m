Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA7AC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:16:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37AA16196E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37AA16196E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZoX+yLkSmXTAdDp3qPtyhBziLj5fsLwLR3gLvHrI1oQ=; b=kaBsmkCy/oXG0N/2+/ehmvMsG
	Jlgzx9Uynx2uzBYOeDHEopI6iafKU9UWmqci9NTjTeCEHeiDj90RPeqjW6rWwW8DXRq3yqOHNm75z
	hQcLJnLhd0o2+NVuUQLET9VWHZT9x0+O0QbeOZ31eH3ZHw973ZWo/NAYf2fXWz4z/dbJDH7N87oKO
	QOOjsTKwMZ4pmh1nuF54engkiLgpQqRt4K1bzI4aEtHnAtiqqJVev2ZnsfQy93fWyF8VKMV/LwNcb
	uqSByW3qqFvt4PPOoIxPGeexdHPzNsNwtGUWFiAo41RaScG87c7B1G3XynYRTGU7+oxUr8/Yz9dSh
	ZFufUg8RQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxMA-001CTe-48; Mon, 29 Mar 2021 19:15:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq73-000cPt-6T; Mon, 29 Mar 2021 11:31:20 +0000
X-UUID: d755181998e945e4a8e65673a16f6f5f-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nZVe6rKcQKMfYGLt349wuLiCwxni++pQj8nLA37hd7g=; 
 b=O35n/iwe5+TjtT0m6SK4aB9ZwPrStApVK+B7nAl09mV43xxkeoK0wqW0iiKCDnkWAauMjU546u6Ap5Kn82+STOyT6ez5BkPSJLuZs1kpdw2mV5dN+vCNfsqd5LUsG//VuBq7DAhs6LJxzj+5Scjzg9AN/7iyEdsz7heeuh8dokM=;
X-UUID: d755181998e945e4a8e65673a16f6f5f-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1371981252; Mon, 29 Mar 2021 03:31:12 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 04:31:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 19:31:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:31:08 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH Resend v0 2/6] dt-bindings: pinctrl: mt8195: add binding
 document
Date: Mon, 29 Mar 2021 19:30:59 +0800
Message-ID: <20210329113103.11003-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
References: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_123117_664010_755841AF 
X-CRM114-Status: GOOD (  14.98  )
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

The commit adds mt8195 compatible node in binding document.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
new file mode 100644
index 000000000000..7915b9568c29
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8195.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8195 Pin Controller
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+description: |
+  The Mediatek's Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8195-pinctrl
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: |
+      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
+      the amount of cells must be specified as 2. See the below
+      mentioned gpio binding representation for description of particular cells.
+    const: 2
+
+  gpio-ranges:
+    description: gpio valid number range.
+    maxItems: 1
+
+  reg:
+    description: |
+      Physical address base for gpio base registers. There are 8 GPIO
+      physical address base in mt8195.
+    maxItems: 8
+
+  reg-names:
+    description: |
+      Gpio base register names.
+    maxItems: 8
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupts:
+    description: The interrupt outputs to sysirq.
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '^pins':
+    type: object
+    description: |
+      A pinctrl node should contain at least one subnodes representing the
+      pinctrl groups available on the machine. Each subnode will list the
+      pins it needs, and how they should be configured, with regard to muxer
+      configuration, pullups, drive strength, input enable/disable and
+      input schmitt.
+      An example of using macro:
+      pincontroller {
+        /* GPIO0 set as multifunction GPIO0 */
+        state_0_node_a {
+          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+        };
+        /* GPIO1 set as multifunction CLKM1 */
+        state_0_node_b {
+          pinmux = <PINMUX_GPIO1__FUNC_CLKM1>;
+        };
+      };
+    $ref: "pinmux-node.yaml"
+
+    properties:
+      pinmux:
+        description: |
+          Integer array, represents gpio pin number and mux setting.
+          Supported pin number and mux varies for different SoCs, and are defined
+          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+
+      drive-strength:
+        description: |
+          It can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See
+          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8195.
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      output-high: true
+
+      output-low: true
+
+      input-enable: true
+
+      input-disable: true
+
+      input-schmitt-enable: true
+
+      input-schmitt-disable: true
+
+    required:
+      - pinmux
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+            #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+            #include <dt-bindings/interrupt-controller/arm-gic.h>
+            pio: pinctrl@10005000 {
+                    compatible = "mediatek,mt8195-pinctrl";
+                    reg = <0x10005000 0x1000>,
+                          <0x11d10000 0x1000>,
+                          <0x11d30000 0x1000>,
+                          <0x11d40000 0x1000>,
+                          <0x11e20000 0x1000>,
+                          <0x11e20000 0x1000>,
+                          <0x11eb0000 0x1000>,
+                          <0x11f40000 0x1000>,
+                          <0x1000b000 0x1000>;
+                    reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
+                          "iocfg_br", "iocfg_lm", "iocfg_rb",
+                          "iocfg_tl", "eint";
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    gpio-ranges = <&pio 0 0 144>;
+                    interrupt-controller;
+                    interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+                    #interrupt-cells = <2>;
+
+                    pins {
+                      pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                      output-low;
+                    };
+            };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
