Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D1AC982CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2026 04:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxSmsJzbIneEXZndIf7W1mbqPxGSYMwHTFZOXNa27kw=; b=b4R0XpcxN0UuP4NfledD8Zx0fY
	paRnuM6nBOdRJ+W6ycjk8jCvPNtrfkYGdHcRqGvdD8IMNolRWzdN9Kh3WXt+ic+kqR0J/s1JoLznG
	Qs87zmf7zOMqrfUtWrYNzTFUWuwGunPlG3OjJ2kcO9TNJ2JbWveZ2HOtt8BI1BFWNYZsTNIL6K4An
	fWTh+cGmoMIQ3uPQw3FnfIZ+LQUUbSCKB05J2V/JlzeONtGZzazjvEAq4r3zBemmV0ld4RuktJXyR
	ahlWBY+4WhaiirpmBWja80aTt7y3cId5TgAHOOaUnqKWEKe8jQSO7aasqTx49eiXIwE1LaD/M7qou
	VHXEWmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89du-0000000Gua5-0gDs;
	Sun, 20 Sep 2026 04:59:10 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dr-0000000GuY3-3loW
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Sep 2026 04:59:09 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ec6185so12091845ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Sep 2026 21:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880347; x=1790485147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxSmsJzbIneEXZndIf7W1mbqPxGSYMwHTFZOXNa27kw=;
        b=HugKko2cGfps6tRdjl4JXlSyQolMkU4EWHTCTVsv4u0+A9sOuqJjpPQAPlDYlluw3H
         kG9p3PWQjYDpaEDYZmvoaBDz+wSwiwvRNlaRENcDvsn84EDN0v+yfgEyzXp30+DmF16i
         z75o0yKIu+OwdlarshJtXdLhOmkPuuK9T9O9fbfOKDiNKYiIHYIAx1wuvjhpxnB8EViZ
         dThcbirEtUnmBB9x722mdga7zlpEk49UlPhHov0Q11dP1uLr4r1C3TbjAE4Bf4nd7SIE
         qARBg8maY0uZMrF6N2vckga2NyxLyfQdl7OXtoah2X3hL5eNFEThcBp8FxsYoeVWDC2M
         dp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880347; x=1790485147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxSmsJzbIneEXZndIf7W1mbqPxGSYMwHTFZOXNa27kw=;
        b=d7Zxnu1Eiz4J5UFSOFOJ08ETZRfuJm2HfVZUYabU3jIVld63pKZ9eKFWJdDChyQCK8
         W/HZQunZiK9BrTYU5hh0mySPGiDbDbJBIvjPj1L0oCosBExJB/bLP5jArA5kjWUtFBwR
         ++IWLxi/nJf0YOKFY/KORYMNTkNgjhCtdJMjdQiLLxvhO1kDYih04YfR9UYyualjf3eq
         Cc67QX7VtSaQdOrbHnMxeD38aIWh+6g0Z1iKizfz0Zr6FvdhtPRt6MFww/CCR6S2BG0J
         bSx1tFY+Zc2fdmQJHmlV2ihYak7JYHM4tFPdCv3nLbHra0M+zx+/VtuzVFQGSaTaQydC
         DL+g==
X-Forwarded-Encrypted: i=1; AKwUvBwmRTaex6Tj+s96VVR8WcOSpbYtbfSYzyTRI4KAeJFu6iQ3q83OrO//wTou2ywgGBb+lP+Yj1h8GIOKYfWnzQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kZCGTcTg/rq6nBFSYX0ABcITcIr9DNFAUhnn5EZclgQ+ceji8S
	rdoDLiRQDUWF2kATfoCxdzAw1yPPjV+L3XXlYSv2EDCoSy/dq9L2aEgm
X-Gm-Gg: AYBFou1VzplIkdT2LGEd4tuYNbwIGZ8XQC5hijz1U1QVbDOMYbq8+j0e8jOQkq5P8XW
	SWmIe1imrOSm8XeY8vAM35F3bTp2pASBqSZMAoSRnpPkkF2EujvTtd9yQ1bWGhgcTP1/kOH3t7m
	IpwjvJYApt5ensoU4u/Hy/v/cNQRgbZu6MmyLHFnjMpl7eukTSiiXIZkGcwM+buLAr08qAHFoJ7
	f5I58U0rZR+pxUvq0JskouZviOI9SJe7bBRr3Cydvr89CKiuyI0SbC1BTzg70NzU0Rjx2ObX1Xa
	7J8NXKjJyP+HsRR5sMcevWXKaGwaZaUsSScE8RunNBCbe9pPmlgcmX+tq1tvZ5g3Pz7kp95LUtN
	/eV0qMbyQXO7kUU1jUoQ6fwQreAPfUBw40vP8Mjq5Qtk1gcuvTj+CA85oH0YiuthjoUqFUqvYd9
	H69i/eBxRagpfn5XQ/mRv6bUJvQ9aTTDP7/+YP7t2dgb0BM7Ooj2sF8IOb+J7PpO1/oRWv3wtbO
	4ATGJHc2LUf9FgoNAQpEjLCP6ZBIQAyQMHUOryAtlARCKEj+LHd9xkNRqnxzx9LNTB2QAUb60cF
	AlmnF7jwYoeU8WXylYqeWsdTSse8ZZmVNctABDBURj+OUcw=
X-Received: by 2002:a17:903:3e2c:b0:2dd:c053:ec72 with SMTP id d9443c01a7336-2ddc054095cmr43098755ad.37.1789880347267;
        Sat, 19 Sep 2026 21:59:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:59:06 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:05 +1000
Subject: [PATCH 26/28] arm64: dts: apple: t600x-j375: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-26-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=exZLW1orbjDOjAe+qhZ0AJwTOY6a9pj0Hwu8KuUxZmI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05U5024/rGw+4x47c0Wpg89398uRqpM0UgS0mNaHP
 9p+/rBQx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpTBBn+CurZBnuuFVRcb2G+qCRkWnS0haEb70yxdzeuti+XFjSuY/grvDPw3QH
 pAqdzXnd5RB8xKt4rsBd1iJAN7/PsFHsXqM8DAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215907_951482_475104DF 
X-CRM114-Status: GOOD (  11.75  )
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
 .../arm64/boot/dts/apple/t6001-j375c.dts |  5 +++
 .../arm64/boot/dts/apple/t6002-j375d.dts |  5 +++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 58 +++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..bfaafad6f60b 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..2f37784357a8 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio", "apple,macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..60aa9a870bd9 100644
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
@@ -410,4 +438,34 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		dai-link@0 {
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
2.55.0


