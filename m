Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 05:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/bPTj9w4ggSnXdnliABuyIibnS0sRzlK8cfTc1fXbE=; b=B6CwmRtEyhRJ6f
	0NbLFu4IcOoKWK1zC2lBONTkyPxWRmluUgZ3jYbPMz39HoOdcs2PIWzcpct1TWiVqbfuxrguUbD1v
	CVX2k8GvLOuDcn8xQjv5NkImP7hJUILPgXYxNu49zDrBkfSSGwFEQK/ozGL6FuLVcTiQJyRMjwZeM
	r3ioDOsAITYmRDxL3dHzxxCvyN2VFzoQOp8xjsdlv7tkH2/aMthhYpmsDIqv89Zfu7cBILvT012Kw
	5fOFcuxM/XaVUzWRRw41DNgJTwNUT9ADdH4tMkSsVOa+FLh5oW6uaU+dnY6fUNCkcBKdov4U2205T
	9me9RkUh4VCwOjXsCTWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Kxq-00DVzl-QD; Mon, 17 Jan 2022 05:53:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Kx9-00DVjg-Vt; Mon, 17 Jan 2022 05:53:19 +0000
X-UUID: ee5196abf4874697b9b6e2613080415d-20220116
X-UUID: ee5196abf4874697b9b6e2613080415d-20220116
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1658398149; Sun, 16 Jan 2022 22:53:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 13:53:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:09 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 14/14] dt-bindings: media: mediatek: mdp3: add yaml for new
 modules added in mt8195
Date: Mon, 17 Jan 2022 13:52:54 +0800
Message-ID: <20220117055254.9777-15-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_215316_091140_CA0A8A1D 
X-CRM114-Status: GOOD (  15.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add yaml for new modules added in mt8195

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
This patch is base on [1]
[1] dt-bindings: arm: mediatek: move out common module from display folder
- https://patchwork.kernel.org/project/linux-mediatek/patch/20220107101425.6917-8-jason-jh.lin@mediatek.com/
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  2 +
 .../bindings/media/mediatek,mdp3-aal.yaml     | 56 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-color.yaml   | 56 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-fg.yaml      | 55 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-hdr.yaml     | 55 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-merge.yaml   | 54 ++++++++++++++++
 .../bindings/media/mediatek,mdp3-ovl.yaml     | 53 ++++++++++++++++
 .../bindings/media/mediatek,mdp3-pad.yaml     | 56 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 28 +++++++++
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  2 +
 .../bindings/media/mediatek,mdp3-split.yaml   | 58 ++++++++++++++++++
 .../bindings/media/mediatek,mdp3-stitch.yaml  | 53 ++++++++++++++++
 .../bindings/media/mediatek,mdp3-tcc.yaml     | 54 ++++++++++++++++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    |  3 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |  6 ++
 16 files changed, 652 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 763c62323a74..9e59c8b738bb 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -31,6 +31,8 @@ properties:
               - mediatek,mt8183-mmsys
               - mediatek,mt8192-mmsys
               - mediatek,mt8365-mmsys
+              - mediatek,mt8195-vppsys0
+              - mediatek,mt8195-vppsys1
           - const: syscon
       - items:
           - const: mediatek,mt7623-mmsys
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
new file mode 100644
index 000000000000..ba4590031f34
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-aal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 AAL Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components is responsible for backlight power saving
+  and sunlight visibility improving.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-aal0
+        - mediatek,mt8195-mdp3-aal1
+        - mediatek,mt8195-mdp3-aal2
+        - mediatek,mt8195-mdp3-aal3
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_aal0: mdp_aal0@14005000 {
+      compatible = "mediatek,mt8195-mdp3-aal0";
+      reg = <0 0x14005000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x5000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
new file mode 100644
index 000000000000..5c0d8e686909
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-color.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 COLOR Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to adjust hue, luma and saturation
+  to get better picture quality.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-color0
+        - mediatek,mt8195-mdp3-color1
+        - mediatek,mt8195-mdp3-color2
+        - mediatek,mt8195-mdp3-color3
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_color0: mdp_color0@14008000 {
+      compatible = "mediatek,mt8195-mdp3-color0";
+      reg = <0 0x14008000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x8000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
new file mode 100644
index 000000000000..d9cb1cb966e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 FG Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to add film grain according to AV1 spec.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-fg0
+        - mediatek,mt8195-mdp3-fg1
+        - mediatek,mt8195-mdp3-fg2
+        - mediatek,mt8195-mdp3-fg3
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_fg0: mdp_fg0@14002000 {
+      compatible = "mediatek,mt8195-mdp3-fg0";
+      reg = <0 0x14002000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x2000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
new file mode 100644
index 000000000000..fbb2af5f5b25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 HDR Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to perform HDR to SDR
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-hdr0
+        - mediatek,mt8195-mdp3-hdr1
+        - mediatek,mt8195-mdp3-hdr2
+        - mediatek,mt8195-mdp3-hdr3
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_hdr0: mdp_hdr0@14004000
+      compatible = "mediatek,mt8195-mdp3-hdr0";
+      reg = <0 0x14004000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x4000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
new file mode 100644
index 000000000000..4e37cb0abe46
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-merge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 MERGE Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to merge
+  two slice-per-line inputs into one side-by-side output.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-merge2
+        - mediatek,mt8195-mdp3-merge3
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    svpp2_mdp3_merge: svpp2_mdp_merge@14f1a000 {
+      compatible = "mediatek,mt8195-mdp3-merge2";
+      reg = <0 0x14f1a000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_14f1XXXX 0xa000 0x1000>;
+      clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
new file mode 100644
index 000000000000..6be6da6b159b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-ovl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 OVL Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to perform alpha blending from the memory.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-ovl0
+        - mediatek,mt8195-mdp3-ovl1
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_ovl0: mdp_ovl0@14009000 {
+      compatible = "mediatek,mt8195-mdp3-ovl0";
+      reg = <0 0x14009000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x9000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
new file mode 100644
index 000000000000..883963a4861f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 PADDING Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to insert
+  pre-defined color or alpha value to arbitrary side of image.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-pad0
+        - mediatek,mt8195-mdp3-pad1
+        - mediatek,mt8195-mdp3-pad2
+        - mediatek,mt8195-mdp3-pad3
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_pad0: mdp_pad0@1400a000 {
+      compatible = "mediatek,mt8195-mdp3-pad0";
+      reg = <0 0x1400a000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0xa000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_PADDING>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 002503383934..3b0779e8bfc2 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -26,6 +26,18 @@ properties:
           # MDP3 controller node
           - const: mediatek,mt8183-mdp3
           - const: mediatek,mt8183-mdp3-rdma0
+          # MDP3 controller node
+          - const: mediatek,mt8195-mdp3
+          - const: mediatek,mt8183-mdp3-rdma0
+          # MDP3 controller node
+          - const: mediatek,mt8195-mdp3
+          - const: mediatek,mt8195-mdp3-rdma1
+          # MDP3 controller node
+          - const: mediatek,mt8195-mdp3
+          - const: mediatek,mt8195-mdp3-rdma2
+          # MDP3 controller node
+          - const: mediatek,mt8195-mdp3
+          - const: mediatek,mt8195-mdp3-rdma3
       - items:
           # normal RDMA conponent
           - const: mediatek,mt8183-mdp3-rdma0
@@ -46,12 +58,28 @@ properties:
           - mediatek,mt8183-mdp3-dl1
       - enum:
           - mediatek,mt8183-mdp3-dl2
+      - enum:
+          - mediatek,mt8195-mdp3-dl1
+      - enum:
+          - mediatek,mt8195-mdp3-dl2
       - enum:
           # MDP direct-link output path selection, create a
           # component for path connectedness of HW pipe control
           - mediatek,mt8183-mdp3-path1
       - enum:
           - mediatek,mt8183-mdp3-path2
+      - enum:
+          - mediatek,mt8195-mdp3-path1
+      - enum:
+          - mediatek,mt8195-mdp3-path2
+      - enum:
+          - mediatek,mt8195-mdp3-path3
+      - enum:
+          - mediatek,mt8195-mdp3-path4
+      - enum:
+          - mediatek,mt8195-mdp3-path5
+      - enum:
+          - mediatek,mt8195-mdp3-path6
       - enum:
           # Input DMA of ISP PASS2 (DIP) module for raw image input
           - mediatek,mt8183-mdp3-imgi
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index cd4cf1531535..714038c9bab9 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -18,6 +18,8 @@ properties:
       - enum:
           - mediatek,mt8183-mdp3-rsz0
           - mediatek,mt8183-mdp3-rsz1
+          - mediatek,mt8195-mdp3-rsz2
+          - mediatek,mt8195-mdp3-rsz3
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
new file mode 100644
index 000000000000..f3eb9cc92fd9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-solit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 SPLIT Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to split hdmi rx into two stream
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-split
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    vpp_split0: vpp_split0@14f06000 {
+      compatible = "mediatek,mt8195-mdp3-split";
+      reg = <0 0x14f06000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_14f0XXXX 0x6000 0x1000>;
+      clocks = <&vppsys1 CLK_VPP1_VPP_SPLIT>,
+               <&vppsys1 CLK_VPP1_HDMI_META>,
+               <&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>,
+               <&vppsys1 CLK_VPP1_DGI_IN>,
+               <&vppsys1 CLK_VPP1_DGI_OUT>,
+               <&vppsys1 CLK_VPP1_VPP_SPLIT_DGI>,
+               <&vppsys1 CLK_VPP1_VPP_SPLIT_26M>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
new file mode 100644
index 000000000000..31cf3592c16f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-stitch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 STITCH Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to combine multiple video frame
+  with overlapping fields of view to produce a segmented panorame.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-stitch
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_stitch0: mdp_stich0@14003000 {
+      compatible = "mediatek,mt8195-mdp3-stitch";
+      reg = <0 0x14003000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x3000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_STITCH>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
new file mode 100644
index 000000000000..b5d6b0214fe0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 TCC Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to support
+  HDR gamma curve conversion HDR displays.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-tcc0
+        - mediatek,mt8195-mdp3-tcc1
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_tcc0: mdp_tcc0@1400b000 {
+      compatible = "mediatek,mt8195-mdp3-tcc0";
+      reg = <0 0x1400b000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0xb000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
new file mode 100644
index 000000000000..d967abd5fb7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-tdshp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 TDSHP Device Tree Bindings
+
+maintainers:
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to improve image sharpness and contrast.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8195-mdp3-tdshp0
+        - mediatek,mt8195-mdp3-tdshp1
+        - mediatek,mt8195-mdp3-tdshp2
+        - mediatek,mt8195-mdp3-tdshp3
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
+
+  reg:
+    maxItems: 1
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - mediatek,gce-client-reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/gce/mt8195-gce.h>
+
+    mdp3_tdshp0: mdp_tdshp0@14007000 {
+      compatible = "mediatek,mt8195-mdp3-tdshp0";
+      reg = <0 0x14007000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x7000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 7b0f9c4fffd7..d2e015bc09a2 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -17,6 +17,9 @@ properties:
     items:
       - enum:
           - mediatek,mt8183-mdp3-wrot0
+          - mediatek,mt8195-mdp3-wrot1
+          - mediatek,mt8195-mdp3-wrot2
+          - mediatek,mt8195-mdp3-wrot3
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index a7ba7ebb9c53..26d69e0320ab 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -31,6 +31,12 @@ properties:
           - const: mediatek,mt8183-disp-mutex
       - items:
           - const: mediatek,mt8192-disp-mutex
+      - items:
+          - const: mediatek,mt8192-disp-mutex
+      - items:
+          - const: mediatek,mt8195-vpp0-mutex
+      - items:
+          - const: mediatek,mt8195-vpp1-mutex
 
   reg:
     maxItems: 1
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
