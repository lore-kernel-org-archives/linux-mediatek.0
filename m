Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C3FC433C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:56:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93ABD61A1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93ABD61A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UwP4fBsdz1JS0hXJTCyY9vLhal7eOOK1M5HyU0+cLqo=; b=CtHLKnonNMfVQL16Fe3poc/CA
	iywwRdH5zFLl9MzahCpfL8APx20vgZwN3YOnfPnMgmrnkxPrNMlCYRK305Zr6WZamyscPhvQgqA6O
	SaVwz9xxS50zBuGWrrTiktcg5opL8jvA4WybJFHA5b2KIZ5Q8wsK+SMnYIizzF0pJlobCCWa+Xrah
	sKcLYgdfiLgq3MQsU+q34qGVeE1COreL8zjh3DQb68LlM1H8LBXusixupP2sXdhtNYoFblRkpvBkM
	7aAuXonauVdDk6onXbT1eMeZugZ7G8TyYVzFZK8gDLfb9NdlsS628ti8MBRWoeaxne6iDEKyavt9R
	AiLxIyH+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPJur-000hNO-Uy; Thu, 25 Mar 2021 06:56:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPJtv-000hCp-V2; Thu, 25 Mar 2021 06:55:35 +0000
X-UUID: 22aa9524aeb84a368cb09bbb3cb76207-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bYHW2Rp9rIlDJdoijJ5W261r5AorIHKxkFNsaqDgJYI=; 
 b=uxs8nQI0rgK1zdciKh01vbm5mk1FTiEll+byN/5uOGGRJZR3zw/a8axDhqk8gnMMK1YoTcbKFrVsws565ZqsePL+ZQcDWe0UwDugGeFXmgTQK/9+D7fobx0bHU+o3sDUBI9X3Gj1inAmZQWYcTphIrWZ8jzZqbClXqrVNsfUKDo=;
X-UUID: 22aa9524aeb84a368cb09bbb3cb76207-20210324
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 414547756; Wed, 24 Mar 2021 22:55:13 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 23:55:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 14:55:09 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 14:55:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH RESEND v5 09/12] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
Date: Thu, 25 Mar 2021 14:54:55 +0800
Message-ID: <20210325065458.43363-9-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
References: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_065533_795009_DE247954 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jie Qiu <jie.qiu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cawa Cheng <cawa.cheng@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Harmonize node names, compatibles and properties.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4~v5: no changes
v3: remove property clock-names suggested by CK
v2: no changes
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 80519a145f13..8882d35ac6ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -880,7 +880,7 @@
 			ranges;
 			status = "disabled";
 
-			usb_host: xhci@11200000 {
+			usb_host: usb@11200000 {
 				compatible = "mediatek,mt8183-xhci",
 					     "mediatek,mtk-xhci";
 				reg = <0 0x11200000 0 0x1000>;
@@ -923,11 +923,10 @@
 			status = "disabled";
 		};
 
-		mipi_tx0: mipi-dphy@11e50000 {
+		mipi_tx0: dsi-phy@11e50000 {
 			compatible = "mediatek,mt8183-mipi-tx";
 			reg = <0 0x11e50000 0 0x1000>;
 			clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
-			clock-names = "ref_clk";
 			#clock-cells = <0>;
 			#phy-cells = <0>;
 			clock-output-names = "mipi_tx0_pll";
@@ -946,11 +945,10 @@
 			};
 		};
 
-		u3phy: usb-phy@11f40000 {
+		u3phy: t-phy@11f40000 {
 			compatible = "mediatek,mt8183-tphy",
 				     "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
-			#phy-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0 0x11f40000 0x1000>;
 			status = "okay";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
