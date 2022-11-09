Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECA0C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVr/w7/wOLRWDOkFgdIIqFh4IiDRfiBAxHj4ct/E3/A=; b=rH/yQ44tS4gNdPMFU4A0t8+fVe
	VsNHH0N0GYoXv37xC6lCcCbhpCAnMF2LVwiKw9eBHkw+Lxilq8kabvEeqfMSF1XQozQXq3QXE+puj
	kc644xSSAYDs0RDH5rzw+pIC/Q6iQdtIjdZDD4ANNCYEkYIxzusDM6VrspP21GKNzWLWhBJDAxktr
	miryGXNAdNwTuJHEpT9ze3+aAraUMSbNP+0n/tppD4xy7yNJxjTNjnVK4uwGVPpporB3RVpoSy4d3
	qT2da19J4hyz3/08VL0mQvhCq74d12Ktru7VswFuTrZEZt6PxW6x5UIAzm4DTMTHu5z7ZvJTtdjYw
	2AnVXnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osfdP-00BaVu-QY; Wed, 09 Nov 2022 07:36:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osfd9-00BaPL-9a; Wed, 09 Nov 2022 07:36:16 +0000
X-UUID: 23b0bbe532e2427484d60895ba99981b-20221109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FVr/w7/wOLRWDOkFgdIIqFh4IiDRfiBAxHj4ct/E3/A=;
	b=fkfOdTNoIMb/b/+IgxzvtYTI2yx3qBe0kONaFlReQjjNaF2jF7uoStkyGbUyACf+Kzz+lzXwar2oIQXQ8lim+z7zdP8pDsZNA5Afei5KG1NI/we3Gu1DrmtALJldU3GwvVGmV+Y07J2QBb5rvC9S/z/M6zIBqSwY5J4F/fkT1Y4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:0c5a4bc7-d818-4f33-94c9-bd914bb009b9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:77d998fa-5f3f-42f2-9a97-16904f30874b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 23b0bbe532e2427484d60895ba99981b-20221109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 394207165; Wed, 09 Nov 2022 00:36:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 9 Nov 2022 15:35:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 9 Nov 2022 15:35:32 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Rob Herring <robh@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
	<tiffany.lin@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 3/3] arm64: dts: mt8195: Add video decoder node
Date: Wed, 9 Nov 2022 15:35:29 +0800
Message-ID: <20221109073529.26765-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221109073529.26765-1-yunfei.dong@mediatek.com>
References: <20221109073529.26765-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_233615_369043_0BE002C4 
X-CRM114-Status: GOOD (  11.12  )
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

Add video decoder node to mt8195 device tree.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
dtbs_check pass.
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 905d1a90b406..ffabf91d4273 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1874,6 +1874,69 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_CAM>;
 		};
 
+		video-codec@18000000 {
+			compatible = "mediatek,mt8195-vcodec-dec";
+			mediatek,scp = <&scp>;
+			iommus = <&iommu_vdo M4U_PORT_L21_VDEC_MC_EXT>;
+			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			reg = <0 0x18000000 0 0x1000>,      /* VDEC_SYS */
+			      <0 0x18004000 0 0x1000>;      /* VDEC_RACING_CTRL */
+			ranges = <0 0 0 0x18000000 0 0x26000>;
+			clocks = <&topckgen CLK_TOP_VDEC>,
+			         <&topckgen CLK_TOP_UNIVPLL_D4>;
+			clock-names = "vdec-sel", "top";
+			assigned-clocks = <&topckgen CLK_TOP_VDEC>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+
+			vcodec-lat-soc@2000 {
+				compatible = "mediatek,mtk-vcodec-lat-soc";
+				reg = <0 0x2000 0 0x800>;		/* VDEC_MISC */
+				iommus = <&iommu_vpp M4U_PORT_L23_VDEC_UFO_ENC_EXT>,
+					 <&iommu_vpp M4U_PORT_L23_VDEC_RDMA_EXT>;
+				clocks = <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+					 <&vdecsys_soc CLK_VDEC_SOC_LAT>;
+				clock-names = "vdec-soc-vdec", "vdec-soc-lat";
+				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
+			};
+
+			vcodec-lat@10000 {
+				compatible = "mediatek,mtk-vcodec-lat";
+				reg = <0 0x10000 0 0x800>;		/* VDEC_MISC */
+				interrupts = <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH 0>;
+				iommus = <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_VLD_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_VLD2_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_AVC_MC_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_PRED_RD_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_TILE_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_WDMA_EXT>;
+				clocks = <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+					 <&vdecsys_soc CLK_VDEC_SOC_LAT>;
+				clock-names = "vdec-soc-vdec", "vdec-soc-lat";
+				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
+			};
+
+			vcodec-core@25000 {
+				compatible = "mediatek,mtk-vcodec-core";
+				reg = <0 0x25000 0 0x1000>;		/* VDEC_CORE_MISC */
+				interrupts = <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH 0>;
+				iommus = <&iommu_vdo M4U_PORT_L21_VDEC_MC_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_UFO_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_PP_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_PRED_RD_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_PRED_WR_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_PPWRAP_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_TILE_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_VLD_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_VLD2_EXT>,
+					 <&iommu_vdo M4U_PORT_L21_VDEC_AVC_MV_EXT>;
+				clocks = <&vdecsys CLK_VDEC_VDEC>, <&vdecsys CLK_VDEC_LAT>;
+				clock-names = "vdec-vdec", "vdec-lat";
+				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+			};
+		};
+
 		larb24: larb@1800d000 {
 			compatible = "mediatek,mt8195-smi-larb";
 			reg = <0 0x1800d000 0 0x1000>;
-- 
2.18.0


