Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED03E7718B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmzIfX5M4nWXT0OGtIvRXIhRj4X+KiyCehm2n5HGgW8=; b=h+bM7j7alUG4abXwAgP8PvdnfE
	1BmZ9d/u6dzMWZ15hnhuMSSjQVwMyemSYQzfDQMiqAKo6irlt8acvV/tvWi6V0VJpTCwGw+qX/VjQ
	SILx41bEoD+aS2s2tOQGRewsWLLXH184BDvta6irDIqn4yExf50++aYUTlYsnNnDuGxPM1F0MPWKN
	l+NkN13s3BZeJc6jYnMCErUB63vo349Qs6CuTFiTZICRfNUAa399lzre90w5YT6458aF37J9K8ZPh
	MW7oh63izGe3SbtlFwT716JJPUp40L56XkTWfn3Um25LQwOQPjP3rqcVQDHaJWhb7X/CxVUcaNpIO
	sjuVPN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfUt-00000009m1M-2PNm;
	Mon, 23 Dec 2024 10:17:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfSZ-00000009lmv-3Wnb
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 10:14:48 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2156e078563so34129765ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Dec 2024 02:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734948887; x=1735553687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmzIfX5M4nWXT0OGtIvRXIhRj4X+KiyCehm2n5HGgW8=;
        b=iZbSCCli46iHF0vnl7KFZN7qsriUupfVwxiWoGdKsiH2VWMhKOXnv6Pk7/fdRRsiz2
         ZqAsyvxA2Khd1UCbsgqj9ypAOruxsZCYu8pu86mV1OOjbdPDpGMiWurELj4HyQ7H+QLt
         8DzxBImq2hSea0MssIdWyQ1z5BnBcwFPwzxgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948887; x=1735553687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmzIfX5M4nWXT0OGtIvRXIhRj4X+KiyCehm2n5HGgW8=;
        b=t9qZBsCYmGYTQ2/7AA/XNM5b2X7UnipwS3ezsJWQDSoXCm/8jdaBxUxAug5a1/Qd0y
         MH4U2SYdVSdWXkYvTJ1PpuFyz8G7sP0d6jomqUE61HJ96Wy/rjXG+vS6nsAhibS+1pCU
         SvFLPP4PgVYYZjg0DFUVoOTyVxY++BzFy1W/2GqAA6R6y+FnmAWWCt/NczkjRU9I9Aun
         tY8TkyL60yLxb2Sy058BXbDVVw8edOnTeonGnwYk9Sa6EOGGhWgILC+kt7+FUzHG0rgr
         3b0UBzVOWV/H2p5c5qEwEgFw7wHHuZhF0UsudPeWUQdZAW6TcHWILA55oSa7CCT2gHlz
         +naQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs0jhn1vyEEbucgCuxEuzJWeIxr2GoDQ8bFms/Q97KNT0t3phlXntPKR5kvOuk3dSJbAUwXWIpTYdB+GgNfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDtipz6oMyYJMQvSVVSAqWqkLVrQXj1EFntgJGpCqMWW8QcvXZ
	yfk9JwJSN+EZulwxsISovFZr3/f6xeWNHzLJYAfXRsSg3pQwD4G3P1W7zpHeFA==
X-Gm-Gg: ASbGncvMFupCX/At/E2N/0oR66LrnSY3QY+L/V8GZn3iekQrulzTmInabYFN74o9htf
	zxLewGhfopwDcCSYo3aoIYSPUhqE0fODVDKDeC8Q/GAkA6a9f8mwd7lMexzw3rVVdN4kZPucw9u
	lqsHYyxHgn1rS2swBMVfH2W/91XUFQp45gCIfMUzVlgA7d5GCfr7tlUX8/uAc/U/2j7uuEX7SZa
	JgUFAEEBOoW4JY5pCIAVn4b0QEsmOva/FivkfB2B+woOn5hRQZchMuB/aiIYC7/OCDIrdVGSzs=
X-Google-Smtp-Source: AGHT+IGvn7LuflVagKwm3SfC0fRZuTKrAtTyakRZsoDywNt46ZDX54DNX8UbIKHJ4q6LUbIN1z/62A==
X-Received: by 2002:a17:903:41c4:b0:216:1367:7e3d with SMTP id d9443c01a7336-219e6eb45a7mr133755795ad.31.1734948886866;
        Mon, 23 Dec 2024 02:14:46 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4fc4:9ee5:ceb8:cb2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdde7sm70193325ad.149.2024.12.23.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:14:46 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8192: Drop Chromebook variants that never shipped
Date: Mon, 23 Dec 2024 18:14:32 +0800
Message-ID: <20241223101434.2170166-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241223101434.2170166-1-wenst@chromium.org>
References: <20241223101434.2170166-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_021447_883320_E304F8FC 
X-CRM114-Status: UNSURE (   9.65  )
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

The Hayato rev5 sku2 and Spherion rev4 variants were designed in
anticipation of shortages of the headphone codec. This never happened.
As far as our records show: the variants were never produced or
shipped, and no such devices were deployed to any lab.

Drop them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../mt8192-asurada-hayato-r5-sku2.dts         | 65 ----------------
 .../mediatek/mt8192-asurada-spherion-r4.dts   | 78 -------------------
 2 files changed, 143 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
deleted file mode 100644
index cd86ad9ba28a..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
+++ /dev/null
@@ -1,65 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-/dts-v1/;
-#include "mt8192-asurada.dtsi"
-
-/ {
-	model = "Google Hayato rev5";
-	chassis-type = "convertible";
-	compatible = "google,hayato-rev5-sku2", "google,hayato-sku2",
-		     "google,hayato", "mediatek,mt8192";
-};
-
-&keyboard_controller {
-	function-row-physmap = <
-		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
-		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
-		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
-		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
-		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
-		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
-		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
-		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
-		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
-		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
-	>;
-	linux,keymap = <
-		MATRIX_KEY(0x00, 0x02, KEY_BACK)
-		MATRIX_KEY(0x03, 0x02, KEY_FORWARD)
-		MATRIX_KEY(0x02, 0x02, KEY_REFRESH)
-		MATRIX_KEY(0x01, 0x02, KEY_FULL_SCREEN)
-		MATRIX_KEY(0x03, 0x04, KEY_SCALE)
-		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
-		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
-		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
-		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
-		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
-
-		CROS_STD_MAIN_KEYMAP
-	>;
-};
-
-&rt5682 {
-	compatible = "realtek,rt5682s";
-};
-
-&sound {
-	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s";
-
-	speaker-codecs {
-		sound-dai = <&rt1015p>;
-	};
-
-	headset-codec {
-		sound-dai = <&rt5682 0>;
-	};
-};
-
-&touchscreen {
-	compatible = "hid-over-i2c";
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
-	vdd-supply = <&pp3300_u>;
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
deleted file mode 100644
index 5e9e598bab90..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-/dts-v1/;
-#include "mt8192-asurada.dtsi"
-#include <dt-bindings/leds/common.h>
-
-/ {
-	model = "Google Spherion (rev4)";
-	chassis-type = "laptop";
-	compatible = "google,spherion-rev4", "google,spherion",
-		     "mediatek,mt8192";
-
-	pwmleds {
-		compatible = "pwm-leds";
-
-		led {
-			function = LED_FUNCTION_KBD_BACKLIGHT;
-			color = <LED_COLOR_ID_WHITE>;
-			pwms = <&cros_ec_pwm 0>;
-			max-brightness = <1023>;
-		};
-	};
-};
-
-&cros_ec_pwm {
-	status = "okay";
-};
-
-&keyboard_controller {
-	function-row-physmap = <
-		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
-		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
-		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
-		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
-		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
-		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
-		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
-		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
-		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
-		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
-	>;
-	linux,keymap = <
-		MATRIX_KEY(0x00, 0x02, KEY_BACK)
-		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
-		MATRIX_KEY(0x02, 0x02, KEY_FULL_SCREEN)
-		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
-		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
-		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
-		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
-		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
-		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
-		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
-
-		CROS_STD_MAIN_KEYMAP
-	>;
-};
-
-&rt5682 {
-	compatible = "realtek,rt5682s";
-};
-
-&sound {
-	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s";
-
-	speaker-codecs {
-		sound-dai = <&rt1015p>;
-	};
-
-	headset-codec {
-		sound-dai = <&rt5682 0>;
-	};
-};
-
-&touchscreen {
-	compatible = "elan,ekth3500";
-};
-- 
2.47.1.613.gc27f4b7a9f-goog


