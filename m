Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1D3CCF2C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=; b=j9H2L7wjcwVzPz5jOTVvmIed3c
	T3if5Ezy2wg1RZNR6y1rAbCWv3Ahn5eStc5OCurHOlboUkxWOGewXOYiMfP7D9/+Q+GIuqkCl9AN7
	I2roPiobv5HZ5rylFUj5CupFBJx1RkFkVsSiXuKS/VFCtnGY6DLLnYxyqhg8uUEMuH381NRGUp4Jt
	dX3eoDvucRdY6cemcodDYd+IBHx9FQiUNRzbhw0Yc7Sto7ylB5bl2kcg23X3hVofqSW5NQ5G3kq0C
	4/Ed3HLPeB8z0M5Mn6Ar3mxFMg1//4KOYEWhFM1ZOkW8l+oRn9VQLQsbTwA44zFuDXfIqLdhVv834
	fYD04yFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJu0-00000005bJ7-0RfY;
	Sun, 18 Oct 2026 05:57:48 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtx-00000005bG3-0wpw
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:47 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso659975a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303064; x=1792907864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=;
        b=ajRq5Zql6TgtJ43d1yjWWr8CIw+uINoBlmd4oJntWtww8QWVM9sueuqmHosdf+cBYO
         3x7uZ0yWzbozFXihSFxIDsp6gNE1NKVFzc9NHrkzpeLQnhpCNPSfsjJhtv3vzXNKz+WZ
         x0JixwubKSNk74pbCDuGoxP734wBmS2fEpxjKmL1hL5S4TM2a7AuI/VYa2V6R3PByXRy
         MtZhrdmBlABPwqQlyDlanEtZDng82HK3MbIA2knUJKpHFIMubT0/8W/6CHBUoSmi85ez
         ImIod4egv5ziBLc9V91VwGcVg5cM0o3K92mw7dmI34R4TvEM5fhr9zOlO0srLuVJr4vY
         NG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303064; x=1792907864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDf0EybxbEMPZU9VxQSFE/nCsO169lfCLx83ijqsYSY=;
        b=GrS3sFQPIjez6exN8yKJEAqLOutmUPbdJBGCRz8oOjPnFBAji1J3bG3GuAoPr7BGMf
         M7hlU1ktLd7TXw/DWrh7c87+7wNlx1+Pi13AC75Rq2/A9OGNsMIqILVojxn8WKMHlw5Q
         MSvsIapV6AXX+lynF5CvLV+K/bmyNCKhbtHMVIvqc+CROwlj3hc9zGAiE5HRBpgdzLcn
         R8YwRHkjGvPHZnIEBcNiVllZ1+8qmaQpaSjD1oo5XD4gd7jCsAgWMfmNEEg+xFNGrFcj
         +Bg8g8nnwn6WmdVNm6SoJFMKv2orcJEfs6u2DS2qiqCb8eZMSFRlrRsWTAFHNApWNet+
         D0SA==
X-Forwarded-Encrypted: i=1; AKwUvByBAZ2Qoy+vzohHbwSOcf6yACBN6UVLRrvkxFQG8sr+8eekR+lm/m4Q/Zk5dVhhGaGKxpDX/dGzsJuVA4JSZw==@lists.infradead.org
X-Gm-Message-State: AFq9FYInuci3WD7ectCC1QN0wIAAAbKp2OLYWD/oSHnJczzjuBi+qFib
	sc8736TMQmKaFNehBxBvTgEN8iiWRmEFRXEuQBZMnBzJQo9jnbuDuiRV
X-Gm-Gg: AYBFou0QJUMMn+EE6xDEJ5APdT9wWqp057UXHmrzwriEAMZpL9UnitH8l+stRdGpKUs
	xXn7Mlxi4JVaJi5XfDJ7rWNm4TsENhHF2MiaQab69Qps59MZOcx9vcKi7qop975Q0NVvQ/K90mS
	wLwCXWGqX2OwpRcKgHehrrBepdXSoY/SS7rVoOBHyPCzZiBbZy6voJnqn0XcTx84ovIvUeYqHEh
	eIJO+mDcQLjY8UZCtRzUEN+WlXI3H5wfwqXIeqpbetFHg3Si56k1viudC0/FQDUKmpwmVjPj3Bh
	ozwwqN/WK2+3UkniwQ9H2vzBhAq1ysGHpz7pDVbKTTuMuCARqlXD3P0wNbyX04BqmJ/niruZFoK
	7biilgEtjGFMCU+yKyJGULeT/qLW/yflTJInqwdhrDsuJ+aJpo3JiM0qy6vQZ8rromKXFvBCZYg
	LUY5Z10pHEerjINqkGHXUH9m5MWLo4dnTDHvcI5QzTqHITKp5YweCneJzaTtMgICIsjSKUOJKXl
	WFC1IqUB2JqNNKsEWrQC2AaLopgVYJRL8h/L0qN3oD7nWTrqMxyJUbR7C0R3HM4Fqpvuv+cjMY9
	0Dr8GYgOqxj5jgPK15G0rs5trGi7aS7C34n4k1mNff/CtA==
X-Received: by 2002:a17:90b:1d4d:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3acef5f0687mr3345724a91.64.1792303064515;
        Sat, 17 Oct 2026 22:57:44 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:14 +1000
Subject: [PATCH v3 20/21] arm64: dts: apple: t602x-j41x: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-20-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=4umqbHnPcmDvTKDGGgoaHBxvCxbbxjsr11wiU95vPB0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vl8PtYHuD+eEiw6QW/zjcuLwwLOnjK6MtFAdca+J
 OFmLv0bHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKl+ocfwP2qvi6NfdVpUzax1+SV/rKyM/zzf3fDra8ud4yf895leMWP4Z9/W3rb
 3QsqbCfUhy1efkTi6uDKdv+Rc04NNLtdCO2LkGQE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225745_494119_7C6B39CD 
X-CRM114-Status: UNSURE (   8.84  )
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
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
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
2.56.0


