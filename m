Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502DDEB64D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4IN7o3HY+rAmG5ZCBhkQPMQxrlMvqGrP+JRduM50kQ=; b=X6yxr+6Xk2fFcc5M2YdK8i7asR
	tT91zWs4TICLJY/Jb0ZLoO8xb+AtFVUO/QYVbJhQBa8DKhV80DmZXFCzPvHxDYs1krkBkQ+cn07Fc
	FxV6hRhMoXnscRqgfNMOmVrO6ih5Wuu+fqoB1/kfd6d9erZTPjRzkkoHiFs/FLBQg3iz4/bt8GEoS
	XOaHKPXOh66YD+zTf1vcBMY0Uw9WLSmmUPbQdsUGybqSuGzvAtgNhvf8r2TQnSHBxVTh8hODvZt5O
	Od4+s5ZXZqXLx2AqPsFk07z5Y3VFQBXBrIo8+WVaCOcu8me2CYskLL71EfAHfs3koQQe6mME5sUAY
	oOw61rAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFB0C-003L3l-1C;
	Fri, 30 Jun 2023 10:05:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFB08-003L2L-0l
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Jun 2023 10:05:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-313f18f5295so1990797f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Jun 2023 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688119514; x=1690711514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4IN7o3HY+rAmG5ZCBhkQPMQxrlMvqGrP+JRduM50kQ=;
        b=3KLNbyC3mjTh/sk4F0wOd3vs9LhPqcP7Pz8I/JY8cAHwUGu3nz2b/7ijpi+r8dtpLE
         GnPFvwH6O9rvmxOt+M62PXRPIv8syoKGePv4LokzTz3PoZQ1hJ4dQR8vS8MM2PlGtnX6
         R94hdDYlGpP0qkzVPGxrepYxhmudGPdloM0CetMWA1H4wM8A3HwxrNn999AJUWossuec
         w/Rcq89tGF5/T43/sttFsUmZVbkYdFPpuz2+KRtpMG56p3uhZu/aHJMsqQyLPz1Oy0uW
         HZJvzjRicXILjsaKKTf9XDPnBFyvlitmy21og0pLrVTvqVoDt1dR20Bi4A+zZd+cZFV3
         IWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688119514; x=1690711514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4IN7o3HY+rAmG5ZCBhkQPMQxrlMvqGrP+JRduM50kQ=;
        b=cWKNGRcL2tCtUh3/mH41WdlsZV5CSsQsAvzX75ei0i8QfZBsHw0jaV8HrqdrDoXrH5
         o0NPxxdfR0Vj7AxZCZ5zJqGUwyvowq7wB3TCIiws/GwNtoBTjfjBMrhNdFd6hqBEB+pd
         lIfbHC+//x0uARWpXcl37UxZ+OJxp/dl/35OYbTua6p2O7XXMEQ7dIE1zPeL4JW0ntGC
         kVXYaAReWwGYE46NRhnarLXSTlx3f6pGAKzd5/vwNMtX+fMiulylIlgCRABtNWMEdgTV
         mLGybm9eGK2ijl2g4SVhThzJ/p6d+AGuz473HSESVJZmqobF9x8GhlqbV1pYlKX7dLsc
         7MTQ==
X-Gm-Message-State: ABy/qLZEB4Dn1r842llnr2tDxkrDaDwdXNr5DNbQC/dfUg/5pk52p+JS
	Z6aW5DDHBXjIaESFvT1fNtJe6w==
X-Google-Smtp-Source: APBJJlFGqPTzHOni+PuFDNr7CC1rLmJJ25QDTMtUD8xhIbq6+m3xFfcgKJMTVOvCczfLZvBjt7zveg==
X-Received: by 2002:adf:dd0a:0:b0:313:f679:a9a5 with SMTP id a10-20020adfdd0a000000b00313f679a9a5mr1872185wrm.20.1688119513925;
        Fri, 30 Jun 2023 03:05:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b0031424f4ef1dsm743280wro.19.2023.06.30.03.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:05:13 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH v2 1/4] dt-bindings: media: add mediatek ISP3.0 sensor interface
Date: Fri, 30 Jun 2023 12:01:50 +0200
Message-ID: <20230630100321.1951138-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630100321.1951138-1-jstephan@baylibre.com>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_030516_279962_D17777DC 
X-CRM114-Status: GOOD (  17.84  )
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

From: Louis Kuo <louis.kuo@mediatek.com>

This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../media/mediatek,mt8365-seninf.yaml         | 295 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
new file mode 100644
index 000000000000..1697e94853f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
@@ -0,0 +1,295 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Sensor Interface 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The ISP3.0 SENINF is the CSI-2 and parallel camera sensor interface found in
+  multiple MediaTek SoCs. It can support up to three physical CSI-2
+  input ports, configured in DPHY (2 or 4 data lanes) or CPHY depending on the SoC.
+  On the output side, SENINF can be connected either to CAMSV instance or
+  to the internal ISP. CAMSV is used to transfer the sensor data (Raw, YUV)
+  to DRAM directly, without internal ISP processing.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-seninf
+
+  reg:
+    maxItems: 1
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
+      - const: camsys
+      - const: top_mux
+
+  phys:
+    minItems: 1
+    maxItems: 4
+    description:
+      phandle to the PHYs connected to CSI0/A, CSI1, CSI2 and CSI0B
+
+  phy-names:
+    minItems: 1
+    items:
+      - const: csi0
+      - const: csi1
+      - const: csi2
+      - const: csi0b
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI0 or CSI0A port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI1 port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI2 port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI0B port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 2
+
+      port@4:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for cam0
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+      port@5:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for cam1
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+      port@6:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for camsv0
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+      port@7:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for camsv1
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+      port@8:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for camsv2
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+      port@9:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: connection point for camsv3
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+      - port@5
+      - port@6
+      - port@7
+      - port@8
+      - port@9
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
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+          #address-cells = <2>;
+          #size-cells = <2>;
+
+          seninf: seninf@15040000 {
+                compatible = "mediatek,mt8365-seninf";
+                reg = <0 0x15040000 0 0x6000>;
+                interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
+                clocks = <&camsys CLK_CAM_SENIF>,
+                         <&topckgen CLK_TOP_SENIF_SEL>;
+                clock-names = "camsys", "top_mux";
+
+                power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+                phys = <&mipi_csi0 PHY_TYPE_DPHY>;
+                phy-names = "csi0";
+
+                ports {
+                      #address-cells = <1>;
+                      #size-cells = <0>;
+
+                      port@0 {
+                            reg = <0>;
+                            seninf_in1: endpoint {
+                              clock-lanes = <2>;
+                              data-lanes = <1 3 0 4>;
+                              remote-endpoint = <&isp1_out>;
+                            };
+                      };
+
+                      port@1 {
+                          reg = <1>;
+                      };
+
+                      port@2 {
+                            reg = <2>;
+                      };
+
+                      port@3 {
+                            reg = <3>;
+                      };
+
+                      port@4 {
+                            reg = <4>;
+                            seninf_camsv1_endpoint: endpoint {
+                                remote-endpoint = <&camsv1_endpoint>;
+                            };
+                      };
+
+                      port@5 {
+                            reg = <5>;
+                      };
+
+                      port@6 {
+                            reg = <6>;
+                      };
+
+                      port@7 {
+                            reg = <7>;
+                      };
+
+                      port@8 {
+                            reg = <8>;
+                      };
+
+                      port@9 {
+                            reg = <9>;
+                      };
+
+                };
+          };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e0976ae2a523..af273a477139 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13350,6 +13350,13 @@ M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
 F:	drivers/char/hw_random/mtk-rng.c
 
+MEDIATEK ISP3.0 DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Julien Stephan <jstephan@baylibre.com>
+M:	Andy Hsieh <andy.hsieh@mediatek.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
+
 MEDIATEK SMI DRIVER
 M:	Yong Wu <yong.wu@mediatek.com>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
-- 
2.41.0


