Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B80C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 08:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lWgzr9qm2ixV3STt2Qq+/qGSNGS+7XQCw88w5N997QU=; b=2RB4hCLbhOqkHYpDszcu+Bt5Ck
	qWjV00VwkqMNDxto4+1ykl2C3WsmEp9M/BDJhrxkyde9EKw5G+byJBTvm1z3QiAGcQXGpS+Et75FZ
	xAlSU2eamf20PyPVcRrVIqfG2qI9XkWxuoTp5pFHQeC1NN0lfaC77eNHm8nSP2OSCOUrxWRKtqIm+
	dAAWGJVkWjPhGRiaQ0zxJDzUNjZdjzTLUsb+UhUtCyYrhcQi84/so1NxhhlTx+OCksfE50NljWsgb
	g8BOFgdY2JaLZnazq7uFm7lg0BbaB0FjxErjJkdO48V2h/X0EaDPlAC4jZHNQNVVWvsxwCHdK9uzr
	qTGoGKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rciOi-000000008ub-2KsX;
	Wed, 21 Feb 2024 08:56:12 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rciOU-000000008q4-1Kky;
	Wed, 21 Feb 2024 08:55:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-512cca90f38so1464220e87.2;
        Wed, 21 Feb 2024 00:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708505756; x=1709110556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lWgzr9qm2ixV3STt2Qq+/qGSNGS+7XQCw88w5N997QU=;
        b=DYfxiIaeqy6UIjj/ylSRAy0qVZubVpVnGOnv5hHm8bANEdXjc8/SGKKnKHPJpWnU8q
         brUCa7RNBo4/hhOL4hE3oNW2ZliWWDDjOVBY/UUY3q6a/HvKCYJLgyP34xyY/4d8fvZy
         jVwK4CuWke7GeIWynp8EYm5Jjgp8fZmuGGXwO8XhJp4HdA7L9ENd/pK9G0Lwg8UCwY0+
         2Qn6XKWrxu/pUXpaQQydmbkFC86kDulll5Xobgp7/ISSfJOxGEmY6nUKuQot+E++SRof
         vFe1JbFDFWBgJ4y8H5NajRRkS1pnc6N0hJ/qqbN0I1kCZqIiiASO2OyZmXoeN/G4Orlz
         yJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708505756; x=1709110556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWgzr9qm2ixV3STt2Qq+/qGSNGS+7XQCw88w5N997QU=;
        b=JhqXAmGfQ0azDlgVYir7GCX6kVgxkTWueHMLCMHhqCCLQncT3iCxAjy4Z0gP6H+9/0
         ptYh81csQSeYLaztExclCbhCwSrSlkazjqpbT3m+IJxuvloJOW5VgjMfu/ed2/n1BCNR
         ftrGgQx74KGkifqzKw7E+TfACDTL3Q+YrGriz80Tcx/vKRhPAebXl1EYEI1Qe4jAVbWw
         HepqRwMqmcgdWjlwJC3uhpwz04zcPzdbuS0WfhPVrO5OpDfty3+pGBamAmK7MfWVewiX
         ZA3Hn3zg7whPpxijpYpXsNps4SMmw4PscE/e6S+R8sqRVY/nV9AQzV+7h/DfOeSy2BXh
         72kA==
X-Forwarded-Encrypted: i=1; AJvYcCUpupDcsb4aUfoWhI2dgN6JdAYH2TfIp58KFWCCZq/qputxFJhsuE2Fu7nnu9l/7sy22n+eBY9CwkEjzO7CsyVOWB3XMmkGGigkmq+pbfAdgveQyfRrge/XgryOj2tkaHcZ+JrDwFdJuAJZ2bXQ56P4ON1pjse0Vko=
X-Gm-Message-State: AOJu0YzRCj3bkNwA+l2vlsgISDk5nJ78QVYxH0c0+YLGwXEeB7Q42LKi
	2wr1uzchjux7ZWVnoOW3uBYu0DLIhNOUK9q3t59p22nXHHX9TZK1jpeWD1EI
X-Google-Smtp-Source: AGHT+IEsgZ5ECXJwsdJ2M1bEqD60lRnejSLvsJzQJfvw5APeIUFuGL5UdWpxBrtnmYuAEfEJSWsKHg==
X-Received: by 2002:ac2:593b:0:b0:512:b366:6c42 with SMTP id v27-20020ac2593b000000b00512b3666c42mr5168372lfi.32.1708505755809;
        Wed, 21 Feb 2024 00:55:55 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id p13-20020ac246cd000000b00511570772f1sm1578415lfo.303.2024.02.21.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 00:55:55 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] arm64: dts: mediatek: mt7981: add watchdog & WiFi controllers
Date: Wed, 21 Feb 2024 09:55:47 +0100
Message-Id: <20240221085547.27840-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_005558_393468_63F637CD 
X-CRM114-Status: GOOD (  11.86  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981 (Filogic 820) is a low cost version of MT7986 (Filogic 830) with
the same watchdog controller. It also comes with on-SoC 802.11ax
wireless.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 2f89b18bab17..0dc49c47dfc2 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/clock/mediatek,mt7981-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/mt7986-resets.h>
 
 / {
 	compatible = "mediatek,mt7981b";
@@ -62,12 +63,19 @@ infracfg: clock-controller@10001000 {
 			#clock-cells = <1>;
 		};
 
-		clock-controller@1001b000 {
+		topckgen: clock-controller@1001b000 {
 			compatible = "mediatek,mt7981-topckgen", "syscon";
 			reg = <0 0x1001b000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		watchdog: watchdog@1001c000 {
+			compatible = "mediatek,mt7986-wdt";
+			reg = <0 0x1001c000 0 0x1000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			#reset-cells = <1>;
+		};
+
 		clock-controller@1001e000 {
 			compatible = "mediatek,mt7981-apmixedsys";
 			reg = <0 0x1001e000 0 0x1000>;
@@ -142,6 +150,22 @@ clock-controller@15000000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
+
+		wifi@18000000 {
+			compatible = "mediatek,mt7981-wmac";
+			reg = <0 0x18000000 0 0x1000000>,
+			      <0 0x10003000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>;
+			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_NETSYS_MCU_SEL>,
+				 <&topckgen CLK_TOP_AP2CNN_HOST_SEL>;
+			clock-names = "mcu", "ap2conn";
+			resets = <&watchdog MT7986_TOPRGU_CONSYS_SW_RST>;
+			reset-names = "consys";
+		};
 	};
 
 	timer {
-- 
2.35.3


