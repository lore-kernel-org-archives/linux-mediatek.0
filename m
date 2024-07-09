Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4DBC2BD09
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yClmM7FbG+STkiGlvMKHgaKsALit4BWDuDxsq4NcyT4=; b=IjSSg3/V094JdA
	yRA2VR+59zH404SDI/spMxT9m1a4d4uBC3klh2A2HQ4MSpfp0x/7Og7o+LbPDnEibZJp185B2E9Js
	0LGLnitaoR9KY5DVhDqGtObWvzDULv1Y/4oj3NFC5kji+OtY9ynEkgR04eq3XKFKvyG8gLGt2oMHU
	QxQwIk+HnixQPbQsWv5OCvQjPIUSsgwDpYTbnaaWy0Bx9LJCKaKyJWX67san5GvZlWwEVHbhf9lpq
	govN7yXG/kf+bx5TnR98pb46rxBdcGZyYnYz0Y/QMq+tGkDkR3P7LltnwVQnIlipOrNj7h9e3g7nT
	sHMCoY4N7UNTUHgyLU7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7s0-00000006mDB-2AcX;
	Tue, 09 Jul 2024 10:14:48 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7qw-00000006ln5-42CN;
	Tue, 09 Jul 2024 10:13:44 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 3068941A4E;
	Tue,  9 Jul 2024 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1720520019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yClmM7FbG+STkiGlvMKHgaKsALit4BWDuDxsq4NcyT4=;
	b=A6ZRVjgq+lUCXTIvq4zWCVXaAZ9zBGsOK+rd5onPZSJHomzYjSZX3BXDWCeIVWam/Cilhi
	0XsRS810PkUcOM3ytWAJ5D3dXECmZcFb181ayp0HpvV0jfx1x0PrV70klhin6gA3QW0BJV
	xWQXHRosK4XK0jiyR/sfQrImp24LoYM=
Received: from frank-u24.. (fttx-pool-217.61.149.221.bambit.de [217.61.149.221])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id EABB9100756;
	Tue,  9 Jul 2024 10:13:37 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v1 4/4] arm64: dts: mediatek: mt7988: add syscon for watchdog, xfi-pll and ethwarp
Date: Tue,  9 Jul 2024 12:13:26 +0200
Message-ID: <20240709101328.102969-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709101328.102969-1-linux@fw-web.de>
References: <20240709101328.102969-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a9a804e3-baad-4dc7-95ce-a21e05282f94
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_031343_166916_01590928 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This is needed by u-boot-driver when using OF_UPSTREAM.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 9ced005b1595..abde2719c34d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -93,7 +93,7 @@ topckgen: clock-controller@1001b000 {
 		};
 
 		watchdog: watchdog@1001c000 {
-			compatible = "mediatek,mt7988-wdt";
+			compatible = "mediatek,mt7988-wdt", "syscon";
 			reg = <0 0x1001c000 0 0x1000>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			#reset-cells = <1>;
@@ -192,7 +192,7 @@ ssusb1: usb@11200000 {
 		};
 
 		xfi_pll: clock-controller@11f40000 {
-			compatible = "mediatek,mt7988-xfi-pll";
+			compatible = "mediatek,mt7988-xfi-pll", "syscon";
 			reg = <0 0x11f40000 0 0x1000>;
 			resets = <&watchdog 16>;
 			#clock-cells = <1>;
@@ -206,7 +206,7 @@ ethsys: clock-controller@15000000 {
 		};
 
 		ethwarp: clock-controller@15031000 {
-			compatible = "mediatek,mt7988-ethwarp";
+			compatible = "mediatek,mt7988-ethwarp", "syscon";
 			reg = <0 0x15031000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.43.0


