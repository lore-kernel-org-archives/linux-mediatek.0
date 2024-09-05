Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55379CD4F59
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=; b=ocsSsZP/VmRglz97DXZEl5aPYu
	NdVlJTj2hPPMu8mj/CaMivmg7PFCZgsdOnxyIoZ9g+W3j3g/VOGeSX2uN+vi1jgNUDuEnrTflr0gV
	Lp7h4O0jwtVHomBiYTkKnf95L7E4Hm632YHGZwBPeDiTtoarxzE/Rnan4gmPvHX6SJC4NE8KGD/yh
	Rb67iDdJo0MT+bp9vitvmf97zMOn5BVuq9vF2nrREFTCbcwRymEaIcw5dd27ueWQmepOOwACQGSa0
	inTdDmurfNWw0dp5bXDWZnoc1f9qYA9yKXVVjBJ4U4YeztNV/e/lVqBDwGXzU8q+Rg/XevzlvaGK2
	5MffMJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8VA-00000007hN9-06AY;
	Thu, 05 Sep 2024 09:10:04 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8Sl-00000007ghZ-1QO5
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 09:07:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53345dcd377so587205e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527253; x=1726132053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=gxuzni8d5fSIEGmLqNxDFE93QEjawCCiaj2cZDy6y6c8/+IZRhBv21nWJPNcfQG0T7
         ty86cxLch/ksKMVHpXJdbk25dqlG1z5aBpDFzs2BVrN8ryfdpd07PXt+0X6ckQs1Og8I
         EwHcGS2t4BWS2PTU3TadQ985UBciuvM0CtBwmBkTfw9E6wPF/FN8lgRMvdkp7osXA5ys
         94xKYZepqdXm1NQszBzH/XuFrNkqsGnWHwgWuJ/IuGmP2wJyAYWLBCMJAuPMCGJRRH2B
         xgJMoj0Yu0XHuaS/yZCSQZWNfldx2vbrKPuvKwHEPrMghggtVP2r5Xn9ohbQC8E26sC5
         kP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527253; x=1726132053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=mJxeKscv1fvSh2GKaGF7xYnN83t8YVEEOJ+UWoumECmGuFmmEX62ZcpDLVikPwnkS0
         /vLh6V9iabHnh9U+xDovJSplKPWwb0UbWjj4JZoVBEBA0qKH/BK8uObQ1v2f2F044S/u
         eC4v9+yk4s9Hmq/rmtLpOsLvpJIQmKh47hVd0IPGauIkRbZQSBsGOxuJgYpBJodgjOn0
         tYCqMb3iYUhMMzp1dXbit9f5GVNuXLlKC741ZA7j7JnoHe1pHfIWqhPIOYM0EJ4RthNx
         F01mTsg+U3rrXmEuloxdb3h/+RP6oWLbfGml8IJNMMYn4Q+5d5IGAIfT7yGprnQhiNK5
         JWsg==
X-Forwarded-Encrypted: i=1; AJvYcCVGE1zD4z7ki5Tdt1Etf8jJ6voQOkDOtR/ATJ+4ZV8bFfTy3VwsnSegFDOD2kTtTqJCyqverH9qGVkej+EdgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyN+hbJ1OBoaWjd00pgy82dXiF3Io0qeWY9kkklNy4MospqkMVj
	xfItaMg2uku48CUntWVqr5xs7++JNJBpJtqbXdA6LVWYouaPhH9Vobbv9TSYMck=
X-Google-Smtp-Source: AGHT+IHUWKL+n+aiFePs4KzsKogKpO5HOL8lwDtIY5ZJCkwGzqAj0Zb5pk1kh5ZSvt9j8riN5kXVJA==
X-Received: by 2002:a05:6512:1043:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-53546b93f60mr13156897e87.40.1725527253365;
        Thu, 05 Sep 2024 02:07:33 -0700 (PDT)
Received: from [127.0.1.1] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm2554188e87.0.2024.09.05.02.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:07:32 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 05 Sep 2024 11:06:59 +0200
Subject: [PATCH v8 2/5] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v8-2-e80a57d026ce@baylibre.com>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vnmd2mVApxPLc2R6K6xVxS7OxGsZNFmbe/RXhcwO8AY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBm2XTOF6LibJjBVJ0Mak7b6zJc2UIL1Q3Y4UZZbXqc
 enhjEwyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZtl0zgAKCRArRkmdfjHURboWD/
 9iL3VX1TG8/wPmhbnzb23RJymY0ctV1TF9XW5qW+DpmtYy+Fn12ijWcAcP/1m2jDCoTaHUMzqoQtaM
 PCd1PxmHLubIUpVyynAzHyuUBEb0+2ee2Y7sorWs04g1yQvQaWGtwYd3SmTeImXQ2ZttJTyMcu+aqq
 L1zVk3Ll+zMefprEcVicTt7crtY22HSS/yT3m/nxyiM7HjTv1c7EJMdlBmrpFa3ui3osM2IPhwNd7b
 pGAZGyqZxjjBQuXAz2OZKK6VunOSgFgYWUWbo73Qw3gF4QStKafcUgDxlftZbnYzNFHl3KtYeqAzs3
 37nnwatWubylC2gK7uHUn1Khnson1gqnkGseoosC5gWAliwN2WHbCewJ0WwYWrlrC5ye/FHUTjSlv0
 Q58wqvvBH/A2YWiRunc6iVAPGbybr6gFnJ6mICGGTh1tR0lHiJ1SN/mMXdMkH+iz2Xk2JTCAp1bGZ5
 zAJjQ02YeORd1+pEDbfEqlE2YjzfRrhKETjcb6NghsfTN/n75/Th9ptavVpvBfTR0NxnMnXBW3GPSr
 bWy79yPi0Fzpu72GxEg+JHtjszZBDTekMqKDwFEj4Wt7eR3RV4IAJV96xI824j4M94aot549UwpnLo
 GCNYYDcnV30g8FxJ0r2AUpPVhb3pQzOFxuP2ZdzH49YfrMeeF0FKkzVQE1Qg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_020735_468497_3C6A1C1E 
X-CRM114-Status: GOOD (  15.43  )
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

- Add specific config to enable:
  - MT8365 sound support
  - MT6357 audio codec support
- Add the mt8365 directory and all drivers under it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..e6f7a5a49794 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for MediaTek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for MediaTek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for MediaTek MT8365
+	  boards with the MT6357 PMIC codec.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index 3938e7f75c2e..4b55434f2168 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_SND_SOC_MT8186) += mt8186/
 obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
 obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
 obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
+obj-$(CONFIG_SND_SOC_MT8365) += mt8365/
diff --git a/sound/soc/mediatek/mt8365/Makefile b/sound/soc/mediatek/mt8365/Makefile
new file mode 100644
index 000000000000..52ba45a8498a
--- /dev/null
+++ b/sound/soc/mediatek/mt8365/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# MTK Platform driver
+snd-soc-mt8365-pcm-objs := \
+	mt8365-afe-clk.o \
+	mt8365-afe-pcm.o \
+	mt8365-dai-adda.o \
+	mt8365-dai-dmic.o \
+	mt8365-dai-i2s.o \
+	mt8365-dai-pcm.o
+
+obj-$(CONFIG_SND_SOC_MT8365) += snd-soc-mt8365-pcm.o
+
+# Machine driver
+obj-$(CONFIG_SND_SOC_MT8365_MT6357) += mt8365-mt6357.o

-- 
2.25.1


