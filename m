Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BB9C30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QckC6gjfMonIYwuSOvK7TGa+d6/Qqazmh3+ZmkkxyWM=; b=BBtnt/vY8qJa07PQR309uy5SqB
	CZAIQB4xZ+cbv/30FmaNaNoQ+UoTlnJurvgB+ZDkjUMzdEt9Q4rKG1AqgicfowMiDIHz1VwgGCOR+
	vCIPhNBnnJ+xu3AUyscWWsoFndXl15JzPjpmpKF49EizbqUrNeoY4u+O4CAAb0DeAGEnyln3uYLnR
	onRWYmNvauKZzd0GTInLyN7ZMwDapVK6A+GNOVfQu00Wgd+vgU3uJwOyW/VbKqequeYnHZfmfDA/+
	eL86nHP74mPIzjNa0wRv2ZLMflVpLHgXNGqUBwKh+6bQZV7iJSUElSE3+K7ZhYcxjAs552hO8GjW5
	dOKrHUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2t7-00000002KK7-1YLA;
	Tue, 25 Jun 2024 09:54:57 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2t1-00000002KIc-1Mup
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jun 2024 09:54:53 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70677422857so1463894b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jun 2024 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719309286; x=1719914086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QckC6gjfMonIYwuSOvK7TGa+d6/Qqazmh3+ZmkkxyWM=;
        b=EDZOOEc0VAU7oDsbG9dX/MVwY0UsktMqeUGMLiiWrmxo5W7KFsTVaeC9Js04VZ5IBv
         mFEAGemx4tVOYIvcrMBbD27cRSZ7xuaDh636DuPJabx/i3RtWCKf9x0Ezj41fzCIa0CK
         MHkD9NFvKljlJDFNL/m0pF5NGXWzQXiD2CQ1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719309286; x=1719914086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QckC6gjfMonIYwuSOvK7TGa+d6/Qqazmh3+ZmkkxyWM=;
        b=bpT2xgLJnCWRbwXD70HMX4K6LilKbp5QoW/OvWCW6dZKRbZbIb52A02k5O/VKsfNc0
         0hS4xr7tuI7zBZCU8lQjDX6q2L0C39+aIKXagrUBjliyf5YQFy6OVEbEc1GMNAdcGYci
         vYLaroy8DSxUMeNApew5JQzFKWqseLT+KVKMTDxP2vZ5d8CkoAklQjUyF79gCxIoJXDk
         I1EN3bH9ze/TttVf0/I7jLfWmK3y53qnnYB3hv+Bw7N2Ql0phT9KVDItxd79w9sIj6O9
         sAozIVNXE/epHR3zXPi+w+90r7we85i8O6Ha6FQ3qhbq0XgWgpmg248rgn9CdVP1B0Ma
         MLbA==
X-Forwarded-Encrypted: i=1; AJvYcCXTkYA7syWajcdw1gbEi7BPEP23njGfWl9M5nqaJOrFfs/AHfU3Wz3aemSYI2JLYMDDbJ5hGCNA83usjyrEeAsAA7iGHGVZOjZXBIVGSmGE+vy4
X-Gm-Message-State: AOJu0Yz3/1v05KF/g3293eMOyI0lkl5/TWPEOf9E295Oam46ZWOkDKkJ
	BRH6Nk8OvLbiiy2EgNjvl/5apRxjpx/oKRpnnDykZPNkyPIhdgBHhCFNZe6Adw==
X-Google-Smtp-Source: AGHT+IFKN9C95q1Ki5Q76MKs7sOPj07I0lD5UA8cTwdJwE3Zz3ZT22U72tlalk92pRM7lhXvwJPtPg==
X-Received: by 2002:aa7:92c2:0:b0:705:c029:c9a7 with SMTP id d2e1a72fcca58-706745b6d61mr6257366b3a.15.1719309286177;
        Tue, 25 Jun 2024 02:54:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ea5a:67dd:bd1e:edef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70691ef0c7bsm1747683b3a.4.2024.06.25.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 02:54:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8183-kukui: clean up regulator tree
Date: Tue, 25 Jun 2024 17:54:38 +0800
Message-ID: <20240625095441.3474194-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_025451_397175_D1E30B4B 
X-CRM114-Status: GOOD (  11.64  )
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

Some regulators in the kukui device tree are modeled incorrectly. Some
are missing supplies and some switches are incorrectly modeled as
voltage regulators. A pass-through was incorrectly modeled as a
regulator.

Add supplies where missing, remove voltage constraints for "switches",
and drop the "bl_pp5000" pass-through.

This depends on commit 2a99858c172e ("arm64: dts: mediatek: mt8183-kukui:
Add PMIC regulator supplies") for reg_vsys.

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
Fixes: f15722c0fef0 ("arm64: dts: mt8183: Add pwm and backlight node")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 22 +++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 64b3389028e9..57d962e94af7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -24,7 +24,7 @@ chosen {
 	backlight_lcd0: backlight_lcd0 {
 		compatible = "pwm-backlight";
 		pwms = <&pwm0 0 500000>;
-		power-supply = <&bl_pp5000>;
+		power-supply = <&reg_vsys>;
 		enable-gpios = <&pio 176 0>;
 		brightness-levels = <0 1023>;
 		num-interpolated-steps = <1023>;
@@ -47,10 +47,9 @@ clk32k: oscillator1 {
 	it6505_pp18_reg: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "it6505_pp18";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
 		gpio = <&pio 178 0>;
 		enable-active-high;
+		vin-supply = <&pp1800_alw>;
 	};
 
 	lcd_pp3300: regulator1 {
@@ -62,27 +61,16 @@ lcd_pp3300: regulator1 {
 		regulator-boot-on;
 	};
 
-	bl_pp5000: regulator2 {
-		compatible = "regulator-fixed";
-		regulator-name = "bl_pp5000";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	mmc1_fixed_power: regulator3 {
 		compatible = "regulator-fixed";
 		regulator-name = "mmc1_power";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
+		vin-supply = <&pp3300_alw>;
 	};
 
 	mmc1_fixed_io: regulator4 {
 		compatible = "regulator-fixed";
 		regulator-name = "mmc1_io";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
+		vin-supply = <&pp1800_alw>;
 	};
 
 	pp1800_alw: regulator5 {
@@ -92,6 +80,7 @@ pp1800_alw: regulator5 {
 		regulator-boot-on;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
+		vin-supply = <&reg_vsys>;
 	};
 
 	pp3300_alw: regulator6 {
@@ -101,6 +90,7 @@ pp3300_alw: regulator6 {
 		regulator-boot-on;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vsys>;
 	};
 
 	/* system wide semi-regulated power rail from charger */
-- 
2.45.2.741.gdbec12cfda-goog


