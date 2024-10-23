Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0F8D2E01B
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5DyChpYdm3ksXmmJjhWN/WFnsoQhtsbl9u4kQ/VRbik=; b=Hv4N1OAUZWVxmcC2PALPlrMTnZ
	gwrI9WYCHtHCMA2Pq31gKLUSq95UiM/yr9zSt00XcKYgpp9+1YK//8zi4psOGNp1qOQpMPmFEgD+n
	a0sKOJQ8YTshzn0TOvi9+vE0f3J+g362m8wnyRNnRady12RKv7pp94jpSb8AR2mnvlIq9Swravj3f
	qs1mbHSm3iHCoPopYdzTBdZZlEdlw7llqZ7bDoMmS1hT3W510qBmT2DE6YYcU9KMHU0S0ZNjbn2hn
	/itmqyNOSoU95IcEhQQ03d2EuJVOjfHWHJCouflSA6rjbMoYFjUlvfIN9reS6+3Pzi2JJ929kfsBh
	Vdi8B8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Vp5-0000000DOFG-1LRZ;
	Wed, 23 Oct 2024 07:30:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3VXs-0000000DL0K-31XW;
	Wed, 23 Oct 2024 07:12:42 +0000
X-UUID: 2de89ef6910e11ef9048ed6ed365623b-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5DyChpYdm3ksXmmJjhWN/WFnsoQhtsbl9u4kQ/VRbik=;
	b=puLjNlWATTNEm026Tv0A8I6eOTE8ocIrW6mGmmw9ZyFyNpG9G1AVi26A1YfcSzX8x6mA7CO3ahUG/PySxl+hnR4Z9k1g4Eed9HKiwupA5TEUmbzSy2HVvyLB702S3YZzLOLPGK7JrpFe48sAvEHOTRYAnav4wdwgRh7EKzOw6uc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:23c3d8b9-bc3c-4099-86ae-5fe32056dd3a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:77e6f92d-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2de89ef6910e11ef9048ed6ed365623b-20241023
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1258588160; Wed, 23 Oct 2024 00:12:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 00:12:32 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 15:12:32 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-usb@vger.kernel.org>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>, Yow-Shin Liou
	<yow-shin.liou@mediatek.com>, Simon Sun <simon.sun@yunjingtech.com>
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add support for TCPC port
Date: Wed, 23 Oct 2024 15:12:25 +0800
Message-ID: <20241023071226.14090-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_001240_803808_F98BA0CB 
X-CRM114-Status: GOOD (  12.75  )
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

From: Fabien Parent <fparent@baylibre.com>

Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
configuration for TCPC Port, USB-C connector, and related settings.

Configure dual role switch capability, set up PD (Power Delivery) profiles,
and establish endpoints for SSUSB (SuperSpeed USB).

Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
to "otg" for OTG (On-The-Go) mode operation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Yow-Shin Liou <yow-shin.liou@mediatek.com>
Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../dts/mediatek/mt8395-genio-1200-evk.dts    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

Changes for v2:
 - Drop the no need '1/2' DT Schema update patch in the 1st version.  
 - Fix intent for 'ports' node, it should under the 'connector' node.
 - Correct the index for 'port@0' and 'port@1' node.

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 5f16fb820580..195e486d9101 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -249,6 +249,43 @@ mt6360: pmic@34 {
 		#interrupt-cells = <1>;
 		pinctrl-0 = <&mt6360_pins>;
 
+		tcpc {
+			compatible = "mediatek,mt6360-tcpc";
+			interrupts-extended = <&pio 17 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "PD_IRQB";
+
+			connector {
+				compatible = "usb-c-connector";
+				label = "USB-C";
+				data-role = "dual";
+				power-role = "dual";
+				try-power-role = "sink";
+				source-pdos = <PDO_FIXED(5000, 1000, \
+					       PDO_FIXED_DUAL_ROLE | \
+					       PDO_FIXED_DATA_SWAP)>;
+				sink-pdos = <PDO_FIXED(5000, 2000, \
+					     PDO_FIXED_DUAL_ROLE | \
+					     PDO_FIXED_DATA_SWAP)>;
+				op-sink-microwatt = <10000000>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+						mt6360_ssusb_ep: endpoint {
+							remote-endpoint = <&ssusb_ep>;
+						};
+					};
+				};
+			};
+		};
+
 		charger {
 			compatible = "mediatek,mt6360-chg";
 			richtek,vinovp-microvolt = <14500000>;
@@ -446,6 +483,13 @@ &pciephy {
 };
 
 &pio {
+	u3_p0_vbus: u3-p0-vbus-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO63__FUNC_VBUSVALID>;
+			input-enable;
+		};
+	};
+
 	audio_default_pins: audio-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO61__FUNC_DMIC1_CLK>,
@@ -900,8 +944,18 @@ &ufsphy {
 };
 
 &ssusb0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&u3_p0_vbus>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	dr_mode = "otg";
+	usb-role-switch;
 	status = "okay";
+
+	port {
+		ssusb_ep: endpoint {
+			remote-endpoint = <&mt6360_ssusb_ep>;
+		};
+	};
 };
 
 &ssusb2 {
-- 
2.45.2


