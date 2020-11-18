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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C52FC56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:23:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F9D222266
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="srmm+mJj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FKrXCzQ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F9D222266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RxVJCA7ssRBgPTi/3q2/C64n8RaIpR0IR5mL/A+VS5k=; b=srmm+mJjbDLcU7dbmPIvuFxEH
	QPpPcjPS9EubDhQzAMf+NEaGadNeNiCq6NxMMxTGUBw8lexLrVTMU/vcooQTsUsTq3yq/zEPFEc2L
	piFWLbyqu6r1xljvolcKjubvQEXeRvdjhMtFnK2j7dpJb1B9oibKKhdA83M6V6/U1lF4daX+B7ZMA
	CeVUCY9gOIpoN0yxwqkcZekDmTAr1TiXJFB+fupZygvGpNvZR2eaIEyh58Ela+ipupuyE6mZKokun
	3PkvjLEW18kZBw9M3EG/KewPeCku6fi+WGqpHB6fpRymmjRmnK8d7B5QKSD4Y9LvHTurzbpfDtSc+
	Dszc7ByMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfIkM-0008O5-GI; Wed, 18 Nov 2020 08:23:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfIk1-0008Fq-2c; Wed, 18 Nov 2020 08:23:07 +0000
X-UUID: 2e54c5030de54680a8be082c0a21aa15-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wPYqoh6TTh7pSTY0uSbwzAHnzpJpZhVdrDKwycnirJI=; 
 b=FKrXCzQ+XMt+gvXW1Y8E5m2MPrAxDM2SehXdEUacK1BbEPNXYb0TQrWMBGYWG1o6Hr6I1oyeuXiv3XCVZyBF4N7FUkpkbU0ieijUu/p30+yD0ry/aOLDYK2Rz7bdrLUp56rV2Nldk38goPw84JwRpSGcT8lQfWjwdpP1OUB8mjE=;
X-UUID: 2e54c5030de54680a8be082c0a21aa15-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 741011318; Wed, 18 Nov 2020 00:22:45 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 00:21:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 16:21:47 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Nov 2020 16:21:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 10/11] dt-bindings: usb: convert mediatek,
 mtu3.txt to YAML schema
Date: Wed, 18 Nov 2020 16:21:25 +0800
Message-ID: <20201118082126.42701-10-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_032301_340643_9EFA5095 
X-CRM114-Status: GOOD (  26.41  )
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

Convert mediatek,mtu3.txt to YAML schema mediatek,mtu3.yaml

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3:
  1. fix yamllint warning
  2. remove pinctrl* properties
  3. remove unnecessary '|'
  4. drop unused labels in example

v2: new patch
---
 .../devicetree/bindings/usb/mediatek,mtu3.txt | 108 ---------
 .../bindings/usb/mediatek,mtu3.yaml           | 218 ++++++++++++++++++
 2 files changed, 218 insertions(+), 108 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
deleted file mode 100644
index a82ca438aec1..000000000000
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ /dev/null
@@ -1,108 +0,0 @@
-The device node for Mediatek USB3.0 DRD controller
-
-Required properties:
- - compatible : should be "mediatek,<soc-model>-mtu3", "mediatek,mtu3",
-	soc-model is the name of SoC, such as mt8173, mt2712 etc,
-	when using "mediatek,mtu3" compatible string, you need SoC specific
-	ones in addition, one of:
-	- "mediatek,mt8173-mtu3"
- - reg : specifies physical base address and size of the registers
- - reg-names: should be "mac" for device IP and "ippc" for IP port control
- - interrupts : interrupt used by the device IP
- - power-domains : a phandle to USB power domain node to control USB's
-	mtcmos
- - vusb33-supply : regulator of USB avdd3.3v
- - clocks : a list of phandle + clock-specifier pairs, one for each
-	entry in clock-names
- - clock-names : must contain "sys_ck" for clock of controller,
-	the following clocks are optional:
-	"ref_ck", "mcu_ck" and "dma_ck";
- - phys : see usb-hcd.yaml in the current directory
- - dr_mode : should be one of "host", "peripheral" or "otg",
-	refer to usb/generic.txt
-
-Optional properties:
- - #address-cells, #size-cells : should be '2' if the device has sub-nodes
-	with 'reg' property
- - ranges : allows valid 1:1 translation between child's address space and
-	parent's address space
- - extcon : external connector for vbus and idpin changes detection, needed
-	when supports dual-role mode.
-	it's considered valid for compatibility reasons, not allowed for
-	new bindings, and use "usb-role-switch" property instead.
- - vbus-supply : reference to the VBUS regulator, needed when supports
-	dual-role mode.
-	it's considered valid for compatibility reasons, not allowed for
-	new bindings, and put into a usb-connector node.
-	see connector/usb-connector.yaml.
- - pinctrl-names : a pinctrl state named "default" is optional, and need be
-	defined if auto drd switch is enabled, that means the property dr_mode
-	is set as "otg", and meanwhile the property "mediatek,enable-manual-drd"
-	is not set.
- - pinctrl-0 : pin control group
-	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
- - maximum-speed : valid arguments are "super-speed", "high-speed" and
-	"full-speed"; refer to usb/generic.txt
- - usb-role-switch : use USB Role Switch to support dual-role switch, but
-	not extcon; see usb/generic.txt.
- - enable-manual-drd : supports manual dual-role switch via debugfs; usually
-	used when receptacle is TYPE-A and also wants to support dual-role
-	mode.
- - wakeup-source: enable USB remote wakeup of host mode.
- - mediatek,syscon-wakeup : phandle to syscon used to access the register
-	of the USB wakeup glue layer between SSUSB and SPM; it depends on
-	"wakeup-source", and has two arguments:
-	- the first one : register base address of the glue layer in syscon;
-	- the second one : hardware version of the glue layer
-		- 1 : used by mt8173 etc
-		- 2 : used by mt2712 etc
- - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
-	bit1 for u3port1, ... etc;
-
-additionally the properties from usb-hcd.yaml (in the current directory) are
-supported.
-
-Sub-nodes:
-The xhci should be added as subnode to mtu3 as shown in the following example
-if host mode is enabled. The DT binding details of xhci can be found in:
-Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
-
-The port would be added as subnode if use "usb-role-switch" property.
-	see graph.txt
-
-Example:
-ssusb: usb@11271000 {
-	compatible = "mediatek,mt8173-mtu3";
-	reg = <0 0x11271000 0 0x3000>,
-	      <0 0x11280700 0 0x0100>;
-	reg-names = "mac", "ippc";
-	interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
-	phys = <&phy_port0 PHY_TYPE_USB3>,
-	       <&phy_port1 PHY_TYPE_USB2>;
-	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-	clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>,
-		 <&pericfg CLK_PERI_USB0>,
-		 <&pericfg CLK_PERI_USB1>;
-	clock-names = "sys_ck", "ref_ck";
-	vusb33-supply = <&mt6397_vusb_reg>;
-	vbus-supply = <&usb_p0_vbus>;
-	extcon = <&extcon_usb>;
-	dr_mode = "otg";
-	wakeup-source;
-	mediatek,syscon-wakeup = <&pericfg 0x400 1>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-	ranges;
-
-	usb_host: xhci@11270000 {
-		compatible = "mediatek,mt8173-xhci";
-		reg = <0 0x11270000 0 0x1000>;
-		reg-names = "mac";
-		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
-		clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
-		clock-names = "sys_ck", "ref_ck";
-		vusb33-supply = <&mt6397_vusb_reg>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
new file mode 100644
index 000000000000..290e97a06f2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -0,0 +1,218 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek USB3 DRD Controller Device Tree Bindings
+
+maintainers:
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: |
+  The DRD controller has a glue layer IPPC (IP Port Control), and its host is
+  based on xHCI.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt2712-mtu3
+          - mediatek,mt8173-mtu3
+          - mediatek,mt8183-mtu3
+      - const: mediatek,mtu3
+
+  reg:
+    items:
+      - description: the registers of device MAC
+      - description: the registers of IP Port Control
+
+  reg-names:
+    items:
+      - const: mac
+      - const: ippc
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
+    maxItems: 4
+    items:
+      - description: Controller clock used by normal mode
+      - description: Reference clock used by low power mode etc
+      - description: Mcu bus clock for register access
+      - description: DMA bus clock for data transfer
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+    items:
+      - const: sys_ck  # required, the following ones are optional
+      - const: ref_ck
+      - const: mcu_ck
+      - const: dma_ck
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of all the USB PHYs used
+
+  vusb33-supply:
+    description: Regulator of USB AVDD3.3v
+
+  vbus-supply:
+    $ref: /connector/usb-connector.yaml#
+    deprecated: true
+    description: |
+      Regulator of USB VBUS5v, needed when supports dual-role mode.
+      Particularly, if use an output GPIO to control a VBUS regulator, should
+      model it as a regulator. See bindings/regulator/fixed-regulator.yaml
+      It's considered valid for compatibility reasons, not allowed for
+      new bindings, and put into a usb-connector node.
+
+  dr_mode:
+    description: See usb/generic.txt
+    enum: [host, peripheral, otg]
+    default: otg
+
+  maximum-speed:
+    description: See usb/generic.txt
+    enum: [super-speed-plus, super-speed, high-speed, full-speed]
+
+  "#address-cells":
+    enum: [1, 2]
+
+  "#size-cells":
+    enum: [1, 2]
+
+  ranges: true
+
+  extcon:
+    deprecated: true
+    description: |
+      Phandle to the extcon device detecting the IDDIG/VBUS state, neede
+      when supports dual-role mode.
+      It's considered valid for compatibility reasons, not allowed for
+      new bindings, and use "usb-role-switch" property instead.
+
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Support role switch. See usb/generic.txt
+    type: boolean
+
+  connector:
+    $ref: /connector/usb-connector.yaml#
+    description:
+      Connector for dual role switch, especially for "gpio-usb-b-connector"
+    type: object
+
+  port:
+    description:
+      Any connector to the data bus of this controller should be modelled
+      using the OF graph bindings specified, if the "usb-role-switch"
+      property is used. See graph.txt
+    type: object
+
+  enable-manual-drd:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      supports manual dual-role switch via debugfs; usually used when
+      receptacle is TYPE-A and also wants to support dual-role mode.
+    type: boolean
+
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
+# Required child node when support dual-role
+patternProperties:
+  "^usb@[0-9a-f]+$":
+    type: object
+    $ref: /usb/mediatek,mtk-xhci.yaml#
+    description:
+      The xhci should be added as subnode to mtu3 as shown in the following
+      example if the host mode is enabled.
+
+dependencies:
+  connector: [ 'usb-role-switch' ]
+  port: [ 'usb-role-switch' ]
+  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
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
+    usb@11271000 {
+        compatible = "mediatek,mt8173-mtu3", "mediatek,mtu3";
+        reg = <0x11271000 0x3000>, <0x11280700 0x0100>;
+        reg-names = "mac", "ippc";
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
+        phys = <&phy_port0 PHY_TYPE_USB3>, <&phy_port1 PHY_TYPE_USB2>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+        clocks = <&topckgen CLK_TOP_USB30_SEL>;
+        clock-names = "sys_ck";
+        vusb33-supply = <&mt6397_vusb_reg>;
+        vbus-supply = <&usb_p0_vbus>;
+        extcon = <&extcon_usb>;
+        dr_mode = "otg";
+        wakeup-source;
+        mediatek,syscon-wakeup = <&pericfg 0x400 1>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        xhci: usb@11270000 {
+            compatible = "mediatek,mt8173-xhci", "mediatek,mtk-xhci";
+            reg = <0x11270000 0x1000>;
+            reg-names = "mac";
+            interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+            clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
+            clock-names = "sys_ck", "ref_ck";
+            vusb33-supply = <&mt6397_vusb_reg>;
+        };
+    };
+...
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
