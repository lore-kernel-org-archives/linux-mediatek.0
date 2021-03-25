Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DC6C433C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 07:02:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7BC61A12
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 07:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7BC61A12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X77tQmZL5bD+xSaKwVBiUpkiccRvt+APNWcL8LZmQ64=; b=mhzi5CHqlmrgcfGefSCI7IHLi
	guGw/E7Bmw6O6CC6q5apxxtzAjub6FqTZKvVewezN2131lxuock1KHNiqf1dAs0U7AA64vGsD6kyS
	fImbi5OtdTCPrYYdaBt5kH12z31e09MzrLTnbjZbU4V1UuBvzDUH6VcpJdSpRlQTeTUiFay0LRayh
	yhXYXpmkWq0LZPzVidEufs5yWDK9YX0ih6XljLOU8IM9xOdG4t/QVmPmAZfc1nEIGaVz/GUXT6NpH
	0i0btzDd0CMq+ZNNDc0cZBL1ywj4it14O5fHLkyooG6z0IprzWJZowxokANuE+HYxx4eE6KMEiya0
	u4ySWKYAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPK0m-000ihi-Rz; Thu, 25 Mar 2021 07:02:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPJuc-000hCb-II; Thu, 25 Mar 2021 06:56:16 +0000
X-UUID: 47d84f4a8eac48959f820d3fd2ddac54-20210324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rNTrR3RNieHzQT6gAFVRp8scBDFa6M/TB6JWyrXTLGg=; 
 b=bgs2/rGs1MbWoPtp03zUJQZb+6Fj9vMOEBOaAUJkMnvWOod0fSK34uzN1RdqQmRt4rwz4ecfP32Uv8s9g0amIpAl65yYICmkK2XH9zF4PMj9UQhmZbDInIRXavEE8ixb3J0r0RBlrH3iyyGqO81VLNlkbb+Ls6wxufKk5GohfSs=;
X-UUID: 47d84f4a8eac48959f820d3fd2ddac54-20210324
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1207207166; Wed, 24 Mar 2021 22:55:20 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Mar 2021 23:55:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 14:55:09 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 25 Mar 2021 14:55:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH RESEND v5 11/12] arm: dts: mt7623: harmonize node names and
 compatibles
Date: Thu, 25 Mar 2021 14:54:57 +0800
Message-ID: <20210325065458.43363-11-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
References: <20210325065458.43363-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 56F3879681E2CF554F2F722F69E70FCB42B7A0776F56C9CFB13C5F9E5A31057C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_065611_100930_1771BAFB 
X-CRM114-Status: GOOD (  10.15  )
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
 arch/arm/boot/dts/mt7623.dtsi  | 26 ++++++++++++++------------
 arch/arm/boot/dts/mt7623n.dtsi |  4 ++--
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index aea6809500d7..3c11f7cfcc40 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -787,8 +787,9 @@
 		};
 	};
 
-	pcie0_phy: pcie-phy@1a149000 {
-		compatible = "mediatek,generic-tphy-v1";
+	pcie0_phy: t-phy@1a149000 {
+		compatible = "mediatek,mt7623-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a149000 0 0x0700>;
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -804,8 +805,9 @@
 		};
 	};
 
-	pcie1_phy: pcie-phy@1a14a000 {
-		compatible = "mediatek,generic-tphy-v1";
+	pcie1_phy: t-phy@1a14a000 {
+		compatible = "mediatek,mt7623-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a14a000 0 0x0700>;
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -823,7 +825,7 @@
 
 	usb1: usb@1a1c0000 {
 		compatible = "mediatek,mt7623-xhci",
-			     "mediatek,mt8173-xhci";
+			     "mediatek,mtk-xhci";
 		reg = <0 0x1a1c0000 0 0x1000>,
 		      <0 0x1a1c4700 0 0x0100>;
 		reg-names = "mac", "ippc";
@@ -836,9 +838,9 @@
 		status = "disabled";
 	};
 
-	u3phy1: usb-phy@1a1c4000 {
-		compatible = "mediatek,mt7623-u3phy",
-			     "mediatek,mt2701-u3phy";
+	u3phy1: t-phy@1a1c4000 {
+		compatible = "mediatek,mt7623-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a1c4000 0 0x0700>;
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -864,7 +866,7 @@
 
 	usb2: usb@1a240000 {
 		compatible = "mediatek,mt7623-xhci",
-			     "mediatek,mt8173-xhci";
+			     "mediatek,mtk-xhci";
 		reg = <0 0x1a240000 0 0x1000>,
 		      <0 0x1a244700 0 0x0100>;
 		reg-names = "mac", "ippc";
@@ -877,9 +879,9 @@
 		status = "disabled";
 	};
 
-	u3phy2: usb-phy@1a244000 {
-		compatible = "mediatek,mt7623-u3phy",
-			     "mediatek,mt2701-u3phy";
+	u3phy2: t-phy@1a244000 {
+		compatible = "mediatek,mt7623-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a244000 0 0x0700>;
 		#address-cells = <2>;
 		#size-cells = <2>;
diff --git a/arch/arm/boot/dts/mt7623n.dtsi b/arch/arm/boot/dts/mt7623n.dtsi
index 1880ac9e32cf..bcb0846e29fd 100644
--- a/arch/arm/boot/dts/mt7623n.dtsi
+++ b/arch/arm/boot/dts/mt7623n.dtsi
@@ -246,7 +246,7 @@
 		status = "disabled";
 	};
 
-	mipi_tx0: mipi-dphy@10010000 {
+	mipi_tx0: dsi-phy@10010000 {
 		compatible = "mediatek,mt7623-mipi-tx",
 			     "mediatek,mt2701-mipi-tx";
 		reg = <0 0x10010000 0 0x90>;
@@ -265,7 +265,7 @@
 		status = "disabled";
 	};
 
-	hdmi_phy: phy@10209100 {
+	hdmi_phy: hdmi-phy@10209100 {
 		compatible = "mediatek,mt7623-hdmi-phy",
 			     "mediatek,mt2701-hdmi-phy";
 		reg = <0 0x10209100 0 0x24>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
