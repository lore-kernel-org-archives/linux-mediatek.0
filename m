Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B264AC54E41
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr6qUv7uphl0F7A/cjSpLzFAuez52U6vdxnRSxFG1Us=; b=laZ+j4gwZIfOKLTF9nOD77eQAt
	R4MHrpEPb06xt2DA26iyKss8uPRKak6aTYhtLdCH0cLEyxsmj4FmDCl3gaBoyltgb8q0Jpr61UwP/
	Gi/neEfmsm1Db4QuPEXTFusZpD87mPYQKRDGl1apXf4YM1nKtjs4PIXknZLbVl6OGOKKsu7IhFzW7
	NcU4PV21I2UM52z/6GHCqpNrDxDs6VArJofRZFNB5w5Gb8//5KYC80MdCKfBuyul7DUpku/4L6A8S
	LPg9rLND9NabxJ/YDd7Vml0oXFME1HhIG87gsfoxGi/FS0dtqdg9KAh8E5P6qlx7taf1dQ0NxR/oI
	gqrCbWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebd6-000000010ot-3P3V;
	Mon, 26 Feb 2024 14:06:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebZ9-00000000ys3-3X9Z
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Fr6qUv7uphl0F7A/cjSpLzFAuez52U6vdxnRSxFG1Us=; b=d3elnh44tx0T/f1iUEZQXoCebf
	WmMFMRLluUR4GKNxV3U2/PpiM7eANrntxPRW/ngMdeZzwhfez12GgESjKqwlM+r2qiNkUvhSXwdUH
	5X1MXlqNKGMXg7A4ZQ+UOmnQVkQN/aE5lF2sCdcvKjpJZTxk1rWiUH8d4n4FnKnifGIGnhr2WhGsl
	gUkUMP8wENzG6ryzxzn7HISzKYm+lbTYOlDohkPmj09OWo8ImEcBdRjsFG5qKcjzVZ6CeSwLE/CtW
	+Cni49t7RWrRR187m/uhjPC++4gSpiNUwyPtBs2uPdmgXwOtQrNCe3iLf77FLBjXBaeXiRCpfizbI
	uic4tdNQ==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYw-0000000HKLz-16H9
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:46 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2d28051376eso23774471fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956152; x=1709560952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr6qUv7uphl0F7A/cjSpLzFAuez52U6vdxnRSxFG1Us=;
        b=VOpX+q/wc+jn9ZDzzcidYJh0IY+x+qV0h06WwkM0sZq+kGpMp0NGiZ8BAqoiGaIGz9
         91DeSirpVkN2m94jdEMkOSzWOxyCeYOtG9XSkLB92hVHGnH1tI2QWl+ICLjh+QOralCW
         HjbMFPuC9aK+QcBHWqb4aS99GYC/8lBcuGaqQFNYxFC0RUYuHKsXg+/6XOJxLlxU+STt
         6V7lGMXdaWUvC/b26E2ZWmvMB6zcHwJ8p/qgnfjqGswDZbN3wFwOWhi9HqdwMLTuovMm
         IUaUoShaSGLkX1qjNrsFDweDNicpaFJSPWPZHkq0gNUmEE4ABzNkDHGAtgTjNxu5fzpg
         SkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956152; x=1709560952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr6qUv7uphl0F7A/cjSpLzFAuez52U6vdxnRSxFG1Us=;
        b=KgC5/sp3R7/A8dAkHoCn4DT/IyddJJyAF3xum2CyIyDmuXCGdWfN4LB88tTar451kL
         FUqjzyH/rw0pmSyM+vZwZTqwB2QkIUUaswrYMpa91q4gh3pF7Fv2dxqJZS23A0cS7EMu
         pGG7eQxeYYY4qdctMuKlB8k/kZRw+/5h5oCydZi5f1cQMhk6qnssS7LwpMaoxZhTbAaj
         2JmUJmP1XuPipnypkYlyD9WGwl6Oy7nct3NRQ4QtF+8xFXKtYBAugq8JX6F+zaHB0yUY
         1RRQQRLNQ6NhNhm9EUEDLCKufI8xAni4thfy/P7+siY3JcC76Rh7HwwWK95sh0y45UcC
         MQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVo9Qio6NRf7vxz5G7stOUMHnzscN7DDQ4VUyDsC8ew6/pJKMVd57SKIQOHCYn0rFgE7gA3IolNvWjLgbt64UcDyxqwxLVjn2VRFAThk0sP0QPT
X-Gm-Message-State: AOJu0YyDuTM1QkfqaDItuaFTs/9nhUmM0MiQPCHa5LaGVkDrETzUBffQ
	fosZ2v2gUgwLWPD0pS5+6jPkimGtc6pLCXf7F4SJxRTLmmTU8hpqOwKa57YrjVs=
X-Google-Smtp-Source: AGHT+IFoh8mPmzGM/gZj9w5NAeFQXI6f6EQmCodyO1Vvv8vUKUQrRRqnf2VVbDW26mV1+6aMSpo47A==
X-Received: by 2002:a05:651c:10d1:b0:2d2:2012:1fef with SMTP id l17-20020a05651c10d100b002d220121fefmr3638929ljn.47.1708956151700;
        Mon, 26 Feb 2024 06:02:31 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:31 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:56 +0100
Subject: [PATCH 18/18] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v1-18-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3858; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=lbgi9OL1obZblEePDIhhejeSSwFTqveCSkacaUUqnXE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3Jnd+w8IF/0MoA24p+dI4JyZDGShEkMctxqnmZ3g
 z3OxK12JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURa4QD/
 95NpJWGzTF7i0U4jGIRjRkcN2D4J42NZKCYbftZ8a5Q4MTVuwCbkEMdy8eOB36kpxWTlq61VxNUsug
 lAentcdEWSrZEUsczLGt82lKlMdaKuOrVM3RBz+D/4DCgIzuNqw5RtyRK+D9US6UOjV6bAYg+VOCmr
 E2VvHOXer0VlRm/v1bpjTxH+OXtA8ztKcQFPeK4LFGLDGqSCYnMCT7v0eCZ+Mya9vw7drZY5Eibu/6
 5q8nT8GIe5kFdPwaq64D3uV9hsu59MccdcThnyJqTGqYuEn4C1DN+9rkcT22e5Bp1YS7y7juyj6C04
 DDOXMgU2bl6P9Lpe7uCpyZPOFb6y7cbRw5YzZPYxONpskn1hFV1XqaalcwBTKgeQWdSZZhU1zLosan
 j5qZDHkmN6ipbd0We4rQJg512ny8X13q9fH1AbBW85bZLMwOM2cPOA0or/BdWx0CFzyBAuhz+Yikry
 8OmWIr07732ikrI661VIF8Pj2ZLa1ryWzMjooj5Y/b8OppHDB1LidcNyTHsVKBep5fdn8yiHYYO3j6
 mk7lsczgK/oSLH5NTGz1sViSOvZoYwm2PC2HrHzMCikiFlcqL65mnGQ4Nnr1EqwRfQWlmJadgvAia+
 nixt2u4SvthnmJAfycBFbOcGNz/PTqn0gR2UBZ3nNGyog9K0HoQ5yCYLsjTg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140234_344245_54AEA64C 
X-CRM114-Status: GOOD (  10.65  )
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

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 95 +++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..818a8d263949 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2021-2022 BayLibre, SAS.
- * Authors:
- * Fabien Parent <fparent@baylibre.com>
- * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Authors: Fabien Parent <fparent@baylibre.com>
+ *	    Bernhard Rosenkränzer <bero@baylibre.com>
+ *	    Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +86,25 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	sound: sound {
+		compatible = "mediatek,mt8365-mt6357";
+		mediatek,platform = <&afe>;
+		pinctrl-names = "aud_default",
+			"aud_dmic",
+			"aud_miso_off",
+			"aud_miso_on",
+			"aud_mosi_off",
+			"aud_mosi_on";
+		pinctrl-0 = <&aud_default_pins>;
+		pinctrl-1 = <&aud_dmic_pins>;
+		pinctrl-2 = <&aud_miso_off_pins>;
+		pinctrl-3 = <&aud_miso_on_pins>;
+		pinctrl-4 = <&aud_mosi_off_pins>;
+		pinctrl-5 = <&aud_mosi_on_pins>;
+		vaud28-supply = <&mt6357_vaud28_reg>;
+		status = "okay";
+	};
 };
 
 &cpu0 {
@@ -181,6 +200,67 @@ &mt6357_pmic {
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		pins {
+		pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+			 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+			 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+			 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		pins {
+		pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+			 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+			 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		pins {
+		pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+			 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+			 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+			 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+		input-enable;
+		bias-pull-down;
+		drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		pins {
+		pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+			 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+			 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+			 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+		drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
@@ -416,3 +496,10 @@ &uart2 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&afe {
+	mediatek,dmic-iir-on;
+	mediatek,dmic-irr-mode = <5>;
+	mediatek,dmic-two-wire-mode;
+	status = "okay";
+};

-- 
2.25.1


