Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDC9C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:04:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA70A2078E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 12:04:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="on6Wpgaq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QujEtpGg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA70A2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rFrWrH5+TWItbLpsUcIyM0bQnAkg4AIBCUzo+d3w8E0=; b=on6Wpgaqn7KqXPHhly7HY8w2Y
	D7vCqqnJp3YsIRAJByvbrGHOoIIaYuFlG1M3HnMH+B/XmztVp5yZeKcOvpTsee/Cht9S/HX5HxJCe
	7gkTUjRHyEKDAhGJy4T1Q4Au8B4pdIaFkgUo8ynA61F6A7BD+9nKz8RsFnRBF0yMHAWhdv9cCvFaR
	XVNCRL0eE69c6uDrXHvOcr1DLP29ZKRZoB6crXStz3sCYN2gOkR0yrpuZifWLY+K5qhXiUDmqVPCt
	47b+o3WqXjcAstxsFEnq9sjeBtNyQUkUpgbQeVfs7JJqz+z5JulKI813bS74NT+kYtpHNSEy+H7fJ
	02WaGnOXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDRUg-0007rh-RD; Wed, 02 Sep 2020 12:04:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDRUd-0007qH-Ol; Wed, 02 Sep 2020 12:04:01 +0000
X-UUID: 2b10c8f1eb004039ae786ac7d3381c1a-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vzYMtXsB4AaXM+b4fO6hFxcNKqQVSl9azzTJyvqvlHk=; 
 b=QujEtpGgU2dgc4b/cCAwBnLfJmiszdRSXVEmKGUB44JMKD3kHSO8JkWZAKajSXA8glrEfeCq0X1/zOq+72kI6bp724jGH7gveS9fpNX1x/8wSyyxqxjKu8ZGKB6g2T9u/yYLZ7pr4IRvbuD25XtR51pz+tB2KBY1tn95l4d/n7Q=;
X-UUID: 2b10c8f1eb004039ae786ac7d3381c1a-20200902
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 227447823; Wed, 02 Sep 2020 04:03:43 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 05:03:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:03:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Sep 2020 20:03:38 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [PATCH v14 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Date: Wed, 2 Sep 2020 20:01:21 +0800
Message-ID: <20200902120122.24456-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_080359_980095_22C3CF4E 
X-CRM114-Status: GOOD (  18.61  )
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

Add YAML device tree binding for OV02A10 CMOS image sensor,
and the relevant MAINTAINERS entries.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../bindings/media/i2c/ovti,ov02a10.yaml           | 161 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
new file mode 100644
index 0000000..8c30505
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -0,0 +1,161 @@
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
+    maxItems: 1
+
+  clock-names:
+    description:
+      External clock for the sensor.
+    items:
+      - const: eclk
+
+  clock-frequency:
+    description:
+      Frequency of the eclk clock in Hz.
+
+  dovdd-supply:
+    description:
+      Definition of the regulator used as Digital I/O voltage supply.
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as Analog voltage supply.
+
+  dvdd-supply:
+    description:
+      Definition of the regulator used as Digital core voltage supply.
+
+  powerdown-gpios:
+    description:
+      Must be the device tree identifier of the GPIO connected to the
+      PD_PAD pin. This pin is used to place the OV02A10 into standby mode
+      or shutdown mode. As the line needs to be high for the powerdown mode
+      to be active, it should be marked GPIO_ACTIVE_HIGH.
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      Must be the device tree identifier of the GPIO connected to the
+      RST_PD pin. If specified, it will be asserted during driver probe.
+      As the line needs to be low for the reset to be active, it should be
+      marked GPIO_ACTIVE_LOW.
+    maxItems: 1
+
+  rotation:
+    description:
+      Definition of the sensor's placement.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum:
+          - 0    # Sensor Mounted Upright
+          - 180  # Sensor Mounted Upside Down
+        default: 0
+
+  ovti,mipi-clock-voltage:
+    description:
+      An array of 2-tuples items, and each item consists of link frequency and
+      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
+      dependent upon link speed, indicating MIPI transmission speed select that
+      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
+      the clock driver capability.
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 2
+    default: [390000, 4]
+
+  # See ../video-interfaces.txt for details
+  port:
+    type: object
+    additionalProperties: false
+    description:
+      Output port node, single endpoint describing the CSI-2 transmitter.
+
+    properties:
+      endpoint:
+        type: object
+        additionalProperties: false
+
+        properties:
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - link-frequencies
+          - remote-endpoint
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
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov02a10: camera-sensor@3d {
+            compatible = "ovti,ov02a10";
+            reg = <0x3d>;
+
+            powerdown-gpios = <&pio 107 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
+
+            clocks = <&ov02a10_clk>;
+            clock-names = "eclk";
+            clock-frequency = <24000000>;
+
+            rotation = <180>;
+            ovti,mipi-clock-voltage = <390000 4>;
+
+            dovdd-supply = <&ov02a10_dovdd>;
+            avdd-supply = <&ov02a10_avdd>;
+            dvdd-supply = <&ov02a10_dvdd>;
+
+            port {
+                wcam_out: endpoint {
+                    link-frequencies = /bits/ 64 <390000000>;
+                    remote-endpoint = <&mipi_in_wcam>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb6..48aa7a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12718,6 +12718,13 @@ M:	Harald Welte <laforge@gnumonks.org>
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
