Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D2DECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kK+4cuyn2x8bZa+3XjGCMKovnOpMsppyq3qKsdF2ffg=; b=sO/2NNXMjI45w0iV+YDUcl6P3w
	OpYAFBOAi3yfkiYEnSA+de89M8lm1Pa2/staVpjrOSOFByBIjetzqvcS9/5EnaKq2RRvzV6DJNcgg
	RIKzfJi5m0XyhErjq36irDehHD6Hj2x4ssncLi2uHBJ/BhtqPRiEuRF+wYZUtc+vxnqS7xbd+dywx
	99PdWCWFfHo297GREMGDyokDFD4VHbFxSt34Sb7h69e7H112XbJ3VNgViKR8ZNjLIRQm8DSXFN3y6
	8PYscrDQT2Vy74KIJsqFTU1mAK+o6HE6zsVCbtbNsLr1oPZOB2RHtiVjPGPjGb+yuKeRL9xIKvTl5
	rwWKAGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSDo-000aFI-Nb; Wed, 14 Sep 2022 13:14:32 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSDb-000Zuc-6x
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 13:14:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bz13so25666375wrb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kK+4cuyn2x8bZa+3XjGCMKovnOpMsppyq3qKsdF2ffg=;
        b=QsXOsr8pctoL+dvXPhfMqitnyDpitQBYg6IdWPYLziAKQS/2z68AXxL7Y8ZMgltcne
         aRWXDvzTef1JmAU1pf2KgQ3C64iplqyg/YeTwBCHmNcJeKXhHUS3gjMMoatV4usMNXqh
         jT1KbXksezwoec5WtRhMr+2YINIFL+hwCazWfsb7so7TtN26A/d+KthKpin0bK3PZZ9o
         azLTC/dob2rz2LpTSVPEsaPiJMZeiDbRL6aVLY1oFMG1mksf/l/OxB+yfHxzOJ6kSNt7
         Zl6U1orgyaCHeeD3igXHWtWyXRcLahQ+59syyXa6vDU8ReDYj8jIy586OOsSRZq9fCCM
         FsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kK+4cuyn2x8bZa+3XjGCMKovnOpMsppyq3qKsdF2ffg=;
        b=4WBb0kGBISXGikRRDdYiGjWmctBOtUwYKTQudDGp4ydIOBHUxgOY+/PwyvEUoi/Bsu
         4zXYkRUVEWbOvTvAXLyP1mdv1f7LVTveTulfYPUHDisBCfJKAKMF9O6YFRaRip/w+MEg
         enCic4zyZ8XRPBbWslgOyMubXSkKhDudVsXmtERE9ht+yAGThCw7ICSQ0oTXPKAzB3Hi
         j7aiVSx92hk3JcyUgGcprAVNbflbh7UU3VKqXinVybaXaNYhl+iJe/W0Ry9XRbfdJ1fd
         CPyNXgqcU6LqmcsS6kHFI6T4WKO7sL40hVxiYPkTShJ4IwIzZG64ioUrdOSKwmV2OBHE
         ntUQ==
X-Gm-Message-State: ACgBeo1jcwzAyzToep8WiUc4PqmB7ZfRrEGDyi5g2jJtw4rcV2G19r1+
	gdaoXOmI+vMMnjwrSautD4Jh7A==
X-Google-Smtp-Source: AA6agR5ANUi79WWgOf9jC1tlgp0/htkLuK+NlPCxd4hKwfEcURAD7sCnBetWwAbHCF5GbmcQcIv1Ug==
X-Received: by 2002:a5d:4602:0:b0:228:62df:7d2f with SMTP id t2-20020a5d4602000000b0022862df7d2fmr21723881wrq.247.1663161257160;
        Wed, 14 Sep 2022 06:14:17 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id o29-20020a05600c511d00b003a319b67f64sm8185249wms.0.2022.09.14.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 06:14:16 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8183: remove thermal zones without trips.
Date: Wed, 14 Sep 2022 15:13:39 +0200
Message-Id: <20220914131339.18348-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_061419_272439_7C793781 
X-CRM114-Status: UNSURE (   9.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thermal zones without trip point are not registered by thermal core.

tzts1 ~ tzts6 zones of mt8183 were intially introduced for test-purpose
only but are not supposed to remain on DT.

Remove the zones above and keep only cpu_thermal.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 57 ------------------------
 1 file changed, 57 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9d32871973a2..f65fae8939de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1182,63 +1182,6 @@ THERMAL_NO_LIMIT
 					};
 				};
 			};
-
-			/* The tzts1 ~ tzts6 don't need to polling */
-			/* The tzts1 ~ tzts6 don't need to thermal throttle */
-
-			tzts1: tzts1 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 1>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tzts2: tzts2 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 2>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tzts3: tzts3 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 3>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tzts4: tzts4 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 4>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tzts5: tzts5 {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 5>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
-
-			tztsABB: tztsABB {
-				polling-delay-passive = <0>;
-				polling-delay = <0>;
-				thermal-sensors = <&thermal 6>;
-				sustainable-power = <5000>;
-				trips {};
-				cooling-maps {};
-			};
 		};
 
 		pwm0: pwm@1100e000 {
-- 
2.37.3


