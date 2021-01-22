Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76FCC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7036E2343E
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7036E2343E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NA0Ws9tPaXopWxxfGItjUVsHbgvxUtzR9VeMavunu2M=; b=YSMauGKFEejBMa6CI4vwGX7oF
	I6x8Hq6oImxDidYwcAQ7GjxRzwQoFqJk0Z1AlD+GjaaPoSSxqQAUf1KE6Gz63XnS3W64wK2gztrcT
	3CLgQehrAb5g+8wxvZsVujS4ywc0OXqERnjYa1xFt8+u6WSXUW1W5l+yGVMMt3zX1pNTI99a9z4LU
	ZLIUzV3W7wzZ39jnkx0cn0XTm3X6ovLBw1JvjOZJnrmJWUfG4BhzDqJqAUXAcdlgIAtI8DjLhTo3b
	4TFPOd1IM6w22glk+sTgiYjL3Ykgrq+T6nkPwj6iPXYRfD2MIU5ITyd1NssgCwoeXP9Il9glIo4/E
	fncYiwjbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2vKe-0007ok-4d; Fri, 22 Jan 2021 12:14:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2vK7-0007XC-VO; Fri, 22 Jan 2021 12:13:57 +0000
X-UUID: ac1ab95be30c48718abf594786103615-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oWYkCrHwpIFtfYQr59l/fzuj/QCgyJUK1c+1Ass2rkk=; 
 b=H5JjYOBCE3iamnNXzzAQPYhTJdQjZNwnESbb59vMyIvyev4bC6hWRn0eSUWACltLgBvZ689sugUyyZdCkk57fjiWbo7bglTThPI+1+L/zyY+S4rqc59NRcd1V+twH9Bsfx563osIB373TViZt6rPknV6PdjglG2UH+qLH6fIzm0=;
X-UUID: ac1ab95be30c48718abf594786103615-20210122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1201704641; Fri, 22 Jan 2021 04:13:47 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 04:03:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 20:03:45 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 20:03:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH next v2 16/17] arm: dts: mt7623: harmonize node names and
 compatibles
Date: Fri, 22 Jan 2021 20:03:22 +0800
Message-ID: <20210122120323.4337-16-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 34CC57FC08A18569532AD1F9562FD9DADB9CFA01D81C6BF998D6ACCD20841C072000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_071356_169717_9C95F772 
X-CRM114-Status: GOOD (  11.04  )
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
