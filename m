Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F41FCCF2CF
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=; b=c/SGfw33YSw8gfjobDZ3H6f8mo
	8jyBaCxakLPalrx1zHt/CDRtn+nCXyNh+4PYx6aswPLxOmx5/ojJD044/pqHBXOpqGIGoAp56oKsj
	v10tcU//buDviu8+zQVgpiDB6notwiaPq0AuqzJid5OY6eKMDkRHJFXYVrth0ol+jH9PGLPez76nP
	MxN0qq92RywXCTBxKkKGoeK3rRIKH6uuf3GiygKSjesAQ5GEZDHYqUWuF6jHT1a0O7vn+ILGX7KPz
	Go3HaocxXXw9wHnRUFylUCJeNZ0FiklNQpZNFBLjvDRuKAwemfPpQ4ZHQ4G7YqozCcp7KuMzK0uMg
	XP6V2C9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtF-00000005anx-1jvR;
	Sun, 18 Oct 2026 05:57:01 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJt2-00000005ajy-2xcX
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:56:50 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so603557a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303008; x=1792907808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=;
        b=AwYpI6hJh0L1MWH7qrODJ4J8/mJlUHsHG6tx+F8LwivOoXEMvMcBlQM//yFIAHlkPm
         M0Gmbofz68l2lSkWRRHF4UXvVHqENV/qGNCEmreusx4so/pQXwcsDsYU1gWK0G5cvqx+
         qRZmUj00xf+KTNpNAqCcsRoWCBgdzKsPXAmaQ7n2Yy0wtJrgQtgguPqdos9YUeA+lVb1
         KxlMOMp0apVXdHEL3Llj/Rj1GDWDJETyjo83d+mM9OZsKCPO7UYJtwP+k3x6abms971E
         CTBXz9p4Xk3ebHToNz86CR00moFk34FhmaOYOvhJxJJzjqvv9qSTZD8YKhq0WTjYdg5C
         XcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303008; x=1792907808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLLEnfYEqoeIl5SvmaRTxd/px2CSduXZZtXXzO63XA8=;
        b=cWyIe6qeDc3sV+yNY4A1wXeslNJcGd2mzuHXoQ5KFA4upIvNTUxV1JkLb4yBu59Weg
         h4ACyVwY0u3fjB8J/6RC6WNqYC7dKXY5ILUxjqYm45HUT8iVM2O/5sRx2kplPQc2Der+
         SB8zkkBIJn7IJ/SuX8aARD3PL+bZnPexPKuGDLP/M+HKrz7cHXvd6He/fKO2BUMmxAqZ
         aMGkYYn17mhJAu2eWBZeQJ81/4yN3KFQeT6gw7QpvVYBAmDVnD7xIRJxVU6AXbkXOfn6
         SXUaquig9t9mnvWmHxrjFFA6YniLhDKqYwNr3B6h1EuuetkGNU0AZJfKMkPdVG8xO8pG
         7OWg==
X-Forwarded-Encrypted: i=1; AKwUvBwb+QsPiJLQ1NheW/83HUPORpyK33AMIILLVV3E5FwkTq9wBJYg6A2qcDnd7/beImPue/8URHseCLD4LjmyAw==@lists.infradead.org
X-Gm-Message-State: AFq9FYL3J0Ibps7y0eDqf9+mprJW5N3DkOixhmHUXq8AHfcCi2A351Ze
	mt7mPWA8fEzESn5NGmzYzUWEvlGKm8epXIkyqAZ9Y+WkZ7jnyOgNU8v3
X-Gm-Gg: AYBFou3XLkGFF8IPnKh/ytHQVVD6eCzFmc1SRr6BB1IAZHRBUkUAZAwGmfpdztcxcs6
	1W4gysxOpyqf6n7RmjcjTTwXFmYhIQj8xS7jUxdLxE/VmI4L9b1lGF6z2WU57JAp7yqVw6XJ04r
	Z/f7TzAqpLx/IcejoPCA/Csd618j9/iZK4aCJZ78qw5Tjo1S9y0dtAh2rPLn5ewa+voT0PELCAD
	qtIHkOS/P6xj8eXCWVtN428TOrAoweJEpMohsqCUV2fjNpjHUCHiF2k62PlaNj8EdAebgUcVRt8
	uk8MyWhalnOeKQB/jwyFLVgI1FuDksOt0gDMLENbLNcx2bpZTcNFm42NjDjDG54BlS8YuuEQlRl
	hnGSVjgA2OXSztcqX15JTaPXKU/X9+Mv/SHIo1GzNMn+nGSOvWhePrf4KVjNe3iaswBMr1+EJr9
	zzL3qOLp9ijjr4Mm6Ml2K6xWmOoB6agMOL5ZyN6BvMVyemPbYLPJCvPQnkUIXt80Y1nvCxkSQYw
	QIwGAR7Ye3ex66EMx3Z3Qq2Uj2ed8KWwXv84fJx07+OHUoIy0cPY3WkKgU0RPUVfR738/EwluSj
	BOS3n+a5YR7H4Hq9vnQYO4h0ygFqcTgu1yUpyuPKoc5YJTKkYKa8/6TL
X-Received: by 2002:a17:90b:4403:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3acee277aeamr3445331a91.6.1792303007868;
        Sat, 17 Oct 2026 22:56:47 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:08 +1000
Subject: [PATCH v3 14/21] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-14-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=1ptb+x4vHmj1hE7QHbn/CXWEVOvv8oNUPPwKzMZr61A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnX+KUfj5e7JO+wvi9ik+yT2s6vbRGh+W23BDaIG
 +asTJDtmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATPWiLoZ/ig92rPZILWu+eLD3r0WNtXlBwxeHvskr01arqft61ZxmZPgr37v++BT
 3oCslcj7OK65N4/1zwb1w89sT0VenrF4msHIlMwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225648_750976_DF4ADA18 
X-CRM114-Status: UNSURE (   9.36  )
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
 arch/arm64/boot/dts/apple/t8112-j413.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..5f8768832e1e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,112 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
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
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
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
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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
2.56.0


