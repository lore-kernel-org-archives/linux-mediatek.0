Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C234C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4SwcYmQeEsPhNZNiOlAz3LSIKt52BQiCkN0gMjK+lM=; b=xsKvuh6EkSkAMh3/DNHvvjJ8N9
	J0Mn5+wK7a9ZMDwY7reucypz+6JPzxvSax4U22Y3rjn34cAVh0u+SQFQC6qupZBzvCuMiFbXNkxcR
	WqzKUz72f2LBtK+dmKANRQXpWlB+R5vDINbqVDvoyJ0f+TRYsF2qvUaYzX63yrXdP0I4I0JVn69cX
	hMi4pKyAjkM1DeBYQTwHgaxHPu866nfDR2QiAKzTmKFnvDhJkH53VJEhr1HAI+fzVEICpwP2PQmDU
	rCD3fPFESXocewdcDroz+V4+H6+uULZF0SMOYfLOVf8/0qqTufelAvUeBYbBKSLSfbkVLLle6ay/G
	A2lispXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1CR-003QqD-Hv; Thu, 10 Nov 2022 06:38:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot1CO-003QT8-8N; Thu, 10 Nov 2022 06:38:06 +0000
X-UUID: 00232bd383fe4ed8a445598e32de8220-20221109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o4SwcYmQeEsPhNZNiOlAz3LSIKt52BQiCkN0gMjK+lM=;
	b=ZkKnoofum6hASHZt3TZG5BNd4iNfpwShZ/FMMGsAyaKsywM8huesT3wOzfQd0ei9hb2pXrHwFofmV5uurhpCIpH2nN6rr+h1Vz/7lDIwX1mmkkkGTsnJkWWAZ+tv0Cr28Rsp5SVSRG5u/Gjr4XosOaQNJZTISgClDnhUZNbkg/U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:37ee2439-26bb-4a6c-9a73-d527c79cd9ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:37be265d-100c-4555-952b-a62c895efded,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 00232bd383fe4ed8a445598e32de8220-20221109
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1761424802; Wed, 09 Nov 2022 23:37:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 14:37:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 14:37:18 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v4 4/4] arm64: dts: mediatek: cherry: Add edptx and dptx support
Date: Thu, 10 Nov 2022 14:37:16 +0800
Message-ID: <20221110063716.25677-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
References: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_223804_319069_FB25F55B 
X-CRM114-Status: GOOD (  10.76  )
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

In cherry projects, we use edptx as the internal display interface
and use dptx as the external display interface. To support this, we
need to add more properties.

- Add pinctrls for edptx and dptx.
- Add ports for edptx and dptx.

The port connections for the internal and external display:
dp-intf0 -> edptx -> panel
dp-intf1 -> dptx

The edptx endpoint is kept empty for now, as the panel addition will
come in a later commit.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 303dc32c64dc..560103e29017 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -125,6 +125,7 @@
 
 	port {
 		dp_intf0_out: endpoint {
+			remote-endpoint = <&edp_in>;
 		};
 	};
 };
@@ -134,6 +135,59 @@
 
 	port {
 		dp_intf1_out: endpoint {
+			remote-endpoint = <&dptx_in>;
+		};
+	};
+};
+
+&edp_tx {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&edptx_pins_default>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			edp_in: endpoint {
+				remote-endpoint = <&dp_intf0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			edp_out: endpoint {
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dp_tx {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&dptx_pin>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dptx_in: endpoint {
+				remote-endpoint = <&dp_intf1_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dptx_out: endpoint {
+				data-lanes = <0 1 2 3>;
+			};
 		};
 	};
 };
@@ -497,6 +551,20 @@
 		};
 	};
 
+	edptx_pins_default: edptx-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO7__FUNC_EDP_TX_HPD>;
+			bias-pull-up;
+		};
+	};
+
+	dptx_pin: dptx-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO18__FUNC_DP_TX_HPD>;
+			bias-pull-up;
+		};
+	};
+
 	i2c0_pins: i2c0-default-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
-- 
2.18.0


