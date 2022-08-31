Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB20ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 07:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zZjVZDQq7+xjRP70G/4mz1/Tz13+LwwewsQB5MYr1aY=; b=prLCAvBRfkSsnJwm+vUFdgHWaP
	fVDRmdBkSC/TNgSzI2lJBWlCUO/GhA7iOqsciPS0uKucQziF3NdXqqS5eLu6M3H01Q3Ip+mWK8piT
	2NxU3ErWi5ZgGMtKIQ7tNCCK9p604mnwxJnDqGESEco9UdEqdQ0SJCVCQRPcbfdw1gdqctjC98fh5
	AYrq5d296EheUEp7IugTGq75s2vB6qCsUi9ynIFgOeMZt4xlUY1emUlIjEcFLSiGNZuAVkg3oYIJv
	Yrvq7BhgW4X8vtVFry1emD04uGAJK4e60IOxOHcmV/0AuQGPif+d80Cu6fshvORlWiAnAGQNv/UyO
	Leldpj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTHu1-004X3D-DV; Wed, 31 Aug 2022 07:12:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTHtz-004X1k-DO; Wed, 31 Aug 2022 07:12:44 +0000
X-UUID: 814b09cb4d214bceab0bf49b2af80b9c-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zZjVZDQq7+xjRP70G/4mz1/Tz13+LwwewsQB5MYr1aY=;
	b=iU6zAe7w96O5/yok5Htj3g2Bc/sr8POkgi7lISwBVQufTXXgd2rWiF7MyFZBKf6E1+irrk+wpekJ7CIijyhyI9MCYr/44Hq3Bdwxdiwk1PmUfiLythwNmfZR49ShJDX3/UQ+Fre4eu0OeSgRmFgmDHKtK0atAT1hw1miUlYb+k8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:6b73bca4-9da9-4237-8c08-35664c8f7752,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:bc381f56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 814b09cb4d214bceab0bf49b2af80b9c-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1104804494; Wed, 31 Aug 2022 00:12:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 31 Aug 2022 14:51:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Aug 2022 14:51:57 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1] arm64: dts: mediatek: Fix build warnings of mt8173 vcodec nodes
Date: Wed, 31 Aug 2022 14:51:00 +0800
Message-ID: <20220831065100.27722-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_001243_475898_7B496B7B 
X-CRM114-Status: GOOD (  11.50  )
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

Correct the phandle of power domain node referenced by vcodec nodes.

arch/arm64/boot/dts/mediatek/mt8173.dtsi:1450.35-1471.5: Warning (power_domains_property): /soc/vcodec@18002000: Missing property '#power-domain-cells' in node /soc/syscon@10006000 or bad phandle (referred from power-domains[0])
arch/arm64/boot/dts/mediatek/mt8173.dtsi:1502.35-1522.5: Warning (power_domains_property): /soc/vcodec@19002000: Missing property '#power-domain-cells' in node /soc/syscon@10006000 or bad phandle (referred from power-domains[0])

Fixes: d3dfd4688574 ("arm64: dts: mediatek: Update mt81xx scpsys node to align with dt-bindings")
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index b4d48f8b7eeb..7640b5158ff9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1467,7 +1467,7 @@
 			clock-names = "venc_sel";
 			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
 			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
-			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
+			power-domains = <&spm MT8173_POWER_DOMAIN_VENC>;
 		};
 
 		jpegdec: jpegdec@18004000 {
@@ -1518,7 +1518,7 @@
 			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
 			assigned-clock-parents =
 				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
-			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC_LT>;
+			power-domains = <&spm MT8173_POWER_DOMAIN_VENC_LT>;
 		};
 	};
 };
-- 
2.18.0


