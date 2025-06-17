Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4419C71136
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 08:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLfwvnKqf7flG1w1FJwQLt+8yXkZ/9IUG75s/1+ddU0=; b=tPr9GOUW+b0gJjJMsqzykIZWm6
	bAtG2vle5mHTZu+yGkFjwZyfR8VBkAuTQDQPT/Bo5D8xV+HLGLuXVXPbgpjwQ7PnTgkcp0LaYxozG
	c3ezvkiqBXG2gU5tkslbpLt9rDUuBZykCbdvlxXc0saa9UlXR1Ij1ZnnCiNfmMQmqGmwEzqjrr0Iw
	GYNcRF5Y7kl0+H1WLIEjixqcSwHdutwjvEYdkgOpQdtER2KL+vqB4E+++vkIaoN1uYzTYduIhNWzz
	u+R4Nz1h0dLHwr+Kpzi+u8XQRxH6YUr62N5m6axX1o5O3JMe1AXj0rNP9bhh9XVeYE/a6UT9SkHWQ
	bD4Tw/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRoA-00000006cSl-2Bzk;
	Tue, 17 Jun 2025 08:36:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYX-00000006a1x-3khB
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vLfwvnKqf7flG1w1FJwQLt+8yXkZ/9IUG75s/1+ddU0=; b=cHt/dI7A6JR8ajDrLKy3WM0X0X
	AIzvSmw+S/3CARmVUxsVqTDmchIXQ3T1o+u+fuzYkmBOzUOSUDZYPSwbhd2fteVtlw7yqSHwFwmRR
	FcIoYLYCRhJzJYondoLb5ubof/sz7ZpdvHGhDNoWDVP8NB/Vn2viXDMz6eNOCfiTw3mbilOYARhA9
	lOmPjQ9lZpUSvZVVwVwv2YlLgq0x77PKQv2odYVSVbHRim+7uqtoUyRWh3wU/BqQV9026Le7jL0ES
	KrUwUk3xqW4zh/E7EeXOaog/Y8rE8NVzNzq3akoKbYgIuP0lhxktDZZ9l31VenbvhdjzyG4IvMCNd
	MLLw8Blg==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYP-00000003k6Q-0Eea
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2366e5e4dbaso22499905ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jun 2025 01:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148419; x=1750753219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLfwvnKqf7flG1w1FJwQLt+8yXkZ/9IUG75s/1+ddU0=;
        b=Gxf7Di3odYNSrFE5tyxiZdX5cyVvlPMXbyVdnBG/IrULRuc+1Un3ZsmX1i+7FDR4Gq
         j7t3lPGRad9BJ22lLPnK/H7M5VkLrfuUdQT+Iaux7y5bhTTXSfjnh4GsxbwUc8we4FZY
         UxFgPXUlqJW2PtO4mabDx4WAUTyZv+B0+Am20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148419; x=1750753219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLfwvnKqf7flG1w1FJwQLt+8yXkZ/9IUG75s/1+ddU0=;
        b=fRzL6omzEU+BfYfSEw4Y/4YJJARiYJ+wSB4InGHDLhMM7i6es+Lv3Kn1A6koYNM8Kk
         WAtzftciukcU/wVoXiY7QHLZfV0KDlMwhDFlpCR86m73upXEtxEV7QaaSd8nf+e0ChyS
         qV6ihEoiPCj5dMT2O9CXEXlt2GjPPKdgigmtM1mKv21CxxFG3etqrNSTTF33o9xcZUKy
         PaaxTfvzkF16X5Ojdz//ZZ0EcY1pSj8HvaEYMvSeU4/uWWtPyQW7BXrzQ4APnhctvyIh
         6wE/rKeoYLYeKW+x/zkof+jtUnaqJP0UQXWq0FbMnMvN5aVwRLNGNODidQMLA/WtMR41
         2FFg==
X-Forwarded-Encrypted: i=1; AJvYcCVz1ziYHEIKOHUExcZKXSln76/ACIPPDqaLpxDylspo/k6OiTY7zixRigS3nBdqYPPDivGnu/hImjOlqn74RA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0r1Qsoen/DeoTyboFjk3YGmmXmFEUESi5bnyPT8CzCxRXLpWW
	sQV7EX/4jYfsrWspkkmPdqvg3l1yFecozYMQSw2diVqEpqRsZvWavramRJ10hdt7qw==
X-Gm-Gg: ASbGncu5KPg5L5dSRD4AaOdZjAoUPxDXVfsC4BEpPX5+q28lgaZUr99UGp61fQwMt57
	YzLMVFcpwv+ZWNG6q5Gjl2/bomSnn1Ua7x7Fsi2wsDpkHame/fxAEheFX1PVCv6RxB6Db46b5kw
	WALdav6keWCbrkibIZSBfSULh6C6CKHVviaNLESMF8rl3PCGzfZWuZErJYMJi0Ej78+8+K5cMYM
	Dpi5Pac9gwLzgOqmEaixtJrjXr+7HeXZMHwtf1LdtJBsr0lTCIN+75GF4c0xTLx3wc/vP6sMDvt
	JTgDkY3ezYVi3ZrMrp+36VvBqgEUPtXHmSnvpOezsADT1qh6uvQ/5Xu5iqh+yocTePEAHYeKhTl
	XsoWC
X-Google-Smtp-Source: AGHT+IEdEae9jR3M9Ile50GhlK5a+mZddJwAjCXfQi04qoA/3oENN3QsRc5nWKd11gVEcOZh5+alGQ==
X-Received: by 2002:a17:902:d4d0:b0:236:15b7:62e3 with SMTP id d9443c01a7336-2366ae00e3fmr181507135ad.9.1750148418807;
        Tue, 17 Jun 2025 01:20:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v3 4/6] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
Date: Tue, 17 Jun 2025 16:20:01 +0800
Message-ID: <20250617082004.1653492-5-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092025_185421_3C939AE7 
X-CRM114-Status: GOOD (  13.25  )
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

Cc: stable+noautosel@kernel.org # Needs accompanying new driver to work
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
index 18cfc99cfa3c..ff20376a44d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -398,19 +398,17 @@ &i2c1 {
 
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
2.50.0.rc2.692.g299adb8693-goog


