Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57E5C433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 01:47:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DB7E221FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 01:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQsqz7eD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lxZB1WdF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DB7E221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jL778hWlwPSC3wus5eoAxMXF96ygWktNYulr8GyRztw=; b=XQsqz7eDIBrc8Wok0ohaM/Tx0
	7lr5Wg+GfQdgAvFXSMomt3/9+TBMJen+fUqjs4dAUuRZozIQX4koUwqNBHs6qjsVBjCxJfds9NQyV
	G9LGfD9oJNitfxdg1skZ0HekulftLzvi7dOoEm614TKenmMH5l+/B6A6V41TJ3eeRMXw9PtlIy13T
	PK6e5DSqAisN6M9GRYRPPTuJX6QakzMh6VHZgXzC8gQPGYAlTXrBOdKWv5Z7Wlwmbiw9VPFbqHpdU
	w8qkplk+L3bR7xfNAsyDCm81wXaB85kjsidksgg7Og5ElDmWuVD6bB9cykpW3lvSHNV7tzdR5YSB5
	oR6EI88Wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSVsi-0007h1-Q0; Wed, 14 Oct 2020 01:47:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSVse-0007ej-RR
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 01:47:06 +0000
X-UUID: e3648cee3688421fa71b3aa7a4c5298d-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/1hRdRS40R3hj3AhAEeqMyq3jm2D8NL6j14ZOY3RUZ0=; 
 b=lxZB1WdFoCSAreeuyhb5n6YZ3FB7TfK5nPBxvqdr076gOm9D8TL5QCH8qQLVSqflxCr24rT6VycwiCKs6IjpyHhE26DAP7CvfH3toz8CjS3jtzRZS5PWc0A6p1zq4kSK8a9eP4Wp+CL9M4Py0znEP0B7XodxbfgDi4iReRxP7JI=;
X-UUID: e3648cee3688421fa71b3aa7a4c5298d-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1773889700; Tue, 13 Oct 2020 17:46:59 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 18:44:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 09:44:41 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Oct 2020 09:44:41 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 5/8] dt-bindings: usb: convert mediatek,
 musb.txt to YAML schema
Date: Wed, 14 Oct 2020 09:44:31 +0800
Message-ID: <20201014014434.62239-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201014014434.62239-1-chunfeng.yun@mediatek.com>
References: <20201014014434.62239-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_214705_069305_F24DD7D8 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Min Guo <min.guo@mediatek.com>,
 srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert mediatek,musb.txt to YAML schema mediatek,musb.yaml

Cc: Min Guo <min.guo@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch
---
 .../devicetree/bindings/usb/mediatek,musb.txt |  57 ---------
 .../bindings/usb/mediatek,musb.yaml           | 113 ++++++++++++++++++
 2 files changed, 113 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
deleted file mode 100644
index 5eedb0296562..000000000000
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-MediaTek musb DRD/OTG controller
--------------------------------------------
-
-Required properties:
- - compatible      : should be one of:
-                     "mediatek,mt2701-musb"
-                     ...
-                     followed by "mediatek,mtk-musb"
- - reg             : specifies physical base address and size of
-                     the registers
- - interrupts      : interrupt used by musb controller
- - interrupt-names : must be "mc"
- - phys            : PHY specifier for the OTG phy
- - dr_mode         : should be one of "host", "peripheral" or "otg",
-                     refer to usb/generic.txt
- - clocks          : a list of phandle + clock-specifier pairs, one for
-                     each entry in clock-names
- - clock-names     : must contain "main", "mcu", "univpll"
-                     for clocks of controller
-
-Optional properties:
- - power-domains   : a phandle to USB power domain node to control USB's
-                     MTCMOS
-
-Required child nodes:
- usb connector node as defined in bindings/connector/usb-connector.yaml
-Optional properties:
- - id-gpios        : input GPIO for USB ID pin.
- - vbus-gpios      : input GPIO for USB VBUS pin.
- - vbus-supply     : reference to the VBUS regulator, needed when supports
-                     dual-role mode
- - usb-role-switch : use USB Role Switch to support dual-role switch, see
-                     usb/generic.txt.
-
-Example:
-
-usb2: usb@11200000 {
-	compatible = "mediatek,mt2701-musb",
-		     "mediatek,mtk-musb";
-	reg = <0 0x11200000 0 0x1000>;
-	interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
-	interrupt-names = "mc";
-	phys = <&u2port2 PHY_TYPE_USB2>;
-	dr_mode = "otg";
-	clocks = <&pericfg CLK_PERI_USB0>,
-		 <&pericfg CLK_PERI_USB0_MCU>,
-		 <&pericfg CLK_PERI_USB_SLV>;
-	clock-names = "main","mcu","univpll";
-	power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
-	usb-role-switch;
-	connector{
-		compatible = "gpio-usb-b-connector", "usb-b-connector";
-		type = "micro";
-		id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
-		vbus-supply = <&usb_vbus>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
new file mode 100644
index 000000000000..f2b3dcb3d52c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/mediatek,musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MUSB DRD/OTG Controller Device Tree Bindings
+
+maintainers:
+  - Min Guo <min.guo@mediatek.com>
+
+properties:
+  $nodename:
+    pattern: '^usb@[0-9a-f]+$'
+
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt2701-musb
+      - const: mediatek,mtk-musb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: mc
+
+  clocks:
+    items:
+      - description: The main/core clock
+      - description: The system bus clock
+      - description: The 48Mhz clock
+
+  clock-names:
+    items:
+      - const: main
+      - const: mcu
+      - const: univpll
+
+  phys:
+    maxItems: 1
+
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch. See usb/generic.txt
+    type: boolean
+
+  dr_mode:
+    enum:
+      - host
+      - otg
+      - peripheral
+
+  power-domains:
+    description: A phandle to USB power domain node to control USB's MTCMOS
+    maxItems: 1
+
+  connector:
+    $ref: /connector/usb-connector.yaml#
+    description: Connector for dual role switch
+    type: object
+
+dependencies:
+  usb-role-switch: [ 'connector' ]
+  connector: [ 'usb-role-switch' ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - phys
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mt2701-power.h>
+
+    usb2: usb@11200000 {
+        compatible = "mediatek,mt2701-musb", "mediatek,mtk-musb";
+        reg = <0x11200000 0x1000>;
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-names = "mc";
+        phys = <&u2port2 PHY_TYPE_USB2>;
+        dr_mode = "otg";
+        clocks = <&pericfg CLK_PERI_USB0>,
+                 <&pericfg CLK_PERI_USB0_MCU>,
+                 <&pericfg CLK_PERI_USB_SLV>;
+        clock-names = "main","mcu","univpll";
+        power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
+        usb-role-switch;
+
+        connector{
+            compatible = "gpio-usb-b-connector", "usb-b-connector";
+            type = "micro";
+            id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
+            vbus-supply = <&usb_vbus>;
+        };
+    };
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
