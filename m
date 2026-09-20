Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8C3C982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=; b=LSZH5l8GolbaLZReW1erG2UY9j
	XFhm0tsZygXo30Tr4N3uMN67CZKdEJYyioYjT23Y5QZe+g7mjJji76me1BTpzAo4kZRNEE2eojW5G
	1NhEUS0SlAuU5dr6nLokn5QYfw+05ydbOg37uapNWIaPKtGjOZhn8VWQcDvMZ5sjxU5RaJEyrU/C0
	tCeTqO3OHjoRgoCDlFw0D/PYUDoVxRFtKVBfkmEMNL/xnq4HhhXSOJDpzColm14wXpVy6dZravnWe
	CMMp3Zxw5eJcVx8ovlUv56v9xna8ee2BVW3kELrxWEfg1nIAXXeaW2qXaRl2XTNij6pfjNeS/w2c2
	6eWGctfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89ci-0000000Gthy-3cYN;
	Sun, 20 Sep 2026 04:57:56 +0000
Received: from mail-pj2-x26.google.com ([2607:f8b0:4864:39::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89ch-0000000GtgY-0a5E
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:57:56 +0000
Received: by mail-pj2-x26.google.com with SMTP id d9443c01a7336-2d747eb79f7so13412415ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880274; x=1790485074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=mArTD/fBCyPX6KzOF3mMPxf08Yi+Dp+tj4EDIRlDt1T2Rv1oqt9D0IffdmI1y4/zNH
         SvYXgeGZzZ/Yq88AzB7JIRTEmT9K7W0cNEaj0qgR3C7YwtWGcv/NClzy+jJ9ASFi3ZVb
         m/4SYdj1bK1Zs/DfaTPatPkcPyGgnvcMZtwvut84sAmwQo/Hr80T6/wft11CXTRTKxoZ
         hLTHEyLX2GXfrKUBfe6yaUBkWRRqTRVxWfHn7Eoen2MnhvTSL7Gv41BEvQsilFg3UzzA
         aK0+GrI8cAMJBGojxensKlem665ZAi7GaVG9eWfmTr6wCfskdXWIQgsyKa5ADVKjWdZx
         psDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880274; x=1790485074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVS+rZcPiwNSGlOkstoIB1+WRDSe9XgudDvzIak9RwI=;
        b=Bnwdea5vmXaj2tBPbPDbAsv92SPZuEx/9xKre9YR1PZgtHDmd/JlnPXk5zS8hbaQIe
         rywOntm32K/SHZKFn1NYXEPhdFXb/EdgtAzceSAxYGTrnLMTlXME/EAZTn9eqJSJ7MWK
         RVl57ATNfN/0VhNGDuWS3Kwq4Uv4VD2ceDmDuObVMXTzoubcqjlq5AB8FjCNqeWiFWi8
         u66sUidXtoqSyrpA2zBGU5aFtwhslftA0nEWW5tg18DEHDTQbGhFOYy89TjjR/n1E3Tu
         2skYEmwuboh5+Xo/pkDlphncpfYSdBTf5VAdEFjlSkRUqwNGRQyUtxRyx7JNrUrLY6Xv
         IweQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+uMu2vL1KzHK1qra5zcr/HyNqUsQt87+/m5yvmY9zeAFQDe4h03jQe3LHy3Tjr5PcQkYIs8BxBaCg9Y7PMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lrvxJPvOyr7aA2hxgIk4DVUwYLOxYu1JBlnUyJIrE73QGNslUB
	Ye9BgP3tu3aR56Yx3W/3M1hJWdiFjYqPcgKsccnCXF71KJpBd9K/m/Ek
X-Gm-Gg: AYBFou1V6sp/orKiYIn4aUigpM2R7Xt9Y/Fpt7fRVSyFF7hzIQ4sHws98JIcaF0DWjg
	XBczQ0//aOOwTBY0mGCGOEPrk+VOQB5qeono36pFgTkNvWayysBKx180nRTS1oGMgBZzC+5V5lS
	wbLSXPYYZJO6CXCiATsDFpyFmvWcrOxewJsJ9Cb8qtB/Aa29Ks3uy8wmQa7thQA9E3G/f+PrfNA
	JimggWFGSjXNSfrVZpfIYn0oAm5gV28V2Q2yC6cjdcCNeHCos3ituRb3gO4Z7CSwPfaS+lwnCTb
	+C25CoBFbU3FypmVXTafFWs/92ZqJg/sKwe2CCa1YMSGo31oykN9U43A3QbaWvMd+s+A062Y9kI
	FkyV2wmT4n/ABdwb7Svwnb06ulGTwqe1GI+b+Qgq3sEJZibsXD7VGxz/fa6iSIEZgy5NZfn6X4f
	1idfGax8WWiUcwvKIKc/rjhXPr8hV4Q9m76qdYRJb0XEymzZrK7Ql75W8iJDbUK5nUbA8qsUSDd
	Rcqv3+G3YiyY4DM5oYV47b2th1dVxcRnHkFSY0K9n9iy1ypyZkH6s0+LHah3PmLYzDfnkn5ImEW
	pl/hlYifF+iTuj95aHM1FXDlAc7nT0dxocHuXh3RXn+EARI=
X-Received: by 2002:a17:903:1a0f:b0:2dd:c053:82ef with SMTP id d9443c01a7336-2ddc0538401mr56050135ad.38.1789880274403;
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:57 +1000
Subject: [PATCH 18/28] arm64: dts: apple: t8103-j313: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-18-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=R5y0xujUvUXkSP7Xsswza01bR/jBq8AIplidrHgUeyE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWb21c66G3M4JvHv35y8tKklc9PTDVZ/u9cp9Se1
 TM7LBnEOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPNLMTIMOnKCZnG5Qc/2M6KzS1409PptySZccGOP+mzG6/GRCytbmVk2J6X9P9
 4R3Mos7D4tdcO8pv3FzRPULvT+sC76gqvaqwXEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215755_195878_5B6902B3 
X-CRM114-Status: UNSURE (   9.77  )
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

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 75 +++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..514dd56bc9f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,79 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l", "ti,tas2770";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
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
+		compatible = "apple,j313-macaudio", "apple,macaudio";
+		model = "MacBook Air J313";
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
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
 #include "hwmon-laptop.dtsi"

-- 
2.55.0


