Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CFAC28B30
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 11:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9Hi6z01W79t89Yzzjz+Av4u/k4zBkYFE5hgZtEL7TA=; b=MDU4l3R8n8Ijo0ylNj6BkCWqc6
	Ris8dUaq++fG6iAxKIPC5+APyasRTuy60pfjpGtTJXFWH8lZiui7R5uGQ1CeF2yVhNFE/5fXXytSZ
	FLdR2jM371jqoksiCEt9YgNd+1VQVYbfmvjsRRHIRywCg3jFD4bh6yGaf2Js7Fz+TSCZ8jnX+x/wV
	hxky87Y+SVje7ua6yzdDr8wGTrYwl3xxpaKk5Xmk2qG1k8fr1PoNTdHcvGnZ6f4A3UZcv22dgdKKW
	CyRFTbhfMCH4DmJCDzRoUXpIQyM9fZyFLwfjr75fGM3nmPDVD7v2wVQgtJm/d2YNxnQkCckQUrZWU
	qPzi+1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJtE-00000008ChL-3KQQ;
	Wed, 12 Mar 2025 11:04:44 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZF-000000088j5-1o7y
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:06 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso9103226a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 03:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776244; x=1742381044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9Hi6z01W79t89Yzzjz+Av4u/k4zBkYFE5hgZtEL7TA=;
        b=TXJlHBkwmYmRamwHK8ZV9PzjFMIiN4jbO00lS9hz7NKEZqS6NuScTSE0bbihjNg7f0
         uz678ArxdIdQrJejqPqSJIEtQqvaGO9Gt8DWlcvAezhHwerTlY9g6pk62f+zLBI1W++E
         Wq5eq4rvQyFP0kdJwlNnliZVQ8ZgOrlLoBZ7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776244; x=1742381044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9Hi6z01W79t89Yzzjz+Av4u/k4zBkYFE5hgZtEL7TA=;
        b=BYLT48eP1a/HRFm6IdjwWG7FM6bu1jvUXiF0BsZlK4vPzVCm5mezJGBehHO04nVRLI
         3vHufCneVSdLLz6UKm6DWVnQXRrPSpLoDai6Pc/EVj6ho+SHhXPMW8ISozAPDEakRgeS
         1ih9ks5hz/TGacIRyA1KcMwKgnFBVqgFJDBv8lwQYJOiBIfP3G7ETxpr7UQmE+Upcf9G
         AwN11UIGmsKwpIXxjUFDtEd4fkW4zbdVjLZzzngS/VW2uqp1LBfHsg0S6nNsDnTunTAQ
         eIb0kMoJGa2qfuL3UCAOws0h4Cpg9Z2fjGsXTYuruSsQSsPmBYJR9/SkIafbfxBwCu9p
         rqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDT6uPjxclKGOqvb01YL/7RNNBhNvRiRyeRcJZkSHYHsjjNZ9Awnuj91s+ixyKvpZopcJyOQQkIKPQn21y+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXYGlg4hxXlYAdubH8ET9ZWogznaO8lGpXuXh0igPpZgwzTe1s
	kV9azmFyK0l2HgVQS33JOTmZ/Xd/BkNWoSaGH43VN/EGOz5ukaiSbo8kWsqXWA==
X-Gm-Gg: ASbGnctTLRcntUDDe3ah8c/vkc5mxOgOsid618NzyTxdVFVnMMajMHzpUeNaX/m7WWs
	/tX31YY36g+Fww0nLV8227EbCgKvOCUzmO7EUOwv5QIZ/OAxNQcWOh2skRz/i3UAtJrjX9zlxkA
	mWCYMVILdh7Kjgo0cWxM1/wQQ3p/BrhWviAiRQvDOS992Jbqjq31hxQ6ywv25iBa0KbY6XV6X25
	L8iO7Wz7BbdG/uBKhEqRmx/kWg+ImIKdN1jYKvqqxfInwAEcrT9CeagnRFwh+mvBdWjuIny5yCr
	ir9K3cBwH5Nx50yEMhO4ZYSfOo55Mx+jnMaW4B/mRIZYEhVOtOKReatQKguc40E=
X-Google-Smtp-Source: AGHT+IHJj3ClCl0G4w7uRfbh34yNw6y58jNADTnvGcCG6MJZbH+QLxVptAl9mfKjSGMGz6TiuUUEtA==
X-Received: by 2002:a17:90a:d88d:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-300ff368043mr8303305a91.34.1741776244552;
        Wed, 12 Mar 2025 03:44:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:04 -0700 (PDT)
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
Subject: [PATCH 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Wed, 12 Mar 2025 18:43:38 +0800
Message-ID: <20250312104344.3084425-5-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034405_468662_CAD00DF1 
X-CRM114-Status: GOOD (  13.38  )
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
2.49.0.rc0.332.g42c0ae87b1-goog


