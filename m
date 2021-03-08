Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BD6C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:38:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD02651EE
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD02651EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hfMgoTf1JUuclq1inORoWezdFf4se0zFR8OsJXdCG0o=; b=U2QvNLWxBeUzqH4KifrMrQqFQ
	zJxGFq38jyfwn0+5UMDES0e2yAnODLrjCTIRmFWi1xChfQar5W9xzjVkPhTUcPiTsd1zV6//fqWZz
	kpSRRr4/9JrsZXwKtz8mvfK/8Jhe/2y7pQ5G90aUQCGo8WWIL4Zsyn4L+qj0vR1j508Dt8PdUQuYM
	HKs7ukQRHenkw8afu/zlEOOomGTKg2YbEcs1LIqRelZxiY/zQhctvNCGCNfK1r82CW5j2AvaipGqW
	lnmhgiu9RzAuNGDaS1Km9gLeOE6wrs2Vi+p4P06V1JGjvA0qMULHX2OaG12+nwwN0r1hOdFK3Yj7x
	SBss3r5Iw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8b5-00FI7m-5v; Mon, 08 Mar 2021 05:38:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8ay-00FI6O-6o; Mon, 08 Mar 2021 05:38:25 +0000
X-UUID: 8af46ea8c3564a92a3a305b5ebb4a950-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4wXYdbrtARTL4Y8NjP1mqAUT8xyESpBUUZDTRy8JAkA=; 
 b=JigPBs+obO0eSfeH/mSSMwRH4fCnDGHp9sTxWCC/YoxWXAFbO+zHWPDXsrWz9nTuZiK3ORRXOTTbe+urSuVnsk5mS26r48Tb4q+Xyvgf3F8Z5RnWuCRk+udLyBgn+pckbXeFSF3d9+muIgdc9kENyOZDiD4HXaCKK5MAKCCzaKQ=;
X-UUID: 8af46ea8c3564a92a3a305b5ebb4a950-20210307
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1702475394; Sun, 07 Mar 2021 21:38:14 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 21:38:13 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 13:37:48 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 13:37:48 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Subject: [PATCH v4 05/12] arm64: dts: mediatek: mt8173: fix dtbs_check warning
Date: Mon, 8 Mar 2021 13:37:38 +0800
Message-ID: <20210308053745.25697-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6572549720AE08660F7F63BCEA2A25539E9C236EC12FBA88B545C9E79A94015D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_053822_449120_0942D246 
X-CRM114-Status: UNSURE (   9.93  )
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

Harmonize nodes names, compatibles and remove unused property.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v4: no changes
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
