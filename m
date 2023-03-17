Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AB6C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 06:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9cstHFLJ+gx/qArsmu2CV4neaUdrgqVB6Ig+yYspwo=; b=NOe23oCwuG51oIGVW7ZfqdGQ4T
	/lqdoYji2QOKnQ64mMok5Bl7BmPGpYqaNyMhXBP66t8OMrquxtfnxFSY3fwY1aTcATo8RcZN9q8Bc
	IKmexPLx2MSf+OHgRs9k6N8FCeOhYOpV/7R/Rd1iMA8DjvC9/6iDGGhYbCsvMt5/Hl4Ygo86KeBIJ
	6OJeZHQxpLMNB3Xp65ITTSdwrBxv0WySCsLGKQKMPmRlf2IlR6h8JxzJlm2PHhkvHoBxRmqp1UlAz
	L25Mw9Q1FMq7eDHTwPn5V9BtOXs+34srv2fDxjWGz9DwA48HAnRsMFq38lfBZ7hZztucZ1xlUl35N
	X6BuKQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3HN-0018uN-2F;
	Fri, 17 Mar 2023 06:09:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3HK-0018tQ-2Q;
	Fri, 17 Mar 2023 06:09:28 +0000
X-UUID: 42934f9cc48a11ed86fbcd8805c7ac66-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Q9cstHFLJ+gx/qArsmu2CV4neaUdrgqVB6Ig+yYspwo=;
	b=RRb4M1Li/uRhaZKzLp/R/uPknDE0TGGbHR3bClFBxfPN3rit7VJgfrfhlMfpc7bx494u3RgHt/ywmEHLcpPsD58Wh8yBm77JR90P2/pxzOmAYYpa86MeyyOijQvr2Tsj224OQrWNKnfaCPFcGERqn8cZeNFJPdhmKc5quDTBE88=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:e2cb166c-c922-4cef-ae31-73eef9494c0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:83295aa,CLOUDID:854a16f6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 42934f9cc48a11ed86fbcd8805c7ac66-20230316
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1897077217; Thu, 16 Mar 2023 23:09:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 14:09:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 14:09:19 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 1/7] arm64: dts: mediatek: mt8186: Add MTU3 nodes
Date: Fri, 17 Mar 2023 14:09:11 +0800
Message-ID: <20230317060917.15175-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230317060917.15175-1-allen-kh.cheng@mediatek.com>
References: <20230317060917.15175-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_230926_794829_7929653D 
X-CRM114-Status: UNSURE (   9.77  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add MTU3 nodes for MT8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 68 ++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a0d3e1f731bd..178421fd8380 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -981,6 +981,40 @@
 			status = "disabled";
 		};
 
+		ssusb0: usb@11201000 {
+			compatible = "mediatek,mt8186-mtu3", "mediatek,mtu3";
+			reg = <0 0x11201000 0 0x2dff>, <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			clocks = <&topckgen CLK_TOP_USB_TOP>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
+				 <&infracfg_ao CLK_INFRA_AO_ICUSB>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			usb_host0: usb@11200000 {
+				compatible = "mediatek,mt8186-xhci", "mediatek,mtk-xhci";
+				reg = <0 0x11200000 0 0x1000>;
+				reg-names = "mac";
+				clocks = <&topckgen CLK_TOP_USB_TOP>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
+					 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
+				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+				interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
+				mediatek,syscon-wakeup = <&pericfg 0x420 2>;
+				wakeup-source;
+				status = "disabled";
+			};
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8186-mmc",
 				     "mediatek,mt8183-mmc";
@@ -1012,6 +1046,40 @@
 			status = "disabled";
 		};
 
+		ssusb1: usb@11281000 {
+			compatible = "mediatek,mt8186-mtu3", "mediatek,mtu3";
+			reg = <0 0x11281000 0 0x2dff>, <0 0x11283e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
+				 <&clk26m>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck";
+			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_TYPE_USB3>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB_P1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			usb_host1: usb@11280000 {
+				compatible = "mediatek,mt8186-xhci", "mediatek,mtk-xhci";
+				reg = <0 0x11280000 0 0x1000>;
+				reg-names = "mac";
+				clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
+					 <&clk26m>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>;
+				clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck","xhci_ck";
+				interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH 0>;
+				mediatek,syscon-wakeup = <&pericfg 0x424 2>;
+				wakeup-source;
+				status = "disabled";
+			};
+		};
+
 		u3phy0: t-phy@11c80000 {
 			compatible = "mediatek,mt8186-tphy",
 				     "mediatek,generic-tphy-v2";
-- 
2.18.0


