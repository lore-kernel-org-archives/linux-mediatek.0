Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A810CA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3QHSkSxST2zAhLEr4m0t2e0b9c14pDjRMyYQ78t1Ts=; b=X4AWypRbkkg7n9PEt7LnNafAOz
	0ltGsLfJIjPvQHmmhmMfVByJbZmgBp/bnXwxhyYoM3bentllSlonV3qB6X3y/egZBls4x/XhJExXT
	K+2Ay180zKXfrk8DhsxJds9ghe8f1qppKbF6Zs4vtdS/3Y19O5VwMin3jNzHc9tMyV8SQrcz6sWPt
	19GbSAN+QHWGrAkqr/IfJTKkOR1tpG0onCidUfqrIgEH8CwJpwYTfGCUa9x/BOATUXu0C0lG+0uEC
	IDrwZ6iIM23NudTIEfuSl+0AwWhvFxaT6tdPnwLoivPN0Xv1MnMFJgWqexWaFCQdGw+eXWZbRbCCo
	eym4XBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMS-0000000EOMA-1Ztt;
	Sun, 04 Oct 2026 06:06:12 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFMO-0000000EOHY-1qYu
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:06:10 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so459038a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093968; x=1791698768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a3QHSkSxST2zAhLEr4m0t2e0b9c14pDjRMyYQ78t1Ts=;
        b=VnFR/ANLG/KDZw5NS7mBxjul/uk3EdC7mQmTlnmoLcsvbbo4gQsYLgW00T4MNdSl7f
         9WpYG3aOWGyZwsUfRUgh+W/rIgC8QkdB/RC2n7myStnGRlS78o1VZoIL46xWZPcHEM5Q
         JJMAW+IktScvD0S6PVDprUEhlzF6+miVMmyJWFTD6/gbSsDsn7EQb/9ugV8rkx14q3/z
         GfXun3TMXf/QifBoKXkBcgNJ0tYFrSxuHZf0NzV+/+FxBg5jZ8iG8QjUdfN2SPJ7BuMt
         wm92vYsbWImd80fyRk0hxUL9thJSgFKj4yUBAx1eAL642YwPjKYg6+EHcTlTKLp2dGl8
         DgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093968; x=1791698768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3QHSkSxST2zAhLEr4m0t2e0b9c14pDjRMyYQ78t1Ts=;
        b=Q5MLASRpWBT/QCo8HuiowuYpEFJlbFTcA2ZeAKWg7AEDkOwB1KUgn27LxfWacGT2t0
         iyDKKj3yAB3EHuwdHiYHoMIEDezUAEm+WPgXx6o6AqRsWGr1wKYxF3xebp8lkOSj6kdC
         s2sU6mTyI4QhZoVsnHIT61wYiM6ItXmplA6O9UNxcOb3g3RRXtH67ZOAv3hvaxLBb2Sh
         jLgd7m1DMOmbqGgEfVhF0GtaJKmbEAzsZPlAthA8qqfIJHsY3aCB0GENt7Kznguw1h8Y
         Br71pLuDmNq8TI9JZ4hsv35yIs4vA0QvpMh3tVphrZOkbXVfeM5ri/NhcDon4laBnz6Q
         W4bw==
X-Forwarded-Encrypted: i=1; AKwUvBwMyIeaKYJXGxV3I9n2a9Pf3dK5gI/gsUQywhj7/3zAQZBCOv9/dSDQ9p7G+mvbrxWhiIKGcMIqFco1KQEBlA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL60F2q2XEehEPNr8w81OM4NJTiRuQrGfxE10Y2tzgXEeAfyg5L
	R1UyXzE49/FpN+Z9L//fMqTQPizptgYsdSK+e6TunKSjer3ULaeLOFcP
X-Gm-Gg: AYBFou17gs5cC/1CslKVcnb54jNPTd0ZcnFHNOqQctyvnZVlBfZh0PeAoDKQ8v0wcW8
	ri3QcuSZrarg16yRjxHh27PWv8l4lQjrkieg4QHFZIivRPP59BbhqGc/77OjJqekvHsYhDHg394
	2QT8b9cC9Zti3AbSLKW5ghJjxi6Ed6DKw92pxLdW865FU/fDol48mUxZmXc+sfUVFVyDqGb0bwZ
	2vaQxlU0N4IVpPTxnmKOMEhmsBJED44cMeeJUYpssT/Emll+6T0T797QGFUSQzRRHeteKNFJf7G
	bqINzSBHn2moIZmTC6FKuzbby8ouAdfcTobHR8Y2NoHoEuE75cAexAIF5B0PRR1kqLEiEgqn52x
	r1PRcRv7T7jEDfWZjJo1FVHbq5rPlhOPeGHvBybSPoWILLjgDUaZ9I2J9W0FgNBDaFnm1LWUdD7
	99v4JXUVO9DYAdNluf48zfzmIsiMoGsRQkLeHRymsi3r9+j3BSvlSDd1z3CZXVn3xWn3KO7iW6j
	XcOuQx+8vwwe/JI0wXq4pNL4dNzOHHkppOSoDj26JLhRjDtxwXtJCOl0mWL6RJSf2Qc3qUxhgti
	Vha+9voamX0bBvrI4gyRW3jFcB6xbynxGzgOIsFOkGLAmy8=
X-Received: by 2002:a17:90b:3903:b0:39e:261:4e0d with SMTP id 98e67ed59e1d1-3a6ce75d5a2mr6439953a91.25.1791093967799;
        Sat, 03 Oct 2026 23:06:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:39 +1000
Subject: [PATCH v2 12/21] arm64: dts: apple: t8103-j293: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-12-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fs1ai4BpjRrKf1Z6N1gXbBVEIUvHZAvrJK8NPJKhhz0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+ReN1+v3V95y/atworQPe6OPrPKF8wxlV2+xsjf9
 d8uj7PFHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+9pnhf3BKnfevWe4+XwXOOdVorvkdZB1/evG3vruFp/ZclNK3d2L4KzMldv8
 9gQd+zm2zt4cVreSS4jp5f9uBCDPud7ZPmHVmsQMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230608_557120_636A5A61 
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

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 111 +++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..42f1127151fa 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,116 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
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
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
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
2.55.0


