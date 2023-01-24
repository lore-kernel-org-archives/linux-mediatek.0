Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B04AC25B4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHMc3/+dyDhMpyV5LUTgIySjmD40chmrnfgxrWRBXUc=; b=ptorTE0DuCO09fAZS0YXVoKNrG
	Dv4vzqfbwwdZjJNgKJGRwyt/xkYxhqKpgWdSEgCuamtwbUQaunV7/FW04vQxqVqdbQPJvKpAy3AXx
	iHdLQa+rgIDI8edcUxyLNX7+xJGklsl2X+ncFJxNA51f8WD9Cxy50eCeQq09fnQOOVPOwRYdXVmSi
	WM8he3QXI9bNCLFkKsXesQ/+WO7fnzKvINaqe4tQbKP/PR4M7eHG89HrtcuGt6t7GbbKeCBpKIB/M
	u9sC/0szRxjwDNGy2/kMjnVa7AgnujbgpQmqYshf8cOhDcbpYPax6dxG+P39IdBPuw/IfWy6C2Txt
	TyBZ+sIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGJp-00346m-Sd; Tue, 24 Jan 2023 10:14:21 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGIi-0033RU-O4; Tue, 24 Jan 2023 10:13:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30OACiaN088014;
	Tue, 24 Jan 2023 04:12:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674555164;
	bh=FHMc3/+dyDhMpyV5LUTgIySjmD40chmrnfgxrWRBXUc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mzSLFs4LWt92C9t43gDsALwf3XPqE0Y+Wu4kOPTC+Y7uv0ba/6jvTtyGCyXZIx/G0
	 ViH2PEWqCAJrggZP0ZonjKDTiVf0aN5pX83eq/OBt5yz9tU3TWs3u5xFtvx//GSbv8
	 rezvJAaQIHJkJVc+e2o26bah6ZipBoFg1gctDcyY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30OACiC7032448
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jan 2023 04:12:44 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 04:12:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 24 Jan 2023 04:12:43 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30OAChZ6018486;
	Tue, 24 Jan 2023 04:12:43 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Tomi Valkeinen <tomba@kernel.org>, Jyri
 Sarha <jyri.sarha@iki.fi>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guo Ren
	<guoren@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>,
        Devicetree List
	<devicetree@vger.kernel.org>,
        Linux Kernel List
	<linux-kernel@vger.kernel.org>,
        Linux RISC-V List
	<linux-riscv@lists.infradead.org>,
        Linux ARM Kernel List
	<linux-arm-kernel@lists.infradead.org>,
        Linux Mediatek List
	<linux-mediatek@lists.infradead.org>,
        Linux C-SKY Arch List
	<linux-csky@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar
	<devarsht@ti.com>,
        Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary
	<j-choudhary@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v2 3/4] dt-bindings: panel: Introduce dual-link LVDS panel
Date: Tue, 24 Jan 2023 15:42:37 +0530
Message-ID: <20230124101238.4542-4-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124101238.4542-1-a-bhatia1@ti.com>
References: <20230124101238.4542-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_021312_912433_0C29B83F 
X-CRM114-Status: GOOD (  18.22  )
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

Dual-link LVDS interfaces have 2 links, with even pixels traveling on
one link, and odd pixels on the other. These panels are also generic in
nature, with no documented constraints, much like their single-link
counterparts, "panel-lvds".

Add a new compatible, "panel-dual-lvds", and a dt-binding document for
these panels.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 .../display/panel/panel-dual-lvds.yaml        | 149 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
new file mode 100644
index 000000000000..e2ce1768e9a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-dual-lvds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Dual-Link LVDS Display Panel
+
+maintainers:
+  - Aradhya Bhatia <a-bhatia1@ti.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  A dual-LVDS interface is a dual-link connection with the even pixels
+  traveling on one link, and the odd pixels traveling on the other.
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/display/lvds.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lincolntech,lcd185-101ct
+          - microtips,mf-101hiebcaf0
+      - const: panel-dual-lvds
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The sink for first set of LVDS pixels.
+
+        properties:
+          dual-lvds-odd-pixels:
+            type: boolean
+
+          dual-lvds-even-pixels:
+            type: boolean
+
+        oneOf:
+          - required: [dual-lvds-odd-pixels]
+          - required: [dual-lvds-even-pixels]
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: The sink for second set of LVDS pixels.
+
+        properties:
+          dual-lvds-even-pixels:
+            type: boolean
+
+          dual-lvds-odd-pixels:
+            type: boolean
+
+        oneOf:
+          - required: [dual-lvds-even-pixels]
+          - required: [dual-lvds-odd-pixels]
+
+    allOf:
+      - if:
+          properties:
+            port@0:
+              required:
+                - dual-lvds-odd-pixels
+        then:
+          properties:
+            port@1:
+              properties:
+                dual-lvds-odd-pixels: false
+
+      - if:
+          properties:
+            port@0:
+              required:
+                - dual-lvds-even-pixels
+        then:
+          properties:
+            port@1:
+              properties:
+                dual-lvds-even-pixels: false
+
+    required:
+      - port@0
+      - port@1
+
+  port: false
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - width-mm
+  - height-mm
+  - data-mapping
+  - panel-timing
+  - ports
+
+examples:
+  - |
+    panel {
+      compatible = "microtips,mf-101hiebcaf0", "panel-dual-lvds";
+
+      width-mm = <217>;
+      height-mm = <136>;
+
+      data-mapping = "vesa-24";
+
+      panel-timing {
+        clock-frequency = <150275000>;
+        hactive = <1920>;
+        vactive = <1200>;
+        hfront-porch = <32>;
+        hsync-len = <52>;
+        hback-porch = <24>;
+        vfront-porch = <24>;
+        vsync-len = <8>;
+        vback-porch = <3>;
+        de-active = <1>;
+      };
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          dual-lvds-odd-pixels;
+          lcd_in0: endpoint {
+            remote-endpoint = <&oldi_out0>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          dual-lvds-even-pixels;
+          lcd_in1: endpoint {
+            remote-endpoint = <&oldi_out1>;
+          };
+        };
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5e18388b4579..6025bb024586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6461,6 +6461,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/panel/panel-lvds.c
 F:	Documentation/devicetree/bindings/display/lvds.yaml
+F:	Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
 F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
 
 DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
-- 
2.39.0


