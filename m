Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCE2ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 02:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNoZT8GHmsYXrwIBJ4X7UKKmHGPDl6GG2bXgSJSl9OY=; b=Tcgu3ZRzFHtuRBd9XmGlaJ4Zwi
	MgmcF56OYmPZ9izJ8av3eo9l0xfQwCzCVX4aM2NRGEp+fgUWwoN0ZdIcQWX6aNttWrLoc5phSKY/1
	6+oTneftyLgjMMTanwjUCEB5CEZ9GtsGwmaMmiT+nRtlCpUTJ+OkSmck5yW8rJdPnqM8cZUckCUMU
	jg2ME+UlM2NnLbijNFCfw+B2cBj1EcMwPqmEFTVrMHORKeNNwB//uGIkOEObAlVDpv10/3nQWXU+U
	vQY5LpBDXFY0fADDDIOryAkvDf/q+8bKLzqV89pru5BlDpGHL42r5VspK7HW0D4ZNWtLpBZ2Sg5Bb
	TIfBsHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ1Tw-0062qw-KW; Fri, 16 Sep 2022 02:53:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ1Tt-0062qD-TO; Fri, 16 Sep 2022 02:53:31 +0000
X-UUID: 9845ad9c199347d5b63b2a4832c9025f-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oNoZT8GHmsYXrwIBJ4X7UKKmHGPDl6GG2bXgSJSl9OY=;
	b=UoriI0uAU24ILb9nfJUnXzbLRlzx1qwg2tEqt5bjkStwZATwX58J157Df0RfOzPeIgw0Y5BqEES/cnB9N8Zj0v+QyS2QCIhXr4O7Ucfik6bEE0WifukrQUfCXEEj3nThUwPDWlw20gK0jb/8mhl0Jg5lS3Ws0vZooYK24ifXuuI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:6b711bef-880f-45d9-897e-fc32f44ef519,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:ad5ed17b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9845ad9c199347d5b63b2a4832c9025f-20220915
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1134366767; Thu, 15 Sep 2022 19:51:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 10:51:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 10:51:00 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v3 2/4] arm64: dts: mt8195: Add edptx and dptx nodes
Date: Fri, 16 Sep 2022 10:50:57 +0800
Message-ID: <20220916025059.16673-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220916025059.16673-1-rex-bc.chen@mediatek.com>
References: <20220916025059.16673-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_195329_975559_699C484E 
X-CRM114-Status: GOOD (  10.65  )
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
index 82d28e9f60c3..83567d90ede6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1241,6 +1241,9 @@
 				reg = <0x189 0x2>;
 				bits = <7 5>;
 			};
+			dp_calibration: dp-data@1ac {
+				reg = <0x1ac 0x10>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
@@ -2178,5 +2181,27 @@
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


