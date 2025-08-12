Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFF3CA0EDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1evk3OmIRtfZwDni9+00QXZ21rdMVrFGcmbyCodTqyQ=; b=SJrVCo6C9G9nQWlAt5J5+vBpuC
	7uoeLIkq6iFIUFqKb4Gu/WmfWIsSapHTmBTzdvepYHPSDku7grqusKXKXHYyR7wjJmiyg96Ba2a0b
	X3XJjtGyqvofL9th5LSI68S8ac1thPISOKdJh0BWAHaiAipHGLllvAhJGqzCne9s0aDpM0UbbOUql
	XczFb7UvImKL8uNShvlfeI0Befr8kjKgr9HD4LGkS0jR5Lj5J8PoQnsZeCz2UF9QfwE8K7Q/BpAdX
	K+jRFp/to7A7z0ciMdhl+QnsfoBEOfEPDxgtwNaDkht6lXbwHQq1pTYHqj2BypBlqr98S40fXOIql
	3q01k9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHw-0000000Am1u-19MJ;
	Tue, 12 Aug 2025 12:39:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkt8-0000000AK1X-1nwb
	for linux-mediatek@bombadil.infradead.org;
	Tue, 12 Aug 2025 09:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1evk3OmIRtfZwDni9+00QXZ21rdMVrFGcmbyCodTqyQ=; b=GxVG34r0lv5Cd+xX9EYMmKoY7s
	3qrbxPoY+b5oP0pQZcnGXX9Sw8fv5elDBVbF86xSK8cVloAUcV17zKy2Sq5WsGPEPg23dwD6cz38f
	B88aCJDph/ZDx5tsKs/y0DsJwevaQGtYALfX4rOgqkAqn/Sav7EJcyOcahg7QvORLjasTxe3be0bB
	UA/OYO0w2ARpgAZx9VlfHTDE+RYeNkKKCdfSrC6SkHT+o+gYgFXFD0+fcCJOD3YjGZDj2EpRuHmfs
	mo7eSLgaUVz4vyR/wvH0Kx7BRJLHJ20//j6Jh2FIDILa/7PUug5a6gB2nC8/v2qrtG2jGuAe1+wuy
	gOWwaFqA==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkt5-0000000Flau-28oq
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 09:01:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-769a21bd4d5so4881337b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754989301; x=1755594101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1evk3OmIRtfZwDni9+00QXZ21rdMVrFGcmbyCodTqyQ=;
        b=DA920/cuJIL9i+wpbcs7EgQ1uNJwsDLAeMEVTd4R2cJdddG7RSTqyYAv4PT1iY/dyL
         FCstsFd1yrgpEPAqzC+hLqVdBvL8nsr/sh0AiArNU3TaGKOfnBeAwZiXPMTjunxO9oPq
         qq8+6fW3+Zgo+jg0CS6g8bcO96tXVjMsylU3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989301; x=1755594101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1evk3OmIRtfZwDni9+00QXZ21rdMVrFGcmbyCodTqyQ=;
        b=AjEncK5UfKlc4D48NIVijqsYwz2pHWPUQgANp5x/1SlicZSZWkVNXNTEo4szQ0+4pa
         +PhqJcAN9LLkkSPfcGHz2i8oBZFiPZwcOelxkCsp2OKSOwxJh3jEZcjhrZ9u6s6WAdDI
         15BHU5m/llSV7kQ6X7zsJ6XLaAYU5c/FP4G/63UuU678hdBMCET1RaC3hGNWuJncum/Q
         MTfdwy1ykoXYVaqDYvl0ZxrxeXAT7S8yGavEiQ/zkkgJC9AA8s0zp9k6nhjR1x4gCwc2
         Z4LMOs+jIgC6ydnuYJTMEx5peus+IkAmpSIodqpmhjIHEfHUTKNg7iQUaPfTijEaq+it
         n7OA==
X-Forwarded-Encrypted: i=1; AJvYcCU/JM0miVa0vPac6uRPtZV6MYPzhnY/I4uPMySbr9JxjryQJl+8kKl5AyhDtVa9S2V5Jj5O8nPnJRHn4aJp7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV0TZEBVajC7x72oMbo4TtZNA366Kekbid6C/SG1xuEvKrNizn
	N4a4uz2H2F00ddXMRkFuv/0qojbJd3P7q+NhzZOlyWPFPGoT8Z4vXwwNQGkCknc2mw==
X-Gm-Gg: ASbGnctTemcdeExIxsBXKRB/xC92hFeJuoDpXLTH+1H3DzX3bAikTN6Sodxp99QtDFB
	63SkF1wtfECS9FKoISDOLnseNSWzBl4JlYvDYR4XIsZ2GKJ1qmcDUiedWDMwHq6ypkztcOjLtnk
	E0OxEg51Qo7R3Y5LTT9yw1rAlwrJUiIrB8zkISJ3OT+bYck2i/XdHE6Zpj1aIAv+p4eJyiLpnS+
	SnDq1UuGptXDsARBQwdSJnUQpoQmvxUHDooqR4yIWbdkDj0ylcfS3yNsyw28uU46mef18pi2rJR
	4zqPG/4FPaOEAiTwmjZnBKHAPWz+P3HXfSkCzlBWzTMam3CKipPQnFREnrO0IDRR/UiDYzfvjre
	+tNcRJ2twC/fkx+1gz39sF32s/O41PeoZPRpt3tSi
X-Google-Smtp-Source: AGHT+IHXmeu6f/qQoZG8o8delXd8Ye6Z0N5pfSw8ONOvc9dDiZfBz+hBlS0QTkCIYV04xBciYh8R9w==
X-Received: by 2002:a05:6a20:3d1c:b0:23f:f88a:c17d with SMTP id adf61e73a8af0-2409aa01f0amr3953648637.42.1754989301505;
        Tue, 12 Aug 2025 02:01:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f81e:7c91:8fbf:672a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcee7sm29052518b3a.66.2025.08.12.02.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:01:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
Date: Tue, 12 Aug 2025 17:01:34 +0800
Message-ID: <20250812090135.3310374-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_100143_662398_7DF92FE7 
X-CRM114-Status: GOOD (  14.10  )
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

The touchscreen controller used with the original Krabby design is the
Elan eKTH6918, which is in the same family as eKTH6915, but supporting
a larger screen size with more sense lines.

OTOH, the touchscreen controller that actually shipped on the Tentacruel
devices is the Elan eKTH6A12NAY. A compatible string was added for it
specifically because it has different power sequencing timings.

Fix up the touchscreen nodes for both these. This also includes adding
a previously missing reset line. Also add "no-reset-on-power-off" since
the power is always on, and putting it in reset would consume more
power.

Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi   | 8 ++++----
 .../dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts  | 4 ++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
index 7c971198fa95..72a2a2bff0a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
@@ -71,14 +71,14 @@ &i2c1 {
 	i2c-scl-internal-delay-ns = <10000>;
 
 	touchscreen: touchscreen@10 {
-		compatible = "hid-over-i2c";
+		compatible = "elan,ekth6915";
 		reg = <0x10>;
 		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&touchscreen_pins>;
-		post-power-on-delay-ms = <10>;
-		hid-descr-addr = <0x0001>;
-		vdd-supply = <&pp3300_s3>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vcc33-supply = <&pp3300_s3>;
+		no-reset-on-power-off;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
index 26d3451a5e47..24d9ede63eaa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
@@ -42,3 +42,7 @@ MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
 		CROS_STD_MAIN_KEYMAP
 	>;
 };
+
+&touchscreen {
+	compatible = "elan,ekth6a12nay";
+};
-- 
2.51.0.rc0.215.g125493bb4a-goog


