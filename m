Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2962C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CCE860FEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CCE860FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DVzMTnkGULrAeAj8eSasvMAVaJYmkcvklt9n1R6ip8=; b=ODZhDQ4lVooKau
	LNFGGyc+lVCET/5ncgRLc5cG04nErrL0yEM8jm0gZUuMHqsBHfELQUk3k1bB9UIPtBqSWIkh0JSYH
	G+7psGE1HQh3SzIaumTxF3jHLJlHINoYfB52xYNDDvgz9d03tcLavmQFx5yZvVnoOjlc2aPYXD90s
	YtT4f7Jo4uiXoh8s2/IWryqgThkKQXkZ3bHz1AINYxFdKXJe30Un79s+fmkj265vwn4b6pRPbJ2TX
	7xX+e3v2NIXCxUd2AEJvhggP6L/kJJNmYZrU0ZTkpSSS/fq/WaB72h1k6u2ByV0b6XHcMVidiMqdk
	gTMXBRpf2XXOV74PMu/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGWD-0037Gv-RY; Tue, 15 Jun 2021 21:22:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvl-001lI9-RJ; Tue, 15 Jun 2021 17:32:55 +0000
X-UUID: 1a15d828fb25412e9dc22ce739d19ce1-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=a63t5JoNyZF8khZ1I1BxsUvV86RUm4Bq/cs3MIwYb84=; 
 b=VRyrt/mjmVdYFlvx5aFMlakFO76/kyDHTgrvv1DPQ7fWRDlFpMZECqVMPZ0NzX19O3U4WxKZM5iLX4v44PYGNYT4+eZT2Vua+q2J4X1rBQ7IxvUhO/qVyBFY6RpJwy1CeTbjhKJXEktyvSOrES4MY613fczT6G+JuLCqXln5/qs=;
X-UUID: 1a15d828fb25412e9dc22ce739d19ce1-20210615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1779114777; Tue, 15 Jun 2021 10:32:48 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:44 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>
Subject: [PATCH 12/27] arm64: dts: mt8195: fix mmc driver
Date: Wed, 16 Jun 2021 01:32:18 +0800
Message-ID: <20210615173233.26682-12-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103253_944348_48B6FFFA 
X-CRM114-Status: UNSURE (   9.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Wenbin Mei <wenbin.mei@mediatek.com>

fix mmc driver with proper clock for mt8195 SoC.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 539f405a4f3d..327ff1b856d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -926,22 +926,32 @@
 		};
 
 		mmc0: mmc@11230000 {
-			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
+			compatible = "mediatek,mt8195-mmc",
+				     "mediatek,mt8192-mmc",
+				     "mediatek,mt8183-mmc";
 			reg = <0 0x11230000 0 0x10000>,
 			      <0 0x11f50000 0 0x1000>;
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
+				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>;
 			clock-names = "source", "hclk", "source_cg";
 			status = "disabled";
 		};
 
 		mmc1: mmc@11240000 {
-			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
+			compatible = "mediatek,mt8195-mmc",
+				     "mediatek,mt8192-mmc",
+				     "mediatek,mt8183-mmc";
 			reg = <0 0x11240000 0 0x1000>,
 			      <0 0x11c70000 0 0x1000>;
 			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
+				 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
 			clock-names = "source", "hclk", "source_cg";
+			assigned-clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
 			status = "disabled";
 		};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
