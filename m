Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDBBFC02185
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2025 03:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=; b=rLYIqCdZLb7UwyRYFNV9v/XTSt
	ows3sJMQv9IGYTxuo600Z8zkoIq7ZvOWW87MGAr3pyqoTq16wgJaVoStOpfD39lsqmkGAgJkWy3XA
	6MYNKKKEuYjjjBS8GGg7SzcRMTkqwvGfar8zJ9J9hEZqq1wKTMhngXDo6vaUhrvfduqrxHr1A/6Cc
	ST2SEab4fBHQXK9pmxNrB2Q9XeTB3DklLqSLw0of8oRsqWJVjyMJfjRx4XpmhVf0v3TTvRsrsuWDt
	Mfk2q4yJtnz/ywXsE0Wll/BRaZL8H/qszpGAOE3F9tmqIWNFMPGGHnff+zGSyH0IGeVCL3MLfNfxN
	ouGZVKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZiZf-00000004ewo-0MQ6;
	Mon, 20 Jan 2025 03:35:39 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZiZc-00000004evp-3gxT
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jan 2025 03:35:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21c2f1b610dso64176025ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jan 2025 19:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737344135; x=1737948935; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=;
        b=hrbLIzwRQYLAJqeUQElEGIfzp3IMShuEGiwNN55IMyVbFTQeZgfKjl1X6RO5HJRngE
         lKamWyxrLg5T5/5auKMrUB3yL8Zqe3jtNulqXPGeGrvydxN+1I0JthFX9O1Nmm4MdT8a
         2bDGGFlM3itR9nd1bj4rirPXPl1coGR5/CfUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737344135; x=1737948935;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9SAvhC/1O9xhOgEJgltjPIiKB+jL/KUsbTgQGFrTOI=;
        b=KMF2KRPjL6DcGCBynAOGyk3OZq0QWieHKQozZaLl9qrP1bWQ4yw77iFEwR8p/NwiXQ
         CFjBfp9WkXgBp6tViyQWD5Y2q4prgQgoWt1mM0rUSel5SDy+B2F+ZLOoyF8QqdYnFWcU
         DkPDjNH9rSeIZBgXEa+u2oR81usvlPH1P+3Hrt9WQh+OXGEbvHcCD6UjeElbnEcFaXHu
         Bj+GQALzV/ZHjltNn3ly87jLyfCLyJ+H2b2kmn8I4quzI/4HhOJ0iYgQGTFnf/SvSqRX
         G/fty/cYTKrR2iuIbxfjMxLOVPEwmYRzmioDmm9pe+tlSIZWjC5cB4MA0fqc/eIZ2RHK
         vrlg==
X-Forwarded-Encrypted: i=1; AJvYcCWkYWCQqZZECZdiDTs80x9JBMqc7Dte9+accYu/ZvFrHr5KESCdSIMN5Mhn1ErftWFm/Rzlnv4uU2Syx4h/5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVA0jxQURvgfg+NwULuNFBNAiZS5eZSSLrFyIWbl1GS6FIpf/w
	SGrsW3UEB//5DB6EHd6Wc1/3lj2tSh0R9M0iQDMoBR2nzeQilGDFvOHpsGofzg==
X-Gm-Gg: ASbGnctxQWKpsSP2zvyrFjBtSFEJhcf8y5u1YNqkN+13EAGW1vFYaeUrH9VDEExeKYP
	fjhWozFuUvpw9j3zr6G6Cm/S3HrY/+LBM3QvBwym6hpBMnGTbdX+9qozxUL1j7j7llIkmNHcWzn
	yqE7avwraj6gBMSTu7QkeR3EqBPMtvYOrg3FQU/8/vyvXaKlVph6jWszPR8PTYJKsFtV1XHxDt7
	PxqQ9tGHy1Eru6dv8a/wnVoiOxUbTLGXG+S4WwJdvoiuGeKOkMQjFBmLHQoNzJck7UR4JMhEJil
	tfYl9Sqp9g6EgMhyqwZRFlsoJJkTMMdytrfhi0BJuy9V05ki63RHJhsvWtUR
X-Google-Smtp-Source: AGHT+IHoRnpouPTg9I2Td3asAfewVxkgQF59sVedTc1vZI0Q7LF6MuUmo+EelqKGuxFWOIGciJakbg==
X-Received: by 2002:a17:902:e74c:b0:21c:fb6:7c50 with SMTP id d9443c01a7336-21c3558fc36mr180974915ad.31.1737344135597;
        Sun, 19 Jan 2025 19:35:35 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a91cesm51473855ad.133.2025.01.19.19.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 19:35:35 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 20 Jan 2025 03:35:29 +0000
Subject: [PATCH RESEND v3] arm64: dts: mediatek: mt8183: Switch to Elan
 touchscreen driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-post-reset-v3-1-8f394bb25c8f@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIDEjWcC/3XNPw+CMBAF8K9COlvT61n+ODnI6qCjcQB6SAcoa
 ZFoCN/dhsVocHzv8ns3MU/OkGf7aGKORuON7ULATcSqpujuxI0OmUkhdyAg5b31A3fkaeBFFce
 lQAUxIAugd1Sb5zJ2Zef8kp+O7Bb6xvjButfyY4TlujY3AhdcFYUuE6WEwORQNc625tFurbsvS
 6P8r2XQMtUKM51kBOmKxo+WgF8aOXCqUOg6KzNM4UfP8/wGs95tuisBAAA=
X-Change-ID: 20241018-post-reset-ac66b0351613
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_193536_951181_4468074F 
X-CRM114-Status: GOOD (  13.87  )
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

After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), the i2c-hid-of driver used by some mt8183 devices resets
the touchscreen without having enough post-reset delay. This makes those
touchscreen fail to get probed.

Switch to Elan touchscreen driver, which has enough post-reset delay.

Fixes: 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
After commit 2be404486c05 ("HID: i2c-hid-of: Add reset GPIO support to
i2c-hid-of"), i2c-hid-of driver resets the touchscreen without having
proper post-reset delay on OF platform.  From the commit message of that
commit, not to decribe poset-reset delay in device tree is intended.
Instead, describing the delay in platform data and changing to use
specialized driver is more preferable solution.
---
Changes in v3:
- Remove patches related to the race condition of pinctrl since they are
  not needed anymore.
- Link to v2: https://lore.kernel.org/r/20241018-post-reset-v2-0-28d539d79e18@chromium.org

Changes in v2:
- Add second source touchscreen patches since they should based on the
  first patch of this series.
- Link to v1: https://lore.kernel.org/r/20241018-post-reset-v1-0-5aadb7550037@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts       | 9 +++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts | 8 ++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts | 8 ++------
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts | 8 ++------
 4 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b..b226dfee22669d596e5b45a7cc02133ee4aaa828 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -14,16 +14,13 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
+	vccio-supply = <&pp1800_alw>;
 };
 
 &qca_wifi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index 72852b7600383972d98d9b0edd40b6e99e34a85b..863f3e403de8577da41b17b144cdb17c578b2027 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -27,16 +27,12 @@ &cros_ec_pwm {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 &qca_wifi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 757d0afd14fb064fc1de4608e65eb1a561c4dfa6..e0a583ce4a0bb18095a77d23ab8409bb80898979 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -14,16 +14,12 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index 6641b087e7c5f3a957e43ac985137dfd84ac7878..7874c9a20e124c65ace3f90e2ec5bcaf59b69c40 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -14,16 +14,12 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&touchscreen_pins>;
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 

---
base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
change-id: 20241018-post-reset-ac66b0351613

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


