Return-Path: <SRS0=bqbO=BL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4829C433EA
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2020 04:34:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8554620716
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2020 04:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HKfWRdE3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H1k5P+Wj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8554620716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yO6mcOVdDLqe5VT3pX8XP74JaAymOpP3wkM3QWaXIkM=; b=HKfWRdE32qP2zCU0qlHNfRSi7
	upisk6lAonrl+tPdr5up2IpLmVdjZMmjofCTRX7YWORUFII+cZ68PWxjgmu2q2nSEyrVLdaI2SNVY
	4fcz5aSbe2HSTprOlh24HoaCa989IB9XGKfHv/mBOg8jhhsk2W/EwDAUqPCX6iWf4ArgHsW1IgQgY
	PL2Uks/vaFK1T+E5brF9m5ESdcOi82TC0LrzjXk1J2Rm309Z94rE4vgNGrfvfmepdaMJ/Q6NbKV0n
	2+qWlDcx1J69l+0rhCIoojpwxHPrQfEQj8NPljq1BWX/ZvR8ru7gafzlyNhATd4cj9x7Ehpr6icE7
	hAfCpQQyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1jDn-0008Qd-CS; Sat, 01 Aug 2020 04:34:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1jDf-0008MH-3S; Sat, 01 Aug 2020 04:34:04 +0000
X-UUID: 95e1e25f68ed44b3bbd8757dca4887cb-20200731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=muT1DKmjGMWq5CVwTCh6Du/qvpKs7a1mFm0DmlPAuNE=; 
 b=H1k5P+WjZEnUQzNNQy9kXEfN3TXXgBhQsOalPbUGDCy9a0wBDDYqQLHT+MygWe1+Rr2dJLYcv+G+p2JqTCS/0rW2Sh1Wffdv3JVRnaEK4jUdaS3p8UcOTIK2+38MLWIxpPltSynh2wl+L0Oj26fM6Se4sh8hreZpZwMpPVw7lJc=;
X-UUID: 95e1e25f68ed44b3bbd8757dca4887cb-20200731
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1790009746; Fri, 31 Jul 2020 20:33:50 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 21:33:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 1 Aug 2020 12:33:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 1 Aug 2020 12:33:39 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: mt8192: add binding document
Date: Sat, 1 Aug 2020 12:33:02 +0800
Message-ID: <20200801043303.32149-3-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
References: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FFA9077AECD97666CD079287376B6B901AD43CEAB38FE06961E2CECE49FC45422000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_003403_325993_A99F7429 
X-CRM114-Status: GOOD (  18.97  )
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
 hongzhou.yang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, eddie.huang@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The commit adds mt8192 compatible node in binding document.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 .../bindings/pinctrl/pinctrl-mt8192.yaml      | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
new file mode 100755
index 000000000000..88e18e2e23a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
@@ -0,0 +1,175 @@
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
+      node {
+        pinmux = <PIN_NUMBER_PINMUX>;
+        GENERIC_PINCONFIG;
+      };
+    properties:
+      pinmux:
+        $ref: "/schemas/types.yaml#/definitions/uint32-array"
+        description: |
+          Integer array, represents gpio pin number and mux setting.
+          Supported pin number and mux varies for different SoCs, and are defined
+          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
+
+      GENERIC_PINCONFIG:
+        description: |
+          It is the generic pinconfig options to use, bias-disable,
+          bias-pull-down, bias-pull-up, input-enable, input-disable, output-low,
+          output-high, input-schmitt-enable, input-schmitt-disable
+          and drive-strength are valid.
+
+          Some special pins have extra pull up strength, there are R0 and R1 pull-up
+          resistors available, but for user, it's only need to set R1R0 as 00, 01,
+          10 or 11. So It needs config "mediatek,pull-up-adv" or
+          "mediatek,pull-down-adv" to support arguments for those special pins.
+          Valid arguments are from 0 to 3.
+
+          We can use "mediatek,tdsel" which is an integer describing the steps for
+          output level shifter duty cycle when asserted (high pulse width adjustment).
+          Valid arguments  are from 0 to 15.
+          We can use "mediatek,rdsel" which is an integer describing the steps for
+          input level shifter duty cycle when asserted (high pulse width adjustment).
+          Valid arguments are from 0 to 63.
+
+          When config drive-strength, it can support some arguments, such as
+          MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See dt-bindings/pinctrl/mt65xx.h.
+          It can only support 2/4/6/8/10/12/14/16mA in mt8192.
+          For I2C pins, there are existing generic driving setup and the specific
+          driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA driving
+          adjustment in generic driving setup. But in specific driving setup,
+          they can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
+          driving setup for I2C pins, the existing generic driving setup will be
+          disabled. For some special features, we need the I2C pins specific
+          driving setup. The specific driving setup is controlled by E1E0EN.
+          So we need add extra vendor driving preperty instead of
+          the generic driving property.
+          We can add "mediatek,drive-strength-adv = <XXX>;" to describe the specific
+          driving setup property. "XXX" means the value of E1E0EN. EN is 0 or 1.
+          It is used to enable or disable the specific driving setup.
+          E1E0 is used to describe the detail strength specification of the I2C pin.
+          When E1=0/E0=0, the strength is 0.125mA.
+          When E1=0/E0=1, the strength is 0.25mA.
+          When E1=1/E0=0, the strength is 0.5mA.
+          When E1=1/E0=1, the strength is 1mA.
+          So the valid arguments of "mediatek,drive-strength-adv" are from 0 to 7.
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
+examples:
+  - |
+            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
+            #include <dt-bindings/interrupt-controller/arm-gic.h>
+            pio: pinctrl@10005000 {
+                    compatible = "mediatek,mt8192-pinctrl";
+                    reg = <0 0x10005000 0 0x1000>,
+                          <0 0x11c20000 0 0x1000>,
+                          <0 0x11d10000 0 0x1000>,
+                          <0 0x11d30000 0 0x1000>,
+                          <0 0x11d40000 0 0x1000>,
+                          <0 0x11e20000 0 0x1000>,
+                          <0 0x11e70000 0 0x1000>,
+                          <0 0x11ea0000 0 0x1000>,
+                          <0 0x11f20000 0 0x1000>,
+                          <0 0x11f30000 0 0x1000>,
+                          <0 0x1000b000 0 0x1000>;
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
+            };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
