Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498ACC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 07:11:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00757610E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 07:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00757610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3aSEXSrfKSGHBevyixBFjfiHFYyP0lZpRRTd2TEad8=; b=3Tvqf5hZi09q8t
	BU69aeD/Sb4MNi3Hzevbq/z72bo1ypSkFX2MnupCPpJu5gf4MYWMcAI0uKxHCo7NQLF6bxAipYlVL
	qvt+YtEvJxoDozZA3f/1224wx/lZaCcO9sA50Uqm9q8HT0yPh4FCpiZOp46KwgmkD2N+5JAxK+gJb
	P7qXiIUTmfmf0lCHn6gAbsdSCMHjqtwlK+cvFCUyknPwIVQZjJ7UXn4JeDbGPsbReUX6jwRs4BxZR
	6USB1hYcwr7oB5tih5rZBcvObgdg1V5WB+6wMC5ij+DBhgGmKG905kbS9DVw9vz9sMlbIt2zfxPks
	UiqTZ6aToStzo35B7wKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGcCg-007RrA-Jc; Thu, 19 Aug 2021 07:11:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGcBp-007RQw-1w; Thu, 19 Aug 2021 07:10:15 +0000
X-UUID: ed8c62f498b74bfb80d63d170125fe8b-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0s/Vg7b8+XlxrOqcm4Qi8e9ETgPHgJCHf6jw2e5yRUU=; 
 b=rqyQAahEeJsP52c73EXcJauIORGvXCnuDLA7KzY4qKx+NwCUFBAs+l1ldGx53+auSsjbZAYWLHi7uY7dD4g/t2YdWr7J5KnZ24e1DunQ0rT+Xs8TMfJIjutpsqLJfL6BMg67bTIGK08Op8Q1eZ/1KqYP27avkfv5Kxheki6C9Hk=;
X-UUID: ed8c62f498b74bfb80d63d170125fe8b-20210819
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 453757645; Thu, 19 Aug 2021 00:09:59 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 00:09:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 15:09:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 15:09:56 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: <moudy.ho@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 "Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Jernej Skrabec
 <jernej.skrabec@siol.net>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, Rob Landley
 <rob@landley.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <acourbot@chromium.org>, <pihsun@chromium.org>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>, <ben.lok@mediatek.com>,
 <randy.wu@mediatek.com>, <srv_heupstream@mediatek.com>, <hsinyi@google.com>
Subject: [PATCH v6 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Date: Thu, 19 Aug 2021 15:09:52 +0800
Message-ID: <20210819070954.16679-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210819070954.16679-1-moudy.ho@mediatek.com>
References: <20210819070954.16679-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_001013_173529_C3044C81 
X-CRM114-Status: GOOD (  18.37  )
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

This patch adds DT binding document for Media Data Path 3 (MDP3)
a unit in multimedia system used for scaling and color format convert.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../bindings/media/mediatek,mdp3-ccorr.yaml   |  58 +++++
 .../bindings/media/mediatek,mdp3-rdma.yaml    | 241 ++++++++++++++++++
 .../bindings/media/mediatek,mdp3-rsz.yaml     |  66 +++++
 .../bindings/media/mediatek,mdp3-wdma.yaml    |  71 ++++++
 .../bindings/media/mediatek,mdp3-wrot.yaml    |  71 ++++++
 5 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
new file mode 100644
index 000000000000..205b91b55806
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-ccorr.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-ccorr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 CCORR Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to do color correction with 3X3 matrix.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8183-mdp3-ccorr
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
+
+  reg:
+    description: |
+      Physical base address and length of the function block
+      register space, the number aligns with the component
+      and its own subcomponent.
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+
+    mdp3_ccorr: mdp3_ccorr@1401c000 {
+      compatible = "mediatek,mt8183-mdp3-ccorr";
+      mediatek,mdp3-id = <0>;
+      reg = <0x1401c000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+      clocks = <&mmsys CLK_MM_MDP_CCORR>;
+    };
+
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
new file mode 100644
index 000000000000..9565317990a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -0,0 +1,241 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to do read DMA.
+  RDMA0 is also used to be a controller node containing MMSYS,
+  MUTEX, GCE and SCP settings.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          # controller node
+          - mediatek,mt8183-mdp3
+        - enum:
+          - mediatek,mt8183-mdp3-rdma
+
+      - items:
+        - enum:
+          # read DMA
+          - mediatek,mt8183-mdp3-rdma
+
+  mediatek,scp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      The node of system control processor (SCP), using
+      the remoteproc & rpmsg framework.
+      $ref: /schemas/remoteproc/mtk,scp.yaml
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      In MDP3, it can allocate multiple identical modules for
+      different data path selection or multi-pipeline execution.
+      This node is used to indicate the ID of each module.
+
+  mdp3-comps:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+        - enum:
+          # MDP direct-link input path selection, create a
+          # component for path connectedness of HW pipe control
+          - mediatek,mt8183-mdp3-dl1
+        - enum:
+          - mediatek,mt8183-mdp3-dl2
+        - enum:
+          # MDP direct-link output path selection, create a
+          # component for path connectedness of HW pipe control
+          - mediatek,mt8183-mdp3-path1
+        - enum:
+          - mediatek,mt8183-mdp3-path2
+        - enum:
+          # Input DMA of ISP PASS2 (DIP) module for raw image input
+          - mediatek,mt8183-mdp3-imgi
+        - enum:
+          # Output DMA of ISP PASS2 (DIP) module for YUV image output
+          - mediatek,mt8183-mdp3-exto
+
+  mdp3-comp-ids:
+    maxItems: 1
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      Pipeline ID of MDP direct-link or DIP.
+
+  reg:
+    description: |
+      Physical base address and length of the function block
+      register space, the number aligns with the component
+      and its own subcomponent.
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+
+  iommus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Should point to the respective IOMMU block with master
+      port as argument.
+      $ref: /schemas/iommu/mediatek,iommu.yaml
+
+  mediatek,mmsys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      The node of mux(multiplexer) controller for HW connections.
+
+  mediatek,mm-mutex:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
+    description: |
+      The node of sof(start of frame) signal controller.
+
+  mediatek,mailbox-gce:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      The node of global command engine (GCE), used to read/write
+      registers with critical time limitation.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  mboxes:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      $ref: /schemas/mailbox/mailbox.txt
+
+  gce-subsys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  mediatek,gce-events:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      In use event IDs list, all IDs are defined in
+      'dt-bindings/gce/mt8183-gce.h'.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+if:
+  properties:
+    compatible:
+      items:
+        - enum:
+          - mediatek,mt8183-mdp3
+        - enum:
+          - mediatek,mt8183-mdp3-rdma
+
+then:
+  required:
+    - mediatek,scp
+    - mediatek,mmsys
+    - mediatek,mm-mutex
+    - mediatek,gce-events
+    - mediatek,mailbox-gce
+    - mboxes
+    - gce-subsys
+
+required:
+  - compatible
+  - mediatek,mdp3-id
+  - reg
+  - clocks
+  - mediatek,gce-client-reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
+
+    mdp3_rdma0: mdp3_rdma0@14001000 {
+      compatible = "mediatek,mt8183-mdp3",
+                   "mediatek,mt8183-mdp3-rdma";
+      mediatek,scp = <&scp>;
+      mediatek,mdp3-id = <0>;
+      mdp3-comps = "mediatek,mt8183-mdp3-dl1", "mediatek,mt8183-mdp3-dl2",
+		   "mediatek,mt8183-mdp3-path1", "mediatek,mt8183-mdp3-path2",
+                   "mediatek,mt8183-mdp3-imgi", "mediatek,mt8183-mdp3-exto";
+      mdp3-comp-ids = <0 1 0 1 0 1>;
+      reg = <0x14001000 0x1000>,
+            <0x14000000 0x1000>,
+            <0x14005000 0x1000>,
+            <0x14006000 0x1000>,
+            <0x15020000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>,
+                                <&gce SUBSYS_1400XXXX 0 0x1000>,
+                                <&gce SUBSYS_1400XXXX 0x5000 0x1000>,
+                                <&gce SUBSYS_1400XXXX 0x6000 0x1000>,
+                                <&gce SUBSYS_1502XXXX 0 0x1000>;
+      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+      clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+               <&mmsys CLK_MM_MDP_RSZ1>,
+               <&mmsys CLK_MM_MDP_DL_TXCK>,
+               <&mmsys CLK_MM_MDP_DL_RX>,
+               <&mmsys CLK_MM_IPU_DL_TXCK>,
+               <&mmsys CLK_MM_IPU_DL_RX>;
+      iommus = <&iommu>;
+      mediatek,mmsys = <&mmsys>;
+      mediatek,mm-mutex = <&mutex>;
+      mediatek,mailbox-gce = <&gce>;
+      mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
+               <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
+               <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
+               <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
+      gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
+                   <&gce 0x14010000 SUBSYS_1401XXXX>,
+                   <&gce 0x14020000 SUBSYS_1402XXXX>,
+                   <&gce 0x15020000 SUBSYS_1502XXXX>;
+      mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
+                            <CMDQ_EVENT_MDP_RDMA0_EOF>,
+                            <CMDQ_EVENT_MDP_RSZ0_SOF>,
+                            <CMDQ_EVENT_MDP_RSZ1_SOF>,
+                            <CMDQ_EVENT_MDP_TDSHP_SOF>,
+                            <CMDQ_EVENT_MDP_WROT0_SOF>,
+                            <CMDQ_EVENT_MDP_WROT0_EOF>,
+                            <CMDQ_EVENT_MDP_WDMA0_SOF>,
+                            <CMDQ_EVENT_MDP_WDMA0_EOF>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
+                            <CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
+                            <CMDQ_EVENT_WPE_A_DONE>,
+                            <CMDQ_EVENT_SPE_B_DONE>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
new file mode 100644
index 000000000000..218f035ad406
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-rsz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Resizer Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to do frame resizing.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8183-mdp3-rsz
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
+
+  reg:
+    description: |
+      Physical base address and length of the function block
+      register space, the number aligns with the component
+      and its own subcomponent.
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+
+    mdp3_rsz0: mdp3_rsz0@14003000 {
+      compatible = "mediatek,mt8183-mdp3-rsz";
+      mediatek,mdp3-id = <0>;
+      reg = <0x14003000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
+      clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+    };
+
+    mdp3_rsz1: mdp3_rsz1@14004000 {
+      compatible = "mediatek,mt8183-mdp3-rsz";
+      mediatek,mdp3-id = <1>;
+      reg = <0x14004000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
+      clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+    };
+
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
new file mode 100644
index 000000000000..93e6f331ada8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wdma.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-wdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to write DMA.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8183-mdp3-wdma
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
+
+  reg:
+    description: |
+      Physical base address and length of the function block
+      register space, the number aligns with the component
+      and its own subcomponent.
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  iommus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Should point to the respective IOMMU block with master
+      port as argument.
+      $ref: /schemas/iommu/mediatek,iommu.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
+
+    mdp3_wdma: mdp3_wdma@14006000 {
+      compatible = "mediatek,mt8183-mdp3-wdma";
+      mediatek,mdp3-id = <0>;
+      reg = <0x14006000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+      clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+      iommus = <&iommu>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
new file mode 100644
index 000000000000..2993da04c562
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mdp3-wrot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Media Data Path 3 Device Tree Bindings
+
+maintainers:
+  - Daoyuan Huang <daoyuan.huang@mediatek.com>
+  - Moudy Ho <moudy.ho@mediatek.com>
+
+description: |
+  One of Media Data Path 3 (MDP3) components used to write DMA with frame rotation.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - mediatek,mt8183-mdp3-wrot
+
+  mediatek,mdp3-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+    description: |
+      HW index to distinguish same functionality modules.
+
+  reg:
+    description: |
+      Physical base address and length of the function block
+      register space, the number aligns with the component
+      and its own subcomponent.
+
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      sub-system id corresponding to the global command engine (GCE)
+      register address.
+      $ref: /schemas/mailbox/mtk-gce.txt
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  iommus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Should point to the respective IOMMU block with master
+      port as argument.
+      $ref: /schemas/iommu/mediatek,iommu.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/gce/mt8183-gce.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/memory/mt8183-larb-port.h>
+
+    mdp3_wrot0: mdp3_wrot0@14005000 {
+      compatible = "mediatek,mt8183-mdp3-wrot";
+      mediatek,mdp3-id = <0>;
+      reg = <0x14005000 0x1000>;
+      mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+      power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+      clocks = <&mmsys CLK_MM_MDP_WROT0>;
+      iommus = <&iommu>;
+    };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
