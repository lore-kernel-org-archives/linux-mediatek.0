Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA3DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 07:53:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89BA02312F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 07:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89BA02312F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a1ILsCz///pkD6tiqI6wGmy8bvHReW3zidoI7mIzAdc=; b=ShBtOOc1lzmOKSxGBlZVxlbl8
	AlQvlJQZrXSoHDWN3uGBmtdmg5LpXod97FXs4gKH2RFiGipS9Ammsw3+qL7ITWZbtlzEEO5eazjaw
	rChjOnmogYXyVaV9ZE/EVZVoZ60UbSuFQwA8vBGR/v/h37vhFqges/+Hxz4gnADFyr1SYXpLVUWV2
	cCzWRl8UKIUtoA8+nfvgMiSWlEjRPC6+7jFXe3RILSH4syQmOMsUx2GHbWfStctEeyIubnTu/6KM2
	S2klyQ8NcdImvflz1kdxeiG0+4OYlWbDD/3y6yqj1F3pV53qWB6thOthPr5XaW/RXmZboWsX9mMuh
	pH4VJONKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kshud-0004un-Hx; Fri, 25 Dec 2020 07:53:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kshuN-0004oc-A1; Fri, 25 Dec 2020 07:53:10 +0000
X-UUID: 3f03290d339f437e96eec24ae8627d92-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Gkxsn3RhJEBMYPUZZBJ+4dcIQbU1ggJXG32F30tDMY0=; 
 b=CZ8esObgy4U9yr9pNu+yAi4e113b+yoy9hAM6dUF3OY1ARhy7DZ2OBsHhWn35ZKYoVBgB61R9wY/o6BeA3ymZWQs0IZ7QNIeWI4Qb8Rqy3U2dAnHIGGH2X93S3DN5YT1iOdUcmd/Zd9wBVRbqkRYpxdWyQm7+ypmGOdmb04Fh/c=;
X-UUID: 3f03290d339f437e96eec24ae8627d92-20201224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2039666015; Thu, 24 Dec 2020 23:53:03 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 23:53:02 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 15:52:58 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Dec 2020 15:52:58 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 08/11] dt-bindings: usb: convert mediatek,
 musb.txt to YAML schema
Date: Fri, 25 Dec 2020 15:52:55 +0800
Message-ID: <20201225075258.33352-8-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4C2BD39F7A06B8839203EFF13CF1EADF850EF30D9AD7561566933D51B300AF3E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_025307_579683_93B42B35 
X-CRM114-Status: GOOD (  17.95  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kishon Vijay
 Abraham I <kishon@ti.com>, Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert mediatek,musb.txt to YAML schema mediatek,musb.yaml

Cc: Min Guo <min.guo@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4~v5: no changes
v3: add Reviewed-by Rob
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
index 000000000000..790efe8b6274
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
+    usb@11200000 {
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
+        connector {
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
