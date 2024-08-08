Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14629C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9/QWNKXSA4i4sxpfMzvxA3Z99pgqscZPbDBz2zlFLI=; b=FT09iI0mrV3Eo3L/bIZQ3l8Nua
	AhgqmsJGTpCW0r15rpn4lkLQL5F1cEgBojgbrGoYG3mEj4dLNyM6figAROTBjuA6TZ9du5KChRGuD
	M9AAWkELqKpfxKM4ov3ImbdDCFqDrRz7GM82lXYs6TqdrLmjL8IJQiVQPvuGCyD/NtTgLUYd+HOSO
	aQn04ED9ai4uOvbnxuW7iAMvlFOXiMiVS04qyrqfZWD8opM6P7dVyqm/0OnE69cYW6ZlbKkV1oB6Z
	u+0fBDRNHHwvEpS9gfJMdKUSbLzcxnajBzeJZ7cI7vRnxPst1z3yNr0k2Ckxy/QoG97kdogrFl3T4
	xFmSc4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzzM-00000007p67-3COC;
	Thu, 08 Aug 2024 10:03:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzwE-00000007o7L-0NQT
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Aug 2024 10:00:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fd6ed7688cso8194445ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Aug 2024 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111205; x=1723716005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9/QWNKXSA4i4sxpfMzvxA3Z99pgqscZPbDBz2zlFLI=;
        b=IiCM8EkEdisS0C1wXJAaGk3TGC6mNkxWebnuM1EXQRHMkOVksd1DG2BYeQEy0t4TKn
         LsGOok+OrIbChaS/sd8rvhif3jAOpUWUOkgC7V8EBr5G8kkREpPJ4ZUxgyek4BCt5W93
         iXxDScejK4RToXd4Tp/v1KpsR43W+EYLRdVvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111205; x=1723716005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9/QWNKXSA4i4sxpfMzvxA3Z99pgqscZPbDBz2zlFLI=;
        b=p9pUN0RXAq67WRd2Q5ON9Rbbf4eBYrVcgzuwn8JDUfyUwmWkeesO31++ZtZopciT+w
         hl+xTLg0TIqUA9bp82Srj9qefHR+0Z1Bbt0hP9+QMPYyyiuvVePlHo1ZAHfb0MHIMoGF
         Unn0Y6jOdYXlJDGfNzzUIgRP/FX6mn3WTf2Dba1t4uNlolICiQyFubYEUYqM8SlSJzo2
         A4Qf5mmTum3EqSbv67+0+3o6W86FnD3st8SIIZlxJ+MHfm4IR6aIX0i1mB9Yb+USzJTf
         eTYXExTSUZv/jvllWPZwLDW2gvHirPdfL5LgXB2Djoeh7PUvTqIfqsI4V3eW13d/P1M+
         2iVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVg9zp9Fh7aS2Fo8fObwagwUxB5Ya8lds5ArGSAppqb4K9SaSB3ukBxRp+3NWvu/si634WI9TctI1y+rK26ja7vLJSmYhNnyE4mEwHc/V1V5XT
X-Gm-Message-State: AOJu0YxyNNHxRCOKJxv6p6F/bV+DtMba8UPYXsVVV8K6Ow1begNLbmNx
	bsMndQbmViiSEPgyVeGtG5Bi1HlLOK/mmP73z1Jjt7UMz52e7Drnb36FGy2VPA==
X-Google-Smtp-Source: AGHT+IFHYCH6ZPttGWJyX5orsjVgIQjNRW8T6hIcAdANhk3iA3ouOxz6UxT/mqu55va9bKkOzlc4Ag==
X-Received: by 2002:a17:902:ce81:b0:1fd:7724:c783 with SMTP id d9443c01a7336-200952654a3mr16237775ad.36.1723111205352;
        Thu, 08 Aug 2024 03:00:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.03.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:00:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v4 6/6] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Thu,  8 Aug 2024 17:59:29 +0800
Message-ID: <20240808095931.2649657-7-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240808095931.2649657-1-wenst@chromium.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_030006_293934_E03EA503 
X-CRM114-Status: GOOD (  14.86  )
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

Instead of having them all available, mark them all as "fail-needs-probe"
and have the implementation try to probe which one is present.

Also remove the shared resource workaround by moving the pinctrl entry
for the trackpad interrupt line back into the individual trackpad nodes.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Rebased

Changes since v3:
- Also remove second source workaround, i.e. move the interrupt line
  pinctrl entry from the i2c node back to the components.

Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      |  4 ++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 8d1cbc92bce3..251e084bf7de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -14,6 +14,7 @@ touchscreen2: touchscreen@34 {
 		compatible = "melfas,mip4_ts";
 		reg = <0x34>;
 		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/*
@@ -26,6 +27,7 @@ touchscreen3: touchscreen@20 {
 		reg = <0x20>;
 		hid-descr-addr = <0x0020>;
 		interrupts-extended = <&pio 88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 
 	/* Lenovo Ideapad C330 uses G2Touch touchscreen as a 2nd source touchscreen */
@@ -47,9 +49,12 @@ &i2c4 {
 	trackpad2: trackpad@2c {
 		compatible = "hid-over-i2c";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -74,3 +79,11 @@ pins_wp {
 		};
 	};
 };
+
+&touchscreen {
+	status = "fail-needs-probe";
+};
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index b4d85147b77b..eee64461421f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -358,12 +358,12 @@ touchscreen: touchscreen@10 {
 &i2c4 {
 	clock-frequency = <400000>;
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&trackpad_irq>;
 
 	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x15>;
 		vcc-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


