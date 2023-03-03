Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E67BC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 01:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HkB48symoODIC8ECiB6Yao0itYaQt3zHYaMGMx88ZQ=; b=iCReTTUKfaMm4Km3ctwM2JGhyr
	/mJNsBw5WvQeRUk3NIvUSZAYq4Mj94Bu42yYx98E9Jpr3jgzZXhD3kLoWvtCeU6xIZN97EMEPuq+H
	prhXyw9wGhX9j2qDPIbCfhVuzadlyOs+EOlZsS6zXQ7dSL34ylXvI6i8J8Z3zAD35HBZv5EmotmZJ
	bNZ6kGs8ZPBHgaDYcJ7JAiyXk6SRvxETEjZ5ZXueZ4FnvG2EAmKPmo9DC/s7RKBODe9/FV+MakmUk
	NWZ983MGNLJVnmRgBTRsRkfZRn485RZN0gQZN6PS992OxGc2RQ7KD/3NHvC2JTp22vPhefwF/MGNY
	FZI3ZtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXuPC-004DOB-TC; Fri, 03 Mar 2023 01:40:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXuOq-004D5u-GO; Fri, 03 Mar 2023 01:39:57 +0000
X-UUID: 4955c944b96411edbbe3f76fe852e059-20230302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3HkB48symoODIC8ECiB6Yao0itYaQt3zHYaMGMx88ZQ=;
	b=mrxGYG7Y2lXppKl09xo80tPDHY+IMvvhUQPe2Vfd1Zqo71qa4RimY6rmdzzF8nZsVB+9O5yhRVNZLXHYluuHo/orH4oytKcRLYv2WfG2IYP6FYwiwuH6DDaFbHYGcvR9rIeDIxkWa8g8Y6PyH6LdJgZH3lRuXwKXpNvt+Z6NX8g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:e4509949-5eb2-4fa3-be7e-b537b965d93e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.20,REQID:e4509949-5eb2-4fa3-be7e-b537b965d93e,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:25b5999,CLOUDID:2c419bf4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230303093907EEZ6QDDJ,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 4955c944b96411edbbe3f76fe852e059-20230302
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 239321290; Thu, 02 Mar 2023 18:39:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 09:38:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 09:38:48 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>, "Allen-KH
 Cheng" <allen-kh.cheng@mediatek.com>
Subject: [RESEND 6/6] arm64: dts: mt8195: Add video decoder node
Date: Fri, 3 Mar 2023 09:38:42 +0800
Message-ID: <20230303013842.23259-7-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
References: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_173956_569720_B05D2091 
X-CRM114-Status: GOOD (  10.28  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

Add video decoder node to mt8195 device tree.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8fc527570791..d0d53e0bfbfc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2211,6 +2211,76 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_CAM>;
 		};
 
+		video-codec@18000000 {
+			compatible = "mediatek,mt8195-vcodec-dec";
+			mediatek,scp = <&scp>;
+			iommus = <&iommu_vdo M4U_PORT_L21_VDEC_MC_EXT>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			reg = <0 0x18000000 0 0x1000>,
+			      <0 0x18004000 0 0x1000>;
+			ranges = <0 0 0 0x18000000 0 0x26000>;
+
+			video-codec@2000 {
+				compatible = "mediatek,mtk-vcodec-lat-soc";
+				reg = <0 0x2000 0 0x800>;
+				iommus = <&iommu_vpp M4U_PORT_L23_VDEC_UFO_ENC_EXT>,
+					 <&iommu_vpp M4U_PORT_L23_VDEC_RDMA_EXT>;
+				clocks = <&topckgen CLK_TOP_VDEC>,
+					 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+					 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+					 <&topckgen CLK_TOP_UNIVPLL_D4>;
+				clock-names = "sel", "vdec", "lat", "top";
+				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
+			};
+
+			video-codec@10000 {
+				compatible = "mediatek,mtk-vcodec-lat";
+				reg = <0 0x10000 0 0x800>;
+				interrupts = <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH 0>;
+				iommus = <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_VLD_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_VLD2_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_AVC_MC_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_PRED_RD_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_TILE_EXT>,
+					 <&iommu_vdo M4U_PORT_L24_VDEC_LAT0_WDMA_EXT>;
+				clocks = <&topckgen CLK_TOP_VDEC>,
+					 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+					 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+					 <&topckgen CLK_TOP_UNIVPLL_D4>;
+				clock-names = "sel", "vdec", "lat", "top";
+				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
+			};
+
+			video-codec@25000 {
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
+				clocks = <&topckgen CLK_TOP_VDEC>,
+					 <&vdecsys CLK_VDEC_VDEC>,
+					 <&vdecsys CLK_VDEC_LAT>,
+					 <&topckgen CLK_TOP_UNIVPLL_D4>;
+				clock-names = "sel", "vdec", "lat", "top";
+				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
+			};
+		};
+
 		larb24: larb@1800d000 {
 			compatible = "mediatek,mt8195-smi-larb";
 			reg = <0 0x1800d000 0 0x1000>;
-- 
2.18.0


