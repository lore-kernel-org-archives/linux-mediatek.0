Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C921C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:24:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1407B610C8
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1407B610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDiYnIwUFUwYUGQmaGCQs8BYYCgvYcLOiYUu7LgSOBk=; b=v5iOGO4q+ImqZq
	b3Ra5z4O9i03XBEQunvjS9vQYHE6nCeH48EnAa6w3wD55hnzdjEBASokkKsXQtbvbQGikVur1nbs2
	MivcJR7/cQv+FKSTe4cdoEChL+zgZb6U87C482pSakIYCTA31FwmE6gSHGaKDZ6QgcM6p33wIL239
	jMjm12nJZWOMGf7DftuRjTRkjYFOt4GLa5ZDmCxyZoWiamRLAADK7tTmfe3rxqlk/QOJJ8Dnje1iU
	eE/WUCMuHYWRr1Kd52qDyIegYT24iTkLazmrlYHQrVvLHVYq2awwUeGuzeif9xZ6pYdNZzt3LTh/B
	uCGrplSNfDkVJKJQB3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGXP-0037jc-1O; Tue, 15 Jun 2021 21:23:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvk-001lHo-4G; Tue, 15 Jun 2021 17:32:55 +0000
X-UUID: 4fbf76e76f41415da9e183eb3aa8a9e0-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZjFxtqKxcPx8R0PPeyG9mM3OZmJ564pDHQxaeqIW9qg=; 
 b=BlhuuQd+2j9yRA92/VqJYvrtxfQRQtUsLE+8z8UttATyJ/k0dSVWRkD+NnWDpnEwO+4o6cPoKcKwl1WHUKNMIIdCZL0ply26IH/zqmkN9j49lbv/TBPiUVU2ehzssha30Cv7gds/SzSxrLEumRvCUt9RGJOiQHthNyOX2GM/o4M=;
X-UUID: 4fbf76e76f41415da9e183eb3aa8a9e0-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 29144393; Tue, 15 Jun 2021 10:32:46 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:43 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>
Subject: [PATCH 07/27] arm64: dts: mt8195: add power domains controller
Date: Wed, 16 Jun 2021 01:32:13 +0800
Message-ID: <20210615173233.26682-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103252_321194_1513A76D 
X-CRM114-Status: GOOD (  11.29  )
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

From: Weiyi Lu <weiyi.lu@mediatek.com>

Add power domains controller node for SoC mt8195

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 364 +++++++++++++++++++++++
 1 file changed, 364 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 7946a13fcbc3..5463e7ba1061 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+#include <dt-bindings/power/mt8195-power.h>
 #include <dt-bindings/reset/ti-syscon.h>
 
 / {
@@ -317,6 +318,369 @@
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
+					clocks = <&topckgen CLK_TOP_SENINF_SEL>,
+						 <&topckgen CLK_TOP_SENINF2_SEL>;
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
+					clocks = <&topckgen CLK_TOP_ADSP_SEL>;
+					clock-names = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT8195_POWER_DOMAIN_AUDIO {
+						reg = <MT8195_POWER_DOMAIN_AUDIO>;
+						clocks = <&topckgen CLK_TOP_A1SYS_HP_SEL>,
+							 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+							 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS_SEL>,
+							 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
+						clock-names = "audio", "audio1", "audio2",
+							      "audio3";
+						mediatek,infracfg = <&infracfg_ao>;
+						#power-domain-cells = <0>;
+					};
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_AUDIO_ASRC {
+					reg = <MT8195_POWER_DOMAIN_AUDIO_ASRC>;
+					clocks = <&topckgen CLK_TOP_AUDIO_LOCAL_BUS_SEL>,
+						 <&topckgen CLK_TOP_ASM_L_SEL>,
+						 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
+					clock-names = "audio_asrc", "audio_asrc1", "audio_asrc2";
+					mediatek,infracfg = <&infracfg_ao>;
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_NNA {
+					reg = <MT8195_POWER_DOMAIN_NNA>;
+					clocks = <&topckgen CLK_TOP_NNA0_SEL>;
+					clock-names = "nna";
+					mediatek,infracfg = <&infracfg_ao>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT8195_POWER_DOMAIN_NNA0 {
+						reg = <MT8195_POWER_DOMAIN_NNA0>;
+						mediatek,infracfg = <&infracfg_ao>;
+						#power-domain-cells = <0>;
+					};
+
+					power-domain@MT8195_POWER_DOMAIN_NNA1 {
+						reg = <MT8195_POWER_DOMAIN_NNA1>;
+						mediatek,infracfg = <&infracfg_ao>;
+						#power-domain-cells = <0>;
+					};
+				};
+
+				power-domain@MT8195_POWER_DOMAIN_MFG0 {
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
+					clocks = <&topckgen CLK_TOP_VPP_SEL>,
+						 <&topckgen CLK_TOP_CAM_SEL>,
+						 <&topckgen CLK_TOP_CCU_SEL>,
+						 <&topckgen CLK_TOP_IMG_SEL>,
+						 <&topckgen CLK_TOP_VENC_SEL>,
+						 <&topckgen CLK_TOP_VDEC_SEL>,
+						 <&topckgen CLK_TOP_WPE_VPP_SEL>,
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
+								clocks = <&topckgen CLK_TOP_HDMI_APB_SEL>;
+								clock-names = "hdmi_tx";
+								#power-domain-cells = <0>;
+							};
+
+							power-domain@MT8195_POWER_DOMAIN_HDMI_RX {
+								reg = <MT8195_POWER_DOMAIN_HDMI_RX>;
+								clocks = <&topckgen CLK_TOP_HDMI_APB_SEL>;
+								clock-names = "hdmi_rx";
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
+								clocks = <&topckgen CLK_TOP_IPE_SEL>,
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
+			};
+		};
+
 		watchdog: watchdog@10007000 {
 			compatible = "mediatek,mt8195-wdt", "mediatek,mt6589-wdt";
 			reg = <0 0x10007000 0 0x100>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
