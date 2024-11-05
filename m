Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45027D1CA19
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2024 03:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSuXby54cMC2vAK6ojnOdnoa4iB7IjmAMiqN+tDw83w=; b=3gTdUD0yG5fInPzd8xa26YLvKE
	5l6suKar0HsxvobyXM7SYfhDfCmddvR+pCeGjVVAB0OFAeBr/GJZOBQKZEWtDk1lqMV+1u4DZFCGz
	Nk/IjFjzIC7xoT4t2k/ac+pG6W+m08p6dzBXRTVt0h1XhzrTuBe5S19EfEz9Ht8O+bo6HE9eH4OwN
	cXMJEbHtD5x6/bDm2wMWtsSjKacfNS7Vb2VugnSfAOi1l0iZQI7EMoVxHpKR1h6RTpcl66xjpVgoq
	UQjCIdqPtSDjweGxjItRNZuUgR0iYfD30O/CV81pbgHaP+YwLkYTmVK9Y2h/grYwLCwIBeB3gpVa/
	M7AXl+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t89yz-0000000Fjgj-1Ixd;
	Tue, 05 Nov 2024 03:11:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89vb-0000000FiqF-02sr
	for linux-mediatek@lists.infradead.org;
	Tue, 05 Nov 2024 03:08:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21116b187c4so33629605ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Nov 2024 19:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730776102; x=1731380902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSuXby54cMC2vAK6ojnOdnoa4iB7IjmAMiqN+tDw83w=;
        b=DPxQKeYgBE5o5KoZWR7qj4skpNVRIUlaA0fzE9B9wZu6V769yQNyu6JON5hS8mrwt7
         rosZz1q8Iyk27JsgsjH3X5kXDRCXmbDP+XTlf5stabRhAbKJm4aCM7zEyME8Q5cU33rr
         0OdGh2vGs4g23oUygMAWhtLY3UES5UvvNC5zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730776102; x=1731380902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSuXby54cMC2vAK6ojnOdnoa4iB7IjmAMiqN+tDw83w=;
        b=Zi35W5eHMUwgNhYMPy6gc3YiFuGJC9p3VQEgBcWe3dtW3w2Fnkyvc/vZUCd0LmTX+U
         zhUstQfvafKxdlmKbxv6yqZSeMLmOtq/cE97CsbyNkPif8DuylJCthlS5q79Ws0XbYd3
         1qbLvzomxGQKT5g9I9atOPa1muPSGXQM4BUauibaiWJhEOLx6lJMXNqef/R7d0SxTCfs
         dMJR/HN/2baEzp1AI849vR0TXIaMJxtDDsxdVp39KYUGRH+DtNQTUQVirm/eY9p1/ELr
         PWChjD+4tIALgfnz15uiOa/lu0xwZkgzy6Sx4BIkxn7RV3QYecUY7YONfKnZ5szD8Qtj
         Mwzg==
X-Forwarded-Encrypted: i=1; AJvYcCVjhfBH0LtwL+HjQHNZZcfKPGWxT5dt1sIPuRXudLBhAWCPz7zS84eD6mcRLa+OsIq3QZDgWKIWSa7MwvD8pA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxchVLwvpPvt3KinUgXxs7EJ7pbx3b5CdNEAb1n7KWm+Uq6Z/6q
	aDNQOVx3PfW+CUvkX9ZF5TlASsWXZiSy1vQu+E9Hu0nSds2fpZiuZPkbuzV9Gg==
X-Google-Smtp-Source: AGHT+IHuqQmwmjHY0D5zIUpVl/v6v6kAIikbzzkfJyep2UTBf3dxCno/2IHIhZ62pUvCmVudKfz89g==
X-Received: by 2002:a17:902:ce8c:b0:20c:e262:2560 with SMTP id d9443c01a7336-2111b0078bdmr185112795ad.50.1730776101869;
        Mon, 04 Nov 2024 19:08:21 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d8d4dsm67497885ad.270.2024.11.04.19.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 19:08:21 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 05 Nov 2024 03:08:12 +0000
Subject: [PATCH RESEND v2 2/4] arm64: dts: mediatek: mt8183: Switch to Elan
 touchscreen driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-post-reset-v2-2-c1dc94b65017@chromium.org>
References: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
In-Reply-To: <20241105-post-reset-v2-0-c1dc94b65017@chromium.org>
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
X-CRM114-CacheID: sfid-20241104_190823_096494_B9CA815F 
X-CRM114-Status: GOOD (  10.78  )
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
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts     | 10 +++-------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts     |  9 ++-------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts     |  9 ++-------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts     |  9 ++-------
 4 files changed, 9 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index ebe6e161354c414d91859494ec9295db75a3baf9..b98a3530511e576347a4ed291d37d45dd42fec97 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -14,14 +14,10 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
-
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
+	vccio-supply = <&pp1800_alw>;
 };
 
 &qca_wifi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index 2dc64cc539f815b9848b8243e5b487f22d605a6d..9fb329626a82034e44fb5fbd2d0ad9675c0a5afa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -27,14 +27,9 @@ &cros_ec_pwm {
 };
 
 &touchscreen {
-	status = "okay";
-
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+	compatible = "elan,ekth6a12nay";
 
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 &qca_wifi {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 53e996f9c605dc36df03d4b0051a91e19fefb38d..6d547361fc4f9d2ab1f9b048af443495c9bed323 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -14,14 +14,9 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
-
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
index d7db621383c6b823af08ca07e0794758d062e211..39ab09ce28aa2ed4335d5279a965f23a8458688e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -14,14 +14,9 @@ / {
 };
 
 &touchscreen {
-	status = "okay";
+	compatible = "elan,ekth6a12nay";
 
-	compatible = "hid-over-i2c";
-	reg = <0x10>;
-	interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
-
-	post-power-on-delay-ms = <10>;
-	hid-descr-addr = <0x0001>;
+	vcc33-supply = <&pp3300_alw>;
 };
 
 

-- 
2.47.0.199.ga7371fff76-goog


