Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8561D7497B
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lij+PC1fLvJixrLcoV9Z1Urjyzf4HaJGb+O+EycfkvQ=; b=h1YigzPmmBWD87lNyqerKBk82S
	UAV4DotGUOWR7u8f58DHi5AcOj9mGelVVDU2OeYgIev2w+aovyV2WHdYTccPJbTkxJ10SBXiGrv87
	/yyrDzpq2XnYDfphy5h9bndyqxxU8d7toR8et7zykbwE6H8CFh6pefMujiZQJmv8D/x5cFiQpVKWH
	D5HdSwVzFP8XH3bsIL88jwkIWo1zdjydYU3wBgHm+FFoxPTydqOCouDKWW0UEUtVsYABxv/79u1yp
	GaVDOEIsn6nCYr2t6BhHNp6/vfWCHh3ZcWxNgzlv61baFop2RnccyzcazRm8dKEWnQiURkPnr9rWs
	6LtqpKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62pM-0000000H50Y-2p5L;
	Wed, 30 Oct 2024 07:09:12 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62iz-0000000H49s-1VWE
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 07:02:38 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so4198947a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Oct 2024 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730271757; x=1730876557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lij+PC1fLvJixrLcoV9Z1Urjyzf4HaJGb+O+EycfkvQ=;
        b=M/9PM5JYwIqfi1R5tTIyomr1xnqXw/A0xQFQzv4+iydHbvC8nqniWEwDc/GtV4RAkO
         skM3p8pCbLtaJcl1TEzy3yBvGrtS7WDbBh9566ouYiXHjEPqsJSaug5lDaYS3QxtVFMg
         JNRASELGjhpopqq1RJYjOUHfCFURVr3Vm3FkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271757; x=1730876557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lij+PC1fLvJixrLcoV9Z1Urjyzf4HaJGb+O+EycfkvQ=;
        b=hYxni69MGoSaW3+0xwB43SrN+uUISbR/qGg8qOrUz+tujuzEh5Jom4mdjPotoZvlXh
         w6OskT0WroqsJ62UX0LkPWlNsKYABVaHENZHP5zE7UkTdaBjfc72Bec9VckwkFpidZzM
         +esYzx5Nr6mjxvHwRq/8b5hmQOvT65Lb/ZwwrV/hXG9ro69rmkxisVJPZX9ZhHT5OA11
         yxwOIv0+Lai6Eqy8yQ2clhxf/EHcKPhM6Js+ebTrUrrJ536FvTReMjvXhaJNj5Ggcx04
         QFdCWCaHiL9e6qyz+B7phRz058RBKTAScPXnmQlPPjXmdlQvCQqW5C+cWMh2SnvHFqLC
         Q0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm/kfDOgiAjXj+oFHdtxrQCILxGPaO2hQjYbTQy9aEPeQ0Du+GiVZTGMw6QMlF4Pf1zslyKf9yVtclmIvXlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkuBCa6ARHxR/8c4BOU86ICm5g+gr6Hg3VOspOEkkFm2ektiMW
	ptiRXJ2V1WjLf877BXuhkDq7evVIVR9Pm11Srj0P22JeOixqwfQCt+KZ0feELg==
X-Google-Smtp-Source: AGHT+IEMIHQ8npyjfU/99fAX2NsP9PaKHpba5mfPSOR0IqSW7YKOpbx3Zp8jaGt7KFeqZbuG5u4Y4w==
X-Received: by 2002:a05:6a20:e605:b0:1d9:69cb:9f90 with SMTP id adf61e73a8af0-1d9a83d10bdmr20483336637.19.1730271756808;
        Wed, 30 Oct 2024 00:02:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a94sm8635848b3a.68.2024.10.30.00.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:02:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8183-kukui: Drop bogus fixed regulators
Date: Wed, 30 Oct 2024 15:02:23 +0800
Message-ID: <20241030070224.1006331-5-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030070224.1006331-1-wenst@chromium.org>
References: <20241030070224.1006331-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_000237_428143_F0B509AB 
X-CRM114-Status: GOOD (  12.11  )
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

A couple of the fixed regulators in the Kukui dtsi do not actually
exist in the hardware design; they are simply power rails connected
together with 0 ohm bridges.

Drop them and assign their upstream supplies to their consumers instead.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../dts/mediatek/mt8183-kukui-katsu-sku32.dts |  2 +-
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts |  2 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 25 ++-----------------
 3 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
index 05361008e8ac..2b5a8d1f900e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
@@ -23,7 +23,7 @@ touchscreen1: touchscreen@5d {
 		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 
 		reset-gpios = <&pio 156 GPIO_ACTIVE_LOW>;
-		vdd-supply = <&lcd_pp3300>;
+		vdd-supply = <&pp3300_alw>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
index cf008ed82878..75fadf2c7059 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
@@ -23,7 +23,7 @@ touchscreen1: touchscreen@5d {
 		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
 
 		reset-gpios = <&pio 156 GPIO_ACTIVE_LOW>;
-		vdd-supply = <&lcd_pp3300>;
+		vdd-supply = <&pp3300_alw>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index e9e6253141c6..0cf50b1f59c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -52,27 +52,6 @@ it6505_pp18_reg: regulator0 {
 		vin-supply = <&pp1800_alw>;
 	};
 
-	lcd_pp3300: regulator1 {
-		compatible = "regulator-fixed";
-		regulator-name = "lcd_pp3300";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	mmc1_fixed_power: regulator3 {
-		compatible = "regulator-fixed";
-		regulator-name = "mmc1_power";
-		vin-supply = <&pp3300_alw>;
-	};
-
-	mmc1_fixed_io: regulator4 {
-		compatible = "regulator-fixed";
-		regulator-name = "mmc1_io";
-		vin-supply = <&pp1800_alw>;
-	};
-
 	pp1800_alw: regulator5 {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1800_alw";
@@ -373,8 +352,8 @@ &mmc1 {
 	pinctrl-names = "default", "state_uhs";
 	pinctrl-0 = <&mmc1_pins_default>;
 	pinctrl-1 = <&mmc1_pins_uhs>;
-	vmmc-supply = <&mmc1_fixed_power>;
-	vqmmc-supply = <&mmc1_fixed_io>;
+	vmmc-supply = <&pp3300_alw>;
+	vqmmc-supply = <&pp1800_alw>;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	bus-width = <4>;
 	max-frequency = <200000000>;
-- 
2.47.0.163.g1226f6d8fa-goog


