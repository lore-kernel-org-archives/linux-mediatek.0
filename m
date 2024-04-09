Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D99C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlNVVt0wcqoKbTlcpTD2Av1BFgB4YmPyV+Qn5GBtCCs=; b=2Frtqyja2wF7sdic0HJMEe3xah
	Cp5AJe7b2fQqZwrLOqn/CrgsA2c+mqB1bLkkSYcLou49ZgtE/ySpbuhQ+IkAhkjSNFrBFNoiYBVMX
	8ouXmvnEQ7f53iaPPAnutol1YQWEYcgCqmd1dy2i4OBEw+8hKf8wBzmJPEsoNcsy5V9z8fh54Yv36
	OeprZIHpaAKdpqhBbGyTR7ieNRHVuUsyleEtgy3ufNeU+FJpAcoYwY8R8L+89+3QSg19TOIJzsk9n
	Uc5/xO+O7cC6nNcot/us/ogpC+9KYDHDbMpmnfWWNspx/blF0xFZreE7Uc1EoCHD7hnA4aH2dEUMd
	tvcmmRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8WK-00000001OyF-2Zc7;
	Tue, 09 Apr 2024 10:16:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8Ua-00000001Nnj-28As
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 10:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PlNVVt0wcqoKbTlcpTD2Av1BFgB4YmPyV+Qn5GBtCCs=; b=Kyu6MCCVSPO03DtAAqsd69Cf0/
	Haktc0P6YXnG9blYJxG/wM4frGyUcERYHNwIBWu7Y+zzV/o0EruizP+G5y2GoWOv5tobmKp0uCklB
	o/iTZID7kPffCFUTSseTaS1yARoOc2ZZQY+gpk1wNcWyXqjHV0Qe4cHx430+Qk60mGUJeHR3rnO6w
	FFNw73AG6izMmogozEgJ/cC4Cuq8zQnFLmtFsUFlaVvvzTbNzz5KHEpYcj29miuq1q9Z7CKKPd2Mr
	r3I2vgVn2f0aXNGAmPJ1tYBBMdB+/PFnQBIHHIvbse1xZ6JPeUsQWNIhRiIddM8I/CKH0JLOwAAaH
	jZIKl+QQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UV-00000007YHA-2Pt3
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:14:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4165caf9b2dso22013775e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657648; x=1713262448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlNVVt0wcqoKbTlcpTD2Av1BFgB4YmPyV+Qn5GBtCCs=;
        b=HBfPTEDkSq55FJOjfXTaTxxXnHHbvac3j9b0SkSGX1L5hH9/6PgF9GS4YpK15+ZKYV
         cW2/dTheTAz6rkcinHBUdaU8miIItFK0mlgeOGc+RUprnTl9CYYVLKdYSb2aNLVm7fzV
         Md+SimLYgQK/LRUQQLEQA0MuQ0r60W0ixH2NTnGQcQ+c+Nef2ctrD5oOiP3TdgET23X/
         XCSSyHciFb/rg8ybhfqRv6JWUbMPxlDSeZLXMxftAJA9aZ4dx1PjJIowN9NDPiqKgvID
         VwpzvzJALsZU93pI9rBc3UiRZGnUSWy/bvjXPIMGeasX7PqiXnLvXM9Z5kKMqNPRvgmP
         EN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657648; x=1713262448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlNVVt0wcqoKbTlcpTD2Av1BFgB4YmPyV+Qn5GBtCCs=;
        b=YRnMHt3wr26Zu82lfMaR56Ame8MWGbzYqGhUZRmHF2BTyRL2YIDJMic4Aa1Y/f7ThY
         erPJzRNvMpTIU761Yt8luNWHtal+rmTNo45tkMlzx8x5bSsDCKG5fw190nQ+SWtDxh0x
         77Tdmq7xM2IS/sxfvS9PS5vmiRqMgoJu36536mJvroYNXTGYfRoKb9jCjDGo30kea/Ff
         L5Pr1VrP7JVBhqQvaRYOavzBSWa2YN5LS055PWkVtVue4ttPDILiLOgJcbdgCP5VulMw
         3RBXRXyU8tlicsxakz+XDhZvTrvdapNRGhik9D3wDdL0YpiUg+4c13cOeslPApNZsVOF
         FjGA==
X-Forwarded-Encrypted: i=1; AJvYcCV1PahYBJgnjgw++Y67p2w9qBvdN8JRBsg8ja7fwUMWDEd6hlh1LOREjarVY9UpSzNRNFPH1crr0/KNVRCmjXqCKdcQ6H8tOZ7swBsXjMwdWfSg
X-Gm-Message-State: AOJu0YzkCJynUpVx0lPHPclG1EioO3mYjsFySVk8BJerSX0rS9eeyBaQ
	YOqGJQiiMJJB4PsORmBYnPydySz4jC0FgDouM4eNyWd/zhN16luQDkPUqbWEvec=
X-Google-Smtp-Source: AGHT+IH93tvacaOiFnd4nqmc7gPsI2OQnyM0ybPS1MyBc1NNs/vnBJCMth9sI4K2Y7Z5nTAcW1vKuQ==
X-Received: by 2002:a05:600c:1986:b0:416:4973:4d87 with SMTP id t6-20020a05600c198600b0041649734d87mr7777580wmq.3.1712657648192;
        Tue, 09 Apr 2024 03:14:08 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:14:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:39 +0200
Subject: [PATCH v2 18/18] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v2-18-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=uSzLvOfclK6XqDtrVAYhNkEKbGoFUCZ/BcUUGGGjtWY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTPFBV6yfp7E/gtZ8jajBrd4nrGJXU7zuvHqAn
 MYzj5GiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURd7sD/
 0d7oIOsEwKg1zZ6wKlZHYUcZVM3MBOkC/s+el2n0OhNu8d0vnDZUAx+2NSBnPNMYQIop5CXn599unK
 zTB9ZeemTVqcMLVooBi6G4H5zf1lXsZ0agCq1THO622I/7O/KyLM9HjgyytiVUS3YuIV7DmWnJyGDu
 JWxyOmTQoU5uvqQUYIowraVjoLhkxK3w+BoqD4+vcVUZnTPHDQkKsy2Yee+HqURFMKbREfaB68KkhC
 wacoL0XJvC2lG6ZkP5zkaO7QqqigeYrlE0QMlqnVxtrOb3STiREQptLDQy5W9iomslHnnwrirzTNXt
 wkvQnflZmuetIt96UlaJ7EfwpUfpcSnSyvIECFNKmEtBMlzzQcbBWvoRAR4crLjNi5Ni7VJMEive9T
 ZcNWB9rmdABfIoaj1hgs2V4kiA/cdx4C7/N2csgJGJfbfKN7KCDYtETjmaTZvrmfPtgWOd+KcQEu0F
 Scb6Cwuj55Hc7Yvvv6xQ9X9O82nSU8gyZ12H14H4jFh787GExA6h33K1MJwN0WAuok1upuW7MFqYkZ
 iitq8obavvUIfmBnqn9zRN++w1YJ3yvkdGcWPiJGV3vy4Mfi9isOq1jgOiSHCL+fhBPxBqImEsENqO
 LBlB7ibM5IOmfrPDyZ4N8yx3kZJR4+icLeV0DNeOR6m5LqtiDNRvLaxwtt9A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_111412_103581_71F91460 
X-CRM114-Status: GOOD (  11.54  )
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
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 98 +++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 50cbaefa1a99..bf15d3c7a965 100644
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
@@ -86,6 +86,29 @@ optee_reserved: optee@43200000 {
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
+		status = "okay";
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -174,6 +197,12 @@ &mmc1 {
 	status = "okay";
 };
 
+&mt6357_codec {
+	vaud28-supply = <&mt6357_vaud28_reg>;
+	mediatek,micbias0-microvolt = <1900000>;
+	mediatek,micbias1-microvolt = <1700000>;
+};
+
 &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
@@ -181,6 +210,67 @@ &mt6357_pmic {
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

-- 
2.25.1


