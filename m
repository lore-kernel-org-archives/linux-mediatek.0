Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD356C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dUEnhw5xFiIc+XADgHYaBr/SM4VF5RqnflFunzIbLA=; b=unPMEbisZCXCwztMncXFWsViU1
	KsO0ig3Gc8T5D/IJo2smIioI5pYubVBXQ+QWlgX0M+W8LWZD6GAX6BnCEd6UDaMrw23rfQXrw/N4Z
	Spx4x4wKQEcEQxmHErX9+zcdmigjfpbTMtRDnLsN0e+oOrxvCYBsXfSc/1SImRSfaAh7pex2Yej+L
	y802c6AUvtckXvMdjf29fRzL3pLnQwKzyMB9dCduYOG8Oupod71XO4zxGsOR6klixDQUukMnW5QKE
	XbVqDofL4Y7Ezo9AH+A1A6jBj3KE/L0Wdoy1U2wmHfLicIInrgwraGjxKbWcLfIMTc6mKBpPg2ALB
	YfULjUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqA3-0000000Cx0C-1Mq8;
	Mon, 22 Apr 2024 09:40:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqA0-0000000Cww7-2nQl;
	Mon, 22 Apr 2024 09:40:30 +0000
X-UUID: 542648ce008c11efac1957ae9f99f617-20240422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2dUEnhw5xFiIc+XADgHYaBr/SM4VF5RqnflFunzIbLA=;
	b=K9ea48KWisxv7Tj3w51OarNJrbzwi6brHyqUqQxfgjM6EQD/lwHOHkUJgECBdi4vtigERHF5iOPPnFkUg4m2K23xj28LaujySgHy9rwrL9n9Eb5Ckq6kzg4xk6XwY2n0Ls0xBZ+mhHlWLAvxNZjqz+9hC6jNKO33/ykK7W/SCKs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:c6d8d7d6-88e3-40eb-be45-49eaa9f53752,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:82c5f88,CLOUDID:e6dff682-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 542648ce008c11efac1957ae9f99f617-20240422
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 899244449; Mon, 22 Apr 2024 02:40:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 22 Apr 2024 17:39:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 22 Apr 2024 17:39:37 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Yow-shin Liou
	<yow-shin.liou@mediatek.com>, Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8390-genio-700-evk: add IT5205, RT1715, and USB HUB
Date: Mon, 22 Apr 2024 17:39:25 +0800
Message-ID: <20240422093926.15392-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240422093926.15392-1-macpaul.lin@mediatek.com>
References: <20240422093926.15392-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.669200-8.000000
X-TMASE-MatchedRID: yvDAzrttxFUohE7hoJbtOAPZZctd3P4Bw8djaG0FrZuY5NBG7YIbV0d0
	Rzx07LDVXS+cZR9Lon+vfGA7KBLaSKENdydioT4ACz1WR8KHe4Cy4iyjvVWTog2Y8xyy93kWwl9
	GLHytwjokpovHHUzQSoAy6p60ZV62fJ5/bZ6npdiujVRFkkVsmz3yFinLOvkeMs51Y/gNb4oJoc
	1HDJTj2iNq14IwfLTSS4I2Vx3pKOAXu6myHc7R+Xdy7yJkALcTcTYnJ0lBa6CTL3doWSD6VG1Rj
	oup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnox6EMj9/eK3+Y=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.669200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8898A593C8B07133EB9E530053824434C66F07DBC80D11360B5EFBD2DD36794F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_024028_727052_F41916DF 
X-CRM114-Status: GOOD (  10.71  )
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

1. Add i2c to aliases.
2. Add MUX IT5205 support to i2c1.
3. Add TYPEC RT1715 support to i2c4.
4. Add PMIC_KEY setting.
5. Add USB HUB TUSB8020 to xhci1.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 9b7ad046f193..17f22b1836bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -23,6 +23,15 @@
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
 
@@ -225,6 +234,16 @@
 	pinctrl-0 = <&i2c1_pins>;
 	clock-frequency = <400000>;
 	status = "okay";
+
+	typec-mux@48 {
+		compatible = "ite,it5205";
+		reg = <0x48>;
+
+		mode-switch;
+		orientation-switch;
+
+		vcc-supply = <&mt6359_vcn33_1_bt_ldo_reg>;
+	};
 };
 
 &i2c2 {
@@ -242,11 +261,19 @@
 };
 
 &i2c4 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "default";
 	pinctrl-0 = <&i2c4_pins>;
 	pinctrl-1 = <&rt1715_int_pins>;
 	clock-frequency = <1000000>;
 	status = "okay";
+
+	rt1715@4e {
+		compatible = "richtek,rt1715";
+		reg = <0x4e>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&usb_p1_vbus>;
+		status = "okay";
+	};
 };
 
 &i2c5 {
@@ -836,6 +863,17 @@
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
@@ -890,6 +928,22 @@
 &xhci1 {
 	status = "okay";
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
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
2.18.0


