Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A29C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6309923444
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6309923444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s7rPxfWcgDeLHwjWOlK0RSWpAkGTXy+Hb2ADqENoBzQ=; b=zmmkJEN93e8GqjDsv+y53CkqP
	BAEGknE2/v6dfrqGRLp11hFa7DzUUbjCvrh2nh1CT2fkgNR5bHLJYm0AmjaGPYPA15tuTXMwjV1a/
	piTlG6p++he4DTOHze2PlPz4eQLGQvMzS9obE+qdhlBpnxl6MkMO+QLNn/xnivF5EAFrsK+11HwTs
	ew+cvWNtwzXVry4NJ3wWkCV0N2M29IlXS0sYJ7sHMHX2Pb/c5KuN0soW3tpQZkZOCaHNxBNqCasti
	+djHkr68jmX9xT7ljagpRCM+FRZdbpWdVeovvMyHqjfCVeklgqRWaqhzl1ZjERryKAomcaogvRPbw
	v7wocv+nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2vKZ-0007mD-JD; Fri, 22 Jan 2021 12:14:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2vK7-0007XW-Tb; Fri, 22 Jan 2021 12:13:57 +0000
X-UUID: 26ae9b6071a04bd0be16d35951bbed29-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=G2eE9wL7HhcizK3EFDY9U/ufvtSBlmAXs764fz6NoKg=; 
 b=GJwdbec+cMA7mUildliWvGecv3ff6VUTXCT3W/QGZL4cbpyaPHHFqxL1xN1rWBSxuEjLtvoM1nkOi8CTiCpSIQn9PjPg/ccM4yD6lJ/X+q3+9x4X7tuPByI41KztB0q+3WDU1qg+byqfWM/Mv3l9TPltdSUC9lLbuTqs3Y4F4BY=;
X-UUID: 26ae9b6071a04bd0be16d35951bbed29-20210122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 402326416; Fri, 22 Jan 2021 04:13:47 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 04:03:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 20:03:42 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 20:03:41 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH next v2 10/17] arm64: dts: mediatek: mt8173: fix dtbs_check
 warning
Date: Fri, 22 Jan 2021 20:03:16 +0800
Message-ID: <20210122120323.4337-10-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B19C3F9572A0FEF8FAAE59C22C448E3782D28DF4841214FB181B3E4263AA14882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_071356_112442_B6AC9628 
X-CRM114-Status: GOOD (  10.87  )
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

Harmonize nodes names, compatibles and remove unused property.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts |  4 +---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 13 +++++++------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 6dffada2e66b..0ce81c4fe81e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -516,10 +516,8 @@
 	extcon = <&extcon_usb>;
 	dr_mode = "otg";
 	wakeup-source;
-	pinctrl-names = "default", "id_float", "id_ground";
+	pinctrl-names = "default";
 	pinctrl-0 = <&usb_id_pins_float>;
-	pinctrl-1 = <&usb_id_pins_float>;
-	pinctrl-2 = <&usb_id_pins_ground>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 7fa870e4386a..75040a820f0d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -631,7 +631,7 @@
 			#mbox-cells = <2>;
 		};
 
-		mipi_tx0: mipi-dphy@10215000 {
+		mipi_tx0: dsi-phy@10215000 {
 			compatible = "mediatek,mt8173-mipi-tx";
 			reg = <0 0x10215000 0 0x1000>;
 			clocks = <&clk26m>;
@@ -641,7 +641,7 @@
 			status = "disabled";
 		};
 
-		mipi_tx1: mipi-dphy@10216000 {
+		mipi_tx1: dsi-phy@10216000 {
 			compatible = "mediatek,mt8173-mipi-tx";
 			reg = <0 0x10216000 0 0x1000>;
 			clocks = <&clk26m>;
@@ -926,7 +926,7 @@
 		};
 
 		ssusb: usb@11271000 {
-			compatible = "mediatek,mt8173-mtu3";
+			compatible = "mediatek,mt8173-mtu3", "mediatek,mtu3";
 			reg = <0 0x11271000 0 0x3000>,
 			      <0 0x11280700 0 0x0100>;
 			reg-names = "mac", "ippc";
@@ -943,8 +943,9 @@
 			ranges;
 			status = "disabled";
 
-			usb_host: xhci@11270000 {
-				compatible = "mediatek,mt8173-xhci";
+			usb_host: usb@11270000 {
+				compatible = "mediatek,mt8173-xhci",
+					     "mediatek,mtk-xhci";
 				reg = <0 0x11270000 0 0x1000>;
 				reg-names = "mac";
 				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
@@ -955,7 +956,7 @@
 			};
 		};
 
-		u3phy: usb-phy@11290000 {
+		u3phy: t-phy@11290000 {
 			compatible = "mediatek,mt8173-u3phy";
 			reg = <0 0x11290000 0 0x800>;
 			#address-cells = <2>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
