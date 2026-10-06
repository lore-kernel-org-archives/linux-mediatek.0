Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E5CA6004
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=; b=WES3aMIVMrPFT9FLRZSXEQhZIY
	ZpATBjsVbnPKcnIx1PnEWBQSCl2UgAKdq1yIUtRFXqLfI6u7MnOWO7byVLSb+GC36Pb6DG6P/E4CS
	Tr5NqdL7XBaidDPaAuZdtEpUKboUwKyT3S5W+ynVxHfsgfZsoUvEX5cllZjmxmxmcqehB5oGMsnFT
	GF4Pr/Y4qnK3oFeRFXzeRfr5NMFN4o7vdFCb53LHWxXtuwDpksQXfojNBTG+NkFQKAV+mpLY9ZHvt
	29Q7JG1p9CoJ6tFiCKB1jC4jNDv5aGgZzATsoybfNvVokR4OHQcZ75CU56WgeNbid2w9z1q4W+I5L
	F7WAMvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBja-00000001MU7-1yLM;
	Tue, 06 Oct 2026 20:25:58 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjS-00000001MNj-3bnS
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:53 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso722701eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 13:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318350; x=1791923150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=;
        b=jTvu4fa8X5hSTr1CqEAyDwWuBQqbBaOeVK3bUlXQrkwfwtXhchx+BGL0v13WPK6jX2
         4Z92FEZM/iURFvorSl/B2KyXtBJ+4yvrwReb/2JCBpM0Hhh0ozThsEDKmkLhJCDXjMso
         VBqGNkB6QkanSIhAgdazyfA9w3zYWkyvcbSLjnqzq3en5SGQ6fdQnSPiNzuDOx4VgPCm
         zX0Bri4a9yR66pXLkb19IL1AQzkPEnxEGwBGkQ8Ufvr+rpMm2iVRqx/dWWKkpSV27iSQ
         JVyatLjAHc/6/T1kPImdBs8vVFyoTYRPLXrfOuC1JyBtn7q10KpV0OTP8qs/cgrIzEmD
         5QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318350; x=1791923150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+ILfk0/yu3AcCYfzlStmh4VnAqvAHjplZrGY6KB/T8=;
        b=sKeQ7aLwgsSw/vxi5kcfsR+UCsv76gwAy4FlofrAkf2PZpHoTZZ8z5vEzGchAvoMJf
         COFayGCnnUTZHYyajFca11JgmJWK9NcSMvIS7Q/tcaZx3zPfAbu59kik3vJHqBXdUWoz
         osMisP5Zt/TjRhAZ7eTo/7g8BpHpmbuQvDTJXTVKkaDnK8id1qTvTrppfU5SHSPrc/bu
         g/8JguDf22/cLmu9FhhBPh1MYd4CRfybl8r12AO8L2kvh10YSjSpOpqnLYhi8Pwqb3Xi
         6+sxBs+iWP0lZ1TiIM+XKjI+6QAGZ3noZlhXsQrZT5yDsAyh72yC6Fzxanbx1ChMFnkv
         dcJA==
X-Forwarded-Encrypted: i=1; AKwUvBw4Nqq41LINpTxQpYgV2Szb+bpjP4SGNlJEHUun9kl+tAd4kCrFZtUKCwmv7U/mHkeGYknV1EXOlRiT1Ibnjw==@lists.infradead.org
X-Gm-Message-State: AFuF++kobOus89kFNpjOtRcTqwOLWa4zWNaBLAYssetuR8W5xizQfZWj
	feSeL+ILKy/2vxY/3zt+fJfADDjLa/GxjSseF3RjfXT0dO7VZ7uRmyB8nvfwbfWuHvw=
X-Gm-Gg: AYBFou0bG/MV1wuRDK8hJsZkg0Q0Sl+2hKdHQM47uxVn6v2lIV3sEykguR2crO9I0fH
	R8QwjAYciWjyIE133P3+/9MGKNKmVfrvqWLzLOi0apASOp7Ja3UFqgucQ4TGJzRuats0dZnyVaQ
	tfd9L+vwwslzJOTD4aHZ51ATf+MLjtNBJmEJZE4Z8cHjy3bSbpFPqBNxUv2oUFCIjeuSEwCP16G
	PsaX/cy+E41H3nLpkNvy2p3Amp0/8J8/zcv9BOhP1T873+QewIHRFyvMZ4O3Ap7o7uDjXD1gn8q
	Goihw14WRzp51tFRz2ntohiI3qKyVgvsCrmLjw0dRWCxv6A+HPyNL0nootZPlsFCMhMkx8lsfyC
	GcwaI7oVz+em+pAzIKpoJQDdLNUtxqwHSju1zHpCu/O7ijNh25hyb0LWSmqeouDKxjliz+GfqO2
	l5P6wy46LeszP/Ow1NJTcKJb1+7VJJOhm1ZtNUuUknAAXNx9LoYFjqMG/0O3nxU+Y6mCfXkLCDD
	g==
X-Received: by 2002:a05:6820:4c07:b0:6d7:c2d2:3bb6 with SMTP id 006d021491bc7-6e7a825d4a2mr306044eaf.74.1791318349916;
        Tue, 06 Oct 2026 13:25:49 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:04 -0500
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8395-genio-common: fix the
 panel supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-4-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=EOMVP3YQwkcIyqlWrQGFAqi7cRnWf4pYZmNhfVKctYk=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVk6xsdsb38h2XMoZmyUXwDh+TV2jSd63sKWb
 LEAsaeGN0yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZOgAKCRDCzCAB/wGP
 wOTwB/9qpjbVdEYGrVDi0toIg94lEZMC2rKuCDdP4g4DkG41TRMX0aSRt+zR3KkDxJ79JtVyIeK
 S+MIMyG8ojRbQ0JtT2MpPwX99fFJ44xH9o102h6vWagCYrVTTW/foDhJcKWL1r/LSZ3R2e+hdZF
 GWoHtZXRpEuqx1H8Du8FXvgPvATmIBKjVn1zNuKGT8xczC5l7VctkvrZ1m+TgdrzpvIVbWkCYV0
 i7jqtJ1kRXwdmsfY8j22vgm4OSBFZnW7fTwIpWgyiFu3ZpRg6n4ROXFI6k7A36VAL/MH9B7txNx
 pmagYP8bpZRWIwZGRsYixjEAafiGDg+mkOSiHsMiIg9lXTLf
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132551_341284_C00A5B66 
X-CRM114-Status: GOOD (  12.29  )
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

Point each supply of the Startek KD070FHFID078 panel at the rail that
feeds it on the Genio 1200 EVK, and add the vddp-supply that the
himax,hx8279 binding now requires.

The Genio 1200 EVK is wired as follows:
- VDD (backlight LED power) comes from VSYS through a switch enabled by
  GPIO47. That is the regulator previously described as lcm0_iovcc, so
  rename it to lcm0_vdd and feed it from VSYS.
- IOVCC comes directly from MT6360 LDO2.
- VDDP comes directly from MT6360 LDO1. The lcm0_vddp regulator only
  passed LDO1 through, so drop it.

The previous description pointed vdd-supply at the VDDP rail and used
the VDD switch as the IOVCC regulator. It worked only because the driver
enables all the supplies together.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index aef908df530e..f415b6f71653 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -175,22 +175,16 @@ button-volume-up {
 		};
 	};
 
-	lcm0_iovcc: regulator-vio18-lcm0 {
+	lcm0_vdd: regulator-vsys-lcm0 {
 		compatible = "regulator-fixed";
-		regulator-name = "vio18_lcm0";
+		regulator-name = "vsys_lcm0";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
 		enable-active-high;
 		gpio = <&pio 47 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&dsi0_vreg_en_pins>;
-		vin-supply = <&mt6360_ldo2>;
-	};
-
-	lcm0_vddp: regulator-vsys-lcm0 {
-		compatible = "regulator-fixed";
-		regulator-name = "vsys_lcm0";
-		regulator-always-on;
-		regulator-boot-on;
-		vin-supply = <&mt6360_ldo1>;
+		vin-supply = <&reg_vsys>;
 	};
 
 	wifi_fixed_3v3: regulator-2 {
@@ -303,8 +297,9 @@ panel@0 {
 		backlight = <&backlight_lcm0>;
 		enable-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 108 GPIO_ACTIVE_HIGH>;
-		iovcc-supply = <&lcm0_iovcc>;
-		vdd-supply = <&lcm0_vddp>;
+		iovcc-supply = <&mt6360_ldo2>;
+		vdd-supply = <&lcm0_vdd>;
+		vddp-supply = <&mt6360_ldo1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_default_pins>;
 

-- 
2.53.0


