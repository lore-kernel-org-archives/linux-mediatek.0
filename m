Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A333CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 19:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9Sp0k/K2woNK4YHDD7wN7fzn2fszvIIlFOwBJM8wBU=; b=tpwd0XZhLPbGyMTzB44EVmg8eg
	nNGdMQElPXInZ7KVJABmkzij5v3/yrCWuAunkeVWXqimI3AYB0acLF/wosjGCEH7eVwnZcTTGsURR
	sQzXQf//d189mWV0SR82otxb+lhNlznCpiYDRleZz7T/RraizkpfGPjzqLGjyhqH99W+CeTQRdB4N
	60aV1IbETTgaq4Z9krVI5A68P3dEuGV14LpHLif5LpT/SssjI4Nt+zMVDxHPm8mMJspsQCzAfj5nh
	4mzIF3tMQSg4sVKu4FjiuB1DOhs9EDZW4w/aLraehoFRenezdSwB6ggkTElOveNAw7v9VfF4AgeOo
	EEDWMybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr1VA-001hxJ-34;
	Thu, 12 Oct 2023 19:37:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr1V4-001hus-21
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 19:37:42 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15D357FC;
	Thu, 12 Oct 2023 21:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697139449;
	bh=TzcYL6gP+DxKIq3ZRgcojuIAJVQdSOsosbasKwD8ciY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=efcgNB8YfoKXMXaGNtNA1wEol6iqHAXA9F0N7d0Da/doONS2yYoyoFXNE5eF+S3Wm
	 kjqhZaSszEKIVUjwUA4yK8Wmb5zOlluMW23D9DTH+1lF36YB6ADQrlOoAbs0AL1cGu
	 SOFeULnfVFW+h7+mC8xdPFdL1SHuG/g2CcTsVk7k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: media: Add bindings for THine THP7312 ISP
Date: Thu, 12 Oct 2023 22:37:35 +0300
Message-ID: <20231012193737.7251-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012193737.7251-1-laurent.pinchart@ideasonboard.com>
References: <20231012193737.7251-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_123738_953745_D76445BE 
X-CRM114-Status: GOOD (  20.03  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Paul Elder <paul.elder@ideasonboard.com>

The THP7312 is an external ISP from THine. Add DT bindings for it.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Drop description of reg property
- Improve thine,boot-mode property documentation
- Making thine,boot-mode property optional
- Don't use underscores in supplies names
---
 .../bindings/media/i2c/thine,thp7312.yaml     | 226 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
new file mode 100644
index 000000000000..0758d8d44826
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
@@ -0,0 +1,226 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 Ideas on Board
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/thine,thp7312.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: THine THP7312
+
+maintainers:
+  - Paul Elder <paul.elder@@ideasonboard.com>
+
+description:
+  The THP7312 is a standalone ISP controlled over i2c, and is capable of
+  various image processing and correction functions, including 3A control. It
+  can be connected to CMOS image sensors from various vendors, supporting both
+  MIPI CSI-2 and parallel interfaces. It can also output on either MIPI CSI-2
+  or parallel. The hardware is capable of transmitting and receiving MIPI
+  interlaved data strams with data types or multiple virtual channel
+  identifiers.
+
+allOf:
+  - $ref: ../video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: thine,thp7312
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: CLKI clock input
+
+  thine,boot-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 1
+    default: 1
+    description:
+      Boot mode of the THP7312, reflecting the value of the BOOT[0] pin strap.
+      0 is for the SPI/2-wire slave boot, 1 is for the SPI master boot (from
+      external flash ROM).
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Reference to the GPIO connected to the RESET_N pin, if any.
+      Must be released (set high) after all supplies are applied.
+
+  vddcore-supply:
+    description:
+      1.2V supply for core, PLL, MIPI rx and MIPI tx.
+
+  vhtermrx-supply:
+    description:
+      Supply for input (RX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
+
+  vddtx-supply:
+    description:
+      Supply for output (TX). 1.8V for MIPI, or 1.8/2.8/3.3V for parallel.
+
+  vddhost-supply:
+    description:
+      Supply for host interface. 1.8V, 2.8V, or 3.3V.
+
+  vddcmos-supply:
+    description:
+      Supply for sensor interface. 1.8V, 2.8V, or 3.3V.
+
+  vddgpio-0-supply:
+    description:
+      Supply for GPIO_0. 1.8V, 2.8V, or 3.3V.
+
+  vddgpio-1-supply:
+    description:
+      Supply for GPIO_1. 1.8V, 2.8V, or 3.3V.
+
+  orientation: true
+  rotation: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            description:
+              This property is for lane reordering between the THP7312 and the
+              SoC. The sensor supports either two-lane, or four-lane operation.
+              If this property is omitted four-lane operation is assumed. For
+              two-lane operation the property must be set to <1 2>.
+            minItems: 2
+            maxItems: 4
+            items:
+              maximum: 4
+
+  sensors:
+    type: object
+    description: List of connected sensors
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^sensor@[01]":
+        type: object
+        description:
+          Sensors connected to the first and second input, with one node per
+          sensor.
+
+        properties:
+          thine,model:
+            $ref: /schemas/types.yaml#/definitions/string
+            description:
+              Model of the connected sensors. Must be a valid compatible string.
+
+          reg:
+            maxItems: 1
+            description: THP7312 input port number
+
+          data-lanes:
+            $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes
+            items:
+              maxItems: 4
+            description:
+              This property is for lane reordering between the THP7312 and the imaging
+              sensor that it is connected to.
+
+        patternProperties:
+          ".*-supply":
+            description: Power supplies for the sensor
+
+        required:
+          - reg
+          - data-lanes
+
+        additionalProperties: false
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - clocks
+  - vddcore-supply
+  - vhtermrx-supply
+  - vddtx-supply
+  - vddhost-supply
+  - vddcmos-supply
+  - vddgpio-0-supply
+  - vddgpio-1-supply
+  - sensors
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@61 {
+            compatible = "thine,thp7312";
+            reg = <0x61>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam1_pins_default>;
+
+            reset-gpios = <&pio 119 GPIO_ACTIVE_LOW>;
+            clocks = <&camera61_clk>;
+
+            vddcore-supply = <&vsys_v4p2>;
+            vhtermrx-supply = <&vsys_v4p2>;
+            vddtx-supply = <&vsys_v4p2>;
+            vddhost-supply = <&vsys_v4p2>;
+            vddcmos-supply = <&vsys_v4p2>;
+            vddgpio-0-supply = <&vsys_v4p2>;
+            vddgpio-1-supply = <&vsys_v4p2>;
+
+            orientation = <0>;
+            rotation = <0>;
+
+            sensors {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                sensor@0 {
+                    thine,model = "sony,imx258";
+                    reg = <0>;
+
+                    data-lanes = <4 1 3 2>;
+
+                    dovdd-supply = <&vsys_v4p2>;
+                    avdd-supply = <&vsys_v4p2>;
+                    dvdd-supply = <&vsys_v4p2>;
+                };
+            };
+
+            port {
+                thp7312_2_endpoint: endpoint {
+                    remote-endpoint = <&mipi_thp7312_2>;
+                    data-lanes = <4 2 1 3>;
+                };
+            };
+    	  };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 83a0c7f3826b..e7d0a4e47a4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21447,6 +21447,13 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
 F:	drivers/platform/x86/think-lmi.?
 
+THP7312 ISP DRIVER
+M:	Paul Elder <paul.elder@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
+
 THUNDERBOLT DMA TRAFFIC TEST DRIVER
 M:	Isaac Hazan <isaac.hazan@intel.com>
 L:	linux-usb@vger.kernel.org
-- 
Regards,

Laurent Pinchart


