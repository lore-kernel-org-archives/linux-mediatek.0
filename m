Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0823C5321D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0ZXsCUO90vlD45ZJO1I+QT/1oidv8iaRsna2l2Dubk=; b=KvcAWzeo8TdbRbB5hFfrS3mmSI
	vjUy5Pycm8t36iSuYp5MTzSuHo90cZb9CUYfTUxtVni3iG5MRFiTlpEu7fg3e6ZKg0MzupBlE7KZy
	GtvI6LIVWPBo52TNqfKATq7RWZHQEgO+4RBmoa/K/xSba+XWk9KJuJd2HLfBCHLS68RHII385MrNM
	EheryGDtOPvivCVuTBf5dQa9sp7RGAmAYYg/oCCUl5Z0aqOlDEmRQ4eOU3ZKIv5Z2DdBfzJdnj0SX
	TZy/aeyVP+ueT2BZeQjf5tIhextJQi8DnaToEglzPR0EWyX9X6OBnUUX4fawIRIaoe4ZiiF/2xt1E
	U1AEYQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh46E-0000000CEE7-2feQ;
	Thu, 22 Aug 2024 09:27:22 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh401-0000000CCM2-3BLQ
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-714226888dfso520038b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318457; x=1724923257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0ZXsCUO90vlD45ZJO1I+QT/1oidv8iaRsna2l2Dubk=;
        b=RdIvhLFqJPF1SPTkNNAyUJzNVHa29xpvQSbDG/4PaagEnfgRHrJmRAthiCiofr1SlK
         +MyL8siS7/MEgrkYwxAQTcMEzqWtrNMVLtj0qZKSTRsTjsoH1X6u3TtCxBeGjtUyXjfK
         5ith9xfFSHm6smsccHeafrIyWVA1zDAvOMBFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318457; x=1724923257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0ZXsCUO90vlD45ZJO1I+QT/1oidv8iaRsna2l2Dubk=;
        b=SsmfpXJJwm6H83SAYd0kaG3CaO75DPjjxhSzab97nXrvOvLOhU1cP38l4xu/bCvUqa
         KLgunQFXdoBVplEDVHubfrBubeN1ANhV7dggOuyjuZi1oG73IxmgqzqM0bdjEEdbuirS
         TBTY73LASiqm8rFWiYaJuX/9IqCATmvkLrgchcy5oZIYjkPiAhtBs0lnMUxY+U1is6uu
         2fLe1v28nnp9OyBIbZc9Cc3xhEbBlQ0h8nGjs0Y8IqHPL2ycn/gZs0zMwkNSVMKS0ts2
         riqqTlKQQHjuANSd2Ou7DrAGQoj98Z7I/hh0wSdH7m5zxRh7JhC9m00Aqi/cH0iPpqKO
         LLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDONHJ9yDs4ZHvukOCpPdJUxjDuD0Wctb2AuvZ4qKUIwGA5TpUYycclCWMnP/RKDSzn/taTvXM8NXGBGv5eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Y3MhFKWEhRuYvIs1UnqspSnGLlNEQ7YnigiQtbNiFiAq9itx
	GsFg3b8FWTbu+mUP/fZLZFwRYkwk+zsFRiDeCAcSAmHmARWO1+oMI086N12udQ==
X-Google-Smtp-Source: AGHT+IGopbbojtmE4fS/IUOg0cpO0JEZHF2VnB3L6eDK3aI3tJHchVj0lRN1Md7MFI5PPKTGcEf3AQ==
X-Received: by 2002:a05:6a20:2d26:b0:1c6:fb07:381e with SMTP id adf61e73a8af0-1cad8180a2amr6660606637.44.1724318456919;
        Thu, 22 Aug 2024 02:20:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:56 -0700 (PDT)
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
Subject: [PATCH v5 10/10] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Thu, 22 Aug 2024 17:20:03 +0800
Message-ID: <20240822092006.3134096-11-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022057_935213_D774B311 
X-CRM114-Status: GOOD (  14.82  )
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
2.46.0.184.g6999bdac58-goog


