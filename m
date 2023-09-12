Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF067CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 07:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29S3V9RkHZyuj8n/81A5H79/BWC7JNqrN/iEWAWg2ZI=; b=nZo8CVyXOFfgdsgAg3XtXhkohg
	uLk+RU+es9NMaIJrcTFkOgTgGGCdw6xR4WpdHGhoBiMM9hviRioc23BC2tchKOS1jsk3aw2f0VKVv
	X8oW3sdGTrt5CFsSz1dE8Y1+R8JYH2ERpTgUOw4jzZOzF5MpanvTTYWPv7Piq5hnJFoENe2WSAIdY
	w6SoeRVux6HRap1RANNZ35jI/BwizjAksboYuo5yVdnO7g109MYTLfn2tge3CzdKIpuOVvU6eY6sF
	beidqKXSR+gV9LLjfZSRspOSpaUcIEdeiWTbxGvvpr3kdqXLFsp2oKTipMEUsVEib/L5ISaAb0Zo/
	indZ10uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyIU-002Txw-0e;
	Tue, 12 Sep 2023 07:58:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyIG-002Tj4-25;
	Tue, 12 Sep 2023 07:58:50 +0000
X-UUID: 2f23a8cc514211ee86758d4a7c00f3a0-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=29S3V9RkHZyuj8n/81A5H79/BWC7JNqrN/iEWAWg2ZI=;
	b=MCIBEK8+SonsYdS5DA4gWkaLbqNWpMQ0rk81li+2eVOr/8aK6UWZ51MTC7p16Tj6gI5IBMg1xDxAH/l9DiMg7N4iL4K4DxzQnCWL59tqKLRKm6DFETg90KoMJn4X7onHjF+XQipxPpVyw5rJTzjOKwPiYx6wYet+leeDAzVM7kQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:46782bc7-ed6b-40e8-b4c8-cf4a9d86a8a4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:aefcbcbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2f23a8cc514211ee86758d4a7c00f3a0-20230912
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2127782144; Tue, 12 Sep 2023 00:58:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:58:06 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Moudy
 Ho <moudy.ho@mediatek.com>
Subject: [PATCH v5 02/14] arm64: dts: mediatek: mt8195: add MDP3 nodes
Date: Tue, 12 Sep 2023 15:57:53 +0800
Message-ID: <20230912075805.11432-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_005844_786205_31787081 
X-CRM114-Status: GOOD (  10.81  )
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

Add device nodes for Media Data Path 3 (MDP3) modules.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 378 +++++++++++++++++++++++
 1 file changed, 378 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 4dbbf8fdab75..5e4a211e06fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1960,6 +1960,111 @@
 			#clock-cells = <1>;
 		};
 
+		dma-controller@14001000 {
+			compatible = "mediatek,mt8195-mdp3-rdma";
+			reg = <0 0x14001000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
+					      <CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+			iommus = <&iommu_vpp M4U_PORT_L4_MDP_RDMA>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>;
+			mboxes = <&gce1 12 CMDQ_THR_PRIO_1>,
+				 <&gce1 13 CMDQ_THR_PRIO_1>,
+				 <&gce1 14 CMDQ_THR_PRIO_1>,
+				 <&gce1 21 CMDQ_THR_PRIO_1>,
+				 <&gce1 22 CMDQ_THR_PRIO_1>;
+			#dma-cells = <1>;
+		};
+
+		display@14002000 {
+			compatible = "mediatek,mt8195-mdp3-fg";
+			reg = <0 0x14002000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
+		};
+
+		display@14003000 {
+			compatible = "mediatek,mt8195-mdp3-stitch";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x3000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_STITCH>;
+		};
+
+		display@14004000 {
+			compatible = "mediatek,mt8195-mdp3-hdr";
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
+		};
+
+		display@14005000 {
+			compatible = "mediatek,mt8195-mdp3-aal";
+			reg = <0 0x14005000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		display@14006000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14006000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RSZ_IN_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP0_MDP_RSZ_FRAME_DONE>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_RSZ>;
+		};
+
+		display@14007000 {
+			compatible = "mediatek,mt8195-mdp3-tdshp";
+			reg = <0 0x14007000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
+		};
+
+		display@14008000 {
+			compatible = "mediatek,mt8195-mdp3-color";
+			reg = <0 0x14008000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x8000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		display@14009000 {
+			compatible = "mediatek,mt8195-mdp3-ovl";
+			reg = <0 0x14009000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x9000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+			iommus = <&iommu_vpp M4U_PORT_L4_MDP_OVL>;
+		};
+
+		display@1400a000 {
+			compatible = "mediatek,mt8195-mdp3-pad";
+			reg = <0 0x1400a000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xa000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_PADDING>;
+		};
+
+		display@1400b000 {
+			compatible = "mediatek,mt8195-mdp3-tcc";
+			reg = <0 0x1400b000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
+		};
+
+		dma-controller@1400c000 {
+			compatible = "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x1400c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xc000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_WROT_SOF>,
+					      <CMDQ_EVENT_VPP0_MDP_WROT_VIDO_WDONE>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_WROT>;
+			iommus = <&iommu_vpp M4U_PORT_L4_MDP_WROT>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+			#dma-cells = <1>;
+		};
+
 		mutex@1400f000 {
 			compatible = "mediatek,mt8195-vpp-mutex";
 			reg = <0 0x1400f000 0 0x1000>;
@@ -2107,6 +2212,279 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
 		};
 
+		display@14f06000 {
+			compatible = "mediatek,mt8195-mdp3-split";
+			reg = <0 0x14f06000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x6000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_VPP_SPLIT>,
+				 <&vppsys1 CLK_VPP1_HDMI_META>,
+				 <&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f07000 {
+			compatible = "mediatek,mt8195-mdp3-tcc";
+			reg = <0 0x14f07000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x7000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_TCC>;
+		};
+
+		dma-controller@14f08000 {
+			compatible = "mediatek,mt8195-mdp3-rdma";
+			reg = <0 0x14f08000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x8000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP1_MDP_RDMA_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP1_MDP_RDMA_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_RDMA>;
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_RDMA>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+			#dma-cells = <1>;
+		};
+
+		dma-controller@14f09000 {
+			compatible = "mediatek,mt8195-mdp3-rdma";
+			reg = <0 0x14f09000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x9000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RDMA>;
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_RDMA>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+			#dma-cells = <1>;
+		};
+
+		dma-controller@14f0a000 {
+			compatible = "mediatek,mt8195-mdp3-rdma";
+			reg = <0 0x14f0a000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xa000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RDMA>;
+			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_RDMA>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+			#dma-cells = <1>;
+		};
+
+		display@14f0b000 {
+			compatible = "mediatek,mt8195-mdp3-fg";
+			reg = <0 0x14f0b000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xb000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_FG>;
+		};
+
+		display@14f0c000 {
+			compatible = "mediatek,mt8195-mdp3-fg";
+			reg = <0 0x14f0c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xc000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_FG>;
+		};
+
+		display@14f0d000 {
+			compatible = "mediatek,mt8195-mdp3-fg";
+			reg = <0 0x14f0d000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xd000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_FG>;
+		};
+
+		display@14f0e000 {
+			compatible = "mediatek,mt8195-mdp3-hdr";
+			reg = <0 0x14f0e000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xe000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_HDR>;
+		};
+
+		display@14f0f000 {
+			compatible = "mediatek,mt8195-mdp3-hdr";
+			reg = <0 0x14f0f000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xf000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_HDR>;
+		};
+
+		display@14f10000 {
+			compatible = "mediatek,mt8195-mdp3-hdr";
+			reg = <0 0x14f10000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_HDR>;
+		};
+
+		display@14f11000 {
+			compatible = "mediatek,mt8195-mdp3-aal";
+			reg = <0 0x14f11000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x1000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_AAL>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f12000 {
+			compatible = "mediatek,mt8195-mdp3-aal";
+			reg = <0 0x14f12000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x2000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_AAL>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f13000 {
+			compatible = "mediatek,mt8195-mdp3-aal";
+			reg = <0 0x14f13000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x3000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_AAL>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f14000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14f14000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x4000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP1_MDP_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP1_MDP_RSZ_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_RSZ>;
+		};
+
+		display@14f15000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14f15000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x5000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP2_MDP_RSZ_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RSZ>;
+		};
+
+		display@14f16000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14f16000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP3_MDP_RSZ_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RSZ>;
+		};
+
+		display@14f17000 {
+			compatible = "mediatek,mt8195-mdp3-tdshp";
+			reg = <0 0x14f17000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x7000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_TDSHP>;
+		};
+
+		display@14f18000 {
+			compatible = "mediatek,mt8195-mdp3-tdshp";
+			reg = <0 0x14f18000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x8000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_TDSHP>;
+		};
+
+		display@14f19000 {
+			compatible = "mediatek,mt8195-mdp3-tdshp";
+			reg = <0 0x14f19000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x9000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_TDSHP>;
+		};
+
+		display@14f1a000 {
+			compatible = "mediatek,mt8195-mdp3-merge";
+			reg = <0 0x14f1a000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xa000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f1b000 {
+			compatible = "mediatek,mt8195-mdp3-merge";
+			reg = <0 0x14f1b000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xb000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_MERGE>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f1c000 {
+			compatible = "mediatek,mt8195-mdp3-color";
+			reg = <0 0x14f1c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xc000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_COLOR>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f1d000 {
+			compatible = "mediatek,mt8195-mdp3-color";
+			reg = <0 0x14f1d000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xd000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_COLOR>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f1e000 {
+			compatible = "mediatek,mt8195-mdp3-color";
+			reg = <0 0x14f1e000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xe000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_COLOR>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		display@14f1f000 {
+			compatible = "mediatek,mt8195-mdp3-ovl";
+			reg = <0 0x14f1f000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xf000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_OVL>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_OVL>;
+		};
+
+		display@14f20000 {
+			compatible = "mediatek,mt8195-mdp3-pad";
+			reg = <0 0x14f20000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_VPP_PAD>;
+		};
+
+		display@14f21000 {
+			compatible = "mediatek,mt8195-mdp3-pad";
+			reg = <0 0x14f21000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x1000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_PAD>;
+		};
+
+		display@14f22000 {
+			compatible = "mediatek,mt8195-mdp3-pad";
+			reg = <0 0x14f22000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x2000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_PAD>;
+		};
+
+		dma-controller@14f23000 {
+			compatible = "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x14f23000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x3000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP1_MDP_WROT_SOF>,
+					      <CMDQ_EVENT_VPP1_SVPP1_MDP_WROT_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_WROT>;
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_WROT>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+			#dma-cells = <1>;
+		};
+
+		dma-controller@14f24000 {
+			compatible = "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x14f24000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x4000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_SOF>,
+					<CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_WROT>;
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_WROT>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+			#dma-cells = <1>;
+		};
+
+		dma-controller@14f25000 {
+			compatible = "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x14f25000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x5000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_SOF>,
+					<CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_FRAME_DONE>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_WROT>;
+			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_WROT>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+			#dma-cells = <1>;
+		};
+
 		imgsys: clock-controller@15000000 {
 			compatible = "mediatek,mt8195-imgsys";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.18.0


