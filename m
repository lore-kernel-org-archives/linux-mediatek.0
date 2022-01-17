Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3438AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3sxXMtJ7ZF2+zDk3p+LyTMcCLaVrB4jCQ66Ob7GMWU=; b=LkRRGjVAbiqjga
	JBvm0Cx3LskRLY082UZhxWrMagx0pfNS2enzTf4PA8lkwRTZs08Ipz49caCqBOwvfxgz0VaZJgO09
	wo4nTHbWHjvMqpcIT2SU+TjneLGGGLkwikd8tJ7pkB18dI6a8Yc1zTK6Mk7ssGMZ90TJKgNkWyaHD
	QsPpjTu/oBDQC/P0W5gjteVwrd2yQg+/K3ihRlMhKYMkx9yeExawJj+L1GKyxO+tPmgIRky2tsF2B
	4sWtzucuwfsXAxmvb4LGQimx+PRc9AERE39o+tpTfwt38B8MMOFqxoUv+D/AMxAZ8pQXXxwxIq+BN
	KtsB42UenBds4kh6dVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L9l-00Da9p-3X; Mon, 17 Jan 2022 06:06:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6u-00DYVR-M5; Mon, 17 Jan 2022 06:03:24 +0000
X-UUID: d0781fd393a745aa8e1d2c55bc1090ab-20220116
X-UUID: d0781fd393a745aa8e1d2c55bc1090ab-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1869652401; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Jan 2022 13:53:09 +0800
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
Subject: [PATCH v1 13/14] arm64: dts: mt8195: add mdp3 node
Date: Mon, 17 Jan 2022 13:52:53 +0800
Message-ID: <20220117055254.9777-14-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220320_787433_61430013 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Add mdp3 node.

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 633 +++++++++++++++++++++++
 1 file changed, 633 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ded98ff7b724..89600116ff26 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1245,9 +1245,261 @@
 		vppsys0: syscon@14000000 {
 			compatible = "mediatek,mt8195-vppsys0", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		mdp3_rdma0: mdp_rdma0@14001000 {
+			compatible = "mediatek,mt8195-mdp3",
+						"mediatek,mt8183-mdp3-rdma0";
+			mediatek,scp = <&scp>;
+			mdp3-comps = "mediatek,mt8195-mdp3-path1", "mediatek,mt8195-mdp3-path2",
+				     "mediatek,mt8195-mdp3-path3", "mediatek,mt8195-mdp3-path4",
+				     "mediatek,mt8195-mdp3-path5", "mediatek,mt8195-mdp3-path6",
+				     "mediatek,mt8195-mdp3-dl1", "mediatek,mt8195-mdp3-dl2";
+			reg = <0 0x14001000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x1000 0x1000>;
+			interrupts = <GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>,
+							<&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L4_MDP_RDMA>,
+				 <&iommu_vpp M4U_PORT_L4_MDP_WROT>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>; /* 8G - 12G IOVA*/
+			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>,
+					<&topckgen CLK_TOP_CFG_VPP0>,
+					<&topckgen CLK_TOP_CFG_26M_VPP0>,
+					<&vppsys0 CLK_VPP0_WARP0_ASYNC_TX>,
+					<&vppsys0 CLK_VPP0_WARP0_RELAY>,
+					<&vppsys0 CLK_VPP0_WARP0_MDP_DL_ASYNC>,
+					<&vppsys0 CLK_VPP0_WARP1_ASYNC_TX>,
+					<&vppsys0 CLK_VPP0_WARP1_RELAY>,
+					<&vppsys0 CLK_VPP0_WARP1_MDP_DL_ASYNC>,
+					<&vppsys0 CLK_VPP0_VPP02VPP1_RELAY>,
+					<&vppsys1 CLK_VPP1_DL_ASYNC>,
+					<&vppsys1 CLK_VPP1_VPP0_DL_ASYNC>,
+					<&vppsys1 CLK_VPP1_VPP0_DL_RELAY>,
+					<&vppsys0 CLK_VPP0_VPP12VPP0_ASYNC>,
+					<&vppsys1 CLK_VPP1_VPP0_DL1_RELAY>,
+					<&vppsys1 CLK_VPP1_SVPP2_VDO0_DL_RELAY>,
+					<&vppsys1 CLK_VPP1_SVPP3_VDO1_DL_RELAY>,
+					<&vppsys1 CLK_VPP1_SVPP2_VDO1_DL_RELAY>,
+					<&vppsys1 CLK_VPP1_SVPP3_VDO0_DL_RELAY>;
+			clock-names = "MDP_RDMA0",
+						"TOP_CFG_VPP0",
+						"TOP_CFG_26M_VPP0",
+						"WARP0_ASYNC_TX",
+						"WARP0_RELAY",
+						"WARP0_MDP_DL_ASYNC",
+						"WARP1_ASYNC_TX",
+						"WARP1_RELAY",
+						"WARP1_MDP_DL_ASYNC",
+						"VPP02VPP1_RELAY",
+						"VPP0_DL_ASYNC_VPP1",
+						"VPP0_DL_ASYNC_VPP0",
+						"VPP0_DL_RELAY",
+						"VPP12VPP0_ASYNC",
+						"VPP0_DL1_RELAY",
+						"SVPP2_VDO0_DL_RELAY",
+						"SVPP3_VDO1_DL_RELAY",
+						"SVPP2_VDO1_DL_RELAY",
+						"SVPP3_VDO0_DL_RELAY";
+			mediatek,mmsys2 = <&vppsys1>;
+			mediatek,mm-mutex2 = <&vpp1_mutex>;
+			mediatek,mmsys = <&vppsys0>;
+			mediatek,mm-mutex   = <&vpp0_mutex>;
+			mboxes =
+				<&gce1 12 CMDQ_THR_PRIO_1>,
+				<&gce1 13 CMDQ_THR_PRIO_1>,
+				<&gce1 14 CMDQ_THR_PRIO_1>,
+				<&gce1 21 CMDQ_THR_PRIO_1>,
+				<&gce1 22 CMDQ_THR_PRIO_1>;
+			mdp3-rdma0  = <&mdp3_rdma0>;
+			mdp3-rdma1  = <&svpp1_mdp3_rdma>;
+			mdp3-rdma2  = <&svpp2_mdp3_rdma>;
+			mdp3-rdma3  = <&svpp3_mdp3_rdma>;
+			mdp3-stitch = <&mdp3_stitch0>;
+			mdp3-rsz0   = <&mdp3_rsz0>;
+			mdp3-rsz1   = <&svpp1_mdp3_rsz>;
+			mdp3-rsz2   = <&svpp2_mdp3_rsz>;
+			mdp3-rsz3   = <&svpp3_mdp3_rsz>;
+			mdp3-wrot0  = <&mdp3_wrot0>;
+			mdp3-wrot1  = <&svpp1_mdp3_wrot>;
+			mdp3-wrot2  = <&svpp2_mdp3_wrot>;
+			mdp3-wrot3  = <&svpp3_mdp3_wrot>;
+			mdp3-tdshp0 = <&mdp3_tdshp0>;
+			mdp3-tdshp1 = <&svpp1_mdp3_tdshp>;
+			mdp3-tdshp2 = <&svpp2_mdp3_tdshp>;
+			mdp3-tdshp3 = <&svpp3_mdp3_tdshp>;
+			mdp3-aal0   = <&mdp3_aal0>;
+			mdp3-aal1   = <&svpp1_mdp3_aal>;
+			mdp3-aal2   = <&svpp2_mdp3_aal>;
+			mdp3-aal3   = <&svpp3_mdp3_aal>;
+			mdp3-color0 = <&mdp3_color0>;
+			mdp3-color1 = <&svpp1_mdp3_color>;
+			mdp3-color2 = <&svpp2_mdp3_color>;
+			mdp3-color3 = <&svpp3_mdp3_color>;
+			mdp3-hdr0   = <&mdp3_hdr0>;
+			mdp3-hdr1   = <&svpp1_mdp3_hdr>;
+			mdp3-hdr2   = <&svpp2_mdp3_hdr>;
+			mdp3-hdr3   = <&svpp3_mdp3_hdr>;
+			mdp3-fg0    = <&mdp3_fg0>;
+			mdp3-fg1    = <&svpp1_mdp3_fg>;
+			mdp3-fg2    = <&svpp2_mdp3_fg>;
+			mdp3-fg3    = <&svpp3_mdp3_fg>;
+			mdp3-tcc0   = <&mdp3_tcc0>;
+			mdp3-tcc1   = <&svpp1_mdp3_tcc>;
+			mdp3-ovl0   = <&mdp3_ovl0>;
+			mdp3-ovl1   = <&svpp1_mdp3_ovl>;
+			mdp3-pad0   = <&mdp3_pad0>;
+			mdp3-pad1   = <&svpp1_mdp3_pad>;
+			mdp3-pad2   = <&svpp2_mdp3_pad>;
+			mdp3-pad3   = <&svpp3_mdp3_pad>;
+			mdp3-split  = <&vpp_split0>;
+			mdp3-merge2 = <&svpp2_mdp3_merge>;
+			mdp3-merge3 = <&svpp3_mdp3_merge>;
+		};
+
+		mdp3_fg0: mdp_fg0@14002000 {
+			compatible = "mediatek,mt8195-mdp3-fg0";
+			reg = <0 0x14002000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x2000 0x1000>;
+			interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_FG>;
+			clock-names = "MDP_FG0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_stitch0: mdp_stich0@14003000 {
+			compatible = "mediatek,mt8195-mdp3-stitch";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x3000 0x1000>;
+			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_STITCH>;
+			clock-names = "MDP_STITCH";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_hdr0: mdp_hdr0@14004000 {
+			compatible = "mediatek,mt8195-mdp3-hdr0";
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x4000 0x1000>;
+			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_HDR>;
+			clock-names = "MDP_HDR0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_aal0: mdp_aal0@14005000 {
+			compatible = "mediatek,mt8195-mdp3-aal0";
+			reg = <0 0x14005000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x5000 0x1000>;
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_AAL>;
+			clock-names = "MDP_AAL0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_rsz0: mdp_rsz0@14006000 {
+			compatible = "mediatek,mt8183-mdp3-rsz0";
+			reg = <0 0x14006000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x6000 0x1000>;
+			interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_RSZ>;
+			clock-names = "MDP_RSZ0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_tdshp0: mdp_tdshp0@14007000 {
+			compatible = "mediatek,mt8195-mdp3-tdshp0";
+			reg = <0 0x14007000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x7000 0x1000>;
+			interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_TDSHP>;
+			clock-names = "MDP_TDSHP0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_color0: mdp_color0@14008000 {
+			compatible = "mediatek,mt8195-mdp3-color0";
+			reg = <0 0x14008000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x8000 0x1000>;
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_COLOR>;
+			clock-names = "MDP_COLOR0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_ovl0: mdp_ovl0@14009000 {
+			compatible = "mediatek,mt8195-mdp3-ovl0";
+			reg = <0 0x14009000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0x9000 0x1000>;
+			interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_OVL>;
+			clock-names = "MDP_OVL0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_pad0: mdp_pad0@1400a000 {
+			compatible = "mediatek,mt8195-mdp3-pad0";
+			reg = <0 0x1400a000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xa000 0x1000>;
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_PADDING>;
+			clock-names = "MDP_PAD0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_tcc0: mdp_tcc0@1400b000 {
+			compatible = "mediatek,mt8195-mdp3-tcc0";
+			reg = <0 0x1400b000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xb000 0x1000>;
+			interrupts = <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_TCC>;
+			clock-names = "MDP_TCC0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		mdp3_wrot0: mdp_wrot0@1400c000 {
+			compatible = "mediatek,mt8183-mdp3-wrot0";
+			reg = <0 0x1400c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xc000 0x1000>;
+			interrupts = <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys0 CLK_VPP0_MDP_WROT>;
+			clock-names = "MDP_WROT0";
+			iommus = <&iommu_vpp M4U_PORT_L4_MDP_WROT>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		vpp0_mutex: vpp0_mutex@1400f000 {
+			compatible = "mediatek,mt8195-vpp0-mutex";
+			reg = <0 0x1400f000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xf000 0x1000>;
+			interrupts = <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH 0>;
+			#clocks = <&vppsys0 CLK_VPP0_MUTEX>;
+			#clock-names = "MDP_MUTEX0";
+			clocks = <&vppsys0 CLK_VPP0_MUTEX>;
+			clock-names = "MDP_MUTEX0";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+			mediatek,gce-events = <CMDQ_EVENT_VPP0_MDP_RDMA_SOF>,
+					<CMDQ_EVENT_VPP0_MDP_WROT_SOF>,
+					<CMDQ_EVENT_VPP0_MDP_RDMA_FRAME_DONE>,
+					<CMDQ_EVENT_VPP0_MDP_WROT_VIDO_WDONE>,
+					<CMDQ_EVENT_VPP1_SVPP1_MDP_RDMA_SOF>,
+					<CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_SOF>,
+					<CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_SOF>,
+					<CMDQ_EVENT_VPP1_SVPP1_MDP_WROT_SOF>,
+					<CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_SOF>,
+					<CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_SOF>,
+					<CMDQ_EVENT_VPP1_SVPP1_MDP_RDMA_FRAME_DONE>,
+					<CMDQ_EVENT_VPP1_SVPP2_MDP_RDMA_FRAME_DONE>,
+					<CMDQ_EVENT_VPP1_SVPP3_MDP_RDMA_FRAME_DONE>,
+					<CMDQ_EVENT_VPP1_SVPP1_MDP_WROT_FRAME_DONE>,
+					<CMDQ_EVENT_VPP1_SVPP2_MDP_WROT_FRAME_DONE>,
+					<CMDQ_EVENT_VPP1_SVPP3_MDP_WROT_FRAME_DONE>;
+		};
+
 		wpesys: clock-controller@14e00000 {
 			compatible = "mediatek,mt8195-wpesys";
 			reg = <0 0x14e00000 0 0x1000>;
@@ -1269,9 +1521,390 @@
 		vppsys1: syscon@14f00000 {
 			compatible = "mediatek,mt8195-vppsys1", "syscon";
 			reg = <0 0x14f00000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		vpp1_mutex: vpp1_mutex@14f01000 {
+			compatible = "mediatek,mt8195-vpp1-mutex";
+			reg = <0 0x14f01000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x1000 0x1000>;
+			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
+			#clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
+			#clock-names = "DISP_MUTEX";
+			clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
+			clock-names = "DISP_MUTEX";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		vpp_split0: vpp_split0@14f06000 {
+			compatible = "mediatek,mt8195-mdp3-split";
+			reg = <0 0x14f06000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x6000 0x1000>;
+			interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
+				<GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_VPP_SPLIT>,
+					<&vppsys1 CLK_VPP1_HDMI_META>,
+					<&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>,
+					<&vppsys1 CLK_VPP1_DGI_IN>,
+					<&vppsys1 CLK_VPP1_DGI_OUT>,
+					<&vppsys1 CLK_VPP1_VPP_SPLIT_DGI>,
+					<&vppsys1 CLK_VPP1_VPP_SPLIT_26M>;
+			clock-names = "MDP_SPLIT",
+						"HDMI_META",
+						"SPLIT_HDMI",
+						"DGI_IN",
+						"DGI_OUT",
+						"SPLIT_DGI",
+						"VPP_SPLIT_26M";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_tcc: svpp1_mdp_tcc@14f07000 {
+			compatible = "mediatek,mt8195-mdp3-tcc1";
+			reg = <0 0x14f07000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x7000 0x1000>;
+			interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_TCC>;
+			clock-names = "MDP_TCC1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_rdma: svpp1_mdp_rdma@14f08000 {
+			compatible = "mediatek,mt8195-mdp3",
+				 "mediatek,mt8195-mdp3-rdma1";
+			reg = <0 0x14f08000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x8000 0x1000>;
+			interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_RDMA>,
+					<&topckgen CLK_TOP_CFG_VPP1>,
+					<&topckgen CLK_TOP_CFG_26M_VPP1>;
+			clock-names = "MDP_RDMA1",
+						"TOP_CFG_VPP1",
+						"TOP_CFG_26M_VPP1";
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_RDMA>,
+				 <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_WROT>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>; /* 8G - 12G IOVA*/
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_rdma: svpp2_mdp_rdma@14f09000 {
+			compatible = "mediatek,mt8195-mdp3",
+				 "mediatek,mt8195-mdp3-rdma2";
+			reg = <0 0x14f09000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x9000 0x1000>;
+			interrupts = <GIC_SPI 609 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RDMA>,
+					<&topckgen CLK_TOP_CFG_VPP1>,
+					<&topckgen CLK_TOP_CFG_26M_VPP1>;
+			clock-names = "MDP_RDMA2",
+						"TOP_CFG_VPP1",
+						"TOP_CFG_26M_VPP1";
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_RDMA>,
+				 <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_WROT>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>; /* 8G - 12G IOVA*/
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_rdma: svpp3_mdp_rdma@14f0a000 {
+			compatible = "mediatek,mt8195-mdp3",
+				 "mediatek,mt8195-mdp3-rdma3";
+			reg = <0 0x14f0a000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xa000 0x1000>;
+			interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RDMA>,
+					<&topckgen CLK_TOP_CFG_VPP1>,
+					<&topckgen CLK_TOP_CFG_26M_VPP1>;
+			clock-names = "MDP_RDMA3",
+						"TOP_CFG_VPP1",
+						"TOP_CFG_26M_VPP1";
+			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_RDMA>,
+				 <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_WROT>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>; /* 8G - 12G IOVA*/
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_fg: svpp1_mdp_fg@14f0b000 {
+			compatible = "mediatek,mt8195-mdp3-fg1";
+			reg = <0 0x14f0b000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xb000 0x1000>;
+			interrupts = <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_FG>;
+			clock-names = "MDP_FG1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_fg: svpp2_mdp_fg@14f0c000 {
+			compatible = "mediatek,mt8195-mdp3-fg2";
+			reg = <0 0x14f0c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xc000 0x1000>;
+			interrupts = <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_FG>;
+			clock-names = "MDP_FG2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_fg: svpp3_mdp_fg@14f0d000 {
+			compatible = "mediatek,mt8195-mdp3-fg3";
+			reg = <0 0x14f0d000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xd000 0x1000>;
+			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_FG>;
+			clock-names = "MDP_FG3";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_hdr: svpp1_mdp_hdr@14f0e000 {
+			compatible = "mediatek,mt8195-mdp3-hdr1";
+			reg = <0 0x14f0e000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xe000 0x1000>;
+			interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_HDR>;
+			clock-names = "MDP_HDR1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_hdr: svpp2_mdp_hdr@14f0f000 {
+			compatible = "mediatek,mt8195-mdp3-hdr2";
+			reg = <0 0x14f0f000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0xf000 0x1000>;
+			interrupts = <GIC_SPI 615 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_HDR>;
+			clock-names = "MDP_HDR2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_hdr: svpp3_mdp_hdr@14f10000 {
+			compatible = "mediatek,mt8195-mdp3-hdr3";
+			reg = <0 0x14f10000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0 0x1000>;
+			interrupts = <GIC_SPI 616 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_HDR>;
+			clock-names = "MDP_HDR3";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_aal: svpp1_mdp_aal@14f11000 {
+			compatible = "mediatek,mt8195-mdp3-aal1";
+			reg = <0 0x14f11000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x1000 0x1000>;
+			interrupts = <GIC_SPI 617 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_AAL>;
+			clock-names = "MDP_AAL1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_aal: svpp2_mdp_aal@14f12000 {
+			compatible = "mediatek,mt8195-mdp3-aal2";
+			reg = <0 0x14f12000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x2000 0x1000>;
+			interrupts = <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_AAL>;
+			clock-names = "MDP_AAL2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_aal: svpp3_mdp_aal@14f13000 {
+			compatible = "mediatek,mt8195-mdp3-aal3";
+			reg = <0 0x14f13000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x3000 0x1000>;
+			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_AAL>;
+			clock-names = "MDP_AAL3";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_rsz: svpp1_mdp_rsz@14f14000 {
+			compatible = "mediatek,mt8183-mdp3-rsz1";
+			reg = <0 0x14f14000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x4000 0x1000>;
+			interrupts = <GIC_SPI 620 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_RSZ>;
+			clock-names = "MDP_RSZ1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_rsz: svpp2_mdp_rsz@14f15000 {
+			compatible = "mediatek,mt8195-mdp3-rsz2";
+			reg = <0 0x14f15000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x5000 0x1000>;
+			interrupts = <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_RSZ>,
+					<&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
+			clock-names = "MDP_RSZ2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_rsz: svpp3_mdp_rsz@14f16000 {
+			compatible = "mediatek,mt8195-mdp3-rsz3";
+			reg = <0 0x14f16000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x6000 0x1000>;
+			interrupts = <GIC_SPI 622 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_RSZ>,
+					<&vppsys1 CLK_VPP1_SVPP3_VPP_MERGE>;
+			clock-names = "MDP_RSZ3";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_tdshp: svpp1_mdp_tdshp@14f17000 {
+			compatible = "mediatek,mt8195-mdp3-tdshp1";
+			reg = <0 0x14f17000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x7000 0x1000>;
+			interrupts = <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_TDSHP>;
+			clock-names = "MDP_TDSHP1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_tdshp: svpp2_mdp_tdshp@14f18000 {
+			compatible = "mediatek,mt8195-mdp3-tdshp2";
+			reg = <0 0x14f18000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x8000 0x1000>;
+			interrupts = <GIC_SPI 624 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_TDSHP>;
+			clock-names = "MDP_TDSHP2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_tdshp: svpp3_mdp_tdshp@14f19000 {
+			compatible = "mediatek,mt8195-mdp3-tdshp3";
+			reg = <0 0x14f19000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0x9000 0x1000>;
+			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_TDSHP>;
+			clock-names = "MDP_TDSHP3";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_merge: svpp2_mdp_merge@14f1a000 {
+			compatible = "mediatek,mt8195-mdp3-merge2";
+			reg = <0 0x14f1a000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xa000 0x1000>;
+			interrupts = <GIC_SPI 626 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_MERGE>;
+			clock-names = "MDP_MERGE2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_merge: svpp3_mdp_merge@14f1b000 {
+			compatible = "mediatek,mt8195-mdp3-merge3";
+			reg = <0 0x14f1b000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xb000 0x1000>;
+			interrupts = <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_MERGE>;
+			clock-names = "MDP_MERGE3";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_color: svpp1_mdp_color@14f1c000 {
+			compatible = "mediatek,mt8195-mdp3-color1";
+			reg = <0 0x14f1c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xc000 0x1000>;
+			interrupts = <GIC_SPI 628 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_COLOR>;
+			clock-names = "MDP_COLOR1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_color: svpp2_mdp_color@14f1d000 {
+			compatible = "mediatek,mt8195-mdp3-color2";
+			reg = <0 0x14f1d000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xd000 0x1000>;
+			interrupts = <GIC_SPI 629 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_COLOR>;
+			clock-names = "MDP_COLOR2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_color: svpp3_mdp_color@14f1e000 {
+			compatible = "mediatek,mt8195-mdp3-color3";
+			reg = <0 0x14f1e000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xe000 0x1000>;
+			interrupts = <GIC_SPI 630 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_COLOR>;
+			clock-names = "MDP_COLOR3";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_ovl: svpp1_mdp_ovl@14f1f000 {
+			compatible = "mediatek,mt8195-mdp3-ovl1";
+			reg = <0 0x14f1f000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f1XXXX 0xf000 0x1000>;
+			interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_OVL>;
+			clock-names = "MDP_OVL1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_pad: svpp1_mdp_pad@14f20000 {
+			compatible = "mediatek,mt8195-mdp3-pad1";
+			reg = <0 0x14f20000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0 0x1000>;
+			interrupts = <GIC_SPI 632 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_VPP_PAD>;
+			clock-names = "MDP_PAD1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_pad: svpp2_mdp_pad@14f21000 {
+			compatible = "mediatek,mt8195-mdp3-pad2";
+			reg = <0 0x14f21000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x1000 0x1000>;
+			interrupts = <GIC_SPI 633 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_VPP_PAD>;
+			clock-names = "MDP_PAD2";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_pad: svpp3_mdp_pad@14f22000 {
+			compatible = "mediatek,mt8195-mdp3-pad3";
+			reg = <0 0x14f22000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x2000 0x1000>;
+			interrupts = <GIC_SPI 634 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_VPP_PAD>;
+			clock-names = "MDP_PAD3";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp1_mdp3_wrot: svpp1_mdp_wrot@14f23000 {
+			compatible = "mediatek,mt8195-mdp3-wrot1";
+			reg = <0 0x14f23000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x3000 0x1000>;
+			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP1_MDP_WROT>;
+			clock-names = "MDP_WROT1";
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_WROT>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp2_mdp3_wrot: svpp2_mdp_wrot@14f24000 {
+			compatible = "mediatek,mt8195-mdp3-wrot2";
+			reg = <0 0x14f24000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x4000 0x1000>;
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP2_MDP_WROT>;
+			clock-names = "MDP_WROT2";
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_WROT>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
+		svpp3_mdp3_wrot: svpp3_mdp_wrot@14f25000 {
+			compatible = "mediatek,mt8195-mdp3-wrot3";
+			reg = <0 0x14f25000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f2XXXX 0x5000 0x1000>;
+			interrupts = <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vppsys1 CLK_VPP1_SVPP3_MDP_WROT>;
+			clock-names = "MDP_WROT3";
+			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_WROT>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
 		imgsys: clock-controller@15000000 {
 			compatible = "mediatek,mt8195-imgsys";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
