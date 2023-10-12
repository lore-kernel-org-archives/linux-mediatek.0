Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7AFCDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 01:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHiBzs9J2FRKPc3cBKYCzPbJg3lLw9dS1L+StF8COac=; b=2wU3n6TR5U28LEB/T2sC12Ab97
	PQMNApZM52qxdBHtW1uFtfNmw155qz9QL2tRxdkIxrevLsPDDTWzoz6bVtP1ipdvJ4YZr+QAMlVAx
	zWgLvY9YfB0VWLksMdxnmrzYTAKpBwBRLmOSgy9V7YkL7n5Al/dYEIcypvN7DSYHdBCZmQc1V2z1N
	nDF3ALtY0DAFZK3ZJI4PWu5cgknUAAfkUrVw3MA0HBpXpeET25csBYQR3mlXsgxCkiO63SDSH5vMm
	HGiIR9As5aBTR4uXcCrP7TAqZXHL0Sq2478eKsdsljpOG94bdevgEKe/wpjoCbOZMuXXAC2C24OD4
	5Kgx7oVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqkN6-00H7ED-2l;
	Thu, 12 Oct 2023 01:20:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqkN2-00H7D7-2X
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 01:20:14 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81AC6F0C;
	Thu, 12 Oct 2023 03:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697073608;
	bh=e8hk2CThFmHhSz6FXnR9MAZHNnFExXXotYzRnzp6swc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qJod6vopSyKwNw8NQ1Qlfc8ew7FpwEjvBrK8hQTomulieIU46PpLDd6bTlS3EvsCT
	 8OPKerNYcvReCspjkFDaHJG2C0+LfKcZLZwdfbzCt32yX0S/2bd1580ERdgdjFSLGa
	 ZfOTNG4n/tqND41ya6K0zpVVK4yyu9P9e8O4FjDE=
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
Subject: [PATCH v2 1/3] dt-bindings: media: Add bindings for THine THP7312 ISP
Date: Thu, 12 Oct 2023 04:20:14 +0300
Message-ID: <20231012012016.11535-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
References: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_182012_985047_9D171FD5 
X-CRM114-Status: GOOD (  18.89  )
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
 .../bindings/media/i2c/thine,thp7312.yaml     | 225 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 232 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
new file mode 100644
index 000000000000..053b28fb0a89
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
@@ -0,0 +1,225 @@
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
+    description: I2C device address
+
+  clocks:
+    maxItems: 1
+    description: CLKI clock input
+
+  thine,boot-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Boot mode of the THP7312. 0 is for standard streaming mode, for the
+      THP7312 to be used as an ISP. 1 is for firmware flashing mode.
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
+  vddgpio_0-supply:
+    description:
+      Supply for GPIO_0. 1.8V, 2.8V, or 3.3V.
+
+  vddgpio_1-supply:
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
+  - thine,boot-mode
+  - vddcore-supply
+  - vhtermrx-supply
+  - vddtx-supply
+  - vddhost-supply
+  - vddcmos-supply
+  - vddgpio_0-supply
+  - vddgpio_1-supply
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
+            thine,boot-mode = <0>;
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
+            vddgpio_0-supply = <&vsys_v4p2>;
+            vddgpio_1-supply = <&vsys_v4p2>;
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


