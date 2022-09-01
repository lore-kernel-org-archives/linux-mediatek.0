Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC7CECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 13:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9qzHLV2C1qM7HQeRv+rphvEHCRtfLmuNYiUYd4EBH0I=; b=k+mqjsYtioFkaCuPnrw9aZHwxZ
	pvqCzXQjK0qndP2xHgjfbQ6fnokxjHmZH5IctblH0lN0ycSmfveWvZE1m+FE32BPJNHg/P4Z9Ju8X
	Q73wQ1fJsspr53mRsM4xd4vqXeeTYX1FkrLjry7tRejDM+ggX8U9K+ItQq5Cf6AYpbyIyZ9K8ushp
	X8I3npp63j4X4cal250HzAmB9zQQxAkdctjBVaQXbn0Edxdrha1utJH0F4uDR9OThYDDX/0hUI7mS
	H7rdFmX7ODj0ba36a5rWYSetSWsgKHmtSN7PN6K3KCa2ar8bA/6ZJozQcAksLRRsfI84C7BUmExeH
	Fi8ZOeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkDm-00C1rq-6l; Thu, 01 Sep 2022 13:27:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTk3n-00Bwey-UY; Thu, 01 Sep 2022 13:16:45 +0000
X-UUID: 29cedd415cb74ede87091bc336ebe786-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9qzHLV2C1qM7HQeRv+rphvEHCRtfLmuNYiUYd4EBH0I=;
	b=PrBlLy/V8BbN0qluDCdU2j62GQHeffIk/xKnIDW7hExwJqwDZptBzxi2rwDHp9hIPag3f+XjgJfK8uTLdL8ZSue72RF1TIWI11rbpyBUPx7zKnszAczotsHsjT3/+XWiV9JcX6yRbUTRjZI3F49tv93IrXSQk7AdlhUstr8aMpo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:54e1179c-5191-4551-be14-0ab82688df86,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:3b82d420-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 29cedd415cb74ede87091bc336ebe786-20220901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chui-hao.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 131953604; Thu, 01 Sep 2022 06:16:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 21:05:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 1 Sep 2022 21:05:57 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, Ryder Lee <ryder.Lee@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH v5] arm64: dts: mt7986: add built-in Wi-Fi device nodes
Date: Thu, 1 Sep 2022 21:05:52 +0800
Message-ID: <20220901130552.26234-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_061644_040954_B6B8D19D 
X-CRM114-Status: GOOD (  11.46  )
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

This enables built-in 802.11ax Wi-Fi support.

Reviewed-by: Sam Shih <sam.shih@mediatek.com>
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>

---
v2: add clocks and clock-names.
v3: rename wmac to wifi and change underscores to dash in node names.
v4: rebase to the latest codebase.
v5: remove useless pins in wf_dbdc_pins node.
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 38 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 23 +++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 40 ++++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 882277a52b69..afe37b702eef 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -115,6 +115,13 @@
 	status = "okay";
 };
 
+&wifi {
+	status = "okay";
+	pinctrl-names = "default", "dbdc";
+	pinctrl-0 = <&wf_2g_5g_pins>;
+	pinctrl-1 = <&wf_dbdc_pins>;
+};
+
 &pio {
 	uart1_pins: uart1-pins {
 		mux {
@@ -129,4 +136,35 @@
 			groups = "uart2";
 		};
 	};
+
+	wf_2g_5g_pins: wf-2g-5g-pins {
+		mux {
+			function = "wifi";
+			groups = "wf_2g", "wf_5g";
+		};
+		conf {
+			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
+			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
+			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
+			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
+			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
+			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
+			       "WF1_TOP_CLK", "WF1_TOP_DATA";
+			drive-strength = <4>;
+		};
+	};
+
+	wf_dbdc_pins: wf-dbdc-pins {
+		mux {
+			function = "wifi";
+			groups = "wf_dbdc";
+		};
+		conf {
+			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
+			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
+			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
+			       "WF0_TOP_CLK", "WF0_TOP_DATA";
+			drive-strength = <4>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index e3a407d03551..890ded0efc51 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mt7986-clk.h>
+#include <dt-bindings/reset/mt7986-resets.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -70,6 +71,11 @@
 			reg = <0 0x43000000 0 0x30000>;
 			no-map;
 		};
+
+		wmcpu_emi: wmcpu-reserved@4fc00000 {
+			no-map;
+			reg = <0 0x4fc00000 0 0x00100000>;
+		};
 	};
 
 	timer {
@@ -261,6 +267,23 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+
+		wifi: wifi@18000000 {
+			compatible = "mediatek,mt7986-wmac";
+			resets = <&watchdog MT7986_TOPRGU_CONSYS_SW_RST>;
+			reset-names = "consys";
+			clocks = <&topckgen CLK_TOP_CONN_MCUSYS_SEL>,
+				 <&topckgen CLK_TOP_AP2CNN_HOST_SEL>;
+			clock-names = "mcu", "ap2conn";
+			reg = <0 0x18000000 0 0x1000000>,
+			      <0 0x10003000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>;
+			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&wmcpu_emi>;
+		};
 	};
 
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 0f49d5764ff3..3443013b5971 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -98,3 +98,43 @@
 		};
 	};
 };
+
+&wifi {
+	status = "okay";
+	pinctrl-names = "default", "dbdc";
+	pinctrl-0 = <&wf_2g_5g_pins>;
+	pinctrl-1 = <&wf_dbdc_pins>;
+};
+
+&pio {
+	wf_2g_5g_pins: wf-2g-5g-pins {
+		mux {
+			function = "wifi";
+			groups = "wf_2g", "wf_5g";
+		};
+		conf {
+			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
+			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
+			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
+			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
+			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
+			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
+			       "WF1_TOP_CLK", "WF1_TOP_DATA";
+			drive-strength = <4>;
+		};
+	};
+
+	wf_dbdc_pins: wf-dbdc-pins {
+		mux {
+			function = "wifi";
+			groups = "wf_dbdc";
+		};
+		conf {
+			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
+			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
+			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
+			       "WF0_TOP_CLK", "WF0_TOP_DATA";
+			drive-strength = <4>;
+		};
+	};
+};
-- 
2.18.0


