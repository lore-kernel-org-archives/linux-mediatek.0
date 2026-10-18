Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18BFCCF2C4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5WOTDOeoF/T8akxfCBPXArsiM/VJ5PIwdW2EmkTdhI=; b=RSILrH++LDRnGabo3iBp8T4LVR
	IiFp7E04s+e8v0mzoU8Top4DMx8NMdrMXUX6vKcYI3VgPOWQoiN8WNgOcPnr8CA0JAYTbLnRG8LUC
	EMX2jBQ0NYpQ2OfGlqG3dMb979Vlggpk/Zw6oWCvGBLNsr/FDdN3Ufsehx2HUveFz2cgkf8nYid1m
	KJ1N6cQBuuzT716/CjUxi0LVDyYVAuAjvaVlwZVeb4NpWOScHW7acy0w5q34A/iK0niiQdYiCL/IN
	p7krG0GwNKZpJ2xO2yyVXCgfqviTvK01azgjB8Fr8cQDwFyYcIQ3RGiqirSjkNtlmLEgTKOQ1ptIb
	fFua++Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJtu-00000005bDr-310X;
	Sun, 18 Oct 2026 05:57:42 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJto-00000005b9t-0CxN
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:57:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1015463a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303055; x=1792907855; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5WOTDOeoF/T8akxfCBPXArsiM/VJ5PIwdW2EmkTdhI=;
        b=Le/A08l4smTmlv8ihgJa/NV+XOEkW6zlX9G3vT8tWVib0EHrdxdp1Clz7cTqdyTUG6
         KGZKPGsTJSg750g+dFSx7MYX19ICEGCtyB+3Kzip3aRNkj5xx1zLV7NROa6vKujIub63
         rvaw80tgBzeXQq4opZuJ37xvb0uBbJS7s1TxF5vhrNe655kf77fKW49gBFYnLM3yZaw+
         UhvVfHC2SV4Ub9ah00awE9jlSpMo+4e1PCjMuXnIQCOtT8Ont8o0B1mK3kqE67z5CDb9
         AHPaR86++9smfDCDQhVMMravUq4w3U9rI1HQyaeOuHzt71c++XsfBonS5OBEequSe4ko
         Bf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303055; x=1792907855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5WOTDOeoF/T8akxfCBPXArsiM/VJ5PIwdW2EmkTdhI=;
        b=KBgHxL5XXo/e1mEQ6LjrkKp/r3R0TgmuUga+fBPkjDQ8iQQTTDN4bYmGOeImgwIyXL
         G1EeEcLvuPvv8UuMiCvoB77M8tYgugZ8FmqTX/xJ8m3pwcKBm5T87ywai7rhaOms5dDv
         fei0l1E34N4D9qhDWmJ3WAaHtjJErHvY4/6GMzIMt1v7oIYEo8DLHswoK6W+YNqLNIb7
         6vRb/r6HPZ9e6t0KFuVeTcZbnFMacnw+chR/dy6jUtFyD968e+SCtvNuuoRxJaS2tfmb
         BVdAct/njfWV3Xl2PSkwcgmRYWUWZFN9UuHY5WBQsGcV71a5MZczbrEgEhtrvboYagEY
         JXcQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4MbQWZLeN5N4k3whkWn7+rAfsoUgb0WTnLNExl7AfxGvi5AxchrcUcXKVZTNJ3kPPdgjTUyuBiQKXgHnfoQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLDmyAx+XGjlwPt1QhfhX/RgHMzeU1TMtaxp3k7ppB3k9I7INky
	xPRCoTSzEwJ2up1m0z9mcZdqk2qZozEFq7Qttlpo0ABiEl39QidwauTy
X-Gm-Gg: AYBFou1WxI15SmmSdu7cdcpShjmX/KncbovPWqaJVst03tkA+PvU9k6mV/mS7yKLvUT
	GPnd2y/Yk4yJ5jJKm2lEubsshW9iW0h1D13bhiC4upzjrtOFH9jehbJonNNdfUgyh2ap8jzcgYQ
	RZBCqvoiirlh5P2FkDe49uuvNdkHnMHkGzkpH8ZE2+nyvMr2DXdqqXNzF20W5wr3iehcJTVp7kp
	pqYBx2gZcmFLmrQrUSe6Mh7INWYg/QnvHFqvUkAog34SAEZfDzRQBeiSqy1zrFOlMtbpFgQi+In
	MRp5ApXjWP0oUTGB3XC7gL5VSfdbN/be5nVS5EXULvg4LaSDIQI1naJwafPJwR3sg+zuhkoTagj
	9GYdJGzQ/KZ+O4OHIXMUXXHGogllbILzo1/Bcpi12ndutkrpOUxLCBPZ0Jz2T7wCS3uzQIFS1P7
	2q0Gq2LRZywv1+wIrGuft0kEwB75wFQg0KWr1wpfSoXAmt0GrzPAejTENocSxd6pFej5hHBHXBw
	Jsu2+RrsfRNE1m6Ehw8N3I69DdDkecm4q1S4zcXj+IqXg5F0LNDIYGUX5BWSCLQWSFMFacVc8Df
	gF8a2ncIiWx3jytCWH6Pky6hgntWTM9JhsTTaHr9Xlo+mw==
X-Received: by 2002:a17:90b:28cb:b0:3a8:c0cd:57fa with SMTP id 98e67ed59e1d1-3aceec709c0mr3956469a91.11.1792303055375;
        Sat, 17 Oct 2026 22:57:35 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:13 +1000
Subject: [PATCH v3 19/21] arm64: dts: apple: t600x-j375: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-19-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KWfosToe+XDrj81BrY6Ipu7Z1wn2VsvneWja6aQY+S4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4vma2hU3a5esWNttoHKVyYa98MeVS8edXolfkz/0i
 sPBPYy3YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNW7fzMyfA1n2z7hzuPv/CJq+7cz/NLqmcXDdMGvarktx+evZ6R5PjAyzCvXrlV
 jn+7trH3DYkdb7Gtr+wfKHWL/5zqs+pNz7OtpJgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225740_090479_41C34210 
X-CRM114-Status: GOOD (  10.57  )
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

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts |  5 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  5 ++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 65 +++++++++++++++++++++++++
 3 files changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..6c34fc86af74 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,41 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
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
 #include "spi1-nvram.dtsi"

-- 
2.56.0


