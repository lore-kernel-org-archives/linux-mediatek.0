Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC296C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2OvrTgxMHaRA0nmQ9ju1U2yltzrBZPdX0xC6X5B1FY=; b=GPkkrQr0SJgwSXFJ8ZOSgKZzeZ
	lwVa57CnqxVLQhOTgVPH8rDZxkUg0pNxjqpzSfCUKUgj/Pi+lfhmPuq+2m0xBtPjKsJLFRez9vy9s
	viModslyr7iGSNbyjlWHseKr7n2hbgRxhhM3w8g9k87QJn2gmGvDlbFCA0cO2nyv57gaX4dYqBZ1l
	4Q7L2uvf/HylgFlsPKzcJ6tVrI9J/uJYgA9kbd2dQxxkwZgeZRh13f/Jf4BYPtEMKEK4TP2sPMQXp
	Q8MiARa0EckkyEQq0OEqJBChRaZ67qyXLk8hv7H4jfYV7Y33jtAGvYfmSy6ctmCPakgJr0RtIfCZO
	HYiff19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KKc-007oHX-FL; Mon, 04 Jul 2022 11:33:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Jsl-007Qio-WB; Mon, 04 Jul 2022 11:04:49 +0000
X-UUID: 8172f62e7dae44e186847b5c857ade41-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ed251e40-2757-48d1-b650-44f8010a3239,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:eb947f86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8172f62e7dae44e186847b5c857ade41-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 969088788; Mon, 04 Jul 2022 04:04:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 4 Jul 2022 18:00:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 4 Jul 2022 18:00:31 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Enric
 Balletbo i Serra <enric.balletbo@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Trevor Wu
	<trevor.wu@mediatek.com>
Subject: [PATCH v1 13/16] arm64: dts: mt8195: Specify audio reset controller
Date: Mon, 4 Jul 2022 18:00:25 +0800
Message-ID: <20220704100028.19932-14-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220704100028.19932-1-tinghan.shen@mediatek.com>
References: <20220704100028.19932-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_040448_086401_077A7F4B 
X-CRM114-Status: GOOD (  10.25  )
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

From: Trevor Wu <trevor.wu@mediatek.com>

Specify audio reset controller for audio hardware resetting.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 0e5614108c12..618fb2fa195a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -681,6 +681,7 @@
 				     "mediatek,mt6589-wdt";
 			mediatek,disable-extrst;
 			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
 		};
 
 		apmixedsys: syscon@1000c000 {
@@ -783,6 +784,8 @@
 			mediatek,topckgen = <&topckgen>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
 			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
+			resets = <&watchdog 14>;
+			reset-names = "audiosys";
 			clocks = <&clk26m>,
 				<&apmixedsys CLK_APMIXED_APLL1>,
 				<&apmixedsys CLK_APMIXED_APLL2>,
-- 
2.18.0


