Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4312AC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AoKTfqB+9Kxj81GfGGjmk4oDRtO/OYcUX57xxWs37P0=; b=TV/Tn+uKztijrX2mpGyS/WbDzp
	EDq35z0PVu1M5URdO4/FLok+7dRmYouobGlT1ne7bgWLcAPrqpXnpGYcsDT5YSe44BilqgIuKI4x/
	VL2lOufur1grp/JRCS/2p6+pi2jo6Incx0MnSNAmp8HGRF35anbgR5RIlaZEB1eUjTOASKa3EMDiS
	/PP5C1g5WYWciMpY4kQDzZqIlXlsynpTkpvD0f2IKdbXSDXrs+Gq7tiSlzsHv2ngfiX1ZLYbVrnnC
	qkZZoMmTYYHbljq/Szpqh4UvAQ8xEew3mT4FeMjkMKv4lsQKEjy22iFhdb7HfcJR8v/2Dn7ZWnvzW
	JVBV6nGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBkt-0000000FwSE-2jNX;
	Fri, 12 Apr 2024 07:55:27 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBko-0000000FwQ2-1fkK
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 07:55:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e3e84a302eso5078485ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Apr 2024 00:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712908521; x=1713513321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoKTfqB+9Kxj81GfGGjmk4oDRtO/OYcUX57xxWs37P0=;
        b=fxMjWztd52yenn9DKf681YafvVZvE33SGIGmgW8ZiIRNqTWnIRJ50vG8bx1M0UO9U5
         udeum2v5+Sad7GfqtGxM1hbgswZgxF629tY75uN6J2mTnpanhAp8DrtSwn3n0vPCiJqw
         qrDpG+Ey9djEG2uJQeUqJDnUgtFB4UcrFlPjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908521; x=1713513321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoKTfqB+9Kxj81GfGGjmk4oDRtO/OYcUX57xxWs37P0=;
        b=FhDbYj87wPZbcI7zvBFDbhq/YM9j0B7p12rGHl9mccivVbojmfuBN/WYwNOzNnVDPg
         /vvmzfuVylORRvzH3g2sKpaXAhNuUQkzecZ7NXjvTbiFZoKS0Z+SRW/sNSyEvfa58fhm
         iu3XacFyVYN2I2uQ4m2RapyRsNE3vNhSyQ1JxsB5Bt4Nt2tdrwxdK0Cr3EflLTN5aGif
         m+Wx+W+QDQmsqHIaTgPJHMH8baozM35iRNRHCRvW0izhMXjHgEk0voSysSOIIb+6Lx1+
         dBWBr50P67WNACi83iFoa0JWK/YF3NKDFSah6bPjaMXB97Ye3dvTs/L8ncY5SmwO3YFk
         f6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMJtM9VMIi2UVCqkqdT8Vmqc716gdKhqdxBevIlrp4nAMHgvvKMn/kfL9tCFtaPcLHXR7waFRoonlW+ewuuDzd4rR7usxsg7H6TbW5lPBiwO/d
X-Gm-Message-State: AOJu0Yx28SfKxD2OzlDkE8qAwTUcfMYwqTELfdyfREbcMMUywqVwTsvM
	YoRdVtfVtWHpdBQwh7xPpKpj0S89jxf1ClP1FtkDdpKWk1Cbgq3bSyVPHmW1xEHAhIfdF54k9RM
	=
X-Google-Smtp-Source: AGHT+IHE2tYRZruKtCquqvFgIZalHtBB+3XJOjw2G+9dr8fCHuWkp9Xv3DSW1Uvn5QjEcWGx8LbRnQ==
X-Received: by 2002:a17:902:e950:b0:1e4:b1a2:b47a with SMTP id b16-20020a170902e95000b001e4b1a2b47amr2262198pll.0.1712908521272;
        Fri, 12 Apr 2024 00:55:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e3c8:6e1:dcfa:3e8c])
        by smtp.gmail.com with ESMTPSA id g3-20020a170902868300b001e2c1e56f3bsm2377710plo.104.2024.04.12.00.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 00:55:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: Drop mediatek,drive-strength-adv usage
Date: Fri, 12 Apr 2024 15:55:14 +0800
Message-ID: <20240412075516.1199846-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_005522_550716_51F75BAA 
X-CRM114-Status: UNSURE (   9.73  )
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

The "mediatek,drive-strength-adv" pin config property has been
deprecated in favor of the generic "drive-strength-microamp" property.

Drop or convert all instances. A value of 0 disables the advanced
mode, which is the hardware default.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts     | 6 ------
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi  | 6 ------
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 6 ------
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts     | 4 +---
 4 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 681deddffc2a..f04baea5d6cb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -160,7 +160,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -169,7 +168,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -178,7 +176,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
 				 <PINMUX_GPIO104__FUNC_SDA2>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -187,7 +184,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -196,7 +192,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
 				 <PINMUX_GPIO106__FUNC_SDA4>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -205,7 +200,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 75c799a6adb4..989c979c99c1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -527,7 +527,6 @@ pins-bus {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -536,7 +535,6 @@ pins-bus {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -545,7 +543,6 @@ pins-bus {
 			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
 				 <PINMUX_GPIO104__FUNC_SDA2>;
 			bias-disable;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -554,7 +551,6 @@ pins-bus {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -563,7 +559,6 @@ pins-bus {
 			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
 				 <PINMUX_GPIO106__FUNC_SDA4>;
 			bias-disable;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -572,7 +567,6 @@ pins-bus {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 333c516af490..81f6c205fa98 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -197,7 +197,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -206,7 +205,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -215,7 +213,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
 				 <PINMUX_GPIO104__FUNC_SDA2>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -224,7 +221,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -233,7 +229,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
 				 <PINMUX_GPIO106__FUNC_SDA4>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
@@ -242,7 +237,6 @@ pins_i2c {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
 			mediatek,pull-up-adv = <3>;
-			mediatek,drive-strength-adv = <00>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
index 341b6e074139..83456d649ff7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
@@ -74,7 +74,6 @@ pins {
 			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
 				 <PINMUX_GPIO9__FUNC_SCL0>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
-			mediatek,drive-strength-adv = <0>;
 			drive-strength = <6>;
 		};
 	};
@@ -84,7 +83,6 @@ pins {
 			pinmux = <PINMUX_GPIO10__FUNC_SDA1>,
 				 <PINMUX_GPIO11__FUNC_SCL1>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
-			mediatek,drive-strength-adv = <0>;
 			drive-strength = <6>;
 		};
 	};
@@ -94,7 +92,7 @@ pins {
 			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,
 				 <PINMUX_GPIO17__FUNC_SCL4>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
-			mediatek,drive-strength-adv = <7>;
+			drive-strength-microamp = <1000>;
 		};
 	};
 
-- 
2.44.0.683.g7961c838ac-goog


