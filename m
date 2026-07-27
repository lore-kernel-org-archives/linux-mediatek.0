Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD9AC531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgqY24t2LnW9I+18Wnpp+SZS+jYp8rky2mYR1kjD0VM=; b=GzY6GeL8+2gbK+Bvu6S7TAhWgp
	CwdTyR/J7aqOCuF+WxXE6FsohCQrxKK5QkI83dynQ5quf83HLX3VO/BfsWwW+WNCQ6xEFqP9CvYZ4
	vaq322zcacVnI+Lq0JvFWaSS/FU5NuOBZbluMaLFnm114rdbNqA2h4n3ZLZwYIMqe6ds/MNQlJRCZ
	M6q1zqE21jmKFllW1x16ibSiVMNAXJZr8cq1Cm7Z6oIIETx05plyZOH9WF8tBMNMgVJ0OK6VWq4KP
	DewtuW7qob4pZ1ZjCfRCSMP0l/wvCVfyi8/Xn696NX6BJtSGtVa3JBX46DhbmGHyILJPOqG8e7zrs
	QUHLYLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFx8-000000029DK-3A3n;
	Mon, 27 Jul 2026 07:40:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFwy-0000000298C-2VSz
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:40:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1036772f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138035; x=1785742835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgqY24t2LnW9I+18Wnpp+SZS+jYp8rky2mYR1kjD0VM=;
        b=f47f5ugKXaP8Ho0t0SF/dE1srlXV6E9d9FE87AhkArMqi9i36xuioYipv9LvskNvp1
         6Sp0cUxJRO9flitVVBUuzITcZ62BZGWP1kvFCae8tVsYUu4mIrc66aVZf4HEgvDbZUTM
         r8N/cWtumzGp0+3SGzjVu2/x2PtjsR/UgbbN7SLZylaUoajXepzj09Sxl5aozrZLevMh
         ktWDy9iXshbidjPrjTE3VwursJHTIgamTlDJq5YlVqTHeEiRyPUdPijmIQ5otgWKxy5L
         9r7cdQgC/3D13s/XiXx8hbdyTW5P57QSnUMj+KEEFvL5NMh7ECdqYzYMXCQb+cu1Juic
         unqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138035; x=1785742835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgqY24t2LnW9I+18Wnpp+SZS+jYp8rky2mYR1kjD0VM=;
        b=PPLqaKskM/4TRtvdipfyBptq0A+e/oyoqi52Yq9ti74Q4HySI0oGsVFN1PsFM2FCw7
         C2/K9Vlmr30MK3jaPQeOUcRLp6T8It4ZNEFdtKlW3dH6M8/MO07bV017mdn12HDKbswj
         +UMvF8YC+klSQaxxgHC+GI4RAuEdRB+CaDtV6VQFGoUC1JsjrGwOuLxVxzzEsrprSDeV
         +v/fhtIgTo8T6TKLQYhLdGeZRVO6Kh74qJJxlM5F/RFcTtcEqQ5ExOerkcftw/jIMrIR
         /A4h8ZcFzP0moILwFyVeCkQ+a3qjwJY+P+b5fxwqqIT09G5tpxXWOKEGoA3xv67XECoW
         obAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNqboF/N6MbY/LUb+XQEIQOcJJZJ+FeDETtVWcTk7V1/qTdms8NMF6qpEafuOBWsE6PxxSBTOs6b9ElR40iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB+cYwEFmnV0m0vQ5wzWOmIs/QV7xQ+I5FCGeWIybMB7VZMgpE
	ExF4MdFFB4DrDzMZzLi6gzboJqtMVR+1hvyHbozi7wzP8Jr6n6RC2HZOJ6ernY0taAU=
X-Gm-Gg: AR+sD11oyAFXCKU/rHDTeoOStD62Qjp2MXY+uvnpaZqyFjid67Ov6mNnyIBhbqA0Qno
	IvglmnzAfK7Rwjx3wIx0K/lZkLqxN6eLSRMnuHmnce6lR/+tq4RJJh++PtfECDH79s10mFIUWL3
	CRQ1lube7N06ZG/Tghp6GbXpOl1kJk81pp2mGFTl6qPqcA8fqdBPfjrQc16DF7B9a215HSr/GCv
	htRDDWBFQG6XRpzw2mreZPHyyBids3eaJQgweznPQTQ2qgtBP3/oUaDx9F3HQ63b/duZmfuk5Kh
	TRsJpLLy8vaP9EOam4E9VWcRdQpBG3rfbHr36N7f2Jcp0nlzVRvUOD25Z3jgJkGANnOUHRxJgEE
	pURkb40mtMs9fItg+LfVTqptk2LwmNPtD/FpYCgRFdOht51sdxHr5n32boVrLf1KvnB53G5O07h
	eECKPEHTn4DOxyrxf4/JywNVGFniPsbBZCipa7h4UYPevALKb2AfuUd79LpD9VCFXyR02gjQN7Y
	oghIhbJTrap1Lg=
X-Received: by 2002:a05:6000:188e:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47f9fc9d2d3mr9130842f8f.3.1785138034634;
        Mon, 27 Jul 2026 00:40:34 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43677682f8f.10.2026.07.27.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:40:34 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 27 Jul 2026 09:38:08 +0200
Subject: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial
 ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004036_735617_6D494598 
X-CRM114-Status: GOOD (  12.51  )
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

On most MediaTek boards only serial0 is aliased, so the remaining
enabled uarts get first-free ttyS line numbers from the 8250 core in
probe order. When the console uart defers on its clocks another uart can
win line 0: console=ttyS0 then ends up on the wrong port and the boot
looks like a hang on the serial console, depending on probe order.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
 12 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 0e086dd487d9..63659e240b1d 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -20,6 +20,7 @@ aliases {
 		mmc2 = &mmc2;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcd0: backlight {
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..7bccad118d24 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -20,6 +20,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 19f538d160ab..637e5567c1e0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -21,6 +21,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 5d8e3d3f6c20..9dfd882ca484 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -16,6 +16,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index a8e257b21a88..ae957deac8df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -13,6 +13,7 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
index ac2673e56fb8..233711cb4556 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
@@ -9,6 +9,10 @@ / {
 	model = "Google Hayato rev1";
 	chassis-type = "convertible";
 	compatible = "google,hayato-rev1", "google,hayato", "mediatek,mt8192";
+
+	aliases {
+		serial1 = &uart1;
+	};
 };
 
 &keyboard_controller {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 1f59b5786b81..13132a35080f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index a30ee523b0b5..c535de34dfac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -24,6 +24,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..26e24431d467 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -33,6 +33,8 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcm1: backlight-lcm1 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 888248a75e93..51f12328a1d6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -17,6 +17,8 @@ aliases {
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 9f5a0ec563e8..668985428fc2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -31,6 +31,8 @@ aliases {
 		rtc0 = &rv3028;
 		rtc1 = &mt6359rtc;
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
 	};
 
 	backlight_lcd0: backlight-lcd0 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index edc5539bebde..86e487fb1832 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -22,6 +22,7 @@ aliases {
 		mmc0 = &mmc0;
 		mmc1 = &mmc1;
 		serial0 = &uart0;
+		serial1 = &uart1;
 	};
 
 	chosen {

-- 
2.55.0


