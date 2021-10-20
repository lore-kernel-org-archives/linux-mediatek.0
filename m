Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B370AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:19:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A9A60524
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79A9A60524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/6xMCqHogKO28H3VKS8rTfeU4CiInXadxb08b1OT+s=; b=e/RkKULwaF+RGd
	I2W0TvrR9gz4XmblERvaR7DcYVv7W+kqUgmzlJoaW0PQUXFtn+h4mOYag+5jpj5Z5eYtJsp/tIA+N
	mKjxHgksJA7S6guPTne2dEsGvnlZ1nCg5fUJmkIEiABb4NCPrPJEFYRDGvRPXxWzxPcqjSpKQ54an
	mrYFya4yO8cxCw76/LjlP10DKNjvT+Tomji2a3mYDk1HeXdDKCCZ6a4SotK/3Wzbxp4HjO2YuUWXA
	xj2Tnlt+fmT4NpzFIF7M2/1SKObuWBTTI7KKArTB/IsT+3WjMfsQPFd7Ma4OWwdHILeDB9NO4JkvD
	7BWp4iGnj91qbCxc1qGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md5so-003aAu-7N; Wed, 20 Oct 2021 07:19:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md5p3-003Y5Z-QQ; Wed, 20 Oct 2021 07:15:56 +0000
X-UUID: 509e3675b4e5481ab98f72b2a165247c-20211020
X-UUID: 509e3675b4e5481ab98f72b2a165247c-20211020
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2048491832; Wed, 20 Oct 2021 00:15:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 00:15:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 15:15:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 15:15:26 +0800
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
Subject: [PATCH v2 4/9] dt-bindings: media: mediatek: mdp3: add additional
 function block yaml
Date: Wed, 20 Oct 2021 15:14:43 +0800
Message-ID: <20211020071448.14187-5-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
References: <20211020071448.14187-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_001538_077990_97834F9F 
X-CRM114-Status: GOOD (  16.25  )
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

Add additional function block yaml in mt8195

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  2 +
 .../bindings/arm/mediatek/mediatek,mutex.yaml |  4 ++
 .../bindings/media/mediatek,mdp3-aal.yaml     | 62 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-color.yaml   | 62 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-fg.yaml      | 61 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-hdr.yaml     | 61 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-merge.yaml   | 62 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-ovl.yaml     | 61 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-pad.yaml     | 62 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 22 +++++-
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  2 +
 .../bindings/media/mediatek,mdp3-split.yaml   | 67 +++++++++++++++++++
 .../bindings/media/mediatek,mdp3-stitch.yaml  | 62 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-tcc.yaml     | 62 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   | 61 +++++++++++++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    |  2 +
 16 files changed, 713 insertions(+), 2 deletions(-)
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
index 679437ee2590..7b46b8156a12 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -33,6 +33,8 @@ properties:
               - mediatek,mt8365-mmsys
               - mediatek,mt8195-vdosys0
               - mediatek,mt8195-vdosys1
+              - mediatek,mt8195-vppsys0
+              - mediatek,mt8195-vppsys1
           - const: syscon
       - items:
           - const: mediatek,mt7623-mmsys
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
index 1a1c049aa929..41dc1383131a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
@@ -37,6 +37,10 @@ properties:
           - const: mediatek,mt8192-disp-mutex
       - items:
           - const: mediatek,mt8195-disp-mutex
+      - items:
+          - const: mediatek,mt8195-vpp0-mutex
+      - items:
+          - const: mediatek,mt8195-vpp1-mutex
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
new file mode 100644
index 000000000000..54535aac8942
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-aal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 AAL Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components is responsible for backlight power saving
+  and sunlight visibility improving.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - mediatek,mt8195-mdp3-aal
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-aal";
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x14005000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x5000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
new file mode 100644
index 000000000000..4eba4505ed26
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-color.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 COLOR Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to adjust hue, luma and saturation
+  to get better picture quality.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - mediatek,mt8195-mdp3-color
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-color";
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x14008000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x8000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
new file mode 100644
index 000000000000..8a4ea694c44b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-fg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 FG Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to add film grain according to AV1 spec.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8195-mdp3-fg
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-fg";
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x14002000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x2000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
+    };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
new file mode 100644
index 000000000000..4330f2b79697
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-hdr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 HDR Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to perform HDR to SDR
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8195-mdp3-hdr
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-hdr";
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x14004000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x4000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
new file mode 100644
index 000000000000..1e48a4636588
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-merge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 MERGE Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to merge
+  two slice-per-line inputs into one side-by-side output.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - mediatek,mt8195-mdp3-merge
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-merge";
+      mediatek,mdp3-id = <2>;
+      reg = <0 0x14f1a000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_14f1XXXX 0xa000 0x1000>;
+      clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
new file mode 100644
index 000000000000..4e503d79758b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-ovl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 OVL Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to perform alpha blending from the memory.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - mediatek,mt8195-mdp3-ovl
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-ovl";
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x14009000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x9000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
new file mode 100644
index 000000000000..1f990c5ce6ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 PADDING Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to insert
+  pre-defined color or alpha value to arbitrary side of image.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - mediatek,mt8195-mdp3-pad
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-pad";
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x1400a000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0xa000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_PADDING>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index b355d7fe791e..ce023d9fbef7 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -20,14 +20,16 @@ properties:
     oneOf:
       - items:
         - enum:
-          # controller node
           - mediatek,mt8183-mdp3
+          - mediatek,mt8195-mdp3
         - enum:
           - mediatek,mt8183-mdp3-rdma
 
       - items:
-        - enum:
           # read DMA
+        - enum:
+          - mediatek,mt8195-mdp3-rdma
+        - enum:
           - mediatek,mt8183-mdp3-rdma
 
   mediatek,scp:
@@ -55,12 +57,28 @@ properties:
           - mediatek,mt8183-mdp3-dl1
         - enum:
           - mediatek,mt8183-mdp3-dl2
+        - enum:
+          - mediatek,mt8195-mdp3-dl1
+        - enum:
+          - mediatek,mt8195-mdp3-dl2
+        - enum:
+          - mediatek,mt8195-mdp3-dl3
+        - enum:
+          - mediatek,mt8195-mdp3-dl4
+        - enum:
+          - mediatek,mt8195-mdp3-dl5
+        - enum:
+          - mediatek,mt8195-mdp3-dl6
         - enum:
           # MDP direct-link output path selection, create a
           # component for path connectedness of HW pipe control
           - mediatek,mt8183-mdp3-path1
         - enum:
           - mediatek,mt8183-mdp3-path2
+        - enum:
+          - mediatek,mt8195-mdp3-path1
+        - enum:
+          - mediatek,mt8195-mdp3-path2
         - enum:
           # Input DMA of ISP PASS2 (DIP) module for raw image input
           - mediatek,mt8183-mdp3-imgi
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index c55a52cd32b7..eaa487ec58cc 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -16,6 +16,8 @@ description: |
 properties:
   compatible:
     items:
+      - enum:
+        - mediatek,mt8195-mdp3-rsz
       - enum:
         - mediatek,mt8183-mdp3-rsz
 
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
new file mode 100644
index 000000000000..40827d577f74
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-solit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 SPLIT Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to split hdmi rx into two stream
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - mediatek,mt8195-mdp3-split
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
+  - mediatek,mdp3-id
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
+      mediatek,mdp3-id = <0>;
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
index 000000000000..038a9519b2de
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-stitch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 STITCH Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to combine multiple video frame
+  with overlapping fields of view to produce a segmented panorame.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8195-mdp3-stitch
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
+  - mediatek,mdp3-id
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
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x14003000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x3000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_STITCH>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
new file mode 100644
index 000000000000..63c147cb8d24
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-tcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 TCC Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to support
+  HDR gamma curve conversion HDR displays.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - mediatek,mt8195-mdp3-tcc
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-tcc";
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x1400b000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0xb000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
new file mode 100644
index 000000000000..25b4668d93fc
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
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to improve image sharpness and contrast.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8195-mdp3-tdshp
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
+  - mediatek,mdp3-id
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
+      compatible = "mediatek,mt8195-mdp3-tdshp";
+      mediatek,mdp3-id = <0>;
+      reg = <0 0x14007000 0 0x1000>;
+      mediatek,gce-client-reg = <&gce0 SUBSYS_1400XXXX 0x7000 0x1000>;
+      clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 2993da04c562..885e0f0f9e1f 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -16,6 +16,8 @@ description: |
 properties:
   compatible:
     items:
+      - enum:
+        - mediatek,mt8195-mdp3-wrot
       - enum:
         - mediatek,mt8183-mdp3-wrot
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
