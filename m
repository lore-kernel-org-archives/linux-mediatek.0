Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81B7C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 10:19:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F1C2077D
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 10:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SFG/BFXv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oNB8MyEY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F1C2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A3KFRPu8PeMnxR6IXP8geMlZiLsiuXQFM92CZ8MZaGs=; b=SFG/BFXvt2fKuoleaKoScprj4
	wwHGINaMQfcfCqaw19zLhLae0IzEYh1T9529BEwRe5hOKcpzXy7rDTR0GiPKjc7X2aMoaAMPYSwaA
	hi1BkxivQER+0f3aaYgzIrzdx2UVFe0P9aL4jI1UEG/8nLydVFdrnzDmeUxtmOnRs6RXOE9jfaDqu
	r1K9UEP2bFvODpeCtXUk9mCrRB8VDdE/VhrdSvkTssQcaLs+cJI5coZFpkehnp2yk32xrPlNvO+Z6
	gb3Tttlxj8CBNAlCpZodiWdovz2ual4lcVyUiITOWkV2dS05Vsn0w4CGIeBf34X76KAisl2OQsTlK
	npDxLNH2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtq8C-0002mM-2c; Fri, 10 Jul 2020 10:19:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtq88-0002jb-AJ; Fri, 10 Jul 2020 10:19:45 +0000
X-UUID: 5488dd0d4e774d0d964862b342b04fd4-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oxgA+5RWlyyd09+gVVbe8TMhc9trc3mGT2HvVhln25Q=; 
 b=oNB8MyEYOFefEAQBlE/QqP62SdwBKQwElFJX2zHeeX0WWsPfRtSTjy9FUc1V6WhoaqDf8TUy/yzZmQsUl8ZVlXJXbc3I8I3SBriz5QT2Eq1aJyIw5qgwM6hRDH7ubMRng8AsSAWj1YRnTCFzSnwsYGM+JBEkoYTnHoU+s5uUuK4=;
X-UUID: 5488dd0d4e774d0d964862b342b04fd4-20200710
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1106553710; Fri, 10 Jul 2020 02:19:39 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 03:19:38 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 18:19:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 18:19:35 +0800
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>, 
 <drinkcat@chromium.org>, <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
 <bingbu.cao@intel.com>
Subject: [PATCH v13 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Date: Fri, 10 Jul 2020 18:18:49 +0800
Message-ID: <20200710101850.4604-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200710101850.4604-1-dongchun.zhu@mediatek.com>
References: <20200710101850.4604-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EDF83A120377DBE59EAB153900EED641D97B9A768CFF33D3A50E81FD4648BB1E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_061944_561120_4612201C 
X-CRM114-Status: GOOD (  15.72  )
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
 louis.kuo@mediatek.com, matrix.zhu@aliyun.com, 1095088256@qq.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add YAML device tree binding for OV02A10 CMOS image sensor,
and the relevant MAINTAINERS entries.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 .../bindings/media/i2c/ovti,ov02a10.yaml           | 172 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
new file mode 100644
index 0000000..3a916cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
@@ -0,0 +1,172 @@
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
+      - description: divider clock
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
+  ovti,mipi-tx-speed:
+    description:
+      Indication of MIPI transmission speed select, which is to control D-PHY
+      timing setting by adjusting MIPI clock voltage to improve the clock
+      driver capability.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum:
+          - 0    #  20MHz -  30MHz
+          - 1    #  30MHz -  50MHz
+          - 2    #  50MHz -  75MHz
+          - 3    #  75MHz - 100MHz
+          - 4    # 100MHz - 130MHz
+        default: 3
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
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
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
+            ovti,mipi-tx-speed = <4>;
+
+            dovdd-supply = <&mt6358_vcamio_reg>;
+            avdd-supply = <&mt6358_vcama1_reg>;
+            dvdd-supply = <&mt6358_vcn18_reg>;
+
+            powerdown-gpios = <&pio 107 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 109 GPIO_ACTIVE_LOW>;
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
index 68f21d4..378c961 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12560,6 +12560,13 @@ M:	Harald Welte <laforge@gnumonks.org>
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
