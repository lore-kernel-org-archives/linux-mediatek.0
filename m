Return-Path: <SRS0=0H6n=YK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2D3FA372E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2019 08:27:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1C32089C
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2019 08:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RD+s0Pck"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1C32089C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wwj6gj8h8Z9BoxHk7gXUg4V+nh2SjTCh8OC5LLGs5Bw=; b=RD+s0PckFRxEue
	qmeTmzBK5M7Pl+kCuxKPizz8oMb3Mhlhm05YCtfQmdmadD/ccQbvtqG+bwzM4oj8HXPpHreETVolo
	Fl19k87cxhq2oIW+S1zwfHRgW/MIUNnbTqVfQ3WjlnK28tqo3M3ER8TI/CSVWNAiLetVpkXyWmtAM
	r7j0gUPhYpCgJhZWR1WGtrhC7F6nGlA4DVsv84anB+sUIfLP1wbazntEg/D3mReQqswOdPDkFmT6V
	E3turJ3DN3xW30yJHQRgnSfPk3TceadcpAfsA/pENG2Ie+TBXlPrRJKwWbkor3v/yvuRq/ghQGGwT
	RJp52csHpfi1JkNDHnSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL17l-0001e7-3k; Thu, 17 Oct 2019 08:27:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL16z-0000zt-LH; Thu, 17 Oct 2019 08:26:23 +0000
X-UUID: d7cd1abb13504c85a7df13c5487b0d3d-20191017
X-UUID: d7cd1abb13504c85a7df13c5487b0d3d-20191017
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <min.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 585758172; Thu, 17 Oct 2019 00:26:11 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 17 Oct 2019 01:26:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 17 Oct 2019 16:26:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 17 Oct 2019 16:26:13 +0800
From: <min.guo@mediatek.com>
To: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH RESEND v7 2/6] arm: dts: mt2701: Add usb2 device nodes
Date: Thu, 17 Oct 2019 16:25:50 +0800
Message-ID: <20191017082554.27953-3-min.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191017082554.27953-1-min.guo@mediatek.com>
References: <20191017082554.27953-1-min.guo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8970BAFCD99880B6ECB00EF9FCDCE6C4C1DFF7C4FB63CD24EA70B392BC0959C12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_012621_702255_FCC8977F 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 hdegoede@redhat.com, tony@atomide.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, Min Guo <min.guo@mediatek.com>,
 chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Min Guo <min.guo@mediatek.com>

Add musb nodes and usb2 phy nodes for MT2701

Signed-off-by: Min Guo <min.guo@mediatek.com>
---
changes in v7:
1. Change usb connector child node compatible as "gpio-usb-b-connector" 

changes in v6:
1. Modify usb connector child node

changes in v5:
1. Add usb connector child node

changes in v4:
1. no changes

changes in v3:
1. no changes

changes in v2:
1. Remove phy-names
---
 arch/arm/boot/dts/mt2701-evb.dts | 21 +++++++++++++++++++++
 arch/arm/boot/dts/mt2701.dtsi    | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701-evb.dts b/arch/arm/boot/dts/mt2701-evb.dts
index 88f8fd2..05ba43c 100644
--- a/arch/arm/boot/dts/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mt2701-evb.dts
@@ -6,6 +6,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 #include "mt2701.dtsi"
 
 / {
@@ -61,6 +62,15 @@
 		>;
 		default-brightness-level = <9>;
 	};
+
+	usb_vbus: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pio 45 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &auxadc {
@@ -230,3 +240,14 @@
 &uart0 {
 	status = "okay";
 };
+
+&usb2 {
+	status = "okay";
+	connector{
+		compatible = "gpio-usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb_vbus>;
+	};
+};
diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 51e1305..80a3b55 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -671,6 +671,39 @@
 		};
 	};
 
+	usb2: usb@11200000 {
+		compatible = "mediatek,mt2701-musb",
+			     "mediatek,mtk-musb";
+		reg = <0 0x11200000 0 0x1000>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "mc";
+		phys = <&u2port2 PHY_TYPE_USB2>;
+		dr_mode = "otg";
+		clocks = <&pericfg CLK_PERI_USB0>,
+			 <&pericfg CLK_PERI_USB0_MCU>,
+			 <&pericfg CLK_PERI_USB_SLV>;
+		clock-names = "main","mcu","univpll";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
+		status = "disabled";
+	};
+
+	u2phy0: usb-phy@11210000 {
+		compatible = "mediatek,generic-tphy-v1";
+		reg = <0 0x11210000 0 0x0800>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "okay";
+
+		u2port2: usb-phy@1a1c4800 {
+			reg = <0 0x11210800 0 0x0100>;
+			clocks = <&topckgen CLK_TOP_USB_PHY48M>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
 	ethsys: syscon@1b000000 {
 		compatible = "mediatek,mt2701-ethsys", "syscon";
 		reg = <0 0x1b000000 0 0x1000>;
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
