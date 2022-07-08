Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41928C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 02:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGnTDyLqcRlRRAHUyi/0cvcM36jbffpxahjDD6PTpbM=; b=nszBpooCHXjxREjWGFSo70Vw+D
	YVpNIeESwgjUWX1uTFGUId6bmlDcVZ2n2hmt/hS6tZg1v+TnHgTx/UhTST8vFbSEesrBuA1q8i0nl
	TbkVnsh2extqpzVfKniuAaFG7VlzEOdNiSFhAYG9Giy638P1/a4Zy+jtCHIgDAMC7Rv5qHzR9SKaD
	Jy41WPGsSC6n8pOR6Ga5Oe2eZxyh2E0kyi8GaJBXxAq7+8OPzBxogbfGW4TnwQKgqLhPrM03MUwOq
	zVrUrWzjP6LwH/I5FSg0MZMKHeT/QEYWFIM0w3Kff9V3C7/p5t5hobcmTx/uGrbVj6obeq+eNwo+N
	dlQBOr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9drL-001N6b-8f; Fri, 08 Jul 2022 02:36:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9drI-001N5q-Lu; Fri, 08 Jul 2022 02:36:45 +0000
X-UUID: 247f20e550b94c2f91f3a939f6d56b6e-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3053433e-6a3b-4d4f-8315-7ac127a220cf,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:3211ba63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 247f20e550b94c2f91f3a939f6d56b6e-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 264574561; Thu, 07 Jul 2022 19:36:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 10:16:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 10:16:03 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bin.zhang@mediatek.com>,
	<benliang.zhao@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH V3 1/2] arm64: dts: mt8173: Fix nor_flash node
Date: Fri, 8 Jul 2022 10:15:47 +0800
Message-ID: <20220708021548.21453-2-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220708021548.21453-1-xiangsheng.hou@mediatek.com>
References: <20220708021548.21453-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_193644_792763_CE2B9849 
X-CRM114-Status: GOOD (  10.02  )
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

Add axi clock since the driver change to DMA mode which need
to enable axi clock. And change spi clock to 26MHz as default.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 40d7b47fc52e..e603170100af 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -790,9 +790,12 @@ thermal: thermal@1100b000 {
 		nor_flash: spi@1100d000 {
 			compatible = "mediatek,mt8173-nor";
 			reg = <0 0x1100d000 0 0xe0>;
+			assigned-clocks = <&topckgen CLK_TOP_SPI_SEL>;
+			assigned-clock-parents = <&clk26m>;
 			clocks = <&pericfg CLK_PERI_SPI>,
-				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
-			clock-names = "spi", "sf";
+				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>,
+				 <&pericfg CLK_PERI_NFI>;
+			clock-names = "spi", "sf", "axi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.25.1


