Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93AFC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:56:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A58461A12
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 06:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A58461A12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x2TdWQXStDYp3i7Mafy7GoCkgp6fvjo8MML+wDSCNoo=; b=TjiyvEKJctZ+Ag62/TS2qHD/i
	Pq9Xn5A/xm5hhI9PdzEuyPFY+qeFOumffZF50/f+0zjVFUDt9tu088gBRPJbo+R+DNEMFP/HyMX5l
	Qb8id8/pe8gtHTClNPD2GW5ZTCz897oZYZquw6wp8xy4dPoaPbkfk6zMVtM8I2uCJ7dHUUT71k+b7
	3YhWU5I2G0J2eJm6qN4udoKkoegMgcEANMjEvd7SUGv/jRq4AO5QCEgX5FFn6jnWboLuOnzCL+ACl
	l9S0AsnBAmIoTXQ2kkJiwleBzAfBWKkP1mW7M3/rAqd27HbHU5V9EGiBbIKWCpHskAitUehxsT/W2
	UECBmGVYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPJuq-000hMy-Hv; Thu, 25 Mar 2021 06:56:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPJtv-000hCw-Qh; Thu, 25 Mar 2021 06:55:35 +0000
X-UUID: 80eeb395b19d484bb3a6b9afb3b1980f-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qZ3S15NB5fEKE/IMDHnre38xGhczSfZogXwNwZ7ob/0=; 
 b=LGVa5AOjFrGiOFWjO1sTMahmw/K/bT6uatpqcyXsdCQk2Wx4xLnZUT4jBIbf6lieL3LRKJtsLIHlS9Gnp6tWSiVAvwCS3yPDd6NTFPjQi/AN152HEc/ZPdupAkS1UHBOn2ZDibkHg2NNrdQOaF9DUEpIArS29e6oUh/pIIQXx50=;
X-UUID: 80eeb395b19d484bb3a6b9afb3b1980f-20210324
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 291248789; Wed, 24 Mar 2021 22:55:13 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 23:55:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 14:55:10 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 14:55:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH RESEND v5 12/12] arm: dts: mt2701: harmonize node names and
 compatibles
Date: Thu, 25 Mar 2021 14:54:58 +0800
Message-ID: <20210325065458.43363-12-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
References: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_065533_792230_77DCD548 
X-CRM114-Status: GOOD (  10.04  )
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

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v5: no changes
---
 arch/arm/boot/dts/mt2701.dtsi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index fade14284017..4776f85d6d5b 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -607,7 +607,7 @@
 	};
 
 	usb0: usb@1a1c0000 {
-		compatible = "mediatek,mt8173-xhci";
+		compatible = "mediatek,mt2701-xhci", "mediatek,mtk-xhci";
 		reg = <0 0x1a1c0000 0 0x1000>,
 		      <0 0x1a1c4700 0 0x0100>;
 		reg-names = "mac", "ippc";
@@ -620,8 +620,9 @@
 		status = "disabled";
 	};
 
-	u3phy0: usb-phy@1a1c4000 {
-		compatible = "mediatek,mt2701-u3phy";
+	u3phy0: t-phy@1a1c4000 {
+		compatible = "mediatek,mt2701-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a1c4000 0 0x0700>;
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -646,7 +647,7 @@
 	};
 
 	usb1: usb@1a240000 {
-		compatible = "mediatek,mt8173-xhci";
+		compatible = "mediatek,mt2701-xhci", "mediatek,mtk-xhci";
 		reg = <0 0x1a240000 0 0x1000>,
 		      <0 0x1a244700 0 0x0100>;
 		reg-names = "mac", "ippc";
@@ -659,8 +660,9 @@
 		status = "disabled";
 	};
 
-	u3phy1: usb-phy@1a244000 {
-		compatible = "mediatek,mt2701-u3phy";
+	u3phy1: t-phy@1a244000 {
+		compatible = "mediatek,mt2701-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a244000 0 0x0700>;
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -700,8 +702,9 @@
 		status = "disabled";
 	};
 
-	u2phy0: usb-phy@11210000 {
-		compatible = "mediatek,generic-tphy-v1";
+	u2phy0: t-phy@11210000 {
+		compatible = "mediatek,mt2701-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x11210000 0 0x0800>;
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
