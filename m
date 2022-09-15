Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ED1ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHy/Gx3KYGknHMgZ5mq5VmWHIkd/JO3p2XkWakbWclY=; b=VETGaT7LIj+524CJiQExnPZod8
	yaFklOSjsa/6KI7BZNH8aFqfWH4x3jjmIrWLnC1kppA9tVpT/xRl8QuGVv7GKdhcVeghgMN1NFoTI
	2+FRKxTQkclInJnNfs3JwQ1Anrs0+GjGo3tQ3/2tuWrOBodi3eoe02I14sj54xUgRZCrTkmAl8xwQ
	+N4fdxu7MulHLf1sp+zx85uW6wZ8OabieQq550sDqqQWGlH09xN96gm6cnJrF/J7hrQmT4YvChvlV
	sgf+H5maEkfZ8qGWJFPeCydxHNf5pJc+ZcnboOknfbqP0WtaEDFaGCxTMkFHp4zUn5e267n59SRjJ
	HBzHvCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkoZ-004gDq-6o; Thu, 15 Sep 2022 09:05:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkoW-004g2A-LS; Thu, 15 Sep 2022 09:05:42 +0000
X-UUID: 0b95b33bbdc24d2b9799dc0661ed1851-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RHy/Gx3KYGknHMgZ5mq5VmWHIkd/JO3p2XkWakbWclY=;
	b=hfM5rf3FyAYDFq8pvvH/d5bRqgCCY7ZC5Tp4wLKKZP/s8iFc1P//jR+YK6pWoo4hY3PeBzZ2sxxPyU7v3RwwptPBr9BXweP1VYVPjLVyXcRn6gy9PFp2Jp3OYpHv0ZZE6Kc5rf2RQnqR185tIQ2pRVO2tVuTntCXeMiqybdqbZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1bd17549-5883-4cae-b0b8-a149168c5814,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:381fbc7b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0b95b33bbdc24d2b9799dc0661ed1851-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1905646642; Thu, 15 Sep 2022 01:59:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
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
Subject: [PATCH 1/4] arm64: dts: mt8195: Add dp-intf nodes
Date: Thu, 15 Sep 2022 15:58:46 +0800
Message-ID: <20220915075849.1920-2-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
References: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_020540_765642_3D796A39 
X-CRM114-Status: UNSURE (   8.89  )
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

Add dp-intf0 and dp-intf1 nodes for MT8195.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 905d1a90b406..93e6a106a9b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2155,5 +2155,28 @@
 			clock-names = "apb", "smi", "gals";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 		};
+
+		dp_intf0: dp-intf@1c015000 {
+			status = "disabled";
+			compatible = "mediatek,mt8195-dp-intf";
+			reg = <0 0x1c015000 0 0x1000>;
+			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0  CLK_VDO0_DP_INTF0>,
+				 <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
+			clock-names = "engine", "pixel", "pll";
+		};
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


