Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12E9CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=; b=zeucvHwTohHWeQI9YF4VTwcI1C
	fKP7BSELiTwc2C7P6I7XqJmxKsmQ/8OTDznGeCWfOhFIInRvZuLqysfoKgscNFzSf1JYQhXVpz2sX
	v5R1BiA+wshjCJkjVEPGomU+1tly1JwGzC5et3pueEoGr/PX+C674bmvVBJBly5ZxIbs0mMZ5b4cS
	41wHOJ77C6tmT18plY5g9ps11743dw/KdxeCHjWSDEjQYQgdP0Ny0rBxzd5rcvvtxLQG4/z7i3MK5
	yhjZLGGc2NrwJF8VtwDLT31XaD4/78aIGwDtU+vEIeKWIO2y7vVfEgiAuwHMY/rql+Dko3uctaewP
	QRYBgB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMB-0000000EO18-3idW;
	Sun, 04 Oct 2026 06:05:55 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFM9-0000000ENyo-2CC5
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:05:54 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccda24afso207486a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093953; x=1791698753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=Dsvm9zj7XPGwzVKubrf1A7I3+R/CR02u77XXInDriW6Rc7ZHFoeNlO2SPJDuIx5zb8
         q1uW1dnHjyuV/dHGoB9scf1TWHxTVRAYe5HMMz1OQThN8kCw2bCZLfCBkqrH23enc5fb
         enqFDZlDhLFfFb2jNHjeqc6qT5fkG+eXPX7cO/nsgZIDfLCDWNjeVvnm7n+expDzpzmL
         unPw29PE5Gks8knHjKAgF1geh1ZpN5EMuJy9JOegirxQB4jKXKlnb2RJmADnCpThuIEi
         V/RiTjIAT5/hwlZr84N7YMu9enkQtN1d4PcKtXDYMO7gRWSOLTI5mBoawJcAbbvqFlLP
         k8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093953; x=1791698753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=mCJvy0fPmkU17GKET+DnpTSCsjFpSzle3SFgJue3Xqs90ke3y1OxCbsY9S3qfXHIoU
         4gUDxMf42twQu5AauyFPWIJwWsF1esFs3aqsJ9tz97y8gpL6+J5bXt71YDOZWpEmfkD2
         3lfKAcagAcGTIHT5NP6ngVCrVr42TNGoijSlMk3b0Qo7VAm49vtSL/tXf40p//NGJwez
         4QLYMIc/mkQ3Q5Il2wdXVk55y1M/dSoSZmBBoP7MMFdJonkI6is3fEYTV8j9lDfbcr2E
         oSG/fHzalG8flYSe6WZfiTKyWvMLbE2oHehIocGKfPZrnWOv+gwtwRbDBy0XBhOqFo9j
         Cgiw==
X-Forwarded-Encrypted: i=1; AKwUvBxTTpJXuCAnlLDkBG6ApfPzqcbOZfJ3Z40L2tnBCq5QxCEE30lQmpzxrEImCBd/t3XrAZqMP7ut470E7IyARA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKyOG8wF2gdnSeLzJJN1sgr36eBcl9uFBVOunCr6zikn+5YDx1m
	EjC3QPjA5GeZIo6eHnLQ+PKjSALSQfu+pws6hKFGo8Qqd61XFKXwyX7x
X-Gm-Gg: AYBFou1+O54fI/qW7240xQlvLVvJRVEwf0gcAl3xMF4AFBC0FQv21Chgxq+mQ76LhRI
	dPogp0xhSu8LWW/n4lfWJKDW06QKdh9+6IW8LCrGcIFALz98ZGDycE7XdisfTKdInGk4BCytRhp
	ehAZYuyTB7R2VQcWaWNa5+z0ljSapjRdRnCXQIQ0XHrocObYnFakIscCzXgnsENhYtJQD2icCq3
	CXv5zpE9iEYMyPAVq3z8iQ+QLJEqSNuCB4nK5yidq63DIyL4Gcw94KiHUz2cWKKFe710RCG2BXx
	vjJcnQqTvQb+Tfrt+kv6HmstNDF21U+oBBlQTLCaOGqCHBmY9NN693NAOYsIz3oE6rXM8t51cB7
	z9yPYsWucmj/U4SuI4ot5DiIsHhJl5unfxrFUvUK47ySiuLr5LUsNA916hjacF1eWKLjF29DRHH
	ilooZpBD1LsaQ0T3sxaTtgSJca/rWjBvaErdGAUsK3uiEAmvkfMPflsp+AbiL1OuxjCxATm7WnH
	AF6wtb+g23xnJAp9M0qYAyzsIIP6Q75+CDzkJde1ck49PBw8Lrkn9J1R7Mm8C2SWKQSpG3hANJb
	Vz2H8qlFX1+Nfxs2CnebyinNZH9aAEUye8/4CdI0Mo9jXcw=
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr2965260a91.49.1791093952798;
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:37 +1000
Subject: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YcqdYPkEPgiJniI3m1/5Z4GxljDKdHVHbbdhKHfnQAU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QWXGpdu8z133+eZ64Lnup8sujus3zwc7tQzqf9Y
 uuKT+Ws7pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEw1Cwsjw06nGQ5barf4Td6WU/r7ituvn5LT5msFFjB0rn1gLbuwazsjw+w1bTU
 7D/Zd69RfL6+UNX937tHpsh2djX+uCe0/ZhtfwgQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230553_585699_17DFB3BE 
X-CRM114-Status: UNSURE (   9.33  )
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

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..6121e3a89a0f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,71 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.55.0


