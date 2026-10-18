Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798BCCCF2C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uj/FtW3Fwh1R62fLY15kbSsO1v6D6kwyz703Fo9gvw=; b=ZTS6uU2z8/+qj3Hb5nqqKQ7Ocn
	c1/1IeJXoxsi12AeMsqkGHYlFsaDBZAVQlDsjx6Z6eZnUtb49dzzvzypzXUqlkoTEjKt34IAbGy4h
	Ni3r3wznDvYRWHeEObHqvn1Sp3D9MZggZQX7C+s/+BFr1Hw49kNkovw9Da+J5pbHjPSwP4YG3VcpT
	2ytyuLaKmgygA+Wq9KNCKx6J2B6Xc/b15h+qhid23Zl2c7babaAajrYjlZn5qAFWrS9thJTFkWZJ5
	kRUf9cDjrjxJcS8e4jxnKnT2COvrAwJgEnooSRnkkG3p2ECXld30iqcNkbfg5oG3vLcB1XRo3l6qX
	yEPeag2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtX-00000005b1D-1vva;
	Sun, 18 Oct 2026 05:57:19 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtU-00000005ayN-2c1O
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so614707a91.1
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303036; x=1792907836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uj/FtW3Fwh1R62fLY15kbSsO1v6D6kwyz703Fo9gvw=;
        b=BbEMgXDwxb+ya3QkDYohAyLMApsZ5LUM6RQhvQs+/WGgv4XQBRBDuX7U5+cV+YNXdx
         f47MXl/6l8yPM3dJQXVdIIn9qTsfelDZRxGaHPSLKlJnqj6xWBkdSCiQ5El9qMuCf6aJ
         p2t0H5n6VTP88/D2f8iQt8IStxXwo2rWRPWIe63aYrRby3tJfNGeEJdTgOpxpIcssFL7
         fnHHDN3YB82B+NBp+wNs7wY35IHKWMgimphrz+EhVMVvXb8Ac6yypXBS+GIaxAa3nrB0
         hG2tlRbvHsEuvZ4Z+VZUS/sDrGE9C/gKrIDtkuZRs/5te2feK0cTIFah+vtjpxb4k8/M
         ADIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303036; x=1792907836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6uj/FtW3Fwh1R62fLY15kbSsO1v6D6kwyz703Fo9gvw=;
        b=hS4FqwaJfQQR4ABVwXe/c6IgHImWBgZ3A83oeLkb9ufQ3XgHIx/umCobCRrNkjvzFf
         EwM+5tYZu14QkcL14ZBvEMv2Wr9fXqEwWhpNHm0H1SSW1tkQBMcMZh+JtGUtYEI0Ht43
         Zsp0IHcCuTbpm8IVOHuwrNROzV94Cx9rkCuNAKfNSR6SJeKkHj7lFuXh/KMD2voIaEjT
         8rUDWXP5DdNTXz6nOCJ4pvoVCPgOVLm5ubZoXo+/UJ0SXU5X6TW2pmejKnAFn8W9raJF
         LXwIRaQMldE4+zm2iaJ7Ij7lylxwoJ/dWpqSVf0U+g7VfXaKJJEjbB0s/Ac7wQrCWrkK
         raBg==
X-Forwarded-Encrypted: i=1; AKwUvBzeFcXgswCDH3JJfTAZU1ZgrB9XYJjcFrOArPxIdCIv/WE3EzTlIfOL8vo670ypT2rD8QtQsa76kXPNqaiYAA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5OkB2aj4mFDTH3hK65tbGqn7SR4U1Ru/TSOgndNOEMXXni6st
	Y1Ho0UVo1gY5nIdY7xgu1C7Z13bIQ149XWc6lA/ecyaEj88dW1AXxeQe
X-Gm-Gg: AYBFou1VY2JOGvzmFJq3VpeG+YTlc+e3FR7goDbn6hmEcIvwr/YPSZSFvm/vkk3wb8Z
	Vw6cS1XkxkZsGies2iEwmRj+anC1qt3AduKUDh8UGpweUR2uIU8Zjc0YfNDczqY2Au+eT1NWUaR
	9EfHp+6IqB2faZ38e7KOkohTOZLiPh4cezb95Tn8wM9eChYd02M1aL/rRfKI3pMokeLJXE3kQ8g
	3txOu/BpBxUg+W3IYXT85kmbivDHlatLYMGk0I+4edXIOA4oKOClq73oBW8bUi16b1SK7DS6DZm
	gY6xvWZZVMATeOIVWrT5jYKnCJDgilUxHgsL4tA/M0LPanY+mB4E4oFSZTJV9eZg7aIUvW0TpSJ
	KxNKfQZVL0qEyHUMWh2i9+qezzqPq8ezrsFAUA7Gy+P/ru0ux9NtDCwnuk9vhaY5RZFphwNIBHL
	wmn4YE072uomtN4OSN7FNLwlKtBGULvS//Y8koN7lo46DETkSlVDD1a+/rW8Fyha5ByCL0R9hlv
	q4pOBe7x5ixwsgqfoFZoesNy4gOu+AyMtuE/p23c3hB4aLKn8m6dnDYEC+UUx8G1GI2UkfVGBnI
	TkkSZBJrZzG9lMxF+iofCkHQV1gtWvrRwwsndWnV2VHtk3k=
X-Received: by 2002:a17:90a:fc48:b0:3ac:452b:4a63 with SMTP id 98e67ed59e1d1-3acef51e2a9mr4377352a91.55.1792303036007;
        Sat, 17 Oct 2026 22:57:16 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:11 +1000
Subject: [PATCH v3 17/21] arm64: dts: apple: t8112-j493: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-17-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3253;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Ra2ADqrZxWw8PcYD08Ad73OxCM3L+RBKl//X4m5oIQM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vm8RPZdtn//cm8/66ZbZ3qkfylJuE6dvH9y69mAU
 5EfcvsyOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMt+Inhf1Ziz499nNYf3vmJb0hZXCkrl79m/eGqY8e1N81jnj75WSojwxrLe/Y
 H4/2tN4qrdy8w23DGfcGM8G8LQ9em3DuTeyj3HQcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225716_677118_DBF64072 
X-CRM114-Status: UNSURE (   9.41  )
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

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..8993775da9ab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,113 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
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
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
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
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-fan.dtsi"

-- 
2.56.0


