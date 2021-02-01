Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E42C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:01:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00F5664E2B
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00F5664E2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R//qfmcxQ7xYMQEniSWwpw4iST13z8EkEn0Lp+R9QaU=; b=qoEt4j2Qfk6/epiGtPTfLjN63
	ExOdtKlCIG0LqSBNB0/rIJFKf+OrnzmYcDjai6lXNYJGOXRZBOejfWZ7ScPDrxCTd/R/EZyjr424X
	i27MYQXd79KP5XRMrxILpkaGQfY0nET3aykAWw2xPnZAjy7u4nxXEGdCpS3/iG6f0JtWyR7V7d7n6
	ggbdjy0liHTz7Wx44M5EHQsjJ8U9HT0z0vnS/gok0PtA0e0uswydzFvVGylHdvu9Wsboi5Jk7PDRB
	Po15buT7bJ8oeHzQO37vBEucmLYiRkNbMPhEUIVTzcZAQXGvjQg6fXy8qv5YTkeMQnzY6A+bTylDM
	MQPdefqMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6TCg-0001kD-31; Mon, 01 Feb 2021 07:00:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6TCX-0001fh-Co; Mon, 01 Feb 2021 07:00:46 +0000
X-UUID: b5806eafb4b543508f698dd01081f44a-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qDw4GBA9704tU+M/WrZeB3VuuWS9efZKLKktS42howg=; 
 b=b2JD3sECeFl7e3gmu4/j9uK4kfuJd5OsIJ2QPTnGr8Gtwtm1zvtb7Hg5qm3b3l1VFw2P1v8QJ8qAxJyLTPNM3d9X1H/zPvMCwLzOE54FFBIqV0yr1FOwOFJM5T1nmWbMoVAriH4q++FPV7yJUENHTgjBgJv4FhMahV2/zdb/gjA=;
X-UUID: b5806eafb4b543508f698dd01081f44a-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 512325133; Sun, 31 Jan 2021 23:00:39 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 23:00:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 15:00:29 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Feb 2021 15:00:29 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH next v3 11/16] arm64: dts: mediatek: mt8516: harmonize node
 names and compatibles
Date: Mon, 1 Feb 2021 15:00:11 +0800
Message-ID: <20210201070016.41721-11-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3662852F8D2C464972E1EE201EE433F3D59FF052CF324EF051CCF9FBD3570A472000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_020045_607442_40877495 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is used to fix dtbs_check warning:
  harmonize node names and compatibles;
  add property "usb-role-switch" for connector dependence.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi         | 9 +++++----
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index e6e4d9d60094..70c9c7423bd4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -450,7 +450,7 @@
 		};
 
 		usb0: usb@11100000 {
-			compatible = "mediatek,mtk-musb";
+			compatible = "mediatek,mt8516-musb", "mediatek,mtk-musb";
 			reg = <0 0x11100000 0 0x1000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "mc";
@@ -463,7 +463,7 @@
 		};
 
 		usb1: usb@11190000 {
-			compatible = "mediatek,mtk-musb";
+			compatible = "mediatek,mt8516-musb", "mediatek,mtk-musb";
 			reg = <0 0x11190000 0 0x1000>;
 			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "mc";
@@ -476,8 +476,9 @@
 			status = "disabled";
 		};
 
-		usb_phy: usb@11110000 {
-			compatible = "mediatek,generic-tphy-v1";
+		usb_phy: t-phy@11110000 {
+			compatible = "mediatek,mt8516-tphy",
+				     "mediatek,generic-tphy-v1";
 			reg = <0 0x11110000 0 0x800>;
 			#address-cells = <2>;
 			#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 63fd70086bb8..7d738f01cf8d 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -188,6 +188,7 @@
 &usb0 {
 	status = "okay";
 	dr_mode = "peripheral";
+	usb-role-switch;
 
 	usb_con: connector {
 		compatible = "usb-c-connector";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
