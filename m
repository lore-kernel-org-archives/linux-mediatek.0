Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B41ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcfOR6rajSj1mr0bs/JuGWx4Do71T785IC8UO7uZz0I=; b=eg9lXq0+9rDzU8+eyiu16SDvoA
	NsR+NoF6qR7xKzx3y2SPPVle5j9l+YDmM2sK9iS3wI9QGHCH4V2zNu6+uhCerjVVGo8wHjD71SpvB
	Zq+kzb5R45QL0wezxPOE/BlrY0pEobtnyj9vD0VGZt0GCEMw7upe5C24LcEu7NfxuCPZir4xrhMhU
	b8G38M/rl0XMsILJ2getuxsfje9qlLdvgNRrgtIq/hN1NLGbbvbZfg5LV6jDuL1eCoEolmYNEkq28
	eeRvTGb6vqGVP7py0EADlz8ERYzAUSOB/PdJzlL5QaiAFgvC1Rj2Gi2zBC605e60lzyfP144IGY42
	c3H4MMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk5r-003aKW-G6; Thu, 15 Sep 2022 08:19:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk5n-003aCb-RP; Thu, 15 Sep 2022 08:19:29 +0000
X-UUID: 9828145ab0d440a1b6f5f2379bfdcf72-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VcfOR6rajSj1mr0bs/JuGWx4Do71T785IC8UO7uZz0I=;
	b=AcD7tLu0ShGC7C8f4It23LaKPc48WtFk6beVHKOUacQowJfeMVz7DcAmzcB3WGLsBrN0/W7Ztj1xJp10I3K/j19BVmQSKDDmePYh4O0dyh6fDfMhkU0Xr6ZlU2f2zwcXjTH+Ylhc33PEWe+g4wpuqLR7mP/6Gns1JM/2B25acbc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d6029e73-49cd-4c19-961c-d2102777a96e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:6754ba7b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9828145ab0d440a1b6f5f2379bfdcf72-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 403437641; Thu, 15 Sep 2022 01:19:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 15:58:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 15:58:50 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH 2/4] arm64: dts: mt8195: Add dptx nodes
Date: Thu, 15 Sep 2022 15:58:47 +0800
Message-ID: <20220915075849.1920-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
References: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_011927_932993_B7AE2E40 
X-CRM114-Status: UNSURE (   9.18  )
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

Add edptx and dptx nodes for MT8195.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 93e6a106a9b8..6f3f9bf3dc54 100644
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
+			status = "disabled";
+			compatible = "mediatek,mt8195-edp-tx";
+			reg = <0 0x1c500000 0 0x8000>;
+			nvmem-cells = <&dp_calibration>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+			max-linkrate-mhz = <8100>;
+		};
+
+		dp_tx: dp-tx@1c600000 {
+			compatible = "mediatek,mt8195-dp-tx";
+			reg = <0 0x1c600000 0 0x8000>;
+			nvmem-cells = <&dp_calibration>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+			status = "disabled";
+			max-linkrate-mhz = <8100>;
+		};
 	};
 };
-- 
2.18.0


