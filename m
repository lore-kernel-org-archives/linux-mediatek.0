Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C34C6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 13:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAepj9xDcBT7+/oknT8+PQeRJWAYHEbCWQjHMWNe4Ek=; b=m+d3F5Gowz9TkGS/FcktSvqe4Y
	89ZgHYWBJAlM/3AMLuB69+N+zbn9SW/VJ8c1/LcIBZEDh5Bq2rMuFCC6heLiZ5cNqksZPid7mJPpX
	FAk4w0y8aXfHuX9t02DBZF5VnIQOJLI2pSddpUNXYUU5o3aNYiC/xF1qkPLn8t1R1FNya7dhQeiH+
	4iImUKCwpcAu7S0gc68wIHpmxe2gH5uZ+dfZ1koAryKYwTvMhvMPrK2hvlz6Pt1DIsdDt4/2l4dfl
	SdcbxwlbXp4necTy9zdKdL/px5RMo7yILasfa5eyR+iTFuCtKG/XGzDID+M89CMqsYoUn3wLNPIHc
	qMrwllOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obiTN-004OpD-QT; Fri, 23 Sep 2022 13:12:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obiTK-004Onm-Sg; Fri, 23 Sep 2022 13:12:04 +0000
X-UUID: bbee998e03534e179f8e9f3aaf0fef68-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EAepj9xDcBT7+/oknT8+PQeRJWAYHEbCWQjHMWNe4Ek=;
	b=QNV7a1kvMWpCrE7N8pvgb7kDENIMR3cOLbAXMpSlMHLU9Jys71VXWVvWU0KGDX3jPnzHHGMTpqfTdS4R7rqL2ohnVWYrQp2haWq0ujUhLooBwxgLAF4b8ZuRcBcgaRuIE22lNuK32WyNWtWrWs4IfEjbLvSirEsdMAoj7yIwC9U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e68c1f8d-065a-40c0-a37d-4c98e90140e7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:da23dea2-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: bbee998e03534e179f8e9f3aaf0fef68-20220923
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1168558017; Fri, 23 Sep 2022 06:11:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 21:11:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 21:11:53 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 5/5] arm64: dts: mt8186: Add xhci nodes
Date: Fri, 23 Sep 2022 21:11:48 +0800
Message-ID: <20220923131148.6678-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
References: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_061202_969390_11E55638 
X-CRM114-Status: UNSURE (   9.73  )
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

Add xhci nodes for mt8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index c6809fdc7d15..b08af431e525 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -845,6 +845,26 @@
 			status = "disabled";
 		};
 
+		xhci0: usb@11200000 {
+			compatible = "mediatek,mt8186-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x1000>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>;
+			clocks = <&topckgen CLK_TOP_USB_TOP>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_REF>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_HCLK>,
+				 <&infracfg_ao CLK_INFRA_AO_ICUSB>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB>;
+			mediatek,syscon-wakeup = <&pericfg 0x420 2>;
+			wakeup-source;
+			status = "disabled";
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8186-mmc",
 				     "mediatek,mt8183-mmc";
@@ -875,6 +895,27 @@
 			status = "disabled";
 		};
 
+		xhci1: usb@11280000 {
+			compatible = "mediatek,mt8186-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11280000 0 0x1000>,
+			      <0 0x11283e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port1 PHY_TYPE_USB2>,
+			       <&u3port1 PHY_TYPE_USB3>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_SYS>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_REF>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_HCLK>,
+				 <&clk26m>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_TOP_P1_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck","xhci_ck";
+			power-domains = <&spm MT8186_POWER_DOMAIN_SSUSB_P1>;
+			mediatek,syscon-wakeup = <&pericfg 0x424 2>;
+			wakeup-source;
+			status = "disabled";
+		};
+
 		u3phy0: t-phy@11c80000 {
 			compatible = "mediatek,mt8186-tphy",
 				     "mediatek,generic-tphy-v2";
-- 
2.18.0


