Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33821CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=; b=0DhBc1lSKNL7ygIYScLSxdiNLd
	VWA8tt6S6xCHXQ73oQbAGWqbIUEEoMWEGp040a5zd8kWTBltIE95gKxwXjfB5czjjylppvdRrgWWV
	7rR2k20x2dWAq76SNrklCEEmY12QwkPM7tSP1rr1WTUxYOH7SFU5SDqZq+NXzwIG9+QiCnvqxSup4
	F+51ufRUTRy8VGFoSzCzaU/EM89BVYkeFvBN1hBRsK4KmNShyfXbP5SSOCk/AJMUSEOIVfP4pGXN0
	sQNzV3LuzY02aGxJo0k3LpHTIpyBXhQeiz/ul1SpSu1VrLqX+3ED++v3KNKnYQ3hyYqn6lbph9OOK
	tdU/vZJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBmO-00000002Dt9-13Fb;
	Tue, 09 Apr 2024 13:44:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkP-00000002CWe-1ESy
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 13:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=; b=DAECWiJ8al8gScigMtlKbGrNFP
	S/rfrvNX3TIGPVAx+jyk1uAIUqtEMfYoDDt/Sut96WVhiMoVt5AVsmq7c+NE3nixKBfLRvNeh0JQe
	jY0s9M6/X/FgzhLP9m4YCRPiz1oxB1Klhxt6VLS2JpBUDF+PB3lFcSIdwdgNpn5ZWKEh4LPPlalR1
	1EpGmz0o8U+IU4xvNI4BSOHPDSIxukpjbyelQDugz6roaN8J5LT+nS1fH+hJfpXt/OTSaQBGouc1U
	b/nbvU0ZklBGY6eTDas/wpQl2gJODk1KufkTr0HjucX/9P2W3Q2sqr09BnGny5m6iVy09c0fq6fpT
	hhcJLuhQ==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkI-00000007dDV-1Qzf
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3455ff1339dso1960185f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670155; x=1713274955; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=m7PdB0uIX1nReqMfrnMmU3ISdAntD6jgemuTiyNFM8dpgHOmZja7rh8CztefRKCknX
         w6p9+KkJkK100n09imMJ4QP80kH6b/S5A0wrQaRB+j3fTB3K2Q8TaeJUcNgMerul1jv8
         REjVjy4mJfeHBpfz46cJmtlSXIi3vuV9QqPSC7aY/DChaiipA5sqZnl9wQehZ+jLfTiX
         RRW4siVCSGLgYYWtJJkikMYOvF2ZHNsEUQ1SHdeo6IUDuGHu0JRAXUkbnpcDg20B0P7p
         C+lMt0BIPwBh6G3D0BTH63KX/v44RJMLjYe8UfR3tPlogEF6C5IltSsZ6Iy9kkfOE4xD
         GzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670155; x=1713274955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=ulOAioN2jmalrif+EeJUvT3L1xBS/nju57H2cUqYE5ysLlbU59QKFLJzW5tyT9cmoH
         AmZJJSLFwbZK3/VDkkkrrx2kNBEN900U1vViq1vf2q9PsNV/XXK0VyhrVKspDdjgbuWT
         gSDD5rE1c7V5uq2x/b/2+TPuVPO1QJyILy3wpWPDTwL0gpoieFFFWSP/c2UoLRnWwk4Y
         +X3291aVQSlDK+hzXNQHzclXhK2ZBIV+igZuv+JrVsrhyUAbuYl8rZrFyjV2SXhz6/aL
         23sJbgaLEgffC8I49Hv0IxUZGa7HPUvxFpUPmLVb5voeT1iPi3WWU2yXvl7NN8ZmVrTD
         1JBA==
X-Forwarded-Encrypted: i=1; AJvYcCVmpB4nOTOT/D4B6rbvxcdak1Jq/QtV934Lmus10isubyhT96RfRgQveAgU5k7Ki8eHcWMnM4YGJDY1euZc45TcUDi0tdfaqPRDryQTO4Asjzxf
X-Gm-Message-State: AOJu0YzSx3ZYWWO8UXrdsPFtHD32q4XXPyN3Cf7MBZFQhRx0Qass39zH
	o5xLM422OZN/Juwi6r7rsripGY/BSZ0i6y+FSbI8ImHrHENRuLoM7rvYo1GOzCM=
X-Google-Smtp-Source: AGHT+IE50TCMrfjZuXTdnKL9WNw3DK/tmRr+qyF9NLMMXasFNF8KgA/SVj2Jw2fTgEXVgf0xXcm+Nw==
X-Received: by 2002:a5d:6a8b:0:b0:343:ae9a:b8c0 with SMTP id s11-20020a5d6a8b000000b00343ae9ab8c0mr8260845wru.65.1712670154718;
        Tue, 09 Apr 2024 06:42:34 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:12 +0200
Subject: [PATCH v3 14/18] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-14-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs9pRJy7KUZ4H2C6Wten4uME6QtcFeAGTtQRY2
 FdINPIOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURXBAEA
 C1kIAcewmz3E1DLy4mjYqDKJDGwbRrzHCTjplKxlDH2U9LDCdhuXjjk3NJP55d7ykayD6oWA4N0LlT
 I3onvj9JNUb7Ki5+mDTqlxboZSLHXwOOMC0jk/OsBem3UxJxDLfoiNZYIOiPOO93638rGzqpXA5BtD
 eq/zkOiRxER1Tcht4pzXjTAWeYfv9w16EzypL0ju+VW6cYC0ZJ1ITWiaOT1WVwN8Nv0iSZDiaWyCVl
 MmCiPDqUBooM16xfXUqnRCLRNizoUUc096eUWMVAJGFBnpFvx6xdCv2lmeHbW/+5mEhE6UqcpvZuzr
 647OQB2xxJUZg3Qgkg+9H4XcCkwyYEJ8vWl7Bv4Njehf4GIhz4Illu9EGEBl6FhpJqyvgFXQentbGg
 tCrg+4cJESVdzQBe7pgLsIOYc9zI+egw8BRC/IsndIeiQIGWsnA1JZJcNzyJimY67OYciBGcy1sb5X
 YjKAIRAUQKhg45pHj9x2ZAwn92CbYAEFmBu+Va7HnNRBoMpMKBE6USoG8fLdb+yPUPXCXnFSUCdgXt
 oOaYeRhZPvSwgqObB1hlgmxX+AkeCQ5tlK0npBAu3Xu+k5mMo01325CZ9JsNFqyNT1alaWMIgwMXtT
 PE3GXzld3msBEzj7Tm2j/B1jvFLYtx9uaGK/lGWjx3iOg9cNZvmZz7ncBRaQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_144242_640400_89CF0E30 
X-CRM114-Status: GOOD (  16.15  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/mediatek/Kconfig         | 20 ++++++++++++++++++++
 sound/soc/mediatek/Makefile        |  1 +
 sound/soc/mediatek/mt8365/Makefile | 15 +++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a8476e1ecca..c1c86ecc0601 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -298,3 +298,23 @@ config SND_SOC_MT8195_MT6359
 	  boards with the MT6359 and other I2S audio codecs.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8365
+	tristate "ASoC support for Mediatek MT8365 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for Mediatek MT8365 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8365_MT6357
+	tristate "ASoC Audio driver for MT8365 with MT6357 codec"
+	depends on SND_SOC_MT8365 && MTK_PMIC_WRAP
+	select SND_SOC_MT6357
+	help
+	  This adds support for ASoC machine driver for Mediatek MT8365
+	  boards with the MT6357 codec.
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


