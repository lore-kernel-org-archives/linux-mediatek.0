Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF16C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:41:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF43221FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 02:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lvFGh6tQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CVCSbjZm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEF43221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ab7FmTgC/950K07g9lg6DWRs7BHKc1MRET5CiLttXgw=; b=lvFGh6tQSWXb95QV85J7wmNCi
	Ba4m6q0nS1n12xuDLiGsy51rTHOl6ocesr/S+RUifiAFwM4Yak2Y8MvEqYhJs43Ycd5DOHkHhmE64
	lkwSO3iMSYay1MIMIqTrBuPdolYAYtZ8Nzb+9haAFJ9DRXy8gu3mK7y6z0iSepnmitgFfC2Rd3ff6
	G24se7weIXS7ax6bJQ1xmK1CiV/yY8cu1siSuxzgK7uXfmo7DPsSSN6+R2WR009my2/C/Um95unac
	ovoTTa7IYFZoSCjhtLD5KDSFUlpW4vavdRHiANrwmfx3yju+LqFp5vAVbSDitRR1NY0kJCJkZBJmV
	DlCaNd8iA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfwMf-0006m1-T2; Fri, 20 Nov 2020 02:41:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfwMO-0006ft-LN; Fri, 20 Nov 2020 02:41:18 +0000
X-UUID: ed91aa6716d64370b855053a03947d78-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nl9QknpZlE+fI7edd1Swbo3T7oO9k8A9CyvB45ul20I=; 
 b=CVCSbjZmgJL4DwHmrRVVAnwXklFCbXh3xPIS0EWVgQU4L4a1hglSxhUTJWylKiMit+ZfJUUI+LUf8NIRL6QuaYPNQ84gM8p24EjFx2CCxYwX4/ttp527h1tbq+yNzMMrU2wg4qvSUaegQdchsgJzI9H6v7PyO7jnC15/VHMjXmI=;
X-UUID: ed91aa6716d64370b855053a03947d78-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <daoyuan.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1737553504; Thu, 19 Nov 2020 18:32:46 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 18:29:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 10:29:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Nov 2020 10:29:08 +0800
From: Daoyuan Huang <daoyuan.huang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v4 1/4] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
Date: Fri, 20 Nov 2020 10:29:03 +0800
Message-ID: <1605839346-10648-2-git-send-email-daoyuan.huang@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
References: <1605839346-10648-1-git-send-email-daoyuan.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_214116_925572_CEC5708C 
X-CRM114-Status: GOOD (  18.27  )
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
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, menghui.lin@mediatek.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, drinkcat@chromium.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, daoyuan huang <daoyuan.huang@mediatek.com>,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 linux-arm-kernel@lists.infradead.org, randy.wu@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, ben.lok@mediatek.com,
 moudy.ho@mediatek.com, Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: daoyuan huang <daoyuan.huang@mediatek.com>

This patch adds DT binding document for Media Data Path 3 (MDP3)
a unit in multimedia system used for scaling and color format convert.

Signed-off-by: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
Signed-off-by: daoyuan huang <daoyuan.huang@mediatek.com>
---
 .../bindings/media/mediatek,mt8183-mdp3.txt   | 208 ++++++++++++++++++
 1 file changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
new file mode 100644
index 000000000000..d4db908b8b53
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-mdp3.txt
@@ -0,0 +1,208 @@
+* Mediatek Media Data Path 3
+
+Media Data Path 3 (MDP3) is used for scaling and color space conversion.
+
+Required properties (controller node):
+- compatible: "mediatek,mt8183-mdp3"
+- mediatek,scp: the node of system control processor (SCP), using the
+  remoteproc & rpmsg framework, see
+  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
+- mediatek,mmsys: the node of mux(multiplexer) controller for HW connections.
+- mediatek,mm-mutex: the node of sof(start of frame) signal controller.
+- mediatek,mailbox-gce: the node of global command engine (GCE), used to
+  read/write registers with critical time limitation, see
+  Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
+- mboxes: mailbox number used to communicate with GCE.
+- gce-subsys: sub-system id corresponding to the register address.
+- gce-event-names: in use event name list, used to correspond to event IDs.
+- gce-events: in use event IDs list, all IDs are defined in
+  'dt-bindings/gce/mt8183-gce.h'.
+
+Required properties (all function blocks, child node):
+- compatible: Should be one of
+        "mediatek,mt8183-mdp-rdma"  - read DMA
+        "mediatek,mt8183-mdp-rsz"   - resizer
+        "mediatek,mt8183-mdp-wdma"  - write DMA
+        "mediatek,mt8183-mdp-wrot"  - write DMA with rotation
+        "mediatek,mt8183-mdp-ccorr" - color correction with 3X3 matrix
+- reg: Physical base address and length of the function block register space.
+- clocks: device clocks, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- power-domains: A phandle to the power domain, see
+  Documentation/devicetree/bindings/power/power_domain.txt for details.
+- mediatek,mdp-id: HW index to distinguish same functionality modules.
+
+Required properties (DMA function blocks, child node):
+- compatible: Should be one of
+        "mediatek,mt8183-mdp-rdma"
+        "mediatek,mt8183-mdp-wdma"
+        "mediatek,mt8183-mdp-wrot"
+- mdp-comps(wdma & wrot only):
+        "mediatek,mt8183-mdp-path"  - MDP output path selection, create a
+                                      component for path connectedness of HW
+                                      pipe control; Align with mdp_comp_of_ids[]
+                                      in mtk-mdp3-comp.c.
+- mdp-comp-ids(wdma & wrot only): Index of the output paths, the number aligns
+  with mdp_comp_matches[] in mtk-mdp3-comp.c.
+- iommus: should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt for
+  details.
+- mediatek,larb: Must contain the local arbiters in the current Socs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt for
+  details.
+
+Required properties (input path selection node):
+- compatible:
+        "mediatek,mt8183-mmsys"     - For MDP input/output source selection.
+- mdp-comps:
+        "mediatek,mt8183-mdp-dl"    - MDP direct link input path selection,
+                                      create a component for path connectedness
+                                      of HW pipe control; Align with
+                                      mdp_comp_of_ids[] in mtk-mdp3-comp.c.
+- mdp-comp-ids: Index of the input paths, the number aligns with
+  mdp_comp_matches[] in mtk-mdp3-comp.c.
+- reg: Physical base address and length of the function block register space.
+- clocks: device clocks, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+
+Required properties (ISP PASS2 (DIP) module path selection node):
+- compatible:
+        "mediatek,mt8183-imgsys"    - For ISP PASS2 (DIP) modules frame sync
+                                      control with MDP.
+- mdp-comps:
+        "mediatek,mt8183-mdp-imgi"  - Input DMA of ISP PASS2 (DIP) module for
+                                      raw image input.
+        "mediatek,mt8183-mdp-exto"  - Output DMA of ISP PASS2 (DIP) module for
+                                      yuv image output.
+- mdp-comp-ids: Index of the modules, the number aligns with mdp_comp_matches[]
+  in mtk-mdp3-comp.c.
+- reg: Physical base address and length of the function block register space.
+- mediatek,mdp-id: HW index to distinguish same functionality modules.
+
+Example:
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8183-mmsys", "syscon";
+			mdp-comps = "mediatek,mt8183-mdp-dl",
+				    "mediatek,mt8183-mdp-dl";
+			mdp-comp-ids = <0 1>;
+			reg = <0 0x14000000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&mmsys CLK_MM_MDP_DL_TXCK>,
+				 <&mmsys CLK_MM_MDP_DL_RX>,
+				 <&mmsys CLK_MM_IPU_DL_TXCK>,
+				 <&mmsys CLK_MM_IPU_DL_RX>;
+		};
+
+		mdp_rdma0: mdp-rdma0@14001000 {
+			compatible = "mediatek,mt8183-mdp-rdma",
+				     "mediatek,mt8183-mdp3";
+			mediatek,scp = <&scp>;
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14001000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+				 <&mmsys CLK_MM_MDP_RSZ1>;
+			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+			mediatek,larb = <&larb0>;
+			mediatek,mmsys = <&mmsys>;
+			mediatek,mm-mutex = <&mutex>;
+			mediatek,imgsys = <&imgsys>;
+			mediatek,mailbox-gce = <&gce>;
+			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 22 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 23 CMDQ_THR_PRIO_LOWEST 0>;
+			gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
+				     <&gce 0x14010000 SUBSYS_1401XXXX>,
+				     <&gce 0x14020000 SUBSYS_1402XXXX>,
+				     <&gce 0x15020000 SUBSYS_1502XXXX>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
+					      <CMDQ_EVENT_MDP_RDMA0_EOF>,
+					      <CMDQ_EVENT_MDP_RSZ0_SOF>,
+					      <CMDQ_EVENT_MDP_RSZ1_SOF>,
+					      <CMDQ_EVENT_MDP_TDSHP_SOF>,
+					      <CMDQ_EVENT_MDP_WROT0_SOF>,
+					      <CMDQ_EVENT_MDP_WROT0_EOF>,
+					      <CMDQ_EVENT_MDP_WDMA0_SOF>,
+					      <CMDQ_EVENT_MDP_WDMA0_EOF>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_0>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_1>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_2>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_3>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_4>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_5>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_6>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_7>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_8>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_9>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_10>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_11>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_12>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_13>,
+					      <CMDQ_EVENT_ISP_FRAME_DONE_P2_14>,
+					      <CMDQ_EVENT_WPE_A_DONE>,
+					      <CMDQ_EVENT_SPE_B_DONE>;
+		};
+
+		mdp_rsz0: mdp-rsz0@14003000 {
+			compatible = "mediatek,mt8183-mdp-rsz";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+		};
+
+		mdp_rsz1: mdp-rsz1@14004000 {
+			compatible = "mediatek,mt8183-mdp-rsz";
+			mediatek,mdp-id = <1>;
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+		};
+
+		mdp_wrot0: mdp-wrot0@14005000 {
+			compatible = "mediatek,mt8183-mdp-wrot";
+			mediatek,mdp-id = <0>;
+			mdp-comps = "mediatek,mt8183-mdp-path";
+			mdp-comp-ids = <0>;
+			reg = <0 0x14005000 0 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_WROT0>;
+			iommus = <&iommu M4U_PORT_MDP_WROT0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		mdp_wdma: mdp-wdma@14006000 {
+			compatible = "mediatek,mt8183-mdp-wdma";
+			mediatek,mdp-id = <0>;
+			mdp-comps = "mediatek,mt8183-mdp-path";
+			mdp-comp-ids = <1>;
+			reg = <0 0x14006000 0 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		mdp_ccorr: mdp-ccorr@1401c000 {
+			compatible = "mediatek,mt8183-mdp-ccorr";
+			mediatek,mdp-id = <0>;
+			reg = <0 0x1401c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+			clocks = <&mmsys CLK_MM_MDP_CCORR>;
+		};
+
+		imgsys: syscon@15020000 {
+			compatible = "mediatek,mt8183-imgsys", "syscon";
+			mediatek,mdp-id = <0>;
+			mdp-comps = "mediatek,mt8183-mdp-imgi",
+				    "mediatek,mt8183-mdp-exto";
+			mdp-comp-ids = <0 1>;
+			reg = <0 0x15020000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1502XXXX 0 0x1000>;
+			#clock-cells = <1>;
+		};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
