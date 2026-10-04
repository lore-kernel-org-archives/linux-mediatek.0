Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8BCCA5FCE
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQ3/e5mldTU9lRFwTRwCfrqJHaFkFUoZ7oi2cigEfeI=; b=Ec0sgzodZJM6b0y7ScGmzmYqwv
	RU3s2kK1biHh+P4IjphL6H8Aol2tf9+Ov2pIVXMxo19GRgbh52ifynHkL4reLG0lUqnhU5iEKO7aC
	XlCJTy48T0UYuQujpIQjeDHPDjnTmdDLE21ol9zOdnPkXrB+IU6aV2yOxqmFkp8asAHYUH1y8J9c3
	1Ug1+QK0O6Xs6iF/AxX+ZykVlT4jrxm1SpL7Ehzp5XUUARH02yWv/4on8mGXjw/4yGmRqoOSTlBQP
	uKPeI3ApyPS4QVXaFWmJbDcG4+e90dyBadTLYUJRGLA55NpGKUYjiKu0qFEgdbIb+pH6R7sDFy3ul
	zWWL4bVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMu-0000000EOnJ-381M;
	Sun, 04 Oct 2026 06:06:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMl-0000000EOeO-0d4X
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-381b831d535so614173a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093990; x=1791698790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQ3/e5mldTU9lRFwTRwCfrqJHaFkFUoZ7oi2cigEfeI=;
        b=SP2mH4a/IW91gS6AXLmYn2hsysYSZ7PUgF2MI61ryvDfTO4iZ19sUHlO/WH1OV4S4S
         7RT5FpWmnxndh0P8ppqmGupcoIlfpvEMe0s/P37S3mDveXNwO00s6qhnPhWD0Md2NK+U
         NyMY2uZYZoiqmLeZjMccc5CaRkTZOB0oDgrfYzhGnw7YiCuhdenDD2dVwwIuH41NGh3K
         cA2eNOOMwQ0GQhSphJ4VZagZ+pPjHIFi41VwtRSqWtI3Ztm3x7B5B/junYN87hlRy4nx
         X3i7zrpN6RpRC6t+IiFrJWbxCQKFuvuVAx/UZc69z2KsKZNKHT4KtFw6Oc7bJZachz3F
         HKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093990; x=1791698790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQ3/e5mldTU9lRFwTRwCfrqJHaFkFUoZ7oi2cigEfeI=;
        b=v7nwywQRIiCKDWetLzOn4GLixYEhwiqxgxwz3u3uCgBqcKjFUtR0QA32hzSIfRt+Bc
         4gRoPhXQAsbkq+Dh7YqEC/NfN/ah6thoB7+nJ6tnxAAFPj/rCnv2xrw7OschOFdLobfZ
         xDXWoDG5Ed7PfgdfWEDxdDb2GQzjpKq8KWlLholax6Y6Zpb2hHPncAV5/zh0xHv32wcY
         zLN6p0bnRPMvI8wnQSsbfb6BHa57DjfaPuGGsbKfNyGDMoYE1xsWZlU9DKRInH2bPCu0
         lJyp8ifFkfvyjcXW+g7D37hBjrS/44LLZuGU+xMa7R8rjm2XTcLQ2pnIVxKV5doPHvmi
         xSBg==
X-Forwarded-Encrypted: i=1; AKwUvByI5IkHwV+8BziWIZAmpJsMkVMpVCIVY8fBpwYezaQtdwbkmIj2yQb/WIo4uqFY8HAwgnBt8lyX+Df6rjBbsw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIvm2VpZeEU5Ot6pMVC533H23a9Uoj8vblfk1WPULwQYfqTUrcO
	5Dkb43SNF1YGrGP8K4FD9Gvj9pRL/rUHTCW5S9yjd4qt57Ggp71nooZs
X-Gm-Gg: AYBFou03pC9LBhokJrJ1FmtdNpFxYuCirz1xuaqFSJRgZqFZZs4WhOwyMLfmjW9x4Jo
	M2sHXlMUDGerVSJ89h2nIeBpINXnpWP7xH4+I+gGEeJdhrw9dv32f6CJbt5Arzki7V/6Kfit+pu
	piwhEYHzD0oYxOLdZWQuLGcyk2HyAsvb6KP2TZBeNYQAvOHaZ88HiDShpPdwh36dBQq+4gpVbaK
	Uiqicl/XP7U4FnYlSmgf76Zq9YiaYx37hmdH1rGJBnkygS5TtJC2HcfYbNKI+pntTQimcCbGFBi
	F5hw6eaxm/i0V6M80JusZICkZ3FqTI8wrCYl+EcB/ywMNPOR6Cdk3eMFSgOqSxBg4DEYFwsZVd1
	WRuZCa7pH066DIIQmsA3LN8z06/WyGWU6ap2ZLRrhB6IohFcYx+adGZg7DOsHrKq40lf91s2Wux
	PPzO4fpKuI2C34OC7PxLRAMPoywLu67sSDg6SpkJV7r4l+r/12Pm9TmaWMi8o7KClcCD7U+TksZ
	R6CBitzuUggzVcoAQMXG+l0e3UV7GelJum1KlZ/WXQScpzme4DAfW/Y2gI0uuA7nGiq4CaSh/9Q
	pPt3SHXHT+Sycf/Fd6gkcIp8b7LVXC9ustOofxRWbHFJ6ds=
X-Received: by 2002:a17:90b:540b:b0:3a0:7cbf:b8cd with SMTP id 98e67ed59e1d1-3a787182b90mr3251613a91.14.1791093990369;
        Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:42 +1000
Subject: [PATCH v2 15/21] arm64: dts: apple: t8112-j415: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-15-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=oL7nT/fUiExh/NupOZC1GRwq19xTT792pHy/X0M8idA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+TdDphZfaTCsPPMG8d+n6DH+/2eftm3b+pyFhGrR
 uc/h7V/dUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbabS/Dfzed0lhLW4U3onrLem1Vl8vvMOdK8whf1GJ2vmD1us7eSkaGG0Hp60L
 DX+/eOWd7wFWvS6yzZGvWfen+H13WpHAy1SqZCQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230631_219224_DD10D332 
X-CRM114-Status: UNSURE (   9.32  )
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

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 132 +++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..4f3db2a93db0 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,136 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
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
+		compatible = "ti,sn012776";
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
+		compatible = "apple,j415-macaudio";
+		model = "MacBook Air J415";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
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
 #include "hwmon-laptop.dtsi"

-- 
2.55.0


