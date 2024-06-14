Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4005BC27C7B
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=; b=PDcn1JYAzP17yiyAIXgalvjB7b
	sumvebQ44705/SRysOEco/K91qvOslc4fKcbsUWsnIV1wzVY1bE/hhCE7IFh2OLcan2KqV61el7VU
	d8RQSY265bY/fReTdfaegSPMwWSpEVTyb/ICl3b32EMLuiVK1rNaFi85JCsvZlBtvrubI9mBGlsY5
	LIK9fBJyxFrIG6UztzexfCY1NnW4wKJdvP1soDkHIzpxOoZAtfRAzVqehizEDjOfQSmiPT8MdtGGZ
	YeIzkHbOLxCrclNmXstRo3pVaxf0NFa60ZWWHhu8j/xgh45+gf2KaggGBLmCaQDV8x+ROOXplgVgj
	jyaqDrLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Ou-00000001nYV-48Kw;
	Fri, 14 Jun 2024 07:31:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1NX-00000001mmI-34kK
	for linux-mediatek@bombadil.infradead.org;
	Fri, 14 Jun 2024 07:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=; b=OHVgmaeiR0HincJq3Np7B2+VGR
	/e012t8LSzv9nP0UZU7wexDBCi5S5Ihknm6kQ1Yy6+jGitwjMImJy5GwBKgeWYIhbI0F89DCSY/bq
	y+C6CvbIoLWRb5j8oQw4uAKHdVvNXGOKykehfK0TxQxdaOeJ8yeb7S/HZGPtmWVBvB6ndsnyl+3qn
	ZzOX9dBM1Mp9jURH7ugo/XnHNsFeNHfq7pjimTXetfmg4KCzv0GKRCnNjjVv8laChviB9ZUbu+/eU
	s7Z8vErHhl81WuwM0Zk4tbDQLQbvxkLkvZs0uviTw4WPLX7qVEOlov8DjVORXqADoLz8gexNysRXt
	gYAziRiw==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1MJ-00000004Af6-2nOb
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 07:29:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-35f23f3da44so1724719f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350106; x=1718954906; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=;
        b=HQTF/oLGE7wpCujqkcfW19LI0oQrm6PrC8shUBb+JZWnH/enWrIJWSkZhSsvVo9N6u
         zIiSlhJ7KNjn/VwX9FnB/CbNHKnYFuHsHp0L3jCHzR96WHzmRAot0d9JIMpATkSOMf8i
         gfK6RQ/k9IzK9EeC9woI3xfk9mH5d5KyJqmXy3m1w9GXqsz4ro40SXMg9KneO91Lh6cb
         J3VHsjOr9luw/9cAHhpH7S3/frFpbp65EDuwBP4y/gdJflrENHf8vxFChf+gMLSbzj9f
         kfiQf3kkrqZvhxLEV4JnMQApDLAZAJLa+V7b5r8fvlhrLaKmhylrpGA3k7CEvhOUE86G
         OsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350106; x=1718954906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=;
        b=xTrBzh6F85bSnAzoYJniCn1DC0eY/UEu98dvcO4v7t05ucYz31VhUJv4UlYYbB6eRG
         2zh/77EWUukdetwlXQtNWjk/Ym0Xb/oqFem2hGulKosvnmO8ljgdeqp4pTO49tAf9uJ3
         3xmTuPvGKGSORnNf7/hocU4jCnpiTV2u+5cLRwgwQxustkn129v8agPATZMHGM+AyiEw
         n+Kf2edCwSDGomMNETltGOb7prAealWxhlkz9dQvMcIh/9FGkxX9zkTGNOtP+NAKy0P1
         R4CAPi0P4h19+Ha57YfYmaiVN6NLWjab42JPWn7YBc3Bs3QlHC5IE8aEfQ1lDdko2mqx
         yy8w==
X-Forwarded-Encrypted: i=1; AJvYcCUH3WusFC5agdQinPVjOoiCikQUHRB24NrljBDR+FkBaw/0tM5pD4RU7t7Ukhka3JaHrX2J+T00u6nkuiu6HMaAx74957LUCLKtbpzzRaynl/rS
X-Gm-Message-State: AOJu0YwH3cG8XE8DDXBcM3lQO8RwIyDQORVwmr6cC5HSEPCmGAR1lC0P
	FkvKJrH1e+SetBhO7IMUuMHz8xV6i90bRyaXwmfjWcL/P3VB5mZWl1RAMCYEFgE=
X-Google-Smtp-Source: AGHT+IH1sau9xgdmWet8z49jHSmkMTTRejgofw6/ooSXhPGDtc47ElNp4Kb4O4tkJqcFbLYVG+36Xg==
X-Received: by 2002:a5d:458a:0:b0:360:861f:b7d1 with SMTP id ffacd0b85a97d-360861fb8cdmr69680f8f.65.1718350105904;
        Fri, 14 Jun 2024 00:28:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:59 +0200
Subject: [PATCH RESEND v5 16/16] arm64: dts: mediatek: add audio support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-16-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3674; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UuxD5pLm61p5B/k8KPZWLUQ0/L/5Kc/UQPpFC3tu7EE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/EAEfODnnPkRsdd11u7PQ8F+DYOn/214x3OG4/P
 dgywbJeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvxAAAKCRArRkmdfjHURSTgD/
 9WpD0NJGEfi+cnsDUMbr7XRL72nxkXLtxsW9HyxixY20WGfs40QUu6OB4Goz91wTndbMDaiyjhTh38
 cKt48+pCpGFd5DA1RE8R94l4xxAbStT1gJtN+VLDzvnbz/ASZgZt/pSW7LlF7ce5fb5lBcvLLnlJ8J
 VN8A+/iTg3LdDcp5+vI1NhrbxNrg1L6mAnc7fJiExDcWumNzbH+kjPhHlXOiZezbPWOgH0QmzU29gp
 XaSA9B9egE0nhUpkrSR5lb68O/fFrtqYnErY1Uogmy3Gp11zRBoPl06rC+yvdNOewYxr8cVlYqF5z6
 O8KSlYwinzzBqLsx31eVUzHwH1+T+QarOiwfAyM1/BAGhjlfrXnPGaRB/3VeMliPQtoM90B34Y12ZA
 C/ErsI0t/LDJDE7MP2DpXmKI5GsDo+lwan+94XdGGf2U3/jgh8Ba5CIx5/vUCfNMJ3C/gw+HTw2Dov
 purJinwm0+7HsrG4Ky/LA2qFhaEHRNrmUcBAjUefjoeVzVT+J3ReRLJc2fzZRsKeENH6YN6QEW3VAA
 peArTUI2/QRsG6m4CATcXqZ1vBzS4KpkbmAxkRn87lBsT43rsUROWDZS28P58FEzmWXtAJC6V95x00
 zGSB718brYCPeugLXWEZmYITE6GCAOQ3mDwRcFLZHUfdCbbYf9biZPuyrcxg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_082833_009389_CC3ECD78 
X-CRM114-Status: GOOD (  10.74  )
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
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..1d5457f9a4c2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -4,6 +4,7 @@
  * Authors:
  * Fabien Parent <fparent@baylibre.com>
  * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +87,28 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	sound: sound {
+		compatible = "mediatek,mt8365-mt6357";
+		pinctrl-names = "default",
+				"dmic",
+				"miso_off",
+				"miso_on",
+				"mosi_off",
+				"mosi_on";
+		pinctrl-0 = <&aud_default_pins>;
+		pinctrl-1 = <&aud_dmic_pins>;
+		pinctrl-2 = <&aud_miso_off_pins>;
+		pinctrl-3 = <&aud_miso_on_pins>;
+		pinctrl-4 = <&aud_mosi_off_pins>;
+		pinctrl-5 = <&aud_mosi_on_pins>;
+		mediatek,platform = <&afe>;
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -178,9 +201,75 @@ &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	vaud28-supply = <&mt6357_vaud28_reg>;
+	audio-codec {
+		mediatek,micbias0-microvolt = <1900000>;
+		mediatek,micbias1-microvolt = <1700000>;
+	};
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		pins {
+			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		pins {
+			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+			drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <MTK_DRIVE_2mA>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+			drive-strength = <MTK_DRIVE_6mA>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1


