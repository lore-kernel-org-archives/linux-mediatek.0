Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57515CF9C42
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d0tdadcaOllwZN0zF3sys/aIhLtv2I4tkzaAzDlX5eE=; b=hdZ2lhhalZ0YEMLMwPnCknFHKC
	xRk7dJt4vNqzvXKbfQpYDVCUpya+7PxsAQ0XueqFvQRKyTqVDxD6O0MThTrWYpF0CS/0Z8XBrulnq
	61anTwAOmpFWUXlnxU0Ord6gkaxR6IOIKYmGBrwqrA1xakmfbjqKBzWra+Zz1pJ/g9VesNpGGz52w
	20s2n7ovlz5EWkaBkOVzpZ4f8y8kyqu+HsuobbIb+yguyAoSNrKDHL+bpTO0/5zMA9tG2C/oEW/2N
	QFfsuXQmWxRbGsmvfqq0GvRQJwgJk7ySk3juhwvIqvMBhdIX5xLBwsZWNA/03vwXKu1MGn7c5z7Ld
	FNQViZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7R2-00000006zvf-3oIj;
	Thu, 20 Nov 2025 16:23:04 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7R1-00000006zuy-1CCL
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 16:23:04 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-3e7e57450ceso295338fac.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763655781; x=1764260581; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0tdadcaOllwZN0zF3sys/aIhLtv2I4tkzaAzDlX5eE=;
        b=Qk5u2PnWIQwgWUSYRpqyrALI7bkYeyH7J70Z8uNaKc4hguhDHNkIjUpdQopXBVDpUt
         EpQ9yAJa5S2ZPd2r/6zIR8VWX/KnZ2I005armlyXHBlHu7z3sZekMD7ExqlA7pFm6RVs
         8lk2/JewUIe9VtQSnY23NTmNwJLyB4+vVXMTjy+78fexrbW0I1/7Gw3+nuW6iBXjB44x
         jUbXbN4SZqeV6sb0LTfiB6imNEMgqQMu8sc1CE1qjdELqUmDjvWfV8hc3ug08O2jCkmP
         aE3ANlwShsjO03A2LrMlF9mmeUwgbVxsoxSePrKqsAMct6ecxoIS9/CwmVI5bCUnmtoa
         fnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763655781; x=1764260581;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d0tdadcaOllwZN0zF3sys/aIhLtv2I4tkzaAzDlX5eE=;
        b=fYw05FBGSHuO7FhCUBuoOE1UHy2pNexCFFPCaicMCARuPU0V6Ys4sTSnORu2sDeXL9
         X4Vm0IUzP1dhwroPMXr4r6/MC3VSBiaKYFVKpspgpGeRiMXdNGUzDNF/VaXsEfeCUB3l
         N59IYvwDv/7tCRGmXc9xh9Vd7juECR+Oi0aDgO75RRbXD/cm3UQZ3iQiqXf/IpLhmTyM
         OSVnFsKz7osxcsmMD5FdOO5of7wm+w2+89rySCRdx/t1W/xKgljPclAgCoqQDsejtZFu
         GoGpHCnm4cY21JSI7VKZYnsdH3r2Yjq+9lpf9wm8j5af6JzlenSJVzjk94vfJ0x/fZob
         wM9A==
X-Forwarded-Encrypted: i=1; AJvYcCWHt7A9xbeQHPBXJjzoHobd27+waCLmdYq+WzrKJd8zUM0hVfORZdwwvmNFbC5u51/H2OkgSwlIzMWZzqwA2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZqfCNxnECuQBonaOS/+vmCYJn7eSYxHhUWIcPVmjxv6vsh3Uy
	lo2qH5NJh9mfDu1G63AU8jLDxhTh7NwbrUUODRvZoSThRkw7s0xNLbYz
X-Gm-Gg: ASbGncshwNfv7ACyxF5T2huCsI/SWT1jwQu+w2KmUSc2EkXzFi1Pkex0rzarwp0OZxb
	kzF2h+560WlyHYZBqbR+yvi2DR6kDdzk+eocoiTfrF3MGpIFTWtutsGA/vOgU2ZvWvSSNAMbvRI
	gf20gngk2XH0H5anyAV4LBsxgcVLQGRJTubgoALpGvvhdj3v/wcw8aw0cmzuT/m2sVFEos6vp3Z
	GE+C3jb+dsrnyfm7kdHK2AKssaZwCIq0W6jYxfsyNsb3xmX/CyCWsqJKELF8vxdBd+Hkam5oWQv
	J2MaIzvhT+r9YwTBMkM0OXx47BojatUGOSqNW8dDujCN2vUNx7tJ0rkuYzvNPMQwIU6wZjaKL0+
	GK2aCxzhFllpTcm5Vg81dd6O2IrY0qgFgcphFQoKoIY+q7S8FSR6hqoSp82RCOa6Wln9GYm2LNr
	MKkaiF2kZ37dtfF3Y=
X-Google-Smtp-Source: AGHT+IF7ftfalNRw8ZNUBYR+5ucJXrX7efoW1K3ADp3krYp2GnXALht8+9gG/fjl1hp4DrgVDHKMJg==
X-Received: by 2002:a05:6808:1b26:b0:44d:a0ec:712f with SMTP id 5614622812f47-4510ee8ea7fmr71818b6e.17.1763655781076;
        Thu, 20 Nov 2025 08:23:01 -0800 (PST)
Received: from SC-GAME.lan ([172.245.56.104])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-450fffbf1fbsm766947b6e.19.2025.11.20.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 08:23:00 -0800 (PST)
From: Chen Minqiang <ptpt52@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH] ARM64: dts: mediatek: fix MT7531 reset polarity and reset sequence
Date: Fri, 21 Nov 2025 00:22:24 +0800
Message-Id: <20251120162225.13993-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_082303_352616_BC371648 
X-CRM114-Status: GOOD (  11.25  )
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

The MT7531 reset pin is active-low, but multiple MediaTek boards describe
the reset-gpios property without GPIO_ACTIVE_LOW or incorrectly mark it
as active-high. With an active-low GPIO, gpiod_set_value(1) drives the
line low (assert reset) and gpiod_set_value(0) drives it high (deassert).

Update all affected DTS files to explicitly use GPIO_ACTIVE_LOW so that
the reset polarity matches the hardware design.

Additionally, adjust the mt7530 driver reset sequence to correctly assert
reset by driving the GPIO low first, wait for the reset interval, and
then deassert reset by driving the GPIO high.

Boards fixed:
 - mt7622-bananapi-bpi-r64
 - mt7622-rfb1
 - mt7986a-bananapi-bpi-r3
 - mt7986a-rfb
 - mt7986b-rfb

This ensures the MT7531 receives a proper low-to-high active-low reset
pulse and initializes reliably.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 2 +-
 drivers/net/dsa/mt7530.c                                 | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 9f100b18a676..6f29ce828fdb 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -155,7 +155,7 @@
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupts-extended = <&pio 53 IRQ_TYPE_LEVEL_HIGH>;
-			reset-gpios = <&pio 54 0>;
+			reset-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 8c3e2e2578bc..6600f06ccebf 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -137,7 +137,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <0>;
-			reset-gpios = <&pio 54 0>;
+			reset-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index e7654dc9a1c9..8ec2ec78ee46 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -203,7 +203,7 @@
 		interrupt-parent = <&pio>;
 		interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <1>;
-		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 5d8e3d3f6c20..732dc4f5244f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -87,7 +87,7 @@
 	switch: switch@0 {
 		compatible = "mediatek,mt7531";
 		reg = <31>;
-		reset-gpios = <&pio 5 0>;
+		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 58f77d932429..91809cdb4499 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -64,7 +64,7 @@
 		switch@0 {
 			compatible = "mediatek,mt7531";
 			reg = <31>;
-			reset-gpios = <&pio 5 0>;
+			reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
 
 			ports {
 				#address-cells = <1>;
diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 548b85befbf4..e4caedc3eee5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2405,9 +2405,9 @@ mt7530_setup(struct dsa_switch *ds)
 		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
-		gpiod_set_value_cansleep(priv->reset, 0);
-		usleep_range(5000, 5100);
 		gpiod_set_value_cansleep(priv->reset, 1);
+		usleep_range(5000, 5100);
+		gpiod_set_value_cansleep(priv->reset, 0);
 	}
 
 	/* Waiting for MT7530 got to stable */
-- 
2.17.1


