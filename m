Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C73C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C1D23444
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C1D23444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jcdPnWSWiW8QLVe4F7/s/ncJ3IHJVJ0I8K66LeKJ24I=; b=sO05jSSE/p4nQuThTHnZDWKpO
	bKAsa5GIHHx8ppXENRlasLef1oE6AaOIbnnJm62bKLj767RvK8AmoxCfDDuxOM3r4jjNlX9MWwjCw
	6DjNmguKp4AK2M3Hfv12OmSEHJNUmIm1+lvIG5rdCj2XfjexHKXjB5UCY2nHhcNaLMvLAsZEHTC+r
	UNfgIZaPqopph3h4PN28FIKfdQGTLsZL7WtHXfyeVi6q4CM6tLnp6vuiSM4nWMaf2Mf+uaLxaj7Bx
	mFX8fYo5J4GfYT6rsgwZo1EZoj7B2de31MCP+Ns+YRP/VZJMX5NOY/Y9SDEW7VzAwGhrO7WCHHmiC
	tzQjNf8wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2vKG-0007eB-93; Fri, 22 Jan 2021 12:14:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2vK4-0007XW-8B; Fri, 22 Jan 2021 12:13:53 +0000
X-UUID: 85ab111e3fd145d9b0bffae36413ae78-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XDvTsXbuhgAelgKMHjzRvnXct3BR07oS2COt6QieGF4=; 
 b=bQAdTghWB8ypbpv932hqmWNL4DmOVEec2yRVO+F50tXMYJRmwwDZepafCv/gdwFvO9v1sf/IwpChgnmXZ32FpjIjxW9jxTC2LnQtQo6HE8wwwICKXWWp1RY2i3yp0pxj+7bEG/QjNqGX0EFAESV0l9gEEQcpM2eJkAPkCtS4QRo=;
X-UUID: 85ab111e3fd145d9b0bffae36413ae78-20210122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 43304082; Fri, 22 Jan 2021 04:13:47 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 04:03:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 20:03:45 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 20:03:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH next v2 17/17] arm: dts: mt2701: harmonize node names and
 compatibles
Date: Fri, 22 Jan 2021 20:03:23 +0800
Message-ID: <20210122120323.4337-17-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 280F7A1B7EA74A8FC42AB585FAF740E35CD9B1063BB1B081ECBA46D9393448FC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_071352_466860_16A08C9D 
X-CRM114-Status: GOOD (  10.25  )
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
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
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
