Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A737CFB441
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atK7pOHKORg24ZId2N/MIZ2wuN4xjfHHsGn7g5IrSTA=; b=xd6a12sEO8HRmGPfo6atnPCHaI
	VvfE7Y+JIf5G8WCNKDAos2CwoiENWMgDOdOOJPGnvq3JCYqLr537LfxYTebqcB0yd2yOcMOxHhvwn
	gCKMQHferCtPxiaqt43u+fG32nd/4oNnsP8MiVeAZUHhhqRwnyhAtcbWPAlofyP0fMLFhWjw8L722
	XXhoZoyyZ+Psw8I2DRmeYMDTrqhwxbGw9WpcPZypw1thXvNq35eYlGwOxPd8ZgyE3ieMnR6Y5yqB+
	Yn2IuSLGkVnM07OupImWHY8EW7YECE89tQ0DvaYiAT5w8pvz35iaGdT0mHOxjBM6lwMUQoCbE1vqm
	Zfcz3diA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjf5-00000001s4B-1dQ9;
	Mon, 07 Oct 2024 09:04:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxjdn-00000001rvb-3Z6a;
	Mon, 07 Oct 2024 09:02:57 +0000
X-UUID: ef19419c848a11efba0aef63c0775dbf-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=atK7pOHKORg24ZId2N/MIZ2wuN4xjfHHsGn7g5IrSTA=;
	b=NaS5+bZIB3snhnJ52G7uXbZ3gpYA5wUQYt392zWm4DwBkUrOiuUhgxyBMfSRJt1gsd50yDNEIGFlQharNilhTB0EJ1C+044nS6M766BCEYqIShgIdmltIJOqNwTZA/a5uiQjmSZz5CBMnHJCwAGPpSDX/YdTVeDzaYy/p+JAXHY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:fa94374f-37ea-46ed-ad3a-738481a8fe67,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1571de40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ef19419c848a11efba0aef63c0775dbf-20241007
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2073466637; Mon, 07 Oct 2024 02:02:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 17:02:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 17:02:47 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: add keys and USB HUB
Date: Mon, 7 Oct 2024 17:02:44 +0800
Message-ID: <20241007090244.1731-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241007090244.1731-1-macpaul.lin@mediatek.com>
References: <20241007090244.1731-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.228600-8.000000
X-TMASE-MatchedRID: lpk7+cih7u8ohE7hoJbtOAPZZctd3P4BvtVce6w5+K93tPOoBZSCxk3v
	YK+4NwyrhSoN9m/vOyf+oPE4i6VpDfFmwOXgAg6zh2VzUlo4HVOm3yCZiGA94EsHGbVW/dGw5gc
	Q9o9yjpsWQzFIynHMpm2lMjw3dMOHIfTP27CPTX905zsoB1UKTueJtd3DGvZHmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1k+NIq1Dk9D+N3M8BupAP0k4lOe+LrHD7uxZEjGZwRBbMq1UfUW09vy+Q1
	QZiOfPW+ChiuQ6044L4y5IEeC/ipOoO1taCKaueT07LPKPPWmXzYaPZALfIbSyZdUr8fx4fMbuy
	vvGhtIDNwMS8lpRKBQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.228600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 63AAD04B7BEE6D81011F98D8EC4E78B07A10F6DBC0768A271B3F3B60B1CB9BF12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_020255_913635_86BA08F4 
X-CRM114-Status: GOOD (  10.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. Add i2c, mmc to aliases.
4. Add PMIC_KEY setting.
5. Add USB HUB TUSB8020 to xhci1.
6. Re-order spi2 node.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

Changes for v2:
 - Fix order of spi2.
 - Update pinctrl in i2c4 and rt1715.
 - Drop IT5205 and RT1715 nodes since the DTS are not completed yet.
 - Add #address-cells and #size-cells to xhci1 for supporting USB hubs.

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 96b272567cb1..3e77f59f2c74 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -23,6 +23,15 @@ / {
 		     "mediatek,mt8188";
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
 		serial0 = &uart0;
 	};
 
@@ -249,7 +258,6 @@ &i2c3 {
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins>;
-	pinctrl-1 = <&rt1715_int_pins>;
 	clock-frequency = <1000000>;
 	status = "okay";
 };
@@ -867,6 +875,17 @@ pins-wifi-enable {
 &pmic {
 	interrupt-parent = <&pio>;
 	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
+
+	mt6359keys: keys {
+		compatible = "mediatek,mt6359-keys";
+		mediatek,long-press-mode = <1>;
+		power-off-time-sec = <0>;
+
+		power-key {
+			linux,keycodes = <KEY_POWER>;
+			wakeup-source;
+		};
+	};
 };
 
 &scp {
@@ -874,6 +893,15 @@ &scp {
 	status = "okay";
 };
 
+&spi2 {
+	pinctrl-0 = <&spi2_pins>;
+	pinctrl-names = "default";
+	mediatek,pad-select = <0>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";
@@ -892,15 +920,6 @@ &uart2 {
 	status = "okay";
 };
 
-&spi2 {
-	pinctrl-0 = <&spi2_pins>;
-	pinctrl-names = "default";
-	mediatek,pad-select = <0>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "okay";
-};
-
 &u3phy0 {
 	status = "okay";
 };
@@ -921,6 +940,24 @@ &xhci0 {
 &xhci1 {
 	status = "okay";
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8025";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&usb_hub_fixed_3v3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8027";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&usb_hub_fixed_3v3>;
+	};
 };
 
 &xhci2 {
-- 
2.45.2


