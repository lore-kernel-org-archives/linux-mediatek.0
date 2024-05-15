Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BF2C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 08:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPZC2tLZzoMwQUMQ/NsgDeMOgcmg6uOukKnCCk0Jz0k=; b=OpCXoA0rtn4Lq5GVAwlCJrHrvg
	TGS8g8FZrrUJCIFxrox6xyXDW6Ol3TabmzMn9NTiAK9M0NO5MpY81aDV5Ll1WiNz+hUYhYcLEP9ps
	+7cfSP3dndGiLrqG02NhKsH1lQN1GNoI9ds7JzGMDd4mzThq/mDDs3H7m0Faqi+o7mSa9UinC0Pus
	9x+0X/Hey0404YGE/uttyg2mAGVUgIhwIL5sFSeABFTUelhnu7rFdm5PL4vag1Gi3zi1jgXQE4qWA
	hMgUeZZsRW+KZKzrt0Qa19uQuqXFvXm3zlrof1tPZIRTuc9X2P2MGL41aXAP9sL/UB9xAJgqS5Knj
	hSTEzpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7AMv-00000000zbs-0OnC;
	Wed, 15 May 2024 08:52:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7AMr-00000000zVW-0UrE;
	Wed, 15 May 2024 08:52:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-34d96054375so5104164f8f.2;
        Wed, 15 May 2024 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715763118; x=1716367918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPZC2tLZzoMwQUMQ/NsgDeMOgcmg6uOukKnCCk0Jz0k=;
        b=nFoeftwaMxVQGXCzrZNekrnX1k4LpX3ryTW117lh0VRPPaav4ou3nHiB+8YKzFdbuF
         AgW9ewgEk1UAAsSlqSbkrNV3Nn3ZDYoCetWPgZFhl3XYYLLe9QKXNzLd9fQ5oHz9YOfJ
         mvAOBP4KIXTuYHiZ53q+OPBwGwpdP+SWKAoVMeMJ3Veww/4qcDYtdlbsfta1afKJ+jEo
         rvzc4DjD7OWIy60JfQ9XLphp8MyZB0QphEb0IGOINSqZP/BD8G1pHPrqy7J2KbBlJ1Ws
         ZVwN+i5EJo4Rr6Nk0rO4ufDHqWw4UxerbfzqVs90zzEu22CqjdWIXuYB9myM5R4ZuubQ
         EZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715763118; x=1716367918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPZC2tLZzoMwQUMQ/NsgDeMOgcmg6uOukKnCCk0Jz0k=;
        b=shjGHAfejLnhKtO8j4rqJVsuvG9cWRz7M+hbSoD8TvBAF7kriuqLvFLNX11BuuWvzJ
         qWIWmcPs4LgUG3cGV//x2VFBxT1YLjHQ+23ONJW14dl6cPVIp65vK5d+1y0CqeH6wbIk
         JO+shgMITyeRWzp54cQBHxaON5c4oUkS6/9f3Wag3Tb8xof+j3g3RhPa/vsVli/NbMok
         npYMa/asadVcJQaRIkxqvhVgYKWPD3bxOEwfc27j0qT4YWzGQG2H3xQ+5ZkT0U/isMW0
         c2+pRae7fuwq+FjZr3i/X44przPjbUjzwCI91dMkxHFf4+ZBimhAYBKsfN3E5fPr96ye
         cJxg==
X-Forwarded-Encrypted: i=1; AJvYcCX7mb+Xulevj8sGtVO9gjmE0t8ypaE3sCAo1pdk30CJY0wrNFOmt3NEUJorTMwy0DEzy67B4lTD1d9oWNwAvCWT0Zun46/26pjssfO5Y/3AupcnohKPvJwO0yNXrdOgrTPr8S0G8mdQOgsiRr4hasAqSOfmxqxh1rA=
X-Gm-Message-State: AOJu0YwBUTF1Y264ke1SGCmB/rfmF6v6KHcGDju0MRYTt25So8r0B3Jr
	Qr1QS0CTP43INHxREqJ/E9SRAPcQVZGrnpd0CNyMfUGqT0Hl7odq
X-Google-Smtp-Source: AGHT+IG0SgB8ilO2X7vWlAcw0j1o8wIr1Ltsv+huCeg2g2aeWDyRUcSAab3sNsKxpfx63E9tmVfbbg==
X-Received: by 2002:adf:fc08:0:b0:34c:cca6:3d18 with SMTP id ffacd0b85a97d-3504aa66a33mr10191172f8f.68.1715763113485;
        Wed, 15 May 2024 01:51:53 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a8454sm15825034f8f.56.2024.05.15.01.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 01:51:53 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mediatek@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [RESEND PATCH v2 2/2] arm64: dts: mediatek: mt8173: Fix timer 13 MHz clock description
Date: Wed, 15 May 2024 11:51:05 +0300
Message-ID: <20240515085137.2842804-2-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515085137.2842804-1-alpernebiyasak@gmail.com>
References: <20240515085137.2842804-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_015209_199951_DA06775E 
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
2.43.0


