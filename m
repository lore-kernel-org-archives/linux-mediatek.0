Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6BAC982D0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=; b=umGecHR+/1LgLhXYJinMzH/OrT
	2Z8duynd0V4VdE6vfXXijcDQMyfYaeTtZdaAKYmsXMRaZN23FauWi7Xd+9ujz4JJU5nqtmOKrcO6Q
	IqJra7tEgD8v5t99pJvcL/9a4KwLtcxOnnP74ct++CYOnVOS2GLa3Q1OzMo4HQCWRFnIRo/hyY6tG
	sOVkvo9bNmhs3crzsw128VfDYxjhAJLSevRAss0k087CV1oJacNkbnuUTJER12g+rI/PzHG9yDYpf
	5JyVSR4gMS1uig82oVrTfAP6jTApzNOtlIUIGEJDhitrOgCGgNhU2K61aaLNxq2FtZV7JlNbiPejo
	Lhvr9zqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dJ-0000000Gu9U-3SNG;
	Sun, 20 Sep 2026 04:58:33 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dH-0000000Gu83-2jmV
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:58:32 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1646295a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880311; x=1790485111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=;
        b=XZFd5jpGnwVISVw1vtxOXpdhlo5d9M2OPR6b4UAy75+6Vn98rXCtQfksCejwHwxJt4
         8GA1qyVjJmp/U9zwZ017K14DFR1U+vIit+wzcJXk5GR77C1GTu+ZckfUJMPgByUjVD6T
         N65yCvBkmQt3JEex9i6fj4WHiXK6ZxVvJSTWADCPey91H/2L0Mt6bi4s53cjTxH1pRL9
         20Wl2sIxlkV2nT9Eg9n+NgoxKAg/jUyNXbRjvY3jEtJnykNR3bFFc4kwj40QIcWZwgCP
         r7Jd/4odMymRl8HMbMxhDgUm/eAayqsrRhuQF7ncyrZeO8kgw3swOJttORmeuMz8N0xA
         pqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880311; x=1790485111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5y7b70ubJ7k4DhRxto7zdYhLdV7QsCa9C8GET+K0OY=;
        b=NanYjiHT+C+TN8Ra/SGoIxLWQLvQkMisv1kGtSkAdMsRIs0SOLHSD3Kr4bzJNEknRs
         vFrT7FurzArbj//hAJgFTW8tOTJ+4ppAR6CaSU4TBgJ2Vw8R+fu/mMFKOiRQOs47/xD1
         Pp4A6INdV/qU8b0Eo9+cJJdU3GQCdpoIDhc97xTpAoqSb9sCs9wz2NYwFpkAl7Tm6+Lj
         iS0Ce+8BUflBykGGO/HZ/EmNTiD9IbMvobIqagmrrzWLxypFoJAY0Gx4KX2NQFt6xJHQ
         zSSu+evg8bzngRraEyRvImJC6qrgvs7qHjOh3BlmyV8O5DkUDkmA5SK6omOJfXlVMgMY
         kkxw==
X-Forwarded-Encrypted: i=1; AKwUvBzz5Im8DjqjtgdSrzUpBUeStSTITvwrsfqJSLnZcyIlrI+lU+wHhZjoSyZJ6NS7A3LYkDqRM5m6ti4aGlC52A==@lists.infradead.org
X-Gm-Message-State: AFuF++lrIn9ewPSXdMUnuTmFBWvMbUt2E/QOqI3ZcBvLqCBPFJ3LeW/J
	MQEQWrRKhmzJemoJjF1z9H/cR3OTUES5xwHze/ZU5UPjhmk9HfwAIrXo
X-Gm-Gg: AYBFou2KVjPHhkQWZd5Qz9YVyh26npN53qHR2AlsX+dFrLL8T5ZEWtiKmDoW1yPNwjf
	GXQI2AgX29ViBAGcv0YVME2mQpks9SlsFDJZySf3aTTD99y7ZGt+/67skUEbA6cvPcXiWb6Ciwy
	HYPhWFvjyMNymVYPJV5fxNIMmn9LSsapXCVRIIjUjQadKDWD2GfVjQLrZ+0C/mezdKl7GxTsHPV
	tmqOzoy6yi/cjzkgEff0aqc2E4W1QI8NZMSVH0lTytD9bwDPo1FqXr+fDbCpfTVLNYGuMHjn9CT
	AbDLXh4Zmxr3A2PjHVbe6MWdxLeh598ZyJpJ65W0HBvNrwZvHmQBmr4nCQnIYJuu/bTU0Iq4jaL
	7gFdZm+oTlrnFBWdBmBEiWpt1Q0CAzHdr6ZtJW5MinaAtxLE7HVhm2wer3OTs5Ju4kR/5w3/C2j
	eoN515sz6yQrdew7QALNdzj2PPWTf5YZHDrtEIuZO0P6x1A684Z2mvLKdmt/QJc6d4/hYUudWcU
	q4KzIP7SuBMj5qJcEIOXbFeZhA0Z5u/V3OQLOrB3nzND9aRuJCRTF/nTV0OR8q1XWfwKCe/K8Vd
	HFHTGug7IN7N/a3hmCRS6GuFd/H2bKmh1iNxCu0r5IaM6PE=
X-Received: by 2002:a17:902:ce0c:b0:2df:336b:9c2a with SMTP id d9443c01a7336-2df336b9c5bmr36073685ad.70.1789880311051;
        Sat, 19 Sep 2026 21:58:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:29 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:01 +1000
Subject: [PATCH 22/28] arm64: dts: apple: t8112-j415: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-22-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3974;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=35yLsTXZt5swGMfuhMDygKEChMzE5kiCXJnWEUcydSA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05WquSsFpwoUim+YWmBgy24j0P72fv6G5Q/nVsbZJ
 W/wZ17UMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOquNoafjJvYzyr9844pFNAM/iGur//4e1/lxXUnnHVSzdstmrwjGRmalJomLJf
 fYxJ7j81F7eX3p3b7nxjnnzqf2szswb5m5R5mAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215831_698646_FC573D96 
X-CRM114-Status: GOOD (  10.07  )
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

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 125 +++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..5f245ef1c4bf 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,129 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_woof2: codec@3a {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweet";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j415-macaudio", "apple,macaudio";
+		model = "MacBook Air J415";
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
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


