Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E06C982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wNW58H2E9LvctZSyWkCkKi9IlEj3updz7FkHJDkZcU=; b=si/5fnmn7KzF5UHfr9gTBHSvRY
	HQgSA4Ub9vUdiq8MOw1XX2Bjd1T0oxXAbDbqPuUUYIdi4TsxAB5WW6pWN7FXfF+Fw8cwayHrCihgL
	OWs9DYHYmZH87hoSg5gf+FUTwspNukXwOwPFL8HcCZBCZSIAPE/8SpISabpv7YRWu6XTsTgS5QQNE
	8Hgar49UWdjIFnUWx/d2muNC7pWQJM2huhp71XhnU+FJgX1dzncgxMVnRGgGNWjw1BYdv4FeeR1cK
	CNxlQ7uLTpHuDw+gVMr2nDtrAF7A90F2aNVnlDaVv7WpuSWhXudHP9w6YoRItm+rSopt8d10SzqiG
	k4BQH20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89e3-0000000Guhp-1RUN;
	Sun, 20 Sep 2026 04:59:19 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89e0-0000000Gufr-3HLo
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:59:17 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d9004a1ac0so12574455ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880356; x=1790485156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wNW58H2E9LvctZSyWkCkKi9IlEj3updz7FkHJDkZcU=;
        b=KyUeR9MkM4lNzw6Smea+EKe0hcYTORKKE/qmenxAyZrFesqcUoo6wARD7vGws+mIh5
         wBeDDNDsfmjLizbPqk/VblSTlmAlexmCx9eqfeNLFK6YdAP1f5VVGYH3GFL0mXLH24uh
         R+TFyfLRZiAhXaPYQviDGp5tmCpePv+N54s3Id18qTl5FPoZbj0YepKz+inBxMzRsgJQ
         WAUvMCxH7Hwv7ZgktmxR1r+XI5QGT0yW4Gj6XU0R5565MGOXXRjRLQ5BcbQrVQv40bis
         8s5GxSiNDTWW1l8kJbsgrjB1l3fZJfkuLv5o/bCZQyGmEvoTPeNz4weaCe7vSO+w/wD9
         8+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880356; x=1790485156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wNW58H2E9LvctZSyWkCkKi9IlEj3updz7FkHJDkZcU=;
        b=jz6TVxZVYBAgwIGHjJVX/UDs699V4ozBrHNGxw+RzGb+qcIXuepBxalfp6Pq9GMXds
         kFav4TWQ7TE0itU/qE/l0WC+AK2XrSmxKZVwwyW3v5Q5vbHLrmAZ4vbYct52Yul1JA2q
         xSKQdQ+LLbwnaDWAdgLv0iV/XhPPaIhfk+hx7N5wMbOhMh1eX9vuh4xAZaQX/1vb3DCD
         n2qlN/YEwG8zcEnGPfRgJB7j4ooaN05xjeU+qFGICMChIPaRflqXBw377lWf/iEn4mar
         uHSt83gf9Ek9+6RRQVHvb9i21u1nOQqWFQmh5eVNvWhB0pLlOVGWmmRJUu9kn4V1Fj9x
         Tx1w==
X-Forwarded-Encrypted: i=1; AKwUvBylcH38Wzp6KDAXXSbqMVtBKNN9b8Xuma1gBM8/dyUNtjWZzJex4AtbnYHSsMMvwm+3FOURYyt3JMuSgfgsgQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n74bJ/S0D9hjtl4c6a9xsnpa2gzO2XiE3Uo20wkMfT/93c0lMN
	x2GyoeTgswyvXT+X0w4giLZxDTdhDE5a12hznTyeJs73M8qCBlP1GPvt
X-Gm-Gg: AYBFou3Pg4ISccoVODIoNWd8LQBylzVchXif9XUcnWnXElB6563xtIcA2Y/zxYAG4BT
	33MuedwYor2DA+lU9B2HOG7flzSkF6DBMDsbFvrohlBlo9F9/yfr+WS5/pkiqfnxRAsHLU37qyE
	U6o/UR9ggsfUSJtatBWifhWvBXi0/Bg9qv0XGIzEDZrkt3aLI7+iO36zO5i+bN96ZLw0LWWavLf
	X/AydAiQ0BHHzbEirshDDMgi7r9mGfp9JysPZ1+YWt1SUVaUS+gvV1OTT9Qfn/sDOKb6SzH62cQ
	7r3/HNinKqRMiaKfHz0K/YWWuNScHlb4MaJISjTwEsQ4lC1Dp3TW6aGgoCewDuuGbCy00EFxzgD
	qwu9MUnEnJLPrmlgBbyhiJIv9KyGAlUqtFnLgY+VE1IaGaoMmRBVDSxkps5aDvyy/7x6Yceq/Cs
	4RDKlr7w0tWrDZjWHmGS3WbSZwVrBMHaGwKcZsLLFEwW9VSwPBLsi47x3l+JRheFghItck00Glw
	S8pApseC8AAn9LSPfIs76A+6Z58Lebs5HrKInu8C1TlgG9hu1ozU4BSJ3SUWygLWMVwt70PPYsP
	Z5zkIpfu3B4ZABM8sy2WcxXSu/vpX0RX1ek53DT6yOxV7SA=
X-Received: by 2002:a17:902:e549:b0:2dd:c1a0:c7e0 with SMTP id d9443c01a7336-2ddc1a0c90emr52143865ad.15.1789880356108;
        Sat, 19 Sep 2026 21:59:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:06 +1000
Subject: [PATCH 27/28] arm64: dts: apple: t602x-j41x: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-27-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3776;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QYtiLlOA1qm5LKu0Z+66im/X8d3VR2WwNILFXW4q0n8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05XPTGNt3/WoMq6/4MYqMYPpp/m36vq7eT2aWFHVs
 GL60dczOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOt58/IsD4s4cR7/Wj2Vz4BV5SmBH5fkXHibatD78cr9h5NuU+l+Rj+ytw/sUX
 9/FmD7bVn4sSZ/P5WvdeS5Pp+0+dSuOPprgnvOQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215916_822434_3B0B0CDE 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j414s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6020-j416s.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j414c.dts |  5 ++++
 .../arm64/boot/dts/apple/t6021-j416c.dts |  5 ++++
 .../boot/dts/apple/t602x-j414-j416.dtsi  | 35 +++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..b42750fc9404 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..98caa29e3bdd 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..b945b75e518c 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0d4a7ef7dcac 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.55.0


