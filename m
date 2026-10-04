Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49C7CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=; b=zz+o+phkUx20N4o0xO+m4H98ot
	XG1gTnNY5DP5k4IPB49nkp1YBLxMdg8Cvjf3Jhozs7wna33T8Ok72UpLqtej7v6DwCF/Ts7r6ghQo
	4sznSKbsY9EsYaPr1MRPENQrMZXgDshq6T8Q6OdPro0IMosea1lwL+V75uloNnRGZCxpTD5aD/0Dn
	1d0rD41OcExOoq54MrpNJgtmLq70B9IV5exDAhyKlaf8blw9+KQMs1mtqchnfkrP/U7hB7v0PeL1T
	vJdydbP7MWqzbHjlS3o1QkSk1HPe+3t4skFG+zKfrqdyiVHruRIKE6HnLtnGnRGkeXX3NmYj5VZx1
	Rn2Mn/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFNX-0000000EPS5-2ZKX;
	Sun, 04 Oct 2026 06:07:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFNU-0000000EPNg-2fKR
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:07:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3a7d7287703so121558a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791094036; x=1791698836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=JyBDQqsmpx90mIqUeabMSSOv7/bnOxz6qVxE3mOden/SRaE6QTDaCu84riw4r15DkO
         of9p+4W55Bd0sbKPeZTV1dpSvvDeDuD0hlzB+2Hts84oNI0eX+XPL+o/N9QC+1P2Sdj2
         8VGye2WRZlyzBIUwyBPLGmJhD9TAmuo0dn+XVEfZbdQmDClylOX/3BAgHL8D6adDYoXy
         9Qi3UB4a0tOZelQ86Dt2tGKuhJU0u+AdzzRCzZm5j0MdzN0KIJlWEtCZswGsk9QKhh6W
         pv3USgRIWMEOlteSolq69UlGgtQPJny3SMtZnB8Y4zNiafm/h6OzcqR6JzY/Qn4bXdAR
         RSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791094036; x=1791698836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzaFTmYz+CkkadaQPdQFMgjPkjJonjXtWn2mskY5OKw=;
        b=1Gz4wG5mAK83mstMHFXqGYws8TGpmxboBOHDjaLEk0PoKU2ek+3xzmXEDuvRanhr/O
         Vw/RIRa2Nplopod3ONPtECnaRD7U3jEjqJwNUzdEcsrKZLdd6fCVUkyWJc2lu3+i3p25
         TtAWG1naxQP39vp2Aqug10RxMqh1vNn4gLOOjylmhFp5yA36L2mHoUYqgbLM26l/C6qo
         PGXkpeZmsnQur45zZCaXJ0Puq2d3k/ttdOy2HwaV6deXti8iQT7VW9GCZqlr6StE+MO2
         sOyZPUA6pJwaylpmWOE/XuQR+MQ4zfHgR52qnq7A+xLfNB79C1gG6eMjAqUpU1j/Ri5F
         ul6g==
X-Forwarded-Encrypted: i=1; AKwUvBzcH4smjEvkiefRN1hbDMLpkBmIIi/WIFeO4noHQpt41LWjram57TWnfJeiYq6ogYRT54Z3n6mCNiyQt1Ie6A==@lists.infradead.org
X-Gm-Message-State: AFq9FYIm55e+q7nw/WDwPMS4OB1CIGeZwsvMOGxvIdOLJL6Fs8kIGvIQ
	2ZtGoy3CwbpAzh8Pdx7wHru0RG1a8D1fl1kXXdT4//JL3I665hJ0BlR0
X-Gm-Gg: AYBFou2dYf8avZoalzZedCoqOYH3eMJ5I3axw82rnD/EsmBKveu6NvVuOTjsYpxWkb1
	QGInfUbn7wR+o936QW3yMVZoszJlz2cyM64BGhLgiZ/4RR2O/gC+s+lqsfRq457bukap+Ast/xX
	JRaoMZycXuB3FAo6ZDEl7AYiM0z/Uuq2A5RW664/zqpoAs3adOiA8m40xG54EL7/h5NOE8zwDr1
	/lvc9btl+FgbZ2HnKr3RM2UfePKTZuxyQ9yJi7Xljx46f2LFwADTDjcdgNoiSbhbkgqIr+Ze/7w
	4GTkoiOKgJ4/CKpzJtSwFIztrFWyaxM81MuT/UjcViacgUCQwlbfUTv4WspmIqRTTCbDZ6+fjDS
	d3AvngESACBT2XeMhfG8HB9fdNJZ3P1NxY2DXBXf78+HBj0/u+8leA5FqiOgfe0HcTUchU7xK7R
	m16bx5Gt8y9NWb5M5i1IGgCZwHRJok2TPqnLp+CInhtmyOHFqa2+6+oWHb2AwS2g1L4TC3bW4zF
	Iyc46IqJkqR/D6Xjmg95Elro8PhxKf5nGlibCQieYIqCe62qj/bxwNFmC5htaOYBQkzKUr22Tzu
	Rt+LWQv4Mw7u1+qVtsMG72CZ5Zz9XKVmktQfugYgv7rI+94=
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2837779a91.39.1791094036003;
        Sat, 03 Oct 2026 23:07:16 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:07:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:48 +1000
Subject: [PATCH v2 21/21] arm64: dts: apple: t602x-j47x: Add
 speaker/headset jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-21-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2504;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=j+2mD3Lw4/MJvYfFqphn19jd5ntuiOHqc4m1K2MPqJs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Rf2a8aUrExzb1QOepzh8zJfDu2xPAy/q8rvjbJZ
 8xfeqK1YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNW/tzAyTH/13rXH33uWx1NR3gB53XwtpaUvo/kPyArq3Wd/sm35NEaGnR6/n6y
 /xiJSZzNZ7uVUVp0VBRsfaWW1plgdP7/06ZMTLAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230717_018787_306A8574 
X-CRM114-Status: UNSURE (   9.45  )
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

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6020-j474s.dts |  5 +++++
 .../arm64/boot/dts/apple/t6021-j475c.dts |  5 +++++
 .../arm64/boot/dts/apple/t6022-j475d.dts |  5 +++++
 .../boot/dts/apple/t602x-j474-j475.dtsi  | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..7b4c4ef471be 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J473";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
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


