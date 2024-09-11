Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E822EDE998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwH4RxuOgmEV/VtpOzbgUmR2GAZBgupxo+TGOE0kG2U=; b=NQlyQnaHakFO/WA5hrxnsDRX68
	DNFS0hmHKQ+4ym2XtCcjGt0dtWSdF4HV2vdG+p5AonhV2t5aJzP5VKWwL36gnBUmVXPnQGNzhqYsU
	ALELMXb8ZN3MCA8wOHY88KkwbghCy4orRjdJL3NSIh6SFAemX0y37qvqWcCe0tWl0IWwMB38ij9wt
	5lgm7L8rggnRWJAjburRoKlhG5FatDF3TXwmvW1DTLnejQq0NiTP+kaEroIFqO2pwr4i+PZ7Jt1jJ
	NkoJVvHifaJDFuwwzbVGzA/keROhNctg8vHqTSDgX390xOcICh5YutjY58rZ8OXQ8jdVgjn29Pxzs
	QXnPfXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHwm-00000008Tq8-1VTP;
	Wed, 11 Sep 2024 07:39:28 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHmY-00000008QwI-3sq7
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:28:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718d985b6bbso4612584b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039734; x=1726644534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwH4RxuOgmEV/VtpOzbgUmR2GAZBgupxo+TGOE0kG2U=;
        b=cMyuSXy33b4RzrULMmZDSEfKhfc0OXp4erQcXRkAQLp4xwbtWKxFs2FDVXKeW1q0Tg
         mqn+CBkND3hMpto80HKk59JtzGx6EIbt5ZbzyScRxl8kIh43cwjfrX7e4GV48izmdBom
         OwC2RUtVjz6UbCqh30x/Fjl2vjzbg2z9B7YBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039734; x=1726644534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwH4RxuOgmEV/VtpOzbgUmR2GAZBgupxo+TGOE0kG2U=;
        b=VxJdD6hjsGr+0awYTytTdQDgdY+ah/a+oaeh1Y0SG/iwppC28KMC3YbsuIrc1hfVfi
         cn6iCIQ3s1FvyCl+Y47IjiwaY7hqUkbSeLetEr/OrAxh+5cqsM5UaTnsjGaUKs9QwfAp
         zvSA8VSIAnkV04EBLFUQHFkTOgGge0vGSVA1PVu9JD2cyLxQcu1w8n5AaBaVBhy3f42u
         bZqmGZqDCpbZziIrzarzGkCIriB6W5a9sCuNIm3xjQBgZypxJjjz5Arn8XMTVNnc7hiH
         wlWGqTiesGeQeNGhA3qfVOfyBxjKy6nI0jWAMXw/leTm9u8Xl5JJuWX3eiTPSNo0O8pE
         UhDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvXRrJxKx61ZzTP6Rz3nm2eIWRJllpvJmZ9xuSMRqbN6I92FcF3HpAgIam+LHN2Zd/dXQjSAK/8FyNA3/NGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0vgK09o0pUrvDagnr0ePY9HzxlafuvGvMjc9Fbpr3Gq+7bdY1
	BVDp452Ii9ll7VEbh6b+3fOX/PsY5UA7y0mfJ7TEaw9cj/43kSQFImYcQMJK8g==
X-Google-Smtp-Source: AGHT+IE516O5LzHPomwlShsfozQVhv9kW9/2NJZ52HjZuQpukTdS9x9UaAx49lZ9H3HGK77PP1P1/Q==
X-Received: by 2002:a05:6a00:4b4c:b0:717:bce8:f8a9 with SMTP id d2e1a72fcca58-718d5dee47amr21431629b3a.1.1726039733865;
        Wed, 11 Sep 2024 00:28:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:53 -0700 (PDT)
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
Subject: [PATCH v7 10/10] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Wed, 11 Sep 2024 15:27:48 +0800
Message-ID: <20240911072751.365361-11-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_002855_021194_27963CE9 
X-CRM114-Status: GOOD (  14.48  )
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
Changes since v6:
None.

Changes since v5:
None.

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
2.46.0.598.g6f2099f65c-goog


