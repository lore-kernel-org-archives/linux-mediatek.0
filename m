Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FED2C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7x37NMKwdPVEFEYwYdUiHOP5otf/Yj4Go4IwQ6BGTXI=; b=n5LIlNdG9alyiN
	Tp2PTj5lxxr3kor96tiIG6/9s4RErwGLtbGN/AhRdT+p2R1Vv8D0rE/yX9ZJVo2qD9vJmkJZhSI3M
	DPYwZIahFDcT6kZOL5SxeAL7vK+12aesbPzpUheEON/y+QUaTu3Nm/eSSEDXLI14mVH4XyqbDXe76
	v7r6Gq/YGs5FYkS5pF65j82eENmzWHHL2SiE8hAE+nY8/LmrIH0z17hprzbd0Mf2I+Y5pgMfgfioM
	nTpWSnN63ZqfBZPlxEXBRhTL/QNX7auwAWg+iUJPwqdTOWm8Am1Pm+Ar5pBlLUKNLbIx5I3I6zEl2
	xBIQ6Eg6l23AA1gfFpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNbk-00APik-Lm; Mon, 17 Oct 2022 10:44:32 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZK-00ANAR-Er; Mon, 17 Oct 2022 10:42:05 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id A04841012CE;
	Mon, 17 Oct 2022 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666003317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7x37NMKwdPVEFEYwYdUiHOP5otf/Yj4Go4IwQ6BGTXI=;
	b=gAnpen0SZh7dZSxJA+131qtaAFfvpHCHQvAhQtCRo01G2bLds7fRrRqd7/duhrwhO34co9
	13yshyzTwSjwQKuuZ9Gj2UhrX7/2/SXcuS0sRP1YZZQq0joD2XDZBFJWeyvZ3h7OBzkvbs
	z2dGZ3gE9O2TZROc2ep7UZmmy3mXaUc=
Received: from frank-G5.. (fttx-pool-217.61.154.127.bambit.de [217.61.154.127])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id E0EAA406D6;
	Mon, 17 Oct 2022 10:41:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 05/12] arm64: dts: mt7986: harmonize device node order
Date: Mon, 17 Oct 2022 12:41:34 +0200
Message-Id: <20221017104141.7338-6-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104141.7338-1-linux@fw-web.de>
References: <20221017104141.7338-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b16a93e6-f3b6-48f5-9c06-be096daec2cf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_034202_805270_4E91DE0F 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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


