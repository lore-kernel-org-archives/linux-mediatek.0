Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335B5C761A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iAIFzR/njeqfNJt2xIQ7Fuecu3xAyxrJCbkIieGzjHI=; b=2fXf3MNCcw4LGGw5QgnF7VISOQ
	GtzUkAsUOVRRzr/Jtvb0iSscIQZpoODT61NhmPHJjBHQPUjQpCq2bUI23vEfjTyo/0+UwoD/TZ8PA
	P9kwuTatOt9ebLlbaLQPYDdA/yCkJfni19FGYG+1KM53I3L8S2VT3U8FR53+0NWQNqs4wDS8I5RS+
	aBcU/QNXrb//urv08KiggOhtasvVkysQ4jlmt9oTnhaoCPjMJbrD/sAfn9/FjxDqWy5vcqrylOYXG
	Cy9q08tWc6b7Xk9Nml4Xkd4eLJ9oN2yedW0/9JIGc3ytVE15KZZpIN5GDhuR1a2T6FOrCVSHn4KxI
	p4VyhALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebnT-00CTSo-2N;
	Tue, 21 Mar 2023 13:13:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pebnQ-00CTRp-0Z;
	Tue, 21 Mar 2023 13:13:02 +0000
X-UUID: 1794cfecc7ea11edb7d8d11f642b8e78-20230321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iAIFzR/njeqfNJt2xIQ7Fuecu3xAyxrJCbkIieGzjHI=;
	b=oNlRnkdarAKji2PHtSIMOkRQT0s6LP9p9WwMwd+kCpkXmUKiNqg56wW7qJwSY21sKe6EzV546EdQLLxKR1UDe4E1kvpAJkvs1NGPB14PHYUttzrKJ94Q4u8fxnXWCPYn9j1kbeqw/wcP7OtwqHI6uUkV0NkzwrNE7VO58jldrdo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:59179cf1-abe1-45b1-b532-287beaa5a4a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:2b890929-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 1794cfecc7ea11edb7d8d11f642b8e78-20230321
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1344971799; Tue, 21 Mar 2023 06:12:55 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 21 Mar 2023 21:12:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 21 Mar 2023 21:12:52 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<singo.chang@mediatek.com>, Nancy.Lin <nancy.lin@mediatek.com>
Subject: [PATCH v1] arm64: dts: mt8195: add display node for vdosys1
Date: Tue, 21 Mar 2023 21:12:51 +0800
Message-ID: <20230321131251.3351-1-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_061300_222703_838168F4 
X-CRM114-Status: GOOD (  11.91  )
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

Add display node for vdosys1.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---
1. The dts patch is separated from the following patch:
 - [v21,25/25] arm64: dts: mt8195: add display node for vdosys1
   20220512053128.31415-26-nancy.lin@mediatek.com

2. This patch is based on the following series:
 - Add MediaTek SoC DRM (vdosys1) support for mt8195
   20230321121859.2355-1-nancy.lin@mediatek.com
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223 +++++++++++++++++++++++
 1 file changed, 223 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8fc527570791..c6b625350583 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -24,6 +24,22 @@
 	aliases {
 		gce0 = &gce0;
 		gce1 = &gce1;
+		ethdr0 = &ethdr0;
+		mutex0 = &mutex;
+		mutex1 = &mutex1;
+		merge1 = &merge1;
+		merge2 = &merge2;
+		merge3 = &merge3;
+		merge4 = &merge4;
+		merge5 = &merge5;
+		vdo1-rdma0 = &vdo1_rdma0;
+		vdo1-rdma1 = &vdo1_rdma1;
+		vdo1-rdma2 = &vdo1_rdma2;
+		vdo1-rdma3 = &vdo1_rdma3;
+		vdo1-rdma4 = &vdo1_rdma4;
+		vdo1-rdma5 = &vdo1_rdma5;
+		vdo1-rdma6 = &vdo1_rdma6;
+		vdo1-rdma7 = &vdo1_rdma7;
 	};
 
 	cpus {
@@ -2575,7 +2591,10 @@
 		vdosys1: syscon@1c100000 {
 			compatible = "mediatek,mt8195-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
+			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x0000 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		smi_common_vdo: smi@1c01b000 {
@@ -2604,6 +2623,17 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 		};
 
+		mutex1: mutex0@1c101000 {
+			compatible = "mediatek,mt8195-disp-mutex";
+			reg = <0 0x1c101000 0 0x1000>;
+			reg-names = "vdo1_mutex";
+			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			clocks = <&vdosys1 CLK_VDO1_DISP_MUTEX>;
+			clock-names = "vdo1_mutex";
+			mediatek,gce-events = <CMDQ_EVENT_VDO1_STREAM_DONE_ENG_0>;
+		};
+
 		larb2: larb@1c102000 {
 			compatible = "mediatek,mt8195-smi-larb";
 			reg = <0 0x1c102000 0 0x1000>;
@@ -2628,6 +2658,151 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 		};
 
+		vdo1_rdma0: rdma@1c104000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c104000 0 0x1000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
+		};
+
+		vdo1_rdma1: rdma@1c105000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c105000 0 0x1000>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA1>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x5000 0x1000>;
+		};
+
+		vdo1_rdma2: rdma@1c106000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c106000 0 0x1000>;
+			interrupts = <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA2>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA2>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x6000 0x1000>;
+		};
+
+		vdo1_rdma3: rdma@1c107000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c107000 0 0x1000>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA3>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA3>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x7000 0x1000>;
+		};
+
+		vdo1_rdma4: rdma@1c108000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c108000 0 0x1000>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA4>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA4>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x8000 0x1000>;
+		};
+
+		vdo1_rdma5: rdma@1c109000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c109000 0 0x1000>;
+			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA5>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA5>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x9000 0x1000>;
+		};
+
+		vdo1_rdma6: rdma@1c10a000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c10a000 0 0x1000>;
+			interrupts = <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA6>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA6>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xa000 0x1000>;
+		};
+
+		vdo1_rdma7: rdma@1c10b000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c10b000 0 0x1000>;
+			interrupts = <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA7>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA7>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xb000 0x1000>;
+		};
+
+		merge1: vpp-merge@1c10c000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10c000 0 0x1000>;
+			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
+				 <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xc000 0x1000>;
+			mediatek,merge-mute = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
+		};
+
+		merge2: vpp-merge@1c10d000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10d000 0 0x1000>;
+			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE1>,
+				 <&vdosys1 CLK_VDO1_MERGE1_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xd000 0x1000>;
+			mediatek,merge-mute = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC>;
+		};
+
+		merge3: vpp-merge@1c10e000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10e000 0 0x1000>;
+			interrupts = <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE2>,
+				 <&vdosys1 CLK_VDO1_MERGE2_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xe000 0x1000>;
+			mediatek,merge-mute = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC>;
+		};
+
+		merge4: vpp-merge@1c10f000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10f000 0 0x1000>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE3>,
+				 <&vdosys1 CLK_VDO1_MERGE3_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xf000 0x1000>;
+			mediatek,merge-mute = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC>;
+		};
+
+		merge5: vpp-merge@1c110000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c110000 0 0x1000>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
+				 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x0000 0x1000>;
+			mediatek,merge-fifo-en = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
+		};
+
 		dp_intf1: dp-intf@1c113000 {
 			compatible = "mediatek,mt8195-dp-intf";
 			reg = <0 0x1c113000 0 0x1000>;
@@ -2640,6 +2815,54 @@
 			status = "disabled";
 		};
 
+		ethdr0: hdr-engine@1c114000 {
+			compatible = "mediatek,mt8195-disp-ethdr";
+			reg = <0 0x1c114000 0 0x1000>,
+			      <0 0x1c115000 0 0x1000>,
+			      <0 0x1c117000 0 0x1000>,
+			      <0 0x1c119000 0 0x1000>,
+			      <0 0x1c11a000 0 0x1000>,
+			      <0 0x1c11b000 0 0x1000>,
+			      <0 0x1c11c000 0 0x1000>;
+			reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+				    "vdo_be", "adl_ds";
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xa000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xb000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xc000 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
+				 <&vdosys1 CLK_VDO1_26M_SLOW>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
+				 <&topckgen CLK_TOP_ETHDR>;
+			clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+				      "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
+				      "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
+				      "ethdr_top";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
+				 <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
+			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
+			resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
+			reset-names = "vdo_fe0_async", "vdo_fe1_async", "gfx_fe0_async",
+				      "gfx_fe1_async", "vdo_be_async";
+		};
+
 		edp_tx: edp-tx@1c500000 {
 			compatible = "mediatek,mt8195-edp-tx";
 			reg = <0 0x1c500000 0 0x8000>;
-- 
2.18.0


