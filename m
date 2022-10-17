Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA102C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 08:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ju2bHe3ERXn+3+rnay8a7hEfKCPJnttPMhhc5R1MVGc=; b=Ky+Fb21L1bLYReWfkUEF22GWN/
	azyb+VCUOU7iZMFgfxfjwPG0fv6ybTbrW5ZybPGqP9DLVQH+4Qa5u3jyBzPHxxrP1ij0sLnwyF+OM
	IEEkmD/RNb9xbtWz1OrGGvRnkJQAntNnTPuK6moBi/vnGZX0AhnhjPrViHKHEJ6YZ6WB6qzXkkveN
	0ou64KPOtYBXJEcC5i6xoHASbV6xeYdKGVLYBBGnanwXChquP6QzpCCTeKQZLoWgjsi+TXP3aGoWH
	3Fhl8KdiBW+v2VZ2IcJSi7Nw6qLVT3S1zuqDlJijNMLrMBnGvMIQ0/7C3/gKhi0fIIYLGg2lTm2ah
	T/mtM1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okL2X-008m6y-Ou; Mon, 17 Oct 2022 08:00:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okL2I-008liA-Bo; Mon, 17 Oct 2022 07:59:47 +0000
X-UUID: edcb50b5e4974282a42df99c73852322-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ju2bHe3ERXn+3+rnay8a7hEfKCPJnttPMhhc5R1MVGc=;
	b=BCFtOKeXiX8junMda5TBZ5MIz2/U4tKL7PaQEF+RDpN7HQrUaJdNoLDkUebx+SYsP19rMgmAn6UQfJR/43AnNIM2+9S9R5RgQNu66iAtfnqMtHrh6a+6GA7AYjYiiraGWMk2vT9IffS+XHIna3392XSFrXJeP9vECU+dhIduo5E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:18a43901-06be-43c9-a82a-a7c3a2f192bb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:247100a4-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: edcb50b5e4974282a42df99c73852322-20221017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2050672069; Mon, 17 Oct 2022 00:59:38 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 17 Oct 2022 15:09:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 17 Oct 2022 15:09:00 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
Subject: [PATCH v1 2/3] arm64: dts: mt8195: Add pcie and pcie phy nodes
Date: Mon, 17 Oct 2022 15:08:57 +0800
Message-ID: <20221017070858.13902-3-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221017070858.13902-1-tinghan.shen@mediatek.com>
References: <20221017070858.13902-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_005946_440911_DF5AF987 
X-CRM114-Status: GOOD (  10.98  )
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

Add pcie and pcie phy nodes for mt8195.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 143 +++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index d03f0c2b8233..903e92d6156f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1182,6 +1182,104 @@
 			status = "disabled";
 		};
 
+		pcie0: pcie@112f0000 {
+			compatible = "mediatek,mt8195-pcie",
+				     "mediatek,mt8192-pcie";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			reg = <0 0x112f0000 0 0x4000>;
+			reg-names = "pcie-mac";
+			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>;
+			bus-range = <0x00 0xff>;
+			ranges = <0x81000000 0 0x20000000
+				  0x0 0x20000000 0 0x200000>,
+				 <0x82000000 0 0x20200000
+				  0x0 0x20200000 0 0x3e00000>;
+
+			iommu-map = <0 &iommu_infra IOMMU_PORT_INFRA_PCIE0 0x2>;
+			iommu-map-mask = <0x0>;
+
+			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P0>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_26M>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_32K>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
+				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
+			clock-names = "pl_250m", "tl_26m", "tl_96m",
+				      "tl_32k", "peri_26m", "peri_mem";
+			assigned-clocks = <&topckgen CLK_TOP_TL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4_D4>;
+
+			phys = <&pciephy>;
+			phy-names = "pcie-phy";
+
+			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+					<0 0 0 2 &pcie_intc0 1>,
+					<0 0 0 3 &pcie_intc0 2>,
+					<0 0 0 4 &pcie_intc0 3>;
+			status = "disabled";
+
+			pcie_intc0: interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		pcie1: pcie@112f8000 {
+			compatible = "mediatek,mt8195-pcie",
+				     "mediatek,mt8192-pcie";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			reg = <0 0x112f8000 0 0x4000>;
+			reg-names = "pcie-mac";
+			interrupts = <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH 0>;
+			bus-range = <0x00 0xff>;
+			ranges = <0x81000000 0 0x24000000
+				  0x0 0x24000000 0 0x200000>,
+				 <0x82000000 0 0x24200000
+				  0x0 0x24200000 0 0x3e00000>;
+
+			iommu-map = <0 &iommu_infra IOMMU_PORT_INFRA_PCIE1 0x2>;
+			iommu-map-mask = <0x0>;
+
+			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P1>,
+				 <&clk26m>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
+				 <&clk26m>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
+				 /* Designer has connect pcie1 with peri_mem_p0 clock */
+				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
+			clock-names = "pl_250m", "tl_26m", "tl_96m",
+				      "tl_32k", "peri_26m", "peri_mem";
+			assigned-clocks = <&topckgen CLK_TOP_TL_P1>;
+			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4_D4>;
+
+			phys = <&u3port1 PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+			status = "disabled";
+
+			pcie_intc1: interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+			};
+		};
+
 		nor_flash: spi@1132c000 {
 			compatible = "mediatek,mt8195-nor",
 				     "mediatek,mt8173-nor";
@@ -1241,6 +1339,34 @@
 				reg = <0x189 0x2>;
 				bits = <7 5>;
 			};
+			pciephy_rx_ln1: pciephy-rx-ln1@190 {
+				reg = <0x190 0x1>;
+				bits = <0 4>;
+			};
+			pciephy_tx_ln1_nmos: pciephy-tx-ln1-nmos@190 {
+				reg = <0x190 0x1>;
+				bits = <4 4>;
+			};
+			pciephy_tx_ln1_pmos: pciephy-tx-ln1-pmos@191 {
+				reg = <0x191 0x1>;
+				bits = <0 4>;
+			};
+			pciephy_rx_ln0: pciephy-rx-ln0@191 {
+				reg = <0x191 0x1>;
+				bits = <4 4>;
+			};
+			pciephy_tx_ln0_nmos: pciephy-tx-ln0-nmos@192 {
+				reg = <0x192 0x1>;
+				bits = <0 4>;
+			};
+			pciephy_tx_ln0_pmos: pciephy-tx-ln0-pmos@192 {
+				reg = <0x192 0x1>;
+				bits = <4 4>;
+			};
+			pciephy_glb_intr: pciephy-glb-intr@193 {
+				reg = <0x193 0x1>;
+				bits = <0 4>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
@@ -1461,6 +1587,23 @@
 			};
 		};
 
+		pciephy: phy@11e80000 {
+			compatible = "mediatek,mt8195-pcie-phy";
+			reg = <0 0x11e80000 0 0x10000>;
+			reg-names = "sif";
+			nvmem-cells = <&pciephy_glb_intr>, <&pciephy_tx_ln0_pmos>,
+				      <&pciephy_tx_ln0_nmos>, <&pciephy_rx_ln0>,
+				      <&pciephy_tx_ln1_pmos>, <&pciephy_tx_ln1_nmos>,
+				      <&pciephy_rx_ln1>;
+			nvmem-cell-names = "glb_intr", "tx_ln0_pmos",
+					   "tx_ln0_nmos", "rx_ln0",
+					   "tx_ln1_pmos", "tx_ln1_nmos",
+					   "rx_ln1";
+			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_PHY>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		ufsphy: ufs-phy@11fa0000 {
 			compatible = "mediatek,mt8195-ufsphy", "mediatek,mt8183-ufsphy";
 			reg = <0 0x11fa0000 0 0xc000>;
-- 
2.18.0


