Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF600C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:23:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6981D64FAB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 09:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6981D64FAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g+bEcf5eA25WvaRM4r3NMk48zNk6eWNXymIGpTEbQE0=; b=DTfTfLX8D1r0CVJiZ0DnS3vmv
	PiJNGCnkrsu3mQl73ZjEc+bd5EQJcuJE6fwegKbK8f7lXJWqBfd6q654rXsKTqndcZEaM3thDVrd0
	uf9z2ACwhM+WZgEjvHNYQX4gxfh2EsWNQAH78XrbGjRYwKWTAud4+fG89QoyDLIJofKYOercduy/F
	+lzBsTjvaH+gSAkQHSBmu/0ycXAgA2YC3ZSoQLb2JxYlpGK5PqCowh+e7ong6yHRDWC5diXeEXn/W
	d7WQkfuHHiF8iOfIvG7AmcYhYpgc3s3NAauNy58JX6e5KYC3focOx9Ar1crGjc7UTde7wrM9XhRyM
	N2z32iQ9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM5vU-000Ezz-DY; Tue, 16 Mar 2021 09:23:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM5uZ-000EiN-89; Tue, 16 Mar 2021 09:22:49 +0000
X-UUID: 2ba87d3e56484339a5b63e595da403c6-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3UTCYc4dhqq1rZwBooiLgBskdhkaQse7PQfbsMjZXGs=; 
 b=hItxoO5UUtlcOj4eUCvIrv49HTv6Jk9Ng5+ziRM+O7vRWO6FgQbra1eud3W8AKfHE+e172bZCSoacjSq3MQT4lg2DFT5BKj8OpHxOjhaUFWOskyLv/bhV03yChz+flVCojwNHrisBlnyTXj46anKH5MM8wVdmAJ3o0cJzsWQ5ME=;
X-UUID: 2ba87d3e56484339a5b63e595da403c6-20210316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 161525821; Tue, 16 Mar 2021 01:22:36 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 02:22:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 17:22:34 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 17:22:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jie
 Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Cawa Cheng
 <cawa.cheng@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH v5 07/13] arm64: dts: mediatek: mt2712: harmonize node names
Date: Tue, 16 Mar 2021 17:22:26 +0800
Message-ID: <20210316092232.9806-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_092248_212812_FD8C0D9D 
X-CRM114-Status: UNSURE (   9.98  )
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

This is used to fix dtbs_check warning.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v5: no changes
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index db17d0a4ed57..a9cca9c146fd 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -805,7 +805,7 @@
 		ranges;
 		status = "disabled";
 
-		usb_host0: xhci@11270000 {
+		usb_host0: usb@11270000 {
 			compatible = "mediatek,mt2712-xhci",
 				     "mediatek,mtk-xhci";
 			reg = <0 0x11270000 0 0x1000>;
@@ -818,7 +818,7 @@
 		};
 	};
 
-	u3phy0: usb-phy@11290000 {
+	u3phy0: t-phy@11290000 {
 		compatible = "mediatek,mt2712-tphy",
 			     "mediatek,generic-tphy-v2";
 		#address-cells = <1>;
@@ -869,7 +869,7 @@
 		ranges;
 		status = "disabled";
 
-		usb_host1: xhci@112c0000 {
+		usb_host1: usb@112c0000 {
 			compatible = "mediatek,mt2712-xhci",
 				     "mediatek,mtk-xhci";
 			reg = <0 0x112c0000 0 0x1000>;
@@ -882,7 +882,7 @@
 		};
 	};
 
-	u3phy1: usb-phy@112e0000 {
+	u3phy1: t-phy@112e0000 {
 		compatible = "mediatek,mt2712-tphy",
 			     "mediatek,generic-tphy-v2";
 		#address-cells = <1>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
