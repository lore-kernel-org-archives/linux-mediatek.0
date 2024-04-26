Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4362C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 17:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8YtHIDpzdHx4sXqMfJFiepO7h+jia5jAgm2xcDtDns=; b=taVxB9oFeTEdaOVcwN/+Q3DRVf
	D3EU+vDZQ9hCT0Tfq1IEWSev1tyBXbEMyYXQZ9vQKfXNcmjGOvhy9ci2p28fi5KbfWxfftrZyQFdg
	HVt38+U/3vW79n5Nr1nXe8rm84tpbp9fZ6329S9JLGWJKO9L8PvGAVhkaW2npSgoe8mT0vmQDR24C
	VLRIPjO8vK9pnR6Ok26oEgI4tYTgZ6nAJ6XpjqfoZwFxnLval8Vy6B5dFej+ikBSW46Jx4cyi8igo
	tiVsASzoYMUTHT0Zllw04SYfu8x0Szff2E2OI/4EY0hylsK3bCfk6yJ6xR6y2N97WT94KFv0q3hJG
	vcV6rn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PKv-0000000DSRp-1HQl;
	Fri, 26 Apr 2024 17:26:13 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PHv-0000000DQoe-1Npt
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 17:23:13 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a5544fd07easo325157066b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Apr 2024 10:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152185; x=1714756985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8YtHIDpzdHx4sXqMfJFiepO7h+jia5jAgm2xcDtDns=;
        b=kBOc/O6CZ3zbg7gXk3+7MyGqMAnxqTy/vaz0q2iFa2PRP/mzF5kqU4sOfdPT/tSBbZ
         5fIUW2WJsTyTd9SDsPIzq+BqjpA/Lyluld1HWGwtNdkVu6adSc7aMLFrb9h45D3Ts1tJ
         udOAtn3R31yF3Or9BpHp7R3AR7Z3i9iiyjhFsSnqLuV9DiybKVItUmyhxK2bUurbAcvF
         3/+5pzlahJXAyzkDsmI/TLYCzOag7XKQ6VAoqSQe3iHO6h0iTc2rE2iRhdnGfTwKxqfJ
         OzAqR+f3oX2B7KvalpdZlLK8iqFsHLApnrtMdaEIL/uWX2+wQB8VuO/++bW1UZNH2fso
         0BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152185; x=1714756985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8YtHIDpzdHx4sXqMfJFiepO7h+jia5jAgm2xcDtDns=;
        b=tFDP6mzgbYJadLSxRM5AFdYpRBNF2KAp1ozwGswnMWkNX/zp0T1LMURkM5LFj7kunC
         ont0Slrhk6extwHioagOmSI2924pExsoKp25KPI6ccOWuAUeyaUNXLUagCth2stQGBQ5
         HWAX6rSpfK1I4K3ySDUjLta/UF4BNrToZJVo3T/rnf+90yPgE+iLcrAyjLmxfWWNZLz1
         drHbtwgp7LTrE7BykhvdlqpbfHeel6wFkjR9u9k1c9YGZcEmxtnD5FOp4frmdkivvxs7
         4k+1ZjptDdhB3BaDsEalO0RTv1nYmY9380sANY6J9Qq+3HsqNL+4jKEoT5Pp2Sj28j6r
         zewg==
X-Forwarded-Encrypted: i=1; AJvYcCXWEm+DvaAV22jqYDN7jscQ5ZEysjfQ5lr1HzQYDC6weaUMrVdkkLKEPFFgqsrJY6A3Q64JCvljmUWXtRlsp2xLKz90DkkX1SsSMP/11t2ZUllU
X-Gm-Message-State: AOJu0YwRHvJjV54ffoNQZ7Yo5jOzErgcRPEfwTP+AoEfkrNlAwsk7LIR
	1A+MIwDBfq7K41QNhMnZ4TGh2Xr0SW5M486y6+0Vvf9zjeX7h7T73i2TkZJqs7w=
X-Google-Smtp-Source: AGHT+IFe8cPyxYKPbB10bsA22HXOnNfS2uZCqL9dCr5CCChCqjSUjXJYhasnPEIlUBFiAuMlS60jng==
X-Received: by 2002:a17:906:2c06:b0:a55:64bd:2544 with SMTP id e6-20020a1709062c0600b00a5564bd2544mr2122960ejh.60.1714152185108;
        Fri, 26 Apr 2024 10:23:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:23:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:45 +0200
Subject: [PATCH v4 16/16] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v4-16-082b22186d4c@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
In-Reply-To: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3675; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=SJCQ9iTy0gf3MF6NpcJbnv0eqLDS85mr0GL7yiG+BlA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaAKHbepcmLOlZloUS5NBbwlGYMM92geHkpJU7
 XXa0I1qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURTMzD/
 9qgSi0I2CHYULuwM1Nav9rRhgAYJZAbLZdgfNHsBQc8L4p0cJrd9BxqKmxruQ4EwPq8BkmZJTpIzWE
 iExHW/L8zCFlE6ksIo7WhitWXf5jkNImBAqiEDrhcImecZMqWJuCrE3+RTKcYi0432KkK8ZP/uxnHB
 pBvGzyTTbbVz3kmVZ3fmAfCsYEgeO0b/tUMVqZGYuBexCYTKHrvDlqOJ4cX7BfJg4v5cGSDnjaqi8E
 TLDGHYHZ18jQYlYrUwmsqQ2w0hpnDwb+1HJ7A8ahgjdwJEf4LEBJVYZR1NL86N8ZMi2zg5QUW5qhZ1
 dZqON3mLt5LIcg8AbAZpwK8oRy/dsHkC+78KqmjleWYhCFwupn4oYUi87ZWNGmpZvOynMhtk+ZTvCz
 2l7DMC/2Q0XF643D8disbp/yiMevYeBnnPg/ayz7A4evpXVmOEBPN4bb/aB2qKYru1vKz5teiWLFAC
 +Av/KPOz3MQwqUcjThylnvpy7+Enhq0WVK4i7bUoC0LlClRV4MblSz4vkmC4/CtX+t3Y3Ipb5t87c2
 Y+oHm6LmIGV4dVLgez38gDWlGSxW6xs71wlTPyYgaxs3QCO6UklKMLcBZwPBhraGMQoYuNElQRpW//
 hTPVT5adtgXdUQQn4Rt/rXB/0zCVw2PoI7W/Kbg7YMrjQfHssQjxtLVyEzQQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_102307_536924_BB015C01 
X-CRM114-Status: GOOD (  10.93  )
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
index 50cbaefa1a99..32ae7d599272 100644
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
+	audio-codec {
+		vaud28-supply = <&mt6357_vaud28_reg>;
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


