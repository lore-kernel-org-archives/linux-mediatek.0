Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E33C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 04:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSbci8oLxveaD6T77U4iEvv4tXH1CAkZgWX2D7CS0Uk=; b=n/RlQdPzRvGNeu
	KN7Uysejh47pwTflm8Q/NNgN9seb+QxAfQVZt8eHbpQ/jcRIyJN2sn5oXHqxvIJhhPfA5QLqMamzQ
	BBY2l+318S2RoUTQ/vX/y0KOdBFWGuLvNB+S6kesJ3nbHjuTf6qul3xquTam36J6jWAPAs/kC0VYG
	OmV3xKyxca75OhDDC/dxIts4uDOhlvVbGqD5tiU75RDKIVuU1eaNFch8A0dl6zx9MoOLEVj5nbRMR
	vj6xLc6IaeUH48MRABoZwwdkngy9rywgij2xBk4bE9TAxXL8dxWPt2G7lLBhzpJlzOQRsKjUlEs3m
	MvKAIx+TFGPWI261ZhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhO0S-00BNYx-5q; Thu, 21 Apr 2022 04:01:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhO0P-00BNXz-SB; Thu, 21 Apr 2022 04:01:23 +0000
X-UUID: 1f96c50da40a4f5b91ce61fd032d9372-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:bdf34134-784f-4e69-8f43-82d4b5f6cf72, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:4f296ef0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 1f96c50da40a4f5b91ce61fd032d9372-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1030311151; Wed, 20 Apr 2022 21:01:18 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 20:51:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 11:51:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Apr 2022 11:51:15 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 "Irui Wang" <irui.wang@mediatek.com>
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8173: Add power domain to encoder
 nodes
Date: Thu, 21 Apr 2022 11:51:10 +0800
Message-ID: <20220421035111.7267-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
References: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_210121_940447_75A01102 
X-CRM114-Status: GOOD (  11.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The power of encoder is not control by mediatek,larb, so we add
power domain to encoder nodes for mt8173 SoC.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 10291b2690ab..eebc2d074254 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1470,6 +1470,7 @@
 			clock-names = "venc_sel";
 			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
 			assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
 		};
 
 		jpegdec: jpegdec@18004000 {
@@ -1520,6 +1521,7 @@
 			assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
 			assigned-clock-parents =
 				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC_LT>;
 		};
 	};
 };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
