Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8015C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGnTDyLqcRlRRAHUyi/0cvcM36jbffpxahjDD6PTpbM=; b=Vy7e9iY5ybokmHqBgj5kDZbTzj
	Oix4XRevSkqfE5wDKOSh5sA+5ZnJgU9pyO8nvbY7rFULzrbxSmXKu6N1Gor+caAPcuIynAy3EseAi
	ACV7VFt4BR7V0C4eI+tqk6yiUSZbO9r+7wT8vTRAAZt0Tz8emrK/SFSxa35a3GcOBYxOGroktUY0O
	aKWnkfSOPJ2bvHR+5THneQFMTkdQ0fMfdC5dae4QkN7mX1+lOPbHMnEgxP0wN6+khiXycHwf0KT2j
	9JuvA+HraqyzmRoiU2MDOzdJ+g58gb32jr6TXTgX8RoQNqnvZ+6uMPYXqiHoNBDfe2zZLo7smf9T6
	lhtz1/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6q4j-00G8lQ-Cs; Thu, 30 Jun 2022 09:03:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6q4e-00G8jo-Eu; Thu, 30 Jun 2022 09:02:59 +0000
X-UUID: 6d6f61899ff64e689ad3b0cc7a3751ff-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:e40d1f65-09d2-4e30-ac76-207e44af50fb,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:8b263fd6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6d6f61899ff64e689ad3b0cc7a3751ff-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1583833956; Thu, 30 Jun 2022 02:02:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Jun 2022 17:02:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jun 2022 17:02:29 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bin.zhang@mediatek.com>,
	<benliang.zhao@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH v2 1/2] arm64: dts: mt8173: Fix nor_flash node
Date: Thu, 30 Jun 2022 17:01:56 +0800
Message-ID: <20220630090157.29486-2-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
References: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_020256_542850_BB741FBA 
X-CRM114-Status: UNSURE (   9.28  )
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


