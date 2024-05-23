Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141B6C25B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=; b=b+Mxw1eLn6IJQBm1TuH1MZVpuk
	CInsgSXWDewfLbhjKG7B9QzRZqhVvqVMH2XO2VN71132a/cafR1CTTLx041JTVRf/AcL8SsF4ndhw
	xXjou6RFftsXnh8cpsdUqwtQHw3CcfdyuLvtbMi20Utrw65K5si/r9SSyrZmQUrEfjhoJ88sq4kfA
	rsLR0xi1vohgS1Zc3m1MfUJNRj7bmbz/+If206GZN67ot8EL4fvu2O8SSMtQo30YxQH2BEFSNVqZG
	oiLJUFeM6WRDsieaaBH6NAVn27h5ll01SudQo4O/00lpfA+oSyJ0/w+Zl+x8bAqIPUxdm+XShJkG9
	MwPEzRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA453-00000005Yd2-2ZkK;
	Thu, 23 May 2024 08:45:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42k-00000005XJ6-3jj8
	for linux-mediatek@bombadil.infradead.org;
	Thu, 23 May 2024 08:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=; b=TMFAeTtHTk6p4ownrKA/1SUnbF
	PRHBZqpgVtJPvZBCjE04Qg39BJ+Dx0DB9b19J9D8N4axXNf77qEYh+D6P5jI7/7o04tF73apP21gL
	Xz/vyNLmMakAwzNh+fslVCO0pzz61ZXcEOjoWXYIWeS4Oaz3/06mFikKlr/ErkfMBkVsEDtOunXCO
	GiNXuC1ODBmOZUODh//sppvYGifW9YRNwMRQhJhNamVu9DGDbJnbPLVvkGy/Ngg/orAPX8K59UfhI
	TLLkekqksz1EtbNAcCiMtK3z4UnJomKqA4+Poxmubvz6qEkrkOC1Co3EwgOiqUO8TaDnhtTr2gUG6
	DC8pC1WQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42Z-00000009D8u-2A3u
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 08:43:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41f9ce16ed8so21159785e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453786; x=1717058586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=;
        b=xQ5ChhHp54NmOyr+Qr26D8t2ZaKnpLB7scqs/f4Y7soFxJO28Vf+ghEr6iiLyRLCiw
         1FPPZI/c1urnSL4GVYldE99opnAobjHREvNLKMPG7TKZpZiltAmjTYvG5pypLpmTTDV2
         qXOoFHQCKO/s+tM1qhYEW5/YX3XCVsqQVl1k4ce8z85uZroxjqKlD9QAjDxSDKCMXZAq
         UgSUUmmLy7RLWFek5k52x4qZQPeOmtz/a0+DVQEb8Eisj1XdxJ5wksOIiK4XqCku3Yo7
         l738AAPdVG5wiw1qvGeiWvYs86w7bc142rBmtGr1hJdXrcuZqXq+iA/MpAxaRak5BBw0
         JDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453786; x=1717058586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj6N1XCYi9OkzD42tPPAcjKt9khuBDH5NgwwQe/Q8Ps=;
        b=Dp4BB+2dEvy2stkBfekmyz6jkSXWsOXO2S12HE7GAkVN13JO3k9ud+jhAjUo1pc686
         1BdkemUAlNmbCSYfoPeSnXkECysIFBzTWZMxftMX6R2ejXFh+dc0DhLVCOdJAbHLqF5w
         aqLhRp2PsgAqatN/qFfRs9b1PaDjJEZ7DBpsoUcBtVXH0fmbGt2Qc+rGwRyuIRx12USy
         jj1ezs7As4qjB3y1/kITtCsxbVyR5JteyfJmPN5TXTJ5pLBFi3xWxDspqj3406m7H41b
         Z6vlH/D4lf8S1hiaO9B4aVWrKJ4vAqR4eiB7EuTX6cgzZsj/R0rPnshP9eNJFhJQ+uW6
         aO6g==
X-Forwarded-Encrypted: i=1; AJvYcCVs9dL3NAVohk9syEeDmJ5EUdedhmN9xegSSQEvkLMCc0I8pC8YHyh28AaU/RGFiznE+37eEmEmuqxlt4Zg5Xpy2HNz6AHFpwNYgH7d5BoQWS4D
X-Gm-Message-State: AOJu0YyAzWq0a7tccZ+Qak5AmNX3+/VBQlBSV0qyYOyAJJNK2ztPo8OX
	NqohvnNvC7UKya0hISU1thxT4be91mT/HdavF1H3TQsUZrLG4q5U0PLxFFCGrgM=
X-Google-Smtp-Source: AGHT+IFMxan85JMvlhZzNK1inKnN/olhsGGF3fE8oyneffHwEACsul7Buo/M9+QQDSM/sWz6EKTdlQ==
X-Received: by 2002:a05:600c:21d5:b0:420:2cbe:7f16 with SMTP id 5b1f17b1804b1-420fd3726d5mr44037415e9.34.1716453786677;
        Thu, 23 May 2024 01:43:06 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:43:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:45 +0200
Subject: [PATCH v5 16/16] arm64: dts: mediatek: add audio support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v5-16-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwGAyKEOwovbtoYcOuUP+1kNqMlqBHxH+fBJIpyW
 ZwNDuz2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BgAAKCRArRkmdfjHURegwD/
 9pP2p6C/mj0ZjZa0DuLTwTiFr0fCqnc53uXDOszeVilSx9V0w78yKnj0jmYLzMIeD795tuMlag5dwI
 aXHddglxL1jl8eZLslBYLDB60NEsBTzaw1ZCoMwEyAQ/Jjjs+QROVQL5KkoxNGRRWvx/D+fifhpwKy
 A26wfqqJroPS22VzW5IExhKlbtzWhXaXqABt5RWDQTc7OiQ9W/97F6gtGrxbK1sjD+4j3PPiTnpdIA
 WQL0k7JUDhG6TqbY8HUwhbQRMas1bl0nCAA3mwc0RtGtQxdVTDEg6T6zpMogA2JxsKTdOaT/B+QkzH
 YBbmE1/gcL/ptpvG9Hsma1Im7JoEPDpWjAJ/6jaiPvNp0ANU01fsbxz9hwlvKTPcQeug5bSp+8qxcL
 k2M88IiQiGAraDEAcATnArTpe+FHHhGJJ4O8BBda+jbmdvbTDcbYsBBViTvppuN+FTuUIal7XNHH+O
 RmfW6a4PLQEDwwNa5OjD+yRh9win0SJeCVmQ1uSqtRrhc8JeJ4WE8OPDzEQPOtTbcHzUjA3oXTBx/G
 0tthCBA0/+lwhPVFXrq/MIHOBYNJVnPRiprUBiBjBvnrjzhrmDvU5qllQ1gneBokm+MDse+e/G9q40
 jGbeydbNzcr4b9XzMzt1sO8g8zZ8o9AS7/7Sn7jE6DcHgNByoAaIN4jTayag==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_094316_024944_5F5C3841 
X-CRM114-Status: GOOD (  10.88  )
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


