Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DAFC4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgDZ+/qu7lWLc7KIp03ishgJU7UORnRWQNe+hK0SlRU=; b=JSv02dUBA9VOn7gn8jn3ISK8G5
	50y6dfEdRtbA+eJBuVO7gxQnD3PxsatbtN/i2LsinZG6epmf6FeK7e2q4AqSkYEsEdChXL+skIGC7
	PTO7k770v85L/n3u/xds4lL4e6hzoXMATlJwhtIcLEqW1zCh576Y2TfX/J6N0YILVdVAONHJuKEkn
	jHkkKOLzy2gLWpFtJHgJFkeqGTUH3nlREZnVEpYOz40JH8uz8WooLsu4pTLZIcehes/iDiuobqBZA
	jez2Cl+CbkyUqF3aMQ3yb67jw4BKIBNDIUzQ3dnJqEUP865uw2MzFOTgtCHHkkjPxg4WjmSAD5S3o
	X8wskSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWLY-00EIGm-EW; Thu, 05 Jan 2023 19:56:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDMZS-009d6Y-2P; Thu, 05 Jan 2023 09:30:11 +0000
X-UUID: a1b37f6fdb864d369ba8848031959aa8-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JgDZ+/qu7lWLc7KIp03ishgJU7UORnRWQNe+hK0SlRU=;
	b=QESefLiG+JiibGaGny3KYZdSlwwlFEpM2dLzj/RG+whCyjMRfuW5eAathtpiq22qUuc9ffJ63zKOJ70YkrzW93YKj4Cd4BpKVqDk3BtAkT1ItSIHo+q9ewNqVFsoY8JgXPt7pKyCgT+LduPkkV3hR0s40Ou9fXPwGlovW/ur9X4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:9f21e789-7869-4b27-9462-7ab0b67a73fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:1cdfbb53-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: a1b37f6fdb864d369ba8848031959aa8-20230105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1223983336; Thu, 05 Jan 2023 02:29:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 17:29:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 17:29:35 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Miles Chen <miles.chen@mediatek.com>, <linux-usb@vger.kernel.org>, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for mt8195-demo board
Date: Thu, 5 Jan 2023 17:28:09 +0800
Message-ID: <20230105092809.14214-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230105092809.14214-1-macpaul.lin@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_013007_050129_E2AF9203 
X-CRM114-Status: GOOD (  10.23  )
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

1. Enable USB device port (USB port0).
2. Enable u2 speed for other USB HOST (USB port1/2/3).
3. Configure mt6360 (TYPEC) related pinctrls.

Note: Full dual-role switch capability requires TYPEC MUX driver and dts
update will be send in separate patches.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 51 ++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 07a864cb8b54..207bb5f4c58f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -12,6 +12,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+#include <dt-bindings/usb/pd.h>
 
 / {
 	model = "MediaTek MT8195 demo board";
@@ -380,6 +381,22 @@
 		};
 	};
 
+	mt6360_pins: mt6360-pins {
+		pins {
+			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>,
+				 <PINMUX_GPIO101__FUNC_GPIO101>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
+	u3_p0_vbus: u3_p0vbusdefault {
+		pins_cmd_dat {
+			pinmux = <PINMUX_GPIO63__FUNC_VBUSVALID>;
+			input-enable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
@@ -393,6 +410,14 @@
 				 <PINMUX_GPIO103__FUNC_URXD1>;
 		};
 	};
+
+	usb_otg_vbus: usb-otg-vbus-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "otg-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
 };
 
 
@@ -412,6 +437,22 @@
 	status = "okay";
 };
 
+&u3port0 {
+	status = "okay";
+};
+
+&u2port1 {
+	status = "okay";
+};
+
+&u2port2 {
+	status = "okay";
+};
+
+&u2port3 {
+	status = "okay";
+};
+
 &u3phy0 {
 	status = "okay";
 };
@@ -428,6 +469,16 @@
 	status = "okay";
 };
 
+&ssusb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&u3_p0_vbus>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	dr_mode = "otg";
+	mediatek,usb3-drd;
+	usb-role-switch;
+	status = "okay";
+};
+
 &xhci0 {
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&otg_vbus_regulator>;
-- 
2.18.0


