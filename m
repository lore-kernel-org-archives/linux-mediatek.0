Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16705C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 00:18:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D973E206F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 00:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d0PmHQsA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JmS0VSK2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D973E206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DoPlrCaF+bdpW+f5KhB4hIoagF/Pmv+tQ9CQFi02qZU=; b=d0PmHQsAHsL/NKflMenASqvVt
	Aq4IWEB6sxU+W6OMizPNdu/SP92gi5lNvvuaXVzbj2+5qgnUOEbfVr05AiU+++HtEUUggzkYVvO1z
	Na858TNY4Q9Im46g1a5BVmdQ/NJ0YMPy06vPnykUx/7tWYAVI64g5okBHUkx6xcez8jCP5ZaVIkqK
	1c8jy64MolZ3Is04GvyDTAoBgRFWYRY6Zy01nbLqiKHKi2DsjSI/IeKwbzVFzlU7xYZt4TFWgO9m8
	Nw9WiI3nDkBHwi4tKTsNqTjJMZdiP1vuA0RwfawXTFdjRSvkYIer/i7BT0Rt7THUl2eiGGqDU52Ys
	iwQmwQ1tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7Sr4-0000wI-9d; Mon, 17 Aug 2020 00:18:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7Sr1-0000vB-D1; Mon, 17 Aug 2020 00:18:25 +0000
X-UUID: 21b5202013ca4dc4ae69e7d61990864c-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XNNhGe9hJtc1nRk+cqT0d1vM6iPmlGHWwo/10QVUG+E=; 
 b=JmS0VSK282dOaxax2+7tYo0HlLJRX2gbJd33+ZWeo0hm1S/AtG14YwJMq/4cpCUpwCDGX521QNfgidwZeAv7U0KrZ3FITmwjgTro9bHceBJtVAEq7fe9nHJMJar0yKSg0UiJeYGyXIfS+K+4VDxCSanRILvgMEKiQgi/CRl+Ons=;
X-UUID: 21b5202013ca4dc4ae69e7d61990864c-20200816
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 593422564; Sun, 16 Aug 2020 16:18:14 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 17:18:12 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 08:18:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 08:18:09 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
Subject: [PATCH v4 2/3] dt-bindings: pinctrl: mt8192: add binding document
Date: Mon, 17 Aug 2020 08:17:01 +0800
Message-ID: <20200817001702.1646-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
References: <20200817001702.1646-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_201823_602486_CBC717B1 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: devicetree@vger.kernel.org, sean.wang@mediatek.com,
 srv_heupstream@mediatek.com, chuanjia.liu@mediatek.com,
 biao.huang@mediatek.com, zhiyong.tao@mediatek.com, erin.lo@mediatek.com,
 hui.liu@mediatek.com, seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 sin_jieyang@mediatek.com, hongzhou.yang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, eddie.huang@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The commit adds mt8192 compatible node in binding document.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8192.yaml      | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
new file mode 100644
index 000000000000..5556def6b99b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8192 Pin Controller
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+description: |
+  The Mediatek's Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt8192-pinctrl
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
+      Physical address base for gpio base registers. There are 11 GPIO
+      physical address base in mt8192.
+    maxItems: 11
+
+  reg-names:
+    description: |
+      Gpio base register names.
+    maxItems: 11
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
+        /* GPIO1 set as multifunction PWM */
+        state_0_node_b {
+          pinmux = <PINMUX_GPIO1__FUNC_PWM_1>;
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
+          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8192.
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
+    additionalProperties:  false
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
+            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
+            #include <dt-bindings/interrupt-controller/arm-gic.h>
+            pio: pinctrl@10005000 {
+                    compatible = "mediatek,mt8192-pinctrl";
+                    reg = <0x10005000 0x1000>,
+                          <0x11c20000 0x1000>,
+                          <0x11d10000 0x1000>,
+                          <0x11d30000 0x1000>,
+                          <0x11d40000 0x1000>,
+                          <0x11e20000 0x1000>,
+                          <0x11e70000 0x1000>,
+                          <0x11ea0000 0x1000>,
+                          <0x11f20000 0x1000>,
+                          <0x11f30000 0x1000>,
+                          <0x1000b000 0x1000>;
+                    reg-names = "iocfg0", "iocfg_rm", "iocfg_bm",
+                          "iocfg_bl", "iocfg_br", "iocfg_lm",
+                          "iocfg_lb", "iocfg_rt", "iocfg_lt",
+                          "iocfg_tl", "eint";
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    gpio-ranges = <&pio 0 0 220>;
+                    interrupt-controller;
+                    interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
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
