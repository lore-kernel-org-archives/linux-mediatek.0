Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F381C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:26:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C5C8241A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U4aAWeti";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AnoPve4h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C5C8241A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YS47Uldm7LRIFWIyPukSFUm+dD6XbRVljGg8F5d6pEM=; b=U4aAWetinEnNngJFDABj88naV
	SOyoHdqaHgwGgaZUjyzk4lyJcbbD8yX2VDvYWRSUn2pvpswRIpfoOktmNcGcHtYR4twvGs1J3Eo4V
	DWqIwL6wJvpLGqBOQiF49OC6STEz4TKJC0514mGGONmTQJvt/d+Zjn53TwVIeAHbppsccTF0iUJGZ
	9BhprSD5WuSaEqPh+r5DO0opFEOEZUMNdf6ioZcKixDRJbp+5QeIZizdcELaNO1MsRcHl0/VW/CR0
	bmge0COuFtEWLWCMvpgljQa7jJq6PXsdKasxTEcHEra9apKnAPvrfR0xPzYIrvZMzyodnBBlKwo5T
	THIrQpaVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfInE-0001Do-E9; Wed, 18 Nov 2020 08:26:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfImY-0000rg-FG; Wed, 18 Nov 2020 08:25:40 +0000
X-UUID: aa4c3ac2e0be4046984dbcf8d897c2d2-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=H0a632YVvLWvHpL20R72rYivWFUjreRIQGgMvmjDNcA=; 
 b=AnoPve4hMtd/AbHTMUfDAiXPinJ3y7hYFB2o3YqAAad8P0HEG8wiuzjF2OntSGK/D66Umjw5VEn7OF9Bq9fyp5c8oqZBERD4YauQmRqWocXHgph5j/0y7/kfJ158pvCI+NDimL7S7g/dvryea+aoobvSOG3fTOUhwxpN0R+m8Ug=;
X-UUID: aa4c3ac2e0be4046984dbcf8d897c2d2-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1443856329; Wed, 18 Nov 2020 00:25:27 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 00:21:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 16:21:46 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Nov 2020 16:21:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 09/11] dt-bindings: usb: convert mediatek,
 mtk-xhci.txt to YAML schema
Date: Wed, 18 Nov 2020 16:21:24 +0800
Message-ID: <20201118082126.42701-9-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_032538_733884_0745658F 
X-CRM114-Status: GOOD (  24.78  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod
 Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert mediatek,mtk-xhci.txt to YAML schema mediatek,mtk-xhci.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3:
  1. fix yamllint warning
  2. remove pinctrl* properties supported by default suggested by Rob
  3. drop unused labels
  4. modify description of mediatek,syscon-wakeup
  5. remove type of imod-interval-ns

v2: new patch
---
 .../bindings/usb/mediatek,mtk-xhci.txt        | 121 -------------
 .../bindings/usb/mediatek,mtk-xhci.yaml       | 171 ++++++++++++++++++
 2 files changed, 171 insertions(+), 121 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
deleted file mode 100644
index 42d8814f903a..000000000000
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
+++ /dev/null
@@ -1,121 +0,0 @@
-MT8173 xHCI
-
-The device node for Mediatek SOC USB3.0 host controller
-
-There are two scenarios: the first one only supports xHCI driver;
-the second one supports dual-role mode, and the host is based on xHCI
-driver. Take account of backward compatibility, we divide bindings
-into two parts.
-
-1st: only supports xHCI driver
-------------------------------------------------------------------------
-
-Required properties:
- - compatible : should be "mediatek,<soc-model>-xhci", "mediatek,mtk-xhci",
-	soc-model is the name of SoC, such as mt8173, mt2712 etc, when using
-	"mediatek,mtk-xhci" compatible string, you need SoC specific ones in
-	addition, one of:
-	- "mediatek,mt8173-xhci"
- - reg : specifies physical base address and size of the registers
- - reg-names: should be "mac" for xHCI MAC and "ippc" for IP port control
- - interrupts : interrupt used by the controller
- - power-domains : a phandle to USB power domain node to control USB's
-	mtcmos
- - vusb33-supply : regulator of USB avdd3.3v
-
- - clocks : a list of phandle + clock-specifier pairs, one for each
-	entry in clock-names
- - clock-names : must contain
-	"sys_ck": controller clock used by normal mode,
-	the following ones are optional:
-	"ref_ck": reference clock used by low power mode etc,
-	"mcu_ck": mcu_bus clock for register access,
-	"dma_ck": dma_bus clock for data transfer by DMA,
-	"xhci_ck": controller clock
-
- - phys : see usb-hcd.yaml in the current directory
-
-Optional properties:
- - wakeup-source : enable USB remote wakeup;
- - mediatek,syscon-wakeup : phandle to syscon used to access the register
-	of the USB wakeup glue layer between xHCI and SPM; it depends on
-	"wakeup-source", and has two arguments:
-	- the first one : register base address of the glue layer in syscon;
-	- the second one : hardware version of the glue layer
-		- 1 : used by mt8173 etc
-		- 2 : used by mt2712 etc
- - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
-	bit1 for u3port1, ... etc;
- - vbus-supply : reference to the VBUS regulator;
- - usb3-lpm-capable : supports USB3.0 LPM
- - pinctrl-names : a pinctrl state named "default" must be defined
- - pinctrl-0 : pin control group
-	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
- - imod-interval-ns: default interrupt moderation interval is 5000ns
-
-additionally the properties from usb-hcd.yaml (in the current directory) are
-supported.
-
-Example:
-usb30: usb@11270000 {
-	compatible = "mediatek,mt8173-xhci";
-	reg = <0 0x11270000 0 0x1000>,
-	      <0 0x11280700 0 0x0100>;
-	reg-names = "mac", "ippc";
-	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>,
-		 <&pericfg CLK_PERI_USB0>,
-		 <&pericfg CLK_PERI_USB1>;
-	clock-names = "sys_ck", "ref_ck";
-	phys = <&phy_port0 PHY_TYPE_USB3>,
-	       <&phy_port1 PHY_TYPE_USB2>;
-	vusb33-supply = <&mt6397_vusb_reg>;
-	vbus-supply = <&usb_p1_vbus>;
-	usb3-lpm-capable;
-	mediatek,syscon-wakeup = <&pericfg 0x400 1>;
-	wakeup-source;
-	imod-interval-ns = <10000>;
-};
-
-2nd: dual-role mode with xHCI driver
-------------------------------------------------------------------------
-
-In the case, xhci is added as subnode to mtu3. An example and the DT binding
-details of mtu3 can be found in:
-Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
-
-Required properties:
- - compatible : should be "mediatek,<soc-model>-xhci", "mediatek,mtk-xhci",
-	soc-model is the name of SoC, such as mt8173, mt2712 etc, when using
-	"mediatek,mtk-xhci" compatible string, you need SoC specific ones in
-	addition, one of:
-	- "mediatek,mt8173-xhci"
- - reg : specifies physical base address and size of the registers
- - reg-names: should be "mac" for xHCI MAC
- - interrupts : interrupt used by the host controller
- - power-domains : a phandle to USB power domain node to control USB's
-	mtcmos
- - vusb33-supply : regulator of USB avdd3.3v
-
- - clocks : a list of phandle + clock-specifier pairs, one for each
-	entry in clock-names
- - clock-names : must contain "sys_ck", and the following ones are optional:
-	"ref_ck", "mcu_ck" and "dma_ck", "xhci_ck"
-
-Optional properties:
- - vbus-supply : reference to the VBUS regulator;
- - usb3-lpm-capable : supports USB3.0 LPM
-
-Example:
-usb30: usb@11270000 {
-	compatible = "mediatek,mt8173-xhci";
-	reg = <0 0x11270000 0 0x1000>;
-	reg-names = "mac";
-	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
-	clock-names = "sys_ck", "ref_ck";
-	vusb33-supply = <&mt6397_vusb_reg>;
-	usb3-lpm-capable;
-};
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
new file mode 100644
index 000000000000..4a36ad5c4d25
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -0,0 +1,171 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek USB3 xHCI Device Tree Bindings
+
+maintainers:
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+allOf:
+  - $ref: "usb-hcd.yaml"
+
+description: |
+  There are two scenarios:
+  case 1: only supports xHCI driver;
+  case 2: supports dual-role mode, and the host is based on xHCI driver.
+
+properties:
+  # common properties for both case 1 and case 2
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt2712-xhci
+          - mediatek,mt7622-xhci
+          - mediatek,mt7629-xhci
+          - mediatek,mt8173-xhci
+          - mediatek,mt8183-xhci
+      - const: mediatek,mtk-xhci
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: the registers of xHCI MAC
+      - description: the registers of IP Port Control
+
+  reg-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: mac
+      - const: ippc  # optional, only needed for case 1.
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle to USB power domain node to control USB's MTCMOS
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+    items:
+      - description: Controller clock used by normal mode
+      - description: Reference clock used by low power mode etc
+      - description: Mcu bus clock for register access
+      - description: DMA bus clock for data transfer
+      - description: controller clock
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+    items:
+      - const: sys_ck  # required, the following ones are optional
+      - const: ref_ck
+      - const: mcu_ck
+      - const: dma_ck
+      - const: xhci_ck
+
+  phys:
+    $ref: /usb/usb-hcd.yaml#
+    description: List of all the USB PHYs on this HCD
+
+  vusb33-supply:
+    description: Regulator of USB AVDD3.3v
+
+  vbus-supply:
+    description: Regulator of USB VBUS5v
+
+  usb3-lpm-capable:
+    description: supports USB3.0 LPM
+    type: boolean
+
+  imod-interval-ns:
+    description:
+      Interrupt moderation interval value, it is 8 times as much as that
+      defined in the xHCI spec on MTK's controller.
+    default: 5000
+
+  # the following properties are only used for case 1
+  wakeup-source:
+    description: enable USB remote wakeup, see power/wakeup-source.txt
+    type: boolean
+
+  mediatek,syscon-wakeup:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+    description: |
+      A phandle to syscon used to access the register of the USB wakeup glue
+      layer between xHCI and SPM, the field should always be 3 cells long.
+
+      items:
+        - description:
+            The first cell represents a phandle to syscon
+        - description:
+            The second cell represents the register base address of the glue
+            layer in syscon
+        - description:
+            The third cell represents the hardware version of the glue layer,
+            1 is used by mt8173 etc, 2 is used by mt2712 etc
+          enum: [1, 2]
+
+  mediatek,u3p-dis-msk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The mask to disable u3ports, bit0 for u3port0,
+      bit1 for u3port1, ... etc
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^[a-f]+@[0-9a-f]+$":
+    $ref: /usb/usb-hcd.yaml#
+    type: object
+    description: The hard wired USB devices.
+
+dependencies:
+  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    usb@11270000 {
+        compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
+        reg = <0x11270000 0x1000>, <0x11280700 0x0100>;
+        reg-names = "mac", "ippc";
+        interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+        clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
+        clock-names = "sys_ck", "ref_ck";
+        phys = <&u3port0 PHY_TYPE_USB3>, <&u2port1 PHY_TYPE_USB2>;
+        vusb33-supply = <&mt6397_vusb_reg>;
+        vbus-supply = <&usb_p1_vbus>;
+        imod-interval-ns = <10000>;
+        mediatek,syscon-wakeup = <&pericfg 0x400 1>;
+        wakeup-source;
+        usb3-lpm-capable;
+    };
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
