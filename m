Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D824ACCA479
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jg/2w7XOAJ79UdA1End6OkPh1F1rShINl8J6JY8XCdQ=; b=Qkwt2e/4n78awAxl/ZKBvmeA7R
	EBKD3a6wSy/jUe88Idk/xNhPJOTR1xoUC2pIyrbg4BTN+eJhp3TFMDk87ZT7FRb4SfDGZQpX6tJMN
	3QHDPEwZcvA+z6bTJEg9a7JZjG8oUimhDVHdbp5L/HpFUm7cglMye5+qCA64Dd5QOzHFf+fHCybiy
	l/bhuARIKS/8xGze9BpRRbJCebAL4Sa2hMw0sHdb18W5c/BHR+mtqmO44akcqrvJNMchwCXaxz4Mi
	40hw094ptiWhIpqXCX1Wrg9q57w28nZ/wbydQlXvgKzjD7bGgR0et96ebD0pzXvYbcltiQJqOrY7b
	5fm3N+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Iu7-006id5-Gk; Mon, 04 Jul 2022 10:02:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Isk-006haX-3z; Mon, 04 Jul 2022 10:00:44 +0000
X-UUID: 76ec7ab62f64437dbf2324ffba857054-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ae15373f-4510-417f-993b-0a6f85dc1384,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:7dd78dd6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 76ec7ab62f64437dbf2324ffba857054-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 328058521; Mon, 04 Jul 2022 03:00:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 4 Jul 2022 18:00:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 4 Jul 2022 18:00:30 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 08/16] arm64: dts: mt8195: Add power domains controller
Date: Mon, 4 Jul 2022 18:00:20 +0800
Message-ID: <20220704100028.19932-9-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220704100028.19932-1-tinghan.shen@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_030042_261488_A21573AF 
X-CRM114-Status: GOOD (  12.24  )
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

Add power domains controller node for mt8195.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 327 +++++++++++++++++++++++
 1 file changed, 327 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8d59a7da3271..d52e140d9271 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+#include <dt-bindings/power/mt8195-power.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -338,6 +339,332 @@
 			#interrupt-cells = <2>;
 		};
 
+		scpsys: syscon@10006000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x10006000 0 0x1000>;
+			#power-domain-cells = <1>;
+
+			/* System Power Manager */
+			spm: power-controller {
+				compatible = "mediatek,mt8195-power-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#power-domain-cells = <1>;
+
+				/* power domain of the SoC */
+				mfg0: power-domain@MT8195_POWER_DOMAIN_MFG0 {
+					reg = <MT8195_POWER_DOMAIN_MFG0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT8195_POWER_DOMAIN_MFG1 {
+						reg = <MT8195_POWER_DOMAIN_MFG1>;
+						clocks = <&apmixedsys CLK_APMIXED_MFGPLL>;
+						clock-names = "mfg";
+						mediatek,infracfg = <&infracfg_ao>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						power-domain@MT8195_POWER_DOMAIN_MFG2 {
+							reg = <MT8195_POWER_DOMAIN_MFG2>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_MFG3 {
+							reg = <MT8195_POWER_DOMAIN_MFG3>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_MFG4 {
+							reg = <MT8195_POWER_DOMAIN_MFG4>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_MFG5 {
+							reg = <MT8195_POWER_DOMAIN_MFG5>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_MFG6 {
+							reg = <MT8195_POWER_DOMAIN_MFG6>;
+							#power-domain-cells = <0>;
+						};
+					};
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_VPPSYS0 {
+					reg = <MT8195_POWER_DOMAIN_VPPSYS0>;
+					clocks = <&topckgen CLK_TOP_VPP>,
+						 <&topckgen CLK_TOP_CAM>,
+						 <&topckgen CLK_TOP_CCU>,
+						 <&topckgen CLK_TOP_IMG>,
+						 <&topckgen CLK_TOP_VENC>,
+						 <&topckgen CLK_TOP_VDEC>,
+						 <&topckgen CLK_TOP_WPE_VPP>,
+						 <&topckgen CLK_TOP_CFG_VPP0>,
+						 <&vppsys0 CLK_VPP0_SMI_COMMON>,
+						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB0>,
+						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB1>,
+						 <&vppsys0 CLK_VPP0_GALS_VENCSYS>,
+						 <&vppsys0 CLK_VPP0_GALS_VENCSYS_CORE1>,
+						 <&vppsys0 CLK_VPP0_GALS_INFRA>,
+						 <&vppsys0 CLK_VPP0_GALS_CAMSYS>,
+						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB5>,
+						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB6>,
+						 <&vppsys0 CLK_VPP0_SMI_REORDER>,
+						 <&vppsys0 CLK_VPP0_SMI_IOMMU>,
+						 <&vppsys0 CLK_VPP0_GALS_IMGSYS_CAMSYS>,
+						 <&vppsys0 CLK_VPP0_GALS_EMI0_EMI1>,
+						 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>,
+						 <&vppsys0 CLK_VPP0_SMI_RSI>,
+						 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
+						 <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
+						 <&vppsys0 CLK_VPP0_GALS_VPP1_WPE>,
+						 <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
+					clock-names = "vppsys", "vppsys1", "vppsys2", "vppsys3",
+						      "vppsys4", "vppsys5", "vppsys6", "vppsys7",
+						      "vppsys0-0", "vppsys0-1", "vppsys0-2", "vppsys0-3",
+						      "vppsys0-4", "vppsys0-5", "vppsys0-6", "vppsys0-7",
+						      "vppsys0-8", "vppsys0-9", "vppsys0-10", "vppsys0-11",
+						      "vppsys0-12", "vppsys0-13", "vppsys0-14",
+						      "vppsys0-15", "vppsys0-16", "vppsys0-17",
+						      "vppsys0-18";
+					mediatek,infracfg = <&infracfg_ao>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT8195_POWER_DOMAIN_VDEC1 {
+						reg = <MT8195_POWER_DOMAIN_VDEC1>;
+						clocks = <&vdecsys CLK_VDEC_LARB1>;
+						clock-names = "vdec1-0";
+						mediatek,infracfg = <&infracfg_ao>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8195_POWER_DOMAIN_VENC_CORE1 {
+						reg = <MT8195_POWER_DOMAIN_VENC_CORE1>;
+						mediatek,infracfg = <&infracfg_ao>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8195_POWER_DOMAIN_VDOSYS0 {
+						reg = <MT8195_POWER_DOMAIN_VDOSYS0>;
+						clocks = <&topckgen CLK_TOP_CFG_VDO0>,
+							 <&vdosys0 CLK_VDO0_SMI_GALS>,
+							 <&vdosys0 CLK_VDO0_SMI_COMMON>,
+							 <&vdosys0 CLK_VDO0_SMI_EMI>,
+							 <&vdosys0 CLK_VDO0_SMI_IOMMU>,
+							 <&vdosys0 CLK_VDO0_SMI_LARB>,
+							 <&vdosys0 CLK_VDO0_SMI_RSI>;
+						clock-names = "vdosys0", "vdosys0-0", "vdosys0-1",
+							      "vdosys0-2", "vdosys0-3",
+							      "vdosys0-4", "vdosys0-5";
+						mediatek,infracfg = <&infracfg_ao>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						power-domain@MT8195_POWER_DOMAIN_VPPSYS1 {
+							reg = <MT8195_POWER_DOMAIN_VPPSYS1>;
+							clocks = <&topckgen CLK_TOP_CFG_VPP1>,
+								 <&vppsys1 CLK_VPP1_VPPSYS1_GALS>,
+								 <&vppsys1 CLK_VPP1_VPPSYS1_LARB>;
+							clock-names = "vppsys1", "vppsys1-0",
+								      "vppsys1-1";
+							mediatek,infracfg = <&infracfg_ao>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_WPESYS {
+							reg = <MT8195_POWER_DOMAIN_WPESYS>;
+							clocks = <&wpesys CLK_WPE_SMI_LARB7>,
+								 <&wpesys CLK_WPE_SMI_LARB8>,
+								 <&wpesys CLK_WPE_SMI_LARB7_P>,
+								 <&wpesys CLK_WPE_SMI_LARB8_P>;
+							clock-names = "wepsys-0", "wepsys-1", "wepsys-2",
+								      "wepsys-3";
+							mediatek,infracfg = <&infracfg_ao>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_VDEC0 {
+							reg = <MT8195_POWER_DOMAIN_VDEC0>;
+							clocks = <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
+							clock-names = "vdec0-0";
+							mediatek,infracfg = <&infracfg_ao>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_VDEC2 {
+							reg = <MT8195_POWER_DOMAIN_VDEC2>;
+							clocks = <&vdecsys_core1 CLK_VDEC_CORE1_LARB1>;
+							clock-names = "vdec2-0";
+							mediatek,infracfg = <&infracfg_ao>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_VENC {
+							reg = <MT8195_POWER_DOMAIN_VENC>;
+							mediatek,infracfg = <&infracfg_ao>;
+							#power-domain-cells = <0>;
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_VDOSYS1 {
+							reg = <MT8195_POWER_DOMAIN_VDOSYS1>;
+							clocks = <&topckgen CLK_TOP_CFG_VDO1>,
+								 <&vdosys1 CLK_VDO1_SMI_LARB2>,
+								 <&vdosys1 CLK_VDO1_SMI_LARB3>,
+								 <&vdosys1 CLK_VDO1_GALS>;
+							clock-names = "vdosys1", "vdosys1-0",
+								      "vdosys1-1", "vdosys1-2";
+							mediatek,infracfg = <&infracfg_ao>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#power-domain-cells = <1>;
+
+							power-domain@MT8195_POWER_DOMAIN_DP_TX {
+								reg = <MT8195_POWER_DOMAIN_DP_TX>;
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
+
+							power-domain@MT8195_POWER_DOMAIN_EPD_TX {
+								reg = <MT8195_POWER_DOMAIN_EPD_TX>;
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
+
+							power-domain@MT8195_POWER_DOMAIN_HDMI_TX {
+								reg = <MT8195_POWER_DOMAIN_HDMI_TX>;
+								clocks = <&topckgen CLK_TOP_HDMI_APB>;
+								clock-names = "hdmi_tx";
+								#power-domain-cells = <0>;
+							};
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_IMG {
+							reg = <MT8195_POWER_DOMAIN_IMG>;
+							clocks = <&imgsys CLK_IMG_LARB9>,
+								 <&imgsys CLK_IMG_GALS>;
+							clock-names = "img-0", "img-1";
+							mediatek,infracfg = <&infracfg_ao>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#power-domain-cells = <1>;
+
+							power-domain@MT8195_POWER_DOMAIN_DIP {
+								reg = <MT8195_POWER_DOMAIN_DIP>;
+								#power-domain-cells = <0>;
+							};
+
+							power-domain@MT8195_POWER_DOMAIN_IPE {
+								reg = <MT8195_POWER_DOMAIN_IPE>;
+								clocks = <&topckgen CLK_TOP_IPE>,
+									 <&imgsys CLK_IMG_IPE>,
+									 <&ipesys CLK_IPE_SMI_LARB12>;
+								clock-names = "ipe", "ipe-0", "ipe-1";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
+						};
+
+						power-domain@MT8195_POWER_DOMAIN_CAM {
+							reg = <MT8195_POWER_DOMAIN_CAM>;
+							clocks = <&camsys CLK_CAM_LARB13>,
+								 <&camsys CLK_CAM_LARB14>,
+								 <&camsys CLK_CAM_CAM2MM0_GALS>,
+								 <&camsys CLK_CAM_CAM2MM1_GALS>,
+								 <&camsys CLK_CAM_CAM2SYS_GALS>;
+							clock-names = "cam-0", "cam-1", "cam-2", "cam-3",
+								      "cam-4";
+							mediatek,infracfg = <&infracfg_ao>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#power-domain-cells = <1>;
+
+							power-domain@MT8195_POWER_DOMAIN_CAM_RAWA {
+								reg = <MT8195_POWER_DOMAIN_CAM_RAWA>;
+								#power-domain-cells = <0>;
+							};
+
+							power-domain@MT8195_POWER_DOMAIN_CAM_RAWB {
+								reg = <MT8195_POWER_DOMAIN_CAM_RAWB>;
+								#power-domain-cells = <0>;
+							};
+
+							power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
+								reg = <MT8195_POWER_DOMAIN_CAM_MRAW>;
+								#power-domain-cells = <0>;
+							};
+						};
+					};
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P0 {
+					reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
+					mediatek,infracfg = <&infracfg_ao>;
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P1 {
+					reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
+					mediatek,infracfg = <&infracfg_ao>;
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_PCIE_PHY {
+					reg = <MT8195_POWER_DOMAIN_PCIE_PHY>;
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY {
+					reg = <MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_CSI_RX_TOP {
+					reg = <MT8195_POWER_DOMAIN_CSI_RX_TOP>;
+					clocks = <&topckgen CLK_TOP_SENINF>,
+						 <&topckgen CLK_TOP_SENINF2>;
+					clock-names = "csi_rx_top", "csi_rx_top1";
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_ETHER {
+					reg = <MT8195_POWER_DOMAIN_ETHER>;
+					clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
+					clock-names = "ether";
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_ADSP {
+					reg = <MT8195_POWER_DOMAIN_ADSP>;
+					clocks = <&topckgen CLK_TOP_ADSP>,
+						 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>;
+					clock-names = "adsp", "adsp1";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					mediatek,infracfg = <&infracfg_ao>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT8195_POWER_DOMAIN_AUDIO {
+						reg = <MT8195_POWER_DOMAIN_AUDIO>;
+						clocks = <&topckgen CLK_TOP_A1SYS_HP>,
+							 <&topckgen CLK_TOP_AUD_INTBUS>,
+							 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
+							 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
+						clock-names = "audio", "audio1", "audio2",
+							      "audio3";
+						mediatek,infracfg = <&infracfg_ao>;
+						#power-domain-cells = <0>;
+					};
+				};
+			};
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8195-wdt",
 				     "mediatek,mt6589-wdt";
-- 
2.18.0


