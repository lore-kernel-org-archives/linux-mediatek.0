Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3698CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:56:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D489C61A12
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D489C61A12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g+bEcf5eA25WvaRM4r3NMk48zNk6eWNXymIGpTEbQE0=; b=LwchcoYQjRf61pRnO4ZBUoK+M
	PrYomWCID9x4W2dh+1TKsr7WPIM7sgbDBtmcepiLcfTqjmmr0iwqmHvg+ZmvjdljzGyw2uVEU6Tkh
	gLuIgpKco3fDAuDTB/B4g3NwHXtfTh3ujvyzoYwQX2DWfGDtWg62bKwfyDD7RrWi71kqb4Pa027Du
	x7AqZv7k1sG1xwVU75iY09SG8Zh6vDoHmjvphpNFKmNf0lAwbMdJLHhd5n71/U0QWB78AIFLE/dzb
	LUAeNDSleBV9az0n6iQFJQgLnUfFTBOxDmIKEr+d0SdxDuEAR4UV+RVl5/BV/hjmhyqKz6EtDTRvA
	brN20/HuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPJuo-000hMQ-MD; Thu, 25 Mar 2021 06:56:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPJts-000hCb-S2; Thu, 25 Mar 2021 06:55:33 +0000
X-UUID: 737155769a3449fcac4de3b85d8dbe76-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3UTCYc4dhqq1rZwBooiLgBskdhkaQse7PQfbsMjZXGs=; 
 b=Hg6wGjPc2sg/f1r9nwubCRt51WsYzx7xMbQsuCJ9olpqALjWe1PWcx3wXFy2IYCGAzMZ0BjFV2YFm+nI9yrXM0uxOQD31F17dQCxvOxhHZ/4HK5tntUu3QIDqYWHk2W56e9kJ5Rr5wCvdBUyfaNaq4YzMuHyJ4t+PVSMkUuVeIM=;
X-UUID: 737155769a3449fcac4de3b85d8dbe76-20210324
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 566901641; Wed, 24 Mar 2021 22:55:11 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 23:55:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 14:55:09 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 14:55:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH RESEND v5 06/12] arm64: dts: mediatek: mt2712: harmonize node
 names
Date: Thu, 25 Mar 2021 14:54:52 +0800
Message-ID: <20210325065458.43363-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
References: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_065528_914644_FD2005AF 
X-CRM114-Status: GOOD (  10.50  )
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
