Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A21C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:07:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046FA23A56
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046FA23A56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RDqTr5T6Z8CvvbeyOOBa1+j+9FBLNEy5eLAZaiEfL3E=; b=DYycH+HKKnGzEGemQ76dnrhKT
	j7Dc5ma/k/JZ1d7gttgCP1P3myqZcwWBYuNxnnEwUyAb7nUhm5p62M+6yuUvXxWvkCfwKxSmvzuPo
	Hooewq5qgMTVjl/XC2jsYlQ/oQuYKHWg9eCKybYvSFNE1m+oHDh6YqOU379DaM5tF7oqepKbpTpte
	mBAvudjCqjpnK8vIyyA8xRi/2rX4yF7qYGCF648I2qKV086jhk+WmsFzgkBAHwwoZs9tW731YZso/
	Q3on5eX/HVykboE+f5fW7Nfoks9LeeHLnhlwmQwDGr904O4loIJgCihQrTgpS1VYnax7ARF5dF1iL
	vlK7Zu/Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0hYH-0007z8-Bq; Sat, 16 Jan 2021 09:07:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0hY8-0007v7-PU; Sat, 16 Jan 2021 09:07:14 +0000
X-UUID: d1fe694714e64fe2af0a4fe7ab5837d4-20210116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GB0vtQkEwWei9wzY+9h3r46wLRGJpP/EuhOhHmCWvRU=; 
 b=sTt+8dLHST/yoHKCrRhIVjcKnGtAAs5CbWM8QCC5o0CPoYuYDLjTf91zbPqe44pzHRAR+/6C7HmACF/Jm8sd6yYU00b3CRfrF3wlapH7K172T/Cj/F9DbY66rGGhWOWYbrr9nuD7LGMvJt5brE6QgWhrs1WkHsMxjvZ4Ulve6sE=;
X-UUID: d1fe694714e64fe2af0a4fe7ab5837d4-20210116
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 361810085; Sat, 16 Jan 2021 01:07:07 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 01:07:05 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 17:07:02 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Jan 2021 17:07:02 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH next 12/15] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
Date: Sat, 16 Jan 2021 17:06:53 +0800
Message-ID: <20210116090656.11752-12-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 642A46D8C21FEDB3D30977DFECD18F391399E364FD2873F15A35EB1082F3ED5E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_040713_056564_79FE1F42 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Harmonize node names, compatibles and properties.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7..a69a033a68ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -865,7 +865,7 @@
 			ranges;
 			status = "disabled";
 
-			usb_host: xhci@11200000 {
+			usb_host: usb@11200000 {
 				compatible = "mediatek,mt8183-xhci",
 					     "mediatek,mtk-xhci";
 				reg = <0 0x11200000 0 0x1000>;
@@ -908,11 +908,11 @@
 			status = "disabled";
 		};
 
-		mipi_tx0: mipi-dphy@11e50000 {
+		mipi_tx0: dsi-phy@11e50000 {
 			compatible = "mediatek,mt8183-mipi-tx";
 			reg = <0 0x11e50000 0 0x1000>;
 			clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
-			clock-names = "ref_clk";
+			clock-names = "ref";
 			#clock-cells = <0>;
 			#phy-cells = <0>;
 			clock-output-names = "mipi_tx0_pll";
@@ -931,11 +931,10 @@
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
