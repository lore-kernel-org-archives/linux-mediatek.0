Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13613C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 10:40:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D32852078D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 10:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H77j9b11";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BdBGLj6v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D32852078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uzak/jLiXHg2Tl7aRLEUDWcuHak0n7E/4bcsEsCCUCE=; b=H77j9b11NhRtZihG2LGgK1/cy
	ODMskEYTSJvsNQK9FFL5EaADcm0jO2XhwBlNO1r2L4prc3/GYRE/KJJRho8jUPKQWZMT8cZki6msA
	hutTgbrhuMDdWYNhSpJFdKmREq/StdRISmMgEtxsBLfan8FHceReHa4CK/ClCh6/WwyE1j/tajmZF
	HPhky07BgigyHnKrdIt8Hy1/s8FnlB+tCfKBycs1Eg9NI6obeFdGsIgqd2K9iMRacwgrH5vLXNkJ8
	mmmPQo4EtM6UW+LJQ2YbJ/Tr/dbD5pwKzpUII/EmdT/MZ11UDOvmulBV+pHxAY80ycoTeOwQnHhPM
	NEoYMjZEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt7VQ-0002d0-Ep; Wed, 08 Jul 2020 10:40:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt7VK-0002Zt-3o; Wed, 08 Jul 2020 10:40:43 +0000
X-UUID: 6de9bdcb2cf249939a36251e10a037bd-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C1rVBmtcn80UNbJ7oS203MwTgWEo53DfAO2x/ts3HiE=; 
 b=BdBGLj6vKsjbNPY8zz99k/9uxAu+/q2rahHO5WfpzWy6RjlM6+OeblHttPkdaTio8SUl3NZJl5yTsSc9VLdQLAbFuR+SFV7Ay0czfyqUvY1t5Gw70tO1JNxYoPUmyYn44pxgmcIFj60+2U/0vnW6UD96bdp0W1d6ZG/x7/4qSqs=;
X-UUID: 6de9bdcb2cf249939a36251e10a037bd-20200708
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <louis.kuo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1053560320; Wed, 08 Jul 2020 02:40:41 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 03:40:27 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 18:40:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jul 2020 18:40:26 +0800
From: Louis Kuo <louis.kuo@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
 <mchehab@kernel.org>
Subject: [RFC PATCH V7 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Date: Wed, 8 Jul 2020 18:40:22 +0800
Message-ID: <20200708104023.3225-3-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200708104023.3225-1-louis.kuo@mediatek.com>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_064042_333689_3A4A82E0 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 louis.kuo@mediatek.com, christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds the DT binding documentation for the sensor interface
module in Mediatek SoCs.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 .../bindings/media/mediatek-seninf.yaml       | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
new file mode 100644
index 000000000000..917b393acc0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-seninf.yaml
@@ -0,0 +1,223 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek-seninf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Sensor Interface (CSI) Device Tree Bindings
+
+maintainers:
+  - Louis Kuo <louis.kuo@mediatek.com>
+
+description: |
+  Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support
+  a widely adopted, simple, high-speed protocol primarily intended for
+  point-to-point image and video transmission between cameras and host devices.
+
+properties:
+  compatible:
+    const: mediatek,mt8183-seninf
+
+  reg:
+    minItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Seninf camsys clock
+      - description: Seninf top mux clock
+
+  clock-names:
+    items:
+      - const: cam_seninf
+      - const: top_mux_seninf
+
+  phys:
+    items:
+      - description: Seninf mipi dphy
+
+  phy-names:
+    items:
+      - const: seninf
+
+  # See ./video-interfaces.txt for details
+  ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      port@0:
+        type: object
+        description: connection point for sensor at port 0
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 0
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              remote-endpoint: true
+
+      port@1:
+        type: object
+        description: connection point for sensor at port 1
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 1
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              remote-endpoint: true
+
+      port@4:
+        type: object
+        description: connection point for camsys
+        additionalProperties: false
+
+        properties:
+          reg:
+            const: 4
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+    required:
+      - port@0
+      - port@1
+      - port@4
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8183-power.h>
+
+    parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        seninf: seninf@1a040000 {
+            compatible = "mediatek,mt8183-seninf";
+            reg = <0 0x1a040000 0 0x8000>;
+            interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
+            power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+            clocks = <&camsys CLK_CAM_SENINF>,
+                <&topckgen CLK_TOP_MUX_SENINF>;
+            clock-names = "cam_seninf", "top_mux_seninf";
+            phys = <&mipi_dphy 0>;
+            phy-names = "seninf";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mipi_in_bcam: endpoint {
+                        data-lanes = <0 1 3 4>;
+                        remote-endpoint = <&bcam_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mipi_in_fcam: endpoint {
+                        data-lanes = <1>;
+                        remote-endpoint = <&fcam_out>;
+                    };
+                };
+
+                port@4 {
+                    reg = <4>;
+                    seninf_camisp_endpoint: endpoint {
+                        remote-endpoint = <&camisp_endpoint>;
+                    };
+                };
+            };
+        };
+
+        mipi_dphy: mipi_dphy@11c80000 {
+            compatible = "mediatek,mt8183-mipi_dphy";
+            reg = <0 0x11C80000 0 0x6000>;
+            #phy-cells = <1>;
+        };
+
+        i2c2: i2c@11009000 {
+            reg = <0 0x11009000 0 0x1000>;
+            clock-frequency = <400000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            wcam: camera@36 {
+                compatible = "ovti,ov5695";
+                reg = <0x36>;
+
+                port {
+                    bcam_out: endpoint {
+                        remote-endpoint = <&mipi_in_bcam>;
+                        data-lanes = <0 1 3 4>;
+                    };
+                };
+            };
+        };
+
+        i2c4: i2c@11008000 {
+            reg = <0 0x11008000 0 0x1000>;
+            clock-frequency = <400000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ucam: camera@3c {
+                compatible = "ovti,ov2685";
+                reg = <0x3c>;
+
+                port {
+                    fcam_out: endpoint {
+                        remote-endpoint = <&mipi_in_fcam>;
+                        data-lanes = <1>;
+                    };
+                };
+            };
+        };
+    };
\ No newline at end of file
--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
