Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2379C2D0D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75CE2467F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tJ0cycLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B75CE2467F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=By9CW7e3aCLVd/KprsENG2fxHhIpngU03NxC+dKnIuE=; b=tJ0cycLYxB2Wxi
	wbxLB6xx1PIN81KTEV20ohF5leNQcNJ08xE2u+BjpBqInUw5ndHIdRYiuujBKr4L2g5fQeAjtbkk6
	1gCJViQZZYNZGcpP0sBA/omNxS3xvuOMCOpkm2DRIyWNrQmqkA2LYOccvsYRfvwa6dtwqxk/B/Q98
	ulsq7JIMmwNMtgrqlHdYKd1Dkf6cycwz2wILX92EPZlPfXk49K/5qSZLdRmUK7IthbeM5Hyy0w9yj
	xKWghrC9tFKzlGkoApfQhkLNDZSGcVCLqHnvRHBSoXK+hIuDWIVf/DEk5qFsQEyU7C4eX6aC9i1cQ
	fk0Qu9DpoI7TeQIz3arw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiDUU-0008Im-4c; Fri, 20 Dec 2019 08:18:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiDTt-0007pb-O4; Fri, 20 Dec 2019 08:17:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C47B4293281
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v22 1/2] Documentation: bridge: Add documentation for ps8640
 DT properties
Date: Fri, 20 Dec 2019 09:17:37 +0100
Message-Id: <20191220081738.1895-2-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220081738.1895-1-enric.balletbo@collabora.com>
References: <20191220081738.1895-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_001754_048468_5E794BCF 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 drinkcat@chromium.org, Jitao Shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ulrich Hecht <uli@fpond.eu>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jitao Shi <jitao.shi@mediatek.com>

Add documentation for DT properties supported by
ps8640 DSI-eDP converter.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ulrich Hecht <uli@fpond.eu>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
I maintained the ack from Rob Herring and the review from Philipp
because in essence the only thing I did is migrate to YAML format and
check that no errors are reported via dtbs_check. Just let me know if
you're not agree.

Apart from this note that I removed the mode-sel property because is not
used and I renamed sleep-gpios to powerdown-gpios.

Changes in v22:
- Migrate to YAML format (Maxime Ripart)
- Remove mode-sel property.
- Rename sleep-gpios to powerdown-gpios.

Changes in v21: None
Changes in v19: None
Changes in v18: None
Changes in v17: None
Changes in v16: None
Changes in v15: None
Changes in v14: None
Changes in v13: None
Changes in v12: None
Changes in v11: None

 .../bindings/display/bridge/ps8640.yaml       | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ps8640.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
new file mode 100644
index 000000000000..5dff93641bea
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ps8640.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPI DSI to eDP Video Format Converter Device Tree Bindings
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
+
+description: |
+  The PS8640 is a low power MIPI-to-eDP video format converter supporting
+  mobile devices with embedded panel resolutions up to 2048 x 1536. The
+  device accepts a single channel of MIPI DSI v1.1, with up to four lanes
+  plus clock, at a transmission rate up to 1.5Gbit/sec per lane. The
+  device outputs eDP v1.4, one or two lanes, at a link rate of up to
+  3.24Gbit/sec per lane.
+
+properties:
+  compatible:
+    const: parade,ps8640
+
+  reg:
+    maxItems: 1
+    description: Base I2C address of the device.
+
+  powerdown-gpios:
+    maxItems: 1
+    description: GPIO connected to active low powerdown.
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to active low reset.
+
+  vdd12-supply:
+    maxItems: 1
+    description: Regulator for 1.2V digital core power.
+
+  vdd33-supply:
+    maxItems: 1
+    description: Regulator for 3.3V digital core power.
+
+  ports:
+    type: object
+    description:
+      A node containing DSI input & output port nodes with endpoint
+      definitions as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+      Documentation/devicetree/bindings/graph.txt
+    properties:
+      port@0:
+        type: object
+        description: |
+          Video port for DSI input
+
+      port@1:
+        type: object
+        description: |
+          Video port for eDP output (panel or connector).
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - powerdown-gpios
+  - reset-gpios
+  - vdd12-supply
+  - vdd33-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ps8640: edp-bridge@18 {
+            compatible = "parade,ps8640";
+            reg = <0x18>;
+            powerdown-gpios = <&pio 116 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&pio 115 GPIO_ACTIVE_LOW>;
+            vdd12-supply = <&ps8640_fixed_1v2>;
+            vdd33-supply = <&mt6397_vgp2_reg>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    ps8640_in: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    ps8640_out: endpoint {
+                        remote-endpoint = <&panel_in>;
+                   };
+                };
+            };
+        };
+    };
+
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
