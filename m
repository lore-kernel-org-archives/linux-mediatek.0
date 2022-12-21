Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB45C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WGKJaH848FGT7UtQn20Dr3WfdpVLLB256AUCWfX5JE0=; b=L6wCXLT0Q5JHkM2krVNFBqfgOY
	bwYWgI1VlLxmJxIeW8Nb7BFMRJH+xJnY+3Zmsj4CihVuBK+YI/lA1h+zMqN+xkZDr3c+04d6/lBPf
	LtseZIMChGQMv4rj6yYp6n1G14N+oJT51FqtxUBUwWg9DZYOkQqpTui8Iyk/WsjTrRY+i9lw8m6su
	6r7V5DUKjKP6zQUr0Ub/AN/Af1TC28S/iSoaLtcgyI/sP9s9mBOZimEIfDruT5oGBg6dI7HGMN32f
	7kBzAdzpBfDgh25HaAQ8AQCoBAgTdPx4usyFvCm7H+m+8ApbXMtDyUO8ZHE2zeiGNUMuUp746TOxr
	P3SS/75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7xB3-00E9p8-QC; Wed, 21 Dec 2022 11:22:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7x8Q-00E7zj-Qt; Wed, 21 Dec 2022 11:19:44 +0000
X-UUID: a83cb53c14d34379af55c6dd98f6f48c-20221221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WGKJaH848FGT7UtQn20Dr3WfdpVLLB256AUCWfX5JE0=;
	b=sTn9dEBbUF9nuUb0rDR930bfLu/TVD/R29ozestib63cxf/xmEletrmDRhUjxpSESBCmr3edJwn2Hbz8GsjcaJVCstoc+VUmDi6q7NS/7qOGhsGF84IQ4nacVOQLbvIFj/gF41zAYjgBP4xiRzyqiH0vflefkWr77sEwCo+2gPQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:7cee1965-d672-484d-b160-3b7ca2abe6c4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:0801018a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a83cb53c14d34379af55c6dd98f6f48c-20221221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1692097020; Wed, 21 Dec 2022 04:19:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 21 Dec 2022 18:48:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 21 Dec 2022 18:48:57 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH] arm64: dts: mediatek: mt8186: Add crypto support for eMMC controller
Date: Wed, 21 Dec 2022 18:48:56 +0800
Message-ID: <20221221104856.28770-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_031942_961186_BA055B0A 
X-CRM114-Status: GOOD (  10.74  )
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

For crypto support, add a crypto clock of the inline crypto engine and
expand the register size in the eMMC controller.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index c326aeb33a10..88b6191e1aa0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -662,12 +662,13 @@
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8186-mmc",
 				     "mediatek,mt8183-mmc";
-			reg = <0 0x11230000 0 0x1000>,
+			reg = <0 0x11230000 0 0x10000>,
 			      <0 0x11cd0000 0 0x1000>;
 			clocks = <&topckgen CLK_TOP_MSDC50_0>,
 				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
-				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>;
-			clock-names = "source", "hclk", "source_cg";
+				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>,
+				 <&infracfg_ao CLK_INFRA_AO_MSDCFDE>;
+			clock-names = "source", "hclk", "source_cg", "crypto";
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH 0>;
 			assigned-clocks = <&topckgen CLK_TOP_MSDC50_0>;
 			assigned-clock-parents = <&apmixedsys CLK_APMIXED_MSDCPLL>;
-- 
2.18.0


