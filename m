Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68362ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c+CXqJzxevLGaFZnXFMUkD0mAJpWpY3HHP1XZ4X/APE=; b=hGQJPxJIwy2+iqKbjHrAaGfm51
	c7woA3Mg9YLmiXNZVMWFP8Z2zq9H39eLHkJt1vSeQqhX84xO5kOcjpLbBe8/a/kWXjrQKZR0Qqxo4
	UqPAY0aqEK9cX0msZGo2mhCbhLr5lfXqO5Cb/nquiF9wlFwwH8AyTp9VhSXFrmTE67Yub3Ptrgggs
	59O0ofoqGqVwsNKP22P+zuN852VfMgDk9a6YjrBuAe1D7ziGHEFhR9lTAQXzeJvnXnkx/FuT9iNN1
	YZNhaKaTlPjc7iO0EDhla9/KKJNWlQdulRZg5c7WveTd3SyvQjz/Xej4K/mgz6ExmnH0zgbX2yeu/
	Pprbl9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSCV-000YrU-Oj; Wed, 14 Sep 2022 13:13:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSCJ-000YhY-B5
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 13:13:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso11488186wmr.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=c+CXqJzxevLGaFZnXFMUkD0mAJpWpY3HHP1XZ4X/APE=;
        b=u+XT01IjaCLCz8d+8m02RUkMURuAC7Y57T1yTElVAjMz9t6zu9QTskZ5/QAmrc65fk
         lSi/+v5aP2KayImK4B6PQOyCfqr422Y/WnQZZMKdLnyBKnRaDW118CY5G8nnn4yzS84Y
         F2ZQBm+0A+DPolf9fdy4KYUeGvJiBd7S5fkVlnJx1NoDK/vWe+/NqmcHWiWbtDq5OoiB
         +/40yL0rksS9xZhUCsMiCJqryi6y50sPhTWQtMYdiRtei42pIpTMo9rmdope+0sUSVoV
         f8582kLOEaWVVhco8EAP9WW3fKhgqLEBrj5NqpyEMw9ZT3waIpijMBbB5Hcv5/weOgm/
         mgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=c+CXqJzxevLGaFZnXFMUkD0mAJpWpY3HHP1XZ4X/APE=;
        b=nN6x8rGxoyMm0J1NX2LaELvtBjly8AbS7mDMEoZ+RzrM911rMF5m9+a7WWyV8vJ421
         ZLTXKBkV24JNCTe+4Dh7TpGV6NDDg5IUfmclck5B5K/NaHNxITTPay6K05SDczseBnap
         qvViX6edaLdibsGRse0JsYjfk7P7uwaOFXJV36bt41c9lzU9CHoBbndnU4r2uicGTexI
         Q4qCpmtaJTqhIEGcanVShfz+WYIzOhIPIG6/0KFOciaeKTo+x+xC+5Dbb8rw+6wsXpor
         CCHaWOM0iWnJYlmLdHHueKaV3XekyvyNXBWGaV7189eG07iRwAtnFYNEHEltzE4UVECj
         wjvA==
X-Gm-Message-State: ACgBeo2pvLljb+Aujm2hV9msvdlCHvSGNBe3Ow9kEwuYIl805Do+g3v+
	XY7sAHWJKoQPEXvH3OcjrmFjqg==
X-Google-Smtp-Source: AA6agR6AhmsKmw9U1RIEhuPZ5xg6Jj809FQ9MFO5psrfyvEWyVwyGP/mSb/5Gtm2SZ+pZAziD10o8A==
X-Received: by 2002:a05:600c:1ca0:b0:3a8:41cf:a31f with SMTP id k32-20020a05600c1ca000b003a841cfa31fmr3115606wms.161.1663161176590;
        Wed, 14 Sep 2022 06:12:56 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id c6-20020adffb46000000b0022acb7195aesm970605wrs.33.2022.09.14.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 06:12:56 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: 
Date: Wed, 14 Sep 2022 15:12:19 +0200
Message-Id: <20220914131219.18236-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_061259_398355_9880BB53 
X-CRM114-Status: UNSURE (   9.30  )
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

Subject: [PATCH] arm64: dts: mediatek: mt8183: remove thermal zones without
 trips.

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


