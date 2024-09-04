Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D805CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBItDi4n14IYuM9iuwfGhl3IjynLmMqAt1J2tlAZIYM=; b=aglcChOTX8NG1y0e6JW7eBTXOi
	Hw/12FUxaaDmkVyrc1cqevfwetFTqQVkbLnMYHqbWV2DOkTypzhuRypnUApDv6i4RHTr7lzFy3yCV
	dY0I1W3gO/Pl3f3X8s6MXJhusrqa0kQOM9gz67cFxYeqN3K21+g5K0lWUzqWZdfRv7gUFLcLomEnY
	RkSqq4+sq3Nk2JaFBs35P7r0MGOKX+Bwirs66yZJjOw1YrB45lzTnlUDkLIvznG9qVw5CWyGY3Cu+
	Mgb08ZFacw2tAccAuB64E9sAPluc8nyCtKCi3bt1l1qG8g+ZCitwNco2BFVdcVzKE260WL025P0Tk
	+frVxg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmZG-00000003kOj-3oBU;
	Wed, 04 Sep 2024 09:44:50 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllsx-00000003Z55-1nqq
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 09:01:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-714114be925so5110962b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440467; x=1726045267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBItDi4n14IYuM9iuwfGhl3IjynLmMqAt1J2tlAZIYM=;
        b=dSTrO0eLBcazH6p2JU+/Hhvgy8pf+2zPZ3+WfXpCDMyaEZ/yUqJHBh6bCobWM3/D99
         QdFFvol0+Ru+MkkXSnf6Vcqyp5lJVcpInaVOCzDn1oWtS2RI5zdCmIxgtiaj7hvhBtzL
         RNYc0fU+o56yAcfuEvYnA0VdiFKxt6UTiK1PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440467; x=1726045267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBItDi4n14IYuM9iuwfGhl3IjynLmMqAt1J2tlAZIYM=;
        b=ozWt1OTz69xgOi8wnk+tR2rH2CN50tPid6JJ3BQU8/10QdUnqt/eDwto+lfaqL4X21
         rrIs/kwYlHCfqyuwMr+7zaxfYS4xlZrYvQFwc8VjNZ/yV2VkMULaxOoBqHKAhws1DFEn
         qZFgSaeXkKQx2YvCyihFQojFXNOZf8cgi2HXF/0LorhU7CKNw3t4z3OSByA3Czc9Kt0e
         CYosiRBqjRrq1lzs4q17TLQaoSeDUEB7mU2LN2Lm3X151w8wLrBWYuCq93ek00CBygMW
         xq1XiI9/mlfyGGmqog1LDNBqaWZgAgcr143COaSy8sk3dqlxgl7BBT9HDKHjcHJYF9jt
         +lcg==
X-Forwarded-Encrypted: i=1; AJvYcCUdzocNI9PJlH2GXVYLkXb5A6XS09lLEAEoPYKj6NtLcU/uPzTSOgUH3kuJz9uUNCXarEvFPpRKK5lS1ip0Nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvXD6hJ/YvyVbQXVIM+ohbXv1JP1x/W5Nn6MwOL6p03pBiWLHJ
	Z+8eN4OW3yTbQgHgl5U/SOeCojss8bj4ikvQWPfmYOcaOMe6aYuZQlZprd5ydQ==
X-Google-Smtp-Source: AGHT+IH2qucxlwAjWUMwLjsKdIgEfhg67bYq6GG+aNowoHtwaNabhMzLvVoNZUyf17AzUzRmQ7DIlg==
X-Received: by 2002:a05:6a00:9282:b0:704:2563:5079 with SMTP id d2e1a72fcca58-7173d0069b0mr16668781b3a.27.1725440466605;
        Wed, 04 Sep 2024 02:01:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:01:06 -0700 (PDT)
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
Subject: [PATCH v6 12/12] arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpads as fail
Date: Wed,  4 Sep 2024 17:00:14 +0800
Message-ID: <20240904090016.2841572-13-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020107_550265_BA04CDD8 
X-CRM114-Status: GOOD (  14.29  )
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
2.46.0.469.g59c65b2a67-goog


