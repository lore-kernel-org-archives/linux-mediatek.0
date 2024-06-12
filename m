Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E6C27C77
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L57epYYY3nvfIXWp0G2IWvPKM4CJXDaQCqlGAc5Qu2E=; b=dacU0OPHIqpnK0tMRVKCPt00Ci
	ip6wVeGejsnMfGG8jz2lRwELObZBsS8cuzJVSCgfJ99MdRw8YTgi+lmv7KMkPjFqdoTWFA/SaYCf2
	NMos7yEEutv4X3g3g+BUHRneePJL7imYFogVTUgwCEbihg7lZjKTm9d7RV6c0nqOaDei9/i1NVNNz
	lCQVm4ld+kZ+YIuX5tQf8S7oY4gSevybS/lA1uHzhzoYXhBBWGJY7BVU5jZhnU2bVJD1jdPeeHuXU
	0WenNUug9RQuY4cc7Ha3jW8d26XYAvbFdNqEtVRCqm7FOxVOcy3zLAE5J9rA9j5kVrfym+asXXcYj
	Q8RIbOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUKb-0000000DzMG-3h1x;
	Wed, 12 Jun 2024 20:12:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUKY-0000000DzK2-1xIe;
	Wed, 12 Jun 2024 20:12:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so3240975e9.2;
        Wed, 12 Jun 2024 13:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718223142; x=1718827942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L57epYYY3nvfIXWp0G2IWvPKM4CJXDaQCqlGAc5Qu2E=;
        b=j55vSD8Cjw2IHuQ7oO9YekF/71c5GrZXNt8SJnl6OIdewF30b0cZJPfMNirAKUDyc0
         XN2vJrSotaPDtAmyEQK8Fulbl00hC2hSkv+GyMNAZTzwZn3fIoRGJNOxX7Qffq+8YgdP
         Lp3RxE9MBBhXqcqUqgtRDzdqZISQdfDQz8RlpAULs3gHSbo/3nisZzrvm5Jfy82rgJzX
         ap5eMc+lfVKQDjtgRisiNF5sg6+Oo21C8C/a+p2KJecOeLLDd58P4ixtE1W1ecu/raQ4
         FoMI7OVvjN5jwZIDbESZFNaJJkpEzyCrrFHibS5DRmZiAEaD9W1FTxg1Aq++ee2FWvvY
         FnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718223142; x=1718827942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L57epYYY3nvfIXWp0G2IWvPKM4CJXDaQCqlGAc5Qu2E=;
        b=b3V1NnavPVUmxGCF/4j+YeyV8x3Dg4NFT+NYj+OyQMo4Oq2VWTdWBjmamaSIKIXPGi
         gJP1GnR9slJwQbaODG61qZxGXvtWov+t/9iOsMcFqGNXatUSacTmNy3rv8lc8FKvUNl5
         GyumNNbTTUZujNP5W9BTNfJKH5ccTlri2Yd4VYTkJNt/6+s5H91Gx6NmcqXSdwH7YXKB
         oXivY+sW/ZvGXM5imJoPlyFinOHKnhDPLlMIMnS177ShsYOiJmmZFES13FXm9fGzUuih
         OI3UWiI6WA/Eqsf7PxTC6W42zRTTnI9yw8fiToy3x5m2abV5DrviR5+o03hRdf4u5Qs/
         pHzA==
X-Forwarded-Encrypted: i=1; AJvYcCWzJccnNO960vkPGKn9glKJXOKphMxdgItPACeMR/Hf4Q+GBGN83MAC2KOXkDkca1XSzdMc2U26acDPla9C1FUAA92HkXl8FpRTIVg2EkOVnbEoKEIcTBg0MU1RhU6urnbauFo7YODQsXgA+WUUrs5jFi96khIEyjU=
X-Gm-Message-State: AOJu0YzCOcThhWP1Isi/9GCLDAbg7252LhpCftXDdKAF52D/2o1RskRt
	EJJyGR7Jvla+tl4aVwmXHCmCOIZxcRz8SEhpUOXqSeG9iyN3P5C7
X-Google-Smtp-Source: AGHT+IGILVEjmCSzS67jRWgdAuX1q4I+JSG4Yhl0SPgZJBIukT+wdXYEk+gjwPucjvRhmaopkGKifg==
X-Received: by 2002:a05:600c:470b:b0:422:52c3:7fe0 with SMTP id 5b1f17b1804b1-422864aef80mr28544245e9.22.1718223142436;
        Wed, 12 Jun 2024 13:12:22 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe7670sm38110205e9.6.2024.06.12.13.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 13:12:21 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH RESEND v2 2/2] arm64: dts: mediatek: mt8173: Fix timer 13 MHz clock description
Date: Wed, 12 Jun 2024 23:11:01 +0300
Message-ID: <20240612201211.91683-2-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612201211.91683-1-alpernebiyasak@gmail.com>
References: <20240612201211.91683-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_131226_536990_4245967E 
X-CRM114-Status: GOOD (  15.47  )
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

A previous patch fixes an issue with the mt8173-infracfg clock driver
when working as a module, but has the side effect of skipping set up of
CLK_INFRA_CLK_13M in that case. This clock is used by the timer device.

Similar to the MT8183, MT8192, MT8195 and MT8186 cases [1], change the
input clock of the timer block a fixed factor divide-by-2 clock that
takes the 26 MHz oscillator as its input.

Also remove the RTC clock from the timer node while we're here. According
to commit 59311b19d7f63 ("clocksource/drivers/timer-mediatek: Add system
timer bindings") it is no longer used.

[1] https://lore.kernel.org/all/20221201084229.3464449-1-wenst@chromium.org/

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---
Tested on a MT8173 Chromebook. But I'm not sure I understand all of
this, so review with a pinch of salt.

Changes in v2:
- Add this patch

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 3458be7f7f61..809b379b6818 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -244,6 +244,15 @@ psci {
 		cpu_on	 = <0x84000003>;
 	};
 
+	clk13m: fixed-factor-clock-13m {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&clk26m>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "clk13m";
+	};
+
 	clk26m: oscillator0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -530,8 +539,7 @@ timer: timer@10008000 {
 				     "mediatek,mt6577-timer";
 			reg = <0 0x10008000 0 0x1000>;
 			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&infracfg CLK_INFRA_CLK_13M>,
-				 <&topckgen CLK_TOP_RTC_SEL>;
+			clocks = <&clk13m>;
 		};
 
 		pwrap: pwrap@1000d000 {
-- 
2.45.1


