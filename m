Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18E8C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:17:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848D023A56
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 848D023A56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W/n5eSIcoMSkz6GA83t6np4/kuyVKQ1tS/kW8fJLvx0=; b=MSjBhDL1k4f0eMYsoQrDFYVSO
	XChPVVE/NHGRz3tTJdIfp6tyKE2HIP91MJWsI4WEwiI/GJh4A8v6f3/c5vIUWEP/ZdWTC2MyIUgZS
	Ele618xmu/q29Gqc3PR2DYW+wPqEG1kZo05dHzH9yscsu6frhzlbTUbQ6bgzDVPIPD8F7e24qtq4O
	DVvxwFHmLGTkWBeHH1BgKF2EhBiwWhk4pxCoKSARf2wqLX6xR/hfZGN4r3sdNIGwZExWqd8VKZ5+a
	nGKdZZFr2030+XZy8HIqRMcyW19HiBEcwc3Jvpqbi6wF2pSiGdFpc7jtr0F4d2rlPMnJg6PeLL971
	ljyWiHrIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0hiC-0001Xg-ES; Sat, 16 Jan 2021 09:17:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0hhs-0001MN-9n; Sat, 16 Jan 2021 09:17:18 +0000
X-UUID: 157b88feda244c80952604ea46811eb0-20210116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zs+CwzzlLB5XfSyxussKwdTKfOrG+slA6GzwOnDq/Iw=; 
 b=Yn7nNrH3uGeK+46KK2kDPVr+wqG9Q0IZcmh1NbP0g+P9b+TX56nKwlBoi4TdGi1L30nOhhuJJjM6Wxg2DWsRpN1PTvWvYq3grrBoPZrEuB6xks+/9ruoL4h1Oag1zSjIK8qDbkqZgynrYA3XP3SLmo0OxixzT6UOb7Pvq3lqy44=;
X-UUID: 157b88feda244c80952604ea46811eb0-20210116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 755264873; Sat, 16 Jan 2021 01:17:05 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 01:07:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 17:07:04 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Jan 2021 17:07:04 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH next 15/15] arm: dts: mt2701: harmonize node names and
 compatibles
Date: Sat, 16 Jan 2021 17:06:56 +0800
Message-ID: <20210116090656.11752-15-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3351F36B74ACAF5BC9F06954368254E694B34A1E7224F948F1C411D66B9947592000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_041716_639536_D4AFA7A2 
X-CRM114-Status: UNSURE (   9.38  )
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

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
