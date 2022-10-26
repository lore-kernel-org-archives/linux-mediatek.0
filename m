Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A393C38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7x37NMKwdPVEFEYwYdUiHOP5otf/Yj4Go4IwQ6BGTXI=; b=PKgOXMDB5S+tr5
	sjzDHBSHk12FJ/FVMVDOywFswVGwM2sJRMQotttw9hVQBTfBNyFRsGaE6x0wYZuDJ/Io5mGAQAkSi
	z/s+N68pu/2PJtYQsRr0ukHuyPsQ+GNpvS+AY7F5sPV4oiwS/sg7niGr09UtSkFv7MIMc4dsUQYbd
	E8dXay6CdcK+jZiAy1pYv1zXu2zce+0FwzHDd2VAxE1NeP5oaJOhivY+xKhTv8m9jh0hYO5apqng/
	VrEzoODDVaO84yCro6J74CowaMz5GM7BD6cx105p/5fi/bdN6SQpHrVEeibQywPnlqyq4ztIMDWRi
	PwhlaF/YI/d6W0lo1zeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncsK-008mXc-9O; Wed, 26 Oct 2022 09:39:04 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncqT-008lWa-TA; Wed, 26 Oct 2022 09:37:13 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id 8740C41C24;
	Wed, 26 Oct 2022 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666777020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7x37NMKwdPVEFEYwYdUiHOP5otf/Yj4Go4IwQ6BGTXI=;
	b=ROTAeF4mTI/Zhcn/OJAtdzc+isJeGK3KHvx34fgV9ykFhy+Ezf891Axot6o4tw+HSVYZ08
	ZFPsbppncoAf7lnsM3Z8bYLuzi4+m35a9hyH3Hjqm2d3LbAScQ/oPViQTGR+H56LViMe5I
	UCHWMwKWq1TPhNi7lXMWr/6LSMyQ3tQ=
Received: from frank-G5.. (fttx-pool-80.245.72.174.bambit.de [80.245.72.174])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id C4739802C9;
	Wed, 26 Oct 2022 09:36:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v2 1/7] arm64: dts: mt7986: harmonize device node order
Date: Wed, 26 Oct 2022 11:36:44 +0200
Message-Id: <20221026093650.110290-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026093650.110290-1-linux@fw-web.de>
References: <20221026093650.110290-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ed22976e-4fcd-48d6-bda8-56339d81192e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_023710_267981_687439C8 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This arrange device tree nodes in alphabetical order.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
i modified sams patch

https://patchwork.kernel.org/project/linux-mediatek/patch/20220427124741.18245-2-sam.shih@mediatek.com/

by moving pio-node up instead of moving uarts down to ensure alphabetical
order for switch-/wifi-node.

And moved uart0 and wifi in mt7986b-rfb too.
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 94 ++++++++++----------
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 22 ++---
 2 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index afe37b702eef..6189436fe31d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -54,6 +54,53 @@ switch: switch@0 {
 	};
 };
 
+&pio {
+	uart1_pins: uart1-pins {
+		mux {
+			function = "uart";
+			groups = "uart1";
+		};
+	};
+
+	uart2_pins: uart2-pins {
+		mux {
+			function = "uart";
+			groups = "uart2";
+		};
+	};
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
+};
+
 &switch {
 	ports {
 		#address-cells = <1>;
@@ -121,50 +168,3 @@ &wifi {
 	pinctrl-0 = <&wf_2g_5g_pins>;
 	pinctrl-1 = <&wf_dbdc_pins>;
 };
-
-&pio {
-	uart1_pins: uart1-pins {
-		mux {
-			function = "uart";
-			groups = "uart1";
-		};
-	};
-
-	uart2_pins: uart2-pins {
-		mux {
-			function = "uart";
-			groups = "uart2";
-		};
-	};
-
-	wf_2g_5g_pins: wf-2g-5g-pins {
-		mux {
-			function = "wifi";
-			groups = "wf_2g", "wf_5g";
-		};
-		conf {
-			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
-			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
-			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
-			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
-			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
-			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
-			       "WF1_TOP_CLK", "WF1_TOP_DATA";
-			drive-strength = <4>;
-		};
-	};
-
-	wf_dbdc_pins: wf-dbdc-pins {
-		mux {
-			function = "wifi";
-			groups = "wf_dbdc";
-		};
-		conf {
-			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
-			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
-			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
-			       "WF0_TOP_CLK", "WF0_TOP_DATA";
-			drive-strength = <4>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 3443013b5971..7459ddb6b6f0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -25,10 +25,6 @@ memory@40000000 {
 	};
 };
 
-&uart0 {
-	status = "okay";
-};
-
 &eth {
 	status = "okay";
 
@@ -99,13 +95,6 @@ fixed-link {
 	};
 };
 
-&wifi {
-	status = "okay";
-	pinctrl-names = "default", "dbdc";
-	pinctrl-0 = <&wf_2g_5g_pins>;
-	pinctrl-1 = <&wf_dbdc_pins>;
-};
-
 &pio {
 	wf_2g_5g_pins: wf-2g-5g-pins {
 		mux {
@@ -138,3 +127,14 @@ conf {
 		};
 	};
 };
+
+&uart0 {
+	status = "okay";
+};
+
+&wifi {
+	status = "okay";
+	pinctrl-names = "default", "dbdc";
+	pinctrl-0 = <&wf_2g_5g_pins>;
+	pinctrl-1 = <&wf_dbdc_pins>;
+};
-- 
2.34.1


