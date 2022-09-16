Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ED7ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 03:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4SwcYmQeEsPhNZNiOlAz3LSIKt52BQiCkN0gMjK+lM=; b=u6FXj3h15C3b/CaYR9y8ITQtNC
	WQj1sbclYa4jkDVhwrHJXarvFVDm3up2yxzCjgxxoLrrFUjUgn6A9DTjt3jUrmaguf16AfDeNQje/
	//fySvjDa/DljfmLa9innrrDDJ3hKKjtIcISyppuEwLTmLz4vbcyja40lVL7ab2FRjyHr6UZKjunH
	xPFJG3IJjl9CXKjcT2lyZtIWfJr/Js+Xa+V1jtMwdHqt9Hb2PR55Wgbdjxla1rCzS/mzl1RBZllS+
	Iv9mMkYCh+oyCVeOqHOJlY8UWMAI8WXmHq2/26tt7HtBQgqCJQsRT3XQYrZoHbJP7ppleqeneK9as
	eAEq14fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ1cS-0068DA-UD; Fri, 16 Sep 2022 03:02:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ1cR-0068Ar-6C; Fri, 16 Sep 2022 03:02:20 +0000
X-UUID: 6ddbd344374048bdb79707a843293dd0-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o4SwcYmQeEsPhNZNiOlAz3LSIKt52BQiCkN0gMjK+lM=;
	b=GjhWbedZDVF/70SBb29RJFIaXfiDZxyenGtPssYc3Lu3Mqu3YnwMgnWXewr849KjU9uPONu33kLjX5zsbEczi35zZd465teaPvjxVvBwW9FnwXHeGZItqd2dVxRe8hR5o/LBfJVgJeV8C/sosZ1HID7cAmQG4LsW3egXXgewtmo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2621e0b1-afb1-4e88-8aac-687c992c7b06,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:aecc96f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6ddbd344374048bdb79707a843293dd0-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1050574791; Thu, 15 Sep 2022 20:02:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 10:51:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 10:51:01 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v3 4/4] arm64: dts: mediatek: cherry: Add edptx and dptx support
Date: Fri, 16 Sep 2022 10:50:59 +0800
Message-ID: <20220916025059.16673-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220916025059.16673-1-rex-bc.chen@mediatek.com>
References: <20220916025059.16673-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_200219_257179_F528AD8F 
X-CRM114-Status: GOOD (  10.04  )
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


