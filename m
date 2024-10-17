Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF5FD21274
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgdGGrdxh1yrmxMi7ELq+GCDozx5PI/JXUv/P9EgGw8=; b=tfWMdsNHp3BsUmcenPolxVFm/X
	pgABeRcra34gM4LlXAJosUOxOLUNoH3wmlelAJG3QwApGDATSPOBwqtAcbjr2eiVYDfhwHEfm09mP
	nuzPJlJn95lhjRJ0eXY2D9Os8u9Ldgllq/SGsVOTl+MSfH7D5xy0nBwMcUxOlae2qxGVhR5F/7Kkx
	tvrQ/wi/KA3fSNZOjAy5uIYjBsUv4Fq5iIHbnkfiaHDRLBFWB3pxI7h71EW298ojCMj8fBOS51frh
	H/GZ3A8ntz0LNeOrIKZNorPQ95pV4Co0P89SGc+54QvoM5NjBJk5jHGK+1ptIVaO15xNSaB6L50xe
	t5S8d6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1NWS-0000000EUGR-0ofW;
	Thu, 17 Oct 2024 10:14:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1N1z-0000000ENnO-200I
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 09:43:03 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c6f492d2dso9211425ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729158175; x=1729762975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgdGGrdxh1yrmxMi7ELq+GCDozx5PI/JXUv/P9EgGw8=;
        b=aRhhSeyvJtGktvpClyn1JwKezGh9GDTYwXKHSdbaERy7z3fNCUX/xW4ul68/AUXdw5
         mWKPxH5pHamKOdfMGLnLIskDuZ+f2p7xPMoLgE7gjTr58mG4dOnPvncynURQEzzV1bS0
         YBr6Zd0LbnYXYlluPcyazUd2gDSSR79SlRpDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158175; x=1729762975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgdGGrdxh1yrmxMi7ELq+GCDozx5PI/JXUv/P9EgGw8=;
        b=P2MSizVYpVHUllyLGXHFL5zDWb0pUOAqaKktoUDUFSubIjDGh65O6liWCP2WL57JCI
         66pnI9t3vf3jL2TaeZIfIoIDrqMZ/tKW+SIK0zGtsgFOTMOwytt/0uZGmS3q3+IZqwKg
         dUfg9Vyen9D8JtU4lBQp38heJ2zGlNGm1jFXQmOUXSGl8SOtgVciGsEAnYIwU9SWBeOX
         KGn0RDKz++XLuif62M0xAySckIo2AOyU0POdPjrHvsd0IaR3BeDB+pIqHg7QYd2Mj4Gj
         qn/ITUgnO95pafUoOTZ5KCpkYopizGTWxDnfqxOr4sbUcRQienr/QxvvDOa30CHgWlRk
         32qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1aZEkotvBlNoU45gPSvPER48LGMC42JXD6eTsfiYq3LYPXjGNV4aMZKDIJYGrhbnXASwkWv9ZvuEt5xvt/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+NWVkj6S5H8A6FceLmVqcew0nSS5IJmDzG7E33Ke9yN86dkZi
	hHKkZLgDUYhaxGR1Lrk1D7nkB9sZ9o0CoSdgvJl3aLvVbPI9ePxSuI8z6wfSpg==
X-Google-Smtp-Source: AGHT+IHVU8qRS0FvlAaYy1P680aH2xlYaVBdegJzFVdyqHN/XTuDFiVaYaam7IEGx7XhiQ/wL2kUcA==
X-Received: by 2002:a17:902:e80d:b0:206:c486:4c4c with SMTP id d9443c01a7336-20cbb2abe0dmr282504325ad.57.1729158174895;
        Thu, 17 Oct 2024 02:42:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ccasm40638655ad.62.2024.10.17.02.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:42:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
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
Subject: [PATCH v9 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Thu, 17 Oct 2024 17:34:42 +0800
Message-ID: <20241017094222.1014936-8-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241017094222.1014936-1-wenst@chromium.org>
References: <20241017094222.1014936-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_024255_784624_089D2D4B 
X-CRM114-Status: GOOD (  14.51  )
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
Changes since v7:
- Mark touchscreen@40 as "fail-needs-probe" as well

Changes since v6:
none

Changes since v5:
none

Changes since v4:
- Rebased

Changes since v3:
- Also remove second source workaround, i.e. move the interrupt line
  pinctrl entry from the i2c node back to the components.

Changes since v2:
- Drop class from status
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      |  4 ++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index e03474702cad..d9abd68da369 100644
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
@@ -35,6 +37,7 @@ touchscreen@40 {
 		hid-descr-addr = <0x0001>;
 		interrupt-parent = <&pio>;
 		interrupts = <88 IRQ_TYPE_LEVEL_LOW>;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -47,6 +50,8 @@ &i2c4 {
 	trackpad2: trackpad@2c {
 		compatible = "hid-over-i2c";
 		interrupts-extended = <&pio 117 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
 		/*
@@ -56,6 +61,7 @@ trackpad2: trackpad@2c {
 		/* post-power-on-delay-ms = <100>; */
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
 
@@ -80,3 +86,11 @@ pins_wp {
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
2.47.0.rc1.288.g06298d1525-goog


