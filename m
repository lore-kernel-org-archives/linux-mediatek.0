Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D81DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 07:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7zkDnaWEabyE5XdwVr4ccYWpjzTXOcJn5mpauaL9LQ=; b=pltpjT1bS4gQTEVDokdEN8FLjn
	gJdEqKSowRxyRMoDmz1t1YiMAGZi3ygqjd9jZe/15Sb6wjigza6xCGYMbc0F5VXS/wDMh32TTeHBH
	6qc+y/8Qi7u41kR22hLV+UixhM90PPBSBN5Ld5FBcN7kLYGES9ixbaL4e8MPZ9s8KlA8/+WlKcPKg
	1RNHTOqd7UxfTQedRFIlBWrm9jgCLzvPIgFJbZ+S0MjYkPUzJc+eV+XRlsCpqRBTOyv0vfzDEbVpX
	h+y/0DBSO50PrNKG54KPxsLGFgITouwM9c/X9LNnFil9r0hEv4oMmrfgwxELwctLq37DsZDA/DzMG
	rpD/Pmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1p1-003l1V-Oe; Thu, 10 Nov 2022 07:17:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1oz-003l0u-5w; Thu, 10 Nov 2022 07:17:58 +0000
X-UUID: 48fcc215a1ac429981f9d5e7ee18d9ea-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=d7zkDnaWEabyE5XdwVr4ccYWpjzTXOcJn5mpauaL9LQ=;
	b=eS+UP88zr6TB3FWCnaXYoj/F6JJavvVbvhcUzv2BzB5myEz8Op2N3A/LR/ec9+KeDufd8gCvmX7DTPexRKRW77B8FDM8as+40pnyXvmoO/mKudAJbp/5CQCmoe/he/dF15Zvn9qR+a0Eh9TpV8XhdnPSgWH3oYcMhnZ4nWxNcCA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:1f1849f0-40ad-4b21-a654-8d2524abbb95,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:645ee450-b7af-492d-8b40-b1032f90ce11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 48fcc215a1ac429981f9d5e7ee18d9ea-20221110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 933040154; Thu, 10 Nov 2022 00:17:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 14:37:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 14:37:18 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v4 2/4] arm64: dts: mt8195: Add edptx and dptx nodes
Date: Thu, 10 Nov 2022 14:37:14 +0800
Message-ID: <20221110063716.25677-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
References: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_231757_249420_8B2289F3 
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

In MT8195, we use edptx as the internal display interface and use
dptx as the external display interface. Therefore, we need to add
these nodes to support the internal display and the external display.

- Add dp calibration data in the efuse node.
- Add edptx and dptx nodes for MT8195.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index c380738d10cb..7acbef5a4517 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1244,6 +1244,9 @@
 				reg = <0x189 0x2>;
 				bits = <7 5>;
 			};
+			dp_calibration: dp-data@1ac {
+				reg = <0x1ac 0x10>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
@@ -2205,5 +2208,27 @@
 			clock-names = "engine", "pixel", "pll";
 			status = "disabled";
 		};
+
+		edp_tx: edp-tx@1c500000 {
+			compatible = "mediatek,mt8195-edp-tx";
+			reg = <0 0x1c500000 0 0x8000>;
+			nvmem-cells = <&dp_calibration>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+			max-linkrate-mhz = <8100>;
+			status = "disabled";
+		};
+
+		dp_tx: dp-tx@1c600000 {
+			compatible = "mediatek,mt8195-dp-tx";
+			reg = <0 0x1c600000 0 0x8000>;
+			nvmem-cells = <&dp_calibration>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+			max-linkrate-mhz = <8100>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.18.0


