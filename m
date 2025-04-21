Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392CCC369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=; b=HgFNsXntiBM0mGTHcaHszsZfEK
	cTxavwCQYxvM8vg5boBy6dpylFqlTFGEyFETDZaq1tJlKLtS3Tde7pKi5Oc3nAGGyYqF8/5bBelEW
	5WX+ajv6WsyZSH5KXzeGFT/fckUo9QME9lpE7RzHOIWkiUMifouH1szmzyzePePVAsWlQr6P5ezhL
	F6OBIIyHWPH21s0qnXIMILwtWTLS4oVB7vOSlRKFeiNtSPGlasb09YfNh7j6eun5AnRpi4k3FzR1Y
	azM/mNaqRnFE8UhHxLsPUwHpglVMJ9bOffzksYt4dbjvszHaJdUPPBocsOCyEQP0Bm9RdKzKpq07R
	Xd7l7g4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6oGb-0000000453f-19lt;
	Mon, 21 Apr 2025 10:20:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6o9O-0000000448C-2RhN
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 10:13:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-225df540edcso48904305ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Apr 2025 03:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230398; x=1745835198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=;
        b=LhVSJk118dEB60KZzvm9K0SjaWU8Mp5hfw9F1/VZ3SR2Dt17yZf84bJ9HD+TbGfG2v
         /0DKDp8JTnoudHO265XaJWYnsIPXwgZL2JuHqzRcTp+KdJPfspWdd5iO6/H6uhZjCqIW
         J+Mnci8cGsLbrGlD+R2dCfrldICBjNbi6fsqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230398; x=1745835198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpytMjpN9gDZuQ/F9dqqmXXp6n+OWf7Vs6AgeBOpoF8=;
        b=gefd3/z5g/5RCkgsrjznFNZSnvbvKjyYzT+L5X8MZXXK9x6E0NcCE5tLujKphXklp5
         VfN/a1USIDHVwCCVnUUCgwYEseTkGBxgcQynF2shBjUF+k9K449yIraT3+nRMfyYlcWI
         RLL76pVqjihvRxIfVUn8JFBOLdK01KST+mmFyxQdf3v7L8fsa1sh16A0qhNn/G6GjjIU
         FdPky6HYUyLSeVzrv/fDR4K7M2Z8BJKDJsEkuW2najZw6iXSGT2I7abT7u9Rs+BsZEKk
         VsYqY/O+hTiAaBnpj0dg/ZqvCvQ664ACJGKRRJVvBD5xvM4uNkDbVWOlCpNLdfAMVJeL
         BoTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6YzDdVhkznVgcaEo9sUqWOcB3jFE6MlpKMaCNumY062IGBe6pHKytoV3b0REzW9dUCFqw/mCoNsklI+/Ijg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5sg0zOoXKbHtZ1S4fEqJHjyUKpvP29AV7qeyfb54XJ5UKdeGk
	ha2ZmKmHquGEDef9289Mhw42YfNz6/g5M6Xzw9PSk53DSn/aXpXhE8szJZC6gw==
X-Gm-Gg: ASbGncuhiWV+vvnw+4a+BurmIH/AdLTSfQTDqU+KHp/Qi55jxyz3/SVXmfZ1orWezCZ
	NJNS41ylDpbfabPz3J6gBjlb/mvE5+HSx0UDhZqLuuupYhE0xZ+yH2KZBVy4RA+1Q0ekHZRK0xg
	1PeNxkEWDgUQ9EMDqs8hFgWc+FqlGVHngaYFnEsNxU0wKtIYewGN80v5Unv/7LMtwDztKgOJtx9
	8QoGuWRbyu8rdMIHlKpH+xwk1CfclX7VyB0jFPc0ZxSLPwP5Af22Ety/i6juPWfY90DGInQEqjP
	yqSHCQzV8PRF8+9yIAhSxoanZYLLIOtOtn2Gmk/wE2fBjGWlj20gof0cfAaep5ZRDPLyJA==
X-Google-Smtp-Source: AGHT+IF6rGXrSzCpvaNGhX4xciML4WX1Qp+Xf99qU1svwwhGPd2mOXprUmL/S+UqQYoWzSfytulsaw==
X-Received: by 2002:a17:902:f644:b0:224:7a4:b31 with SMTP id d9443c01a7336-22c53e38f33mr139591965ad.6.1745230398086;
        Mon, 21 Apr 2025 03:13:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	stable+noautosel@kernel.org
Subject: [PATCH v2 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Mon, 21 Apr 2025 18:12:42 +0800
Message-ID: <20250421101248.426929-5-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_031318_613906_D1F1C40A 
X-CRM114-Status: GOOD (  13.44  )
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

Steelix design has two possible trackpad component sources. Currently
they are all marked as available, along with having workarounds for
shared pinctrl muxing and GPIOs.

Instead, mark them all as "fail-needs-probe" and have the implementation
try to probe which one is present.

Also remove the shared resource workaround by moving the pinctrl entry
for the trackpad interrupt line back into the individual trackpad nodes.

Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8186-corsola-steelix.dtsi      |  7 +++++++
 .../mediatek/mt8186-corsola-tentacool-sku327683.dts    |  2 ++
 .../mediatek/mt8186-corsola-tentacruel-sku262148.dts   |  2 ++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi       | 10 ++++------
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
index e74e886a00cb..822a177e7c19 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi
@@ -123,8 +123,11 @@ trackpad@2c {
 		reg = <0x2c>;
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -197,3 +200,7 @@ pins-vreg-en {
 		};
 	};
 };
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
index c3ae6f9616c8..4dbf2cb73a81 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
@@ -17,6 +17,8 @@ trackpad@15 {
 		compatible = "hid-over-i2c";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		hid-descr-addr = <0x0001>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
index 447b57b12b41..ee5bc2cd9e9f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
@@ -19,6 +19,8 @@ trackpad@15 {
 		compatible = "hid-over-i2c";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		hid-descr-addr = <0x0001>;
 		vdd-supply = <&pp3300_s3>;
 		wakeup-source;
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cebb134331fb..918f17385ba5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -390,19 +390,17 @@ &i2c1 {
 
 &i2c2 {
 	pinctrl-names = "default";
-	/*
-	 * Trackpad pin put here to work around second source components
-	 * sharing the pinmux in steelix designs.
-	 */
-	pinctrl-0 = <&i2c2_pins>, <&trackpad_pin>;
+	pinctrl-0 = <&i2c2_pins>;
 	clock-frequency = <400000>;
 	i2c-scl-internal-delay-ns = <10000>;
 	status = "okay";
 
-	trackpad@15 {
+	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		reg = <0x15>;
 		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pin>;
 		vcc-supply = <&pp3300_s3>;
 		wakeup-source;
 	};
-- 
2.49.0.805.g082f7c87e0-goog


