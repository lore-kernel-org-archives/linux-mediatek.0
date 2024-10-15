Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084F3CFC286
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46mZ5GJZQgy4wb+8yI+bn0sWqlOFsJy9zMO5GZshhYo=; b=2KwQg7XUWShjCSGESm1WTbtbrq
	kOJAr1oZnNsNDwRJZrWlLzN0ZSa7SO0mdDhUZjtWbVOJfNNIRRlp7kCF4PHzFlFFrMI45S83outpd
	RC6wfZaZXrbeayI81qO4qUQmFk98+k5VcK2Qid/sqZm4eitaslgBbUmhBJ4vONn0ZI9uMkzpaWf04
	HxFyF88+1kC3WYCbTVTcSdYOghtp17uoW8cNjYjTQLrL5rQViFEacUhYgopspI34jwKyYwbLPY7Q1
	wBz9jvAi0oaYo1VCVoG6tMSMhxttWRzGhoDdnmZS0vLTFgrfbi21wKHqP4LM4PuT6mqXG/lXFeDJH
	4uXt9yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0etu-00000007rhC-31hx;
	Tue, 15 Oct 2024 10:35:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0esS-00000007rJk-40iN;
	Tue, 15 Oct 2024 10:34:10 +0000
X-UUID: fe0c96848ae011efba0aef63c0775dbf-20241015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=46mZ5GJZQgy4wb+8yI+bn0sWqlOFsJy9zMO5GZshhYo=;
	b=dBmto+kNUK/lZUp0Hi9bBvquPfH071lOaXMRJx3S0+2QUgid9VACDg8auZjSFrPeK5ZM3AjwBAzrL4x6zl1AMKmlDa8FgjBQUTK5O8EEVRoiPTBooLH9EJJ/5S24RyQzVg8r/uNw6ce86gJupWF6HFi8Eb8iRXRzJtT/WKnkF7s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:96704b15-5af1-48d3-b6b5-ba8704b97b89,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:f35a4765-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fe0c96848ae011efba0aef63c0775dbf-20241015
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 682010324; Tue, 15 Oct 2024 03:34:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 15 Oct 2024 18:33:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 15 Oct 2024 18:33:56 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, ChiYuan Huang
	<cy_huang@richtek.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chris-qj chen
	<chris-qj.chen@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Simon Sun
	<simon.sun@yunjingtech.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add support for TCPC port
Date: Tue, 15 Oct 2024 18:33:37 +0800
Message-ID: <20241015103337.20479-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241015103337.20479-1-macpaul.lin@mediatek.com>
References: <20241015103337.20479-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.087400-8.000000
X-TMASE-MatchedRID: Rxvf+mQJcSjL05PW1HuK4hcqpH7D1rtQE21NSmBqEKdeARTvhomDCuHM
	eGIgxik9FU2rnI3D77gOHPadhy5U4iUyFVKm+WpVMZ8cIdf+aBRhBfGxmdHCgvHFoBcOsKezmQJ
	6sUxppuKjkL1tNPFpRsZqGjAGu4ch71K1g/S2Z7cQ9/tMNQ4aipSL3AH2CZxKAfnelbSvK7z+/e
	pfiALZfjX5qFNuFL7ljdYbhXOHYJUfE8yM4pjsDwtuKBGekqUpm+MB6kaZ2g55Bwpd6xJsJwss9
	KgMSo3mfrGPTbsXwGPyUWByt6T+uCofFl27RgzTlBOk5L4/h4cNzbvTBDU7hBglWB0w9QO2hYAi
	cWtJQzzyNp7g4PXe0BXsxz6ujBxUq1f8XSkHBUmNJXmEMVvLtmcjFnImzvyS
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.087400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C6D7F85AEBD0D5129E358CA1986CEF593FF6154C17636121425DFB97FD909F8C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_033409_030514_8D1875D7 
X-CRM114-Status: GOOD (  10.38  )
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
Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../dts/mediatek/mt8395-genio-1200-evk.dts    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 5f16fb820580..b91a46f4a702 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -249,6 +249,39 @@ mt6360: pmic@34 {
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
+			};
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					mt6360_ssusb_ep: endpoint {
+						remote-endpoint = <&ssusb_ep>;
+					};
+				};
+			};
+		};
+
 		charger {
 			compatible = "mediatek,mt6360-chg";
 			richtek,vinovp-microvolt = <14500000>;
@@ -446,6 +479,13 @@ &pciephy {
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
@@ -900,8 +940,19 @@ &ufsphy {
 };
 
 &ssusb0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&u3_p0_vbus>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	dr_mode = "otg";
+	mediatek,usb3-drd;
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


