Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA38C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xg3hSXkGciKt52znk4TSmCueeQunNQZuAh3Bmpkgiy8=; b=jCBb3v4r5pbyVw
	AdXt0Th5lqxX0fztUoJuGOp3k/NS2uDjmAid0ijumpz7waa2zmcGHl1Aiy+9Bc+OOFTBpOk5k2ikZ
	ARgtObhHNZCsSMq13cDv06qYWfki3pi46CcN5UOQPQJzAZgBrBr4RVMw4FJ5db+2xGfhGbx9+vVqh
	Wce8LPmqbBt3vdWybEiNT73LP/Q85rQCCtoj60Nob/KEavIPuPz+3Tn/nTfhc9FzLBql+sY3X4Fno
	5O+N3MD5c4E3HpQ7F0K0WDRFsni2rzd7CGVbprZ2fxfM9aT52hU6QA4d1yQPswZNfmz/v3rW9xNId
	Hju9yVYH6il1SUBX5qzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5mRE-003LCR-5O; Fri, 07 Jan 2022 10:25:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5mQS-003KoA-3R; Fri, 07 Jan 2022 10:24:50 +0000
X-UUID: 592349fc8721438cb26758386150f813-20220107
X-UUID: 592349fc8721438cb26758386150f813-20220107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 547851301; Fri, 07 Jan 2022 03:24:44 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Jan 2022 02:14:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Jan 2022 18:14:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Jan 2022 18:14:29 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v14 07/12] dt-bindings: arm: mediatek: move out common module
 from display folder
Date: Fri, 7 Jan 2022 18:14:20 +0800
Message-ID: <20220107101425.6917-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
References: <20220107101425.6917-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_022448_190391_025CCDD6 
X-CRM114-Status: GOOD (  17.12  )
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 linux-kernel@vger.kernel.org, CK
 Hu <ck.hu@mediatek.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

AAL, COLOR, CCORR, MUTEX, WDMA could be used by other modules,
such as MDP, so move their binding document into the common folder.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
This patch is base on [1]
[1] dt-binding: mt8183: add Mediatek MDP3 dt-bindings
- https://patchwork.kernel.org/project/linux-mediatek/patch/20220105093758.6850-2-moudy.ho@mediatek.com/
---
 .../display/mediatek/mediatek,ccorr.yaml      | 76 ----------------
 .../display/mediatek/mediatek,wdma.yaml       | 86 -------------------
 .../mediatek/mediatek,aal.yaml                | 13 +--
 .../bindings/soc/mediatek/mediatek,ccorr.yaml | 46 ++++++++--
 .../mediatek/mediatek,color.yaml              | 15 ++--
 .../mediatek/mediatek,mutex.yaml              | 12 +--
 .../bindings/soc/mediatek/mediatek,wdma.yaml  | 47 +++++++++-
 7 files changed, 96 insertions(+), 199 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,aal.yaml (78%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,color.yaml (78%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (80%)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
deleted file mode 100644
index 6894b6999412..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ /dev/null
@@ -1,76 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek display color correction
-
-maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
-
-description: |
-  Mediatek display color correction, namely CCORR, reproduces correct color
-  on panels with different color gamut.
-  CCORR device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
-
-properties:
-  compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8183-disp-ccorr
-      - items:
-          - const: mediatek,mt8192-disp-ccorr
-      - items:
-          - enum:
-              - mediatek,mt8195-disp-ccorr
-          - enum:
-              - mediatek,mt8192-disp-ccorr
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    description: A phandle and PM domain specifier as defined by bindings of
-      the power controller specified by phandle. See
-      Documentation/devicetree/bindings/power/power-domain.yaml for details.
-
-  clocks:
-    items:
-      - description: CCORR Clock
-
-  mediatek,gce-client-reg:
-    description: The register of client driver can be configured by gce with
-      4 arguments defined in this property, such as phandle of gce, subsys id,
-      register offset and size. Each GCE subsys id is mapping to a client
-      defined in the header include/dt-bindings/gce/<chip>-gce.h.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - power-domains
-  - clocks
-
-additionalProperties: false
-
-examples:
-  - |
-
-    ccorr0: ccorr@1400f000 {
-        compatible = "mediatek,mt8183-disp-ccorr";
-        reg = <0 0x1400f000 0 0x1000>;
-        interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-        clocks = <&mmsys CLK_MM_DISP_CCORR0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
-    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
deleted file mode 100644
index aaf5649b6413..000000000000
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ /dev/null
@@ -1,86 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek Write Direct Memory Access
-
-maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
-
-description: |
-  Mediatek Write Direct Memory Access(WDMA) component used to write
-  the data into DMA.
-  WDMA device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
-
-properties:
-  compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-wdma
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    description: A phandle and PM domain specifier as defined by bindings of
-      the power controller specified by phandle. See
-      Documentation/devicetree/bindings/power/power-domain.yaml for details.
-
-  clocks:
-    items:
-      - description: WDMA Clock
-
-  iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
-
-  mediatek,larb:
-    description:
-      This property should contain a phandle pointing to the local arbiter devices defined in
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
-      It must sort according to the local arbiter index, like larb0, larb1, larb2...
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 1
-    maxItems: 32
-
-  mediatek,gce-client-reg:
-    description: The register of client driver can be configured by gce with
-      4 arguments defined in this property, such as phandle of gce, subsys id,
-      register offset and size. Each GCE subsys id is mapping to a client
-      defined in the header include/dt-bindings/gce/<chip>-gce.h.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - power-domains
-  - clocks
-  - iommus
-
-additionalProperties: false
-
-examples:
-  - |
-
-    wdma0: wdma@14011000 {
-        compatible = "mediatek,mt8173-disp-wdma";
-        reg = <0 0x14011000 0 0x1000>;
-        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
-        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-        clocks = <&mmsys CLK_MM_DISP_WDMA0>;
-        iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-        mediatek,larb = <&larb0>;
-        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
-    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
similarity index 78%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
index 225f9dd726d2..f9f57e073b37 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
@@ -1,22 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,aal.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display adaptive ambient light processor
+title: Mediatek adaptive ambient light processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display adaptive ambient light processor, namely AAL,
+  Mediatek adaptive ambient light processor, namely AAL,
   is responsible for backlight power saving and sunlight visibility improving.
-  AAL device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
index cf23f4f5bd69..c4db0b42cf86 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
@@ -10,17 +10,40 @@ maintainers:
   - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek color correction with 3X3 matrix.
+  Mediatek color correction, namely CCORR, reproduces correct color
+  on panels with 3X3 matrix of different color gamut.
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt8183-mdp3-ccorr
+    oneOf:
+      - items:
+          - const: mediatek,mt8183-mdp3-ccorr
+      - items:
+          - const: mediatek,mt8183-disp-ccorr
+      - items:
+          - const: mediatek,mt8192-disp-ccorr
+      - items:
+          - enum:
+              - mediatek,mt8195-disp-ccorr
+          - enum:
+              - mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
+  clocks:
+    items:
+      - description: CCORR Clock
+    minItems: 1
+
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
       4 arguments defined in this property, such as phandle of gce, subsys id,
@@ -29,8 +52,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
 
-  clocks:
-    minItems: 1
+required:
+  - compatible
+  - reg
+  - clocks
 
 additionalProperties: false
 
@@ -45,3 +70,12 @@ examples:
       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
       clocks = <&mmsys CLK_MM_MDP_CCORR>;
     };
+
+    ccorr0: ccorr@1400f000 {
+        compatible = "mediatek,mt8183-disp-ccorr";
+        reg = <0 0x1400f000 0 0x1000>;
+        interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+        clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+    };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
similarity index 78%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
index bc83155b3b4c..8f8b048a8407 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
@@ -1,23 +1,18 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,color.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color processor
+title: Mediatek color processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color processor, namely COLOR, provides hue, luma and
-  saturation adjustments to get better picture quality and to have one panel
+  Mediatek color processor, namely COLOR, provides hue, luma and saturation
+  adjustments to get better picture quality and to have one panel
   resemble the other in their output characteristics.
-  COLOR device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 6eca525eced0..6e1d1ea377c4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -1,25 +1,19 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mutex.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek mutex
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
   Mediatek mutex, namely MUTEX, is used to send the triggers signals called
-  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the display
-  data path or MDP data path.
+  Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules on the data path.
   In some SoC, such as mt2701, MUTEX could be a hardware mutex which protects
   the shadow register.
-  MUTEX device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
index 4057b5232e45..7e5d1a6a79a9 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
@@ -15,13 +15,18 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt8183-mdp3-wdma
+    oneOf:
+      - items:
+          - const: mediatek,mt8183-mdp3-wdma
+      - items:
+          - const: mediatek,mt8173-disp-wdma
 
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
       4 arguments defined in this property, such as phandle of gce, subsys id,
@@ -31,14 +36,39 @@ properties:
     maxItems: 1
 
   power-domains:
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
     maxItems: 1
 
   clocks:
+    items:
+      - description: WDMA Clock
     minItems: 1
 
   iommus:
+    description:
+      This property should point to the respective IOMMU block with master port as argument,
+      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
     maxItems: 1
 
+  mediatek,larb:
+    description:
+      This property should contain a phandle pointing to the local arbiter devices defined in
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
+      It must sort according to the local arbiter index, like larb0, larb1, larb2...
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - clocks
+  - iommus
+
 additionalProperties: false
 
 examples:
@@ -56,3 +86,14 @@ examples:
       clocks = <&mmsys CLK_MM_MDP_WDMA0>;
       iommus = <&iommu>;
     };
+
+    wdma0: wdma@14011000 {
+        compatible = "mediatek,mt8173-disp-wdma";
+        reg = <0 0x14011000 0 0x1000>;
+        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+        clocks = <&mmsys CLK_MM_DISP_WDMA0>;
+        iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+        mediatek,larb = <&larb0>;
+        mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+    };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
