Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6ECC43217
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYNsu3+YhsLdxa/TdV8zExfZobnqiPHL5UL2NPZZAqU=; b=zV3M2FwUOoJlrlA2hdpz8Kx4wU
	zKo8cjDn3oUWL7dANgfcGrYHFWq9FxjlEnluyAcXqSggYcKDDcbXQU1CTU6r7+knCmyi5rNza28Ku
	MF2yYs7qCrP//CiDY18ES7CMJOejbGPcNLQGj/4s37jh8c8Xt55MbLHyl8pSU7uo5V1+QfhF6+UkP
	KnpKuNXq9ARgM0pryfxMCcenlgSvn1sXBhL/XOPlDiPmcGhHcnVYLk4GwlZLk+VChL9EWSfW3kb1t
	y/qXbDQzsakL2ntf4VbKxKa0JTgVi8O1+WrGnn4mzM6uifeeAuThJdeEuxAHs8wkjSXA2bJoFQ6zE
	l0XJoJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1CQ-003QkK-T2; Thu, 10 Nov 2022 06:38:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1CO-003QRg-8W; Thu, 10 Nov 2022 06:38:06 +0000
X-UUID: a798eb1377d644d0a10c464476a66e91-20221109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IYNsu3+YhsLdxa/TdV8zExfZobnqiPHL5UL2NPZZAqU=;
	b=YImq3n3hByXXLCJE79wAdUBeJXRNslKfuWyZiU0Yhz56pGZfe6ktluQcsUQYJNOZ9JSgY+wq9ErYcvZMLXS09af7XOo2Q0WOpg9re4otSaueCrQibWsK5vKokwS/KSGr0vgOGhke92EuRYeViY4JDKUWxaN/vCZLiogqvAplE8w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:37972fc3-b089-488f-bf14-204835d24c7b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:ce17e350-b7af-492d-8b40-b1032f90ce11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a798eb1377d644d0a10c464476a66e91-20221109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1951660712; Wed, 09 Nov 2022 23:37:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
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
Subject: [PATCH v4 1/4] arm64: dts: mt8195: Add dp-intf nodes
Date: Thu, 10 Nov 2022 14:37:13 +0800
Message-ID: <20221110063716.25677-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
References: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_223804_319719_E937260F 
X-CRM114-Status: UNSURE (   8.69  )
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

Dp-intfs provide the pixel data to edptx and dptx. To support edptx
and dptx, we need to add dp-intf0 and dp-intf1 nodes.

Dp-intf0 is for edptx and dp-intf1 is for dptx.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 2edfc21ece56..c380738d10cb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2094,6 +2094,17 @@
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0x4000 0x1000>;
 		};
 
+		dp_intf0: dp-intf@1c015000 {
+			compatible = "mediatek,mt8195-dp-intf";
+			reg = <0 0x1c015000 0 0x1000>;
+			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0  CLK_VDO0_DP_INTF0>,
+				 <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
+			clock-names = "engine", "pixel", "pll";
+			status = "disabled";
+		};
+
 		mutex: mutex@1c016000 {
 			compatible = "mediatek,mt8195-disp-mutex";
 			reg = <0 0x1c016000 0 0x1000>;
@@ -2182,5 +2193,17 @@
 			clock-names = "apb", "smi", "gals";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 		};
+
+		dp_intf1: dp-intf@1c113000 {
+			compatible = "mediatek,mt8195-dp-intf";
+			reg = <0 0x1c113000 0 0x1000>;
+			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
+				 <&vdosys1 CLK_VDO1_DPINTF>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
+			clock-names = "engine", "pixel", "pll";
+			status = "disabled";
+		};
 	};
 };
-- 
2.18.0


