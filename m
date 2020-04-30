Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91E0C83001
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:16:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8EFD2073E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xsq25RUK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NItP7W9s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8EFD2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmN+jSbhoQlBlen2QW7GHNXxJ8l3i2+zL4G6q1lxBbk=; b=Xsq25RUKtBs+zi
	8WLyhYJmRd8MiMTfYRqnBBt4bTjlggHR9mm7scofp9ahK7fMuGBf7TPnwF8/4hD1h3UVJ6pv9zpxH
	BjGC957R47LunADGn0zWbopUaNvaInLzrB2d3kPSvcb6x1AHq7Pe0n4oTCkJ1x4tkbprCr2OG58md
	1Oj1Ha92+GheTXFuUdODboOpXrYzaYhYSzl1E3jNUc+sjOc/F40TGz1hGsXpQ2rXnpLO2TnRbchtZ
	33UwmYFX741yJRuBel14hFJ5IdCZVeYBpBq69BgGN1zPnbY0JZ1l2INKldX744KWf1ZqwtZ7DdwjQ
	+SQGpt2Ds+GHr21aPrDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU4Mm-0007zZ-TJ; Thu, 30 Apr 2020 08:16:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4MX-0007l5-Bw; Thu, 30 Apr 2020 08:16:07 +0000
X-UUID: 50d00b9715d4430a85264d2bbb9b2dc9-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EcDZkbnw/BOUrM484G7y1Q/9fwZvNqEt5N/wWDQeNUw=; 
 b=NItP7W9szLndFOY77rZ0d5FQi+zXOwlmwyaMxokTYbub2wpJZzKaNus09M6ydGx9hel9RhEd9jQYz9dWCa77a4V9Hh1P5zvWxJNj3h8urJF3p/wGmekoNXcex2GW0Tq0LI58bmlkxHdI3gaYCoPzHw0g6G3sYwou9IjcsiYgRK8=;
X-UUID: 50d00b9715d4430a85264d2bbb9b2dc9-20200430
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 766160955; Thu, 30 Apr 2020 00:15:46 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 01:10:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 16:10:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Apr 2020 16:10:20 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
Date: Thu, 30 Apr 2020 16:09:23 +0800
Message-ID: <20200430080924.1140-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
References: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_011605_411912_1AD8B6C9 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 shengnan.wang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add DT bindings documentation for Omnivision OV02A10 image sensor.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
new file mode 100644
index 0000000..2be4bd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -0,0 +1,148 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
+
+maintainers:
+  - Dongchun Zhu <dongchun.zhu@mediatek.com>
+
+description: |-
+  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
+  image sensor, which is the latest production derived from Omnivision's CMOS
+  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
+  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
+  sensor output is available via CSI-2 serial data output.
+
+properties:
+  compatible:
+    const: ovti,ov02a10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: top mux camtg clock
+      - description: devider clock
+
+  clock-names:
+    items:
+      - const: eclk
+      - const: freq_mux
+
+  clock-frequency:
+    description:
+      Frequency of the eclk clock in Hertz.
+
+  dovdd-supply:
+    description:
+      Definition of the regulator used as interface power supply.
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+  dvdd-supply:
+    description:
+      Definition of the regulator used as digital power supply.
+
+  powerdown-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor powerdown.
+
+  reset-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor reset.
+
+  rotation:
+    description:
+      Definition of the sensor's placement, valid values are 0 and 180.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum:
+          - 0    # Sensor Mounted Upright
+          - 180  # Sensor Mounted Upside Down
+
+  ovti,mipi-tx-speed:
+    description:
+      Indication of MIPI transmission speed select.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum: [ 3, 4 ]
+
+  # See ../video-interfaces.txt for details
+  port:
+    type: object
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        type: object
+        additionalProperties: false
+
+        properties:
+          remote-endpoint: true
+          link-frequencies: true
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-frequency
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - powerdown-gpios
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        clock-frequency = <400000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov02a10: camera-sensor@3d {
+            compatible = "ovti,ov02a10";
+            reg = <0x3d>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&clk_24m_cam>;
+
+            clocks = <&topckgen CLK_TOP_MUX_CAMTG>,
+                     <&topckgen CLK_TOP_UNIVP_192M_D8>;
+            clock-names = "eclk", "freq_mux";
+            clock-frequency = <24000000>;
+
+            rotation = <180>;
+            ovti,mipi-tx-speed = <3>;
+
+            dovdd-supply = <&mt6358_vcamio_reg>;
+            avdd-supply = <&mt6358_vcama1_reg>;
+            dvdd-supply = <&mt6358_vcn18_reg>;
+            powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
+
+            port {
+                wcam_out: endpoint {
+                    remote-endpoint = <&mipi_in_wcam>;
+                    link-frequencies = /bits/ 64 <390000000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db..63a2335 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12389,6 +12389,13 @@ M:	Harald Welte <laforge@gnumonks.org>
 S:	Maintained
 F:	drivers/char/pcmcia/cm4040_cs.*
 
+OMNIVISION OV02A10 SENSOR DRIVER
+M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
+
 OMNIVISION OV13858 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.9.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
