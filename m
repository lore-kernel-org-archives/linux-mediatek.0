Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECE9C54E4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA6Y8WaWiyVxJ/xYCh7GUPTM71b4HBf0Ymw0AKthDEc=; b=Njekb+ri5puQ5wBMX8nF6li7no
	tG37+VFobVt7vVfaUaaVhie8CUJwoftDlstUjs7ZGa+AxBrXqpYQ3w2SctF+riw6UN9CMJI5KkR7q
	H1tt5QSaiOIGmgykONk80c+zvg/Ap0ub093F3pyVM/PW/3s/SNGxxSizqStXVtuTX1VLvYGhthVyN
	RRQH24ukm0z4dAmmQy4aw2L/SnXHtviTClFH/NJf3WLHHh+uj2QjRPPrp1AvohbxoPZ+Qp6dvpqNt
	76KHvY1uTxemeUjUsXCFhad4s5e1HguPGxTsUdZmhxbqVgfKCnvSQGlhoSjYECntYycQTHDxbgp2C
	DNW+QMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebcy-000000010gl-1BkQ;
	Mon, 26 Feb 2024 14:06:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebZ7-00000000ypu-08hH
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zA6Y8WaWiyVxJ/xYCh7GUPTM71b4HBf0Ymw0AKthDEc=; b=bl17ZzvTNoYpifQyggWVruk77M
	JtqsaHUst3QSX8pGcp2+MD9RTywaDX+g4U9M73oaPAwneGkUAAB3otkWfubHQ29+N5igf07PfBSnP
	OOcg9DkGfCgAFc7UmIW/YlaQbdTkDvDoz8u4im2ocm97FhWgEulEvcy7167EpgT9H+ecDn6h4o9z0
	6LVupRAGFQOoZ8jOOehZ9LpfrgMlszkF0QOwIi8cn1Z9XtiuvpHfwlKtu/mYdn0CxGIo5PGyt7isx
	iMu0uSWrTD3IvswTKWlYxop0c2TYQ417+A7v+831fIEU+tTGHK9tf8fXj9X3/hKrYae9lnBm/le0e
	8m6Zrurw==;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYr-00000001Eae-0DPi
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:43 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512d19e2cb8so4630716e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956147; x=1709560947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zA6Y8WaWiyVxJ/xYCh7GUPTM71b4HBf0Ymw0AKthDEc=;
        b=P+yjfLOMHO1xUZzqAkAQsEmdrI+xrXY8bE2sMbrz+IaKSVn5k7PqnzlvPeu3B35aGe
         ZDNOFaaivPm9jKfx5fVh5kaNspcoXs41YAk7BDt/vqR1qLt7i6YCtjwQUj7dWmwS/ZCG
         JlXZTNZsgvQ3TZd2FDvFEGxVVnY0WfuLUDj/pAKmnEc2a4TSxjxwJpeQBTrGx7RKF67H
         xK42itz0wSIvKS8dgC+UFE5oE7qK8s7QTMiIgCOMK8PEuYFS0L1PmnEebVqPnbla8Pn2
         75tNYoTPSYUk9pielfkBRw649KSvszAOSHsnDHrN6ZPBUDtazZhxvpPtbFxLEYqh0G5H
         iR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956147; x=1709560947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zA6Y8WaWiyVxJ/xYCh7GUPTM71b4HBf0Ymw0AKthDEc=;
        b=AHINt2f66a+2dJDdG6Pq+IYuwhHvE2Gor6xrM0nGvE8TCtU7F8q6pg5AMB3ZLl4Mhi
         8W316sGz2A4CZVzxia0x1RXuFT0vtIiVQC96rXPPQHzHM56spPSogCc1Ix8bAWGPBb1Q
         lI+EN2Jn9su6rYxwyGXPWpdsmtdVyXdXk98nkaUfiUGaqzvHIfuYeiz/6+4nTWds7HRa
         UtgXiOUtNplWDXSScchZG/VlUYdWcPbUeSxyJC/pyMU9cQJnpBg2wuyNto9x0MRJR4im
         sZyyIPMRAUSG2pjDoTveDZ6GelBr9ce4cB1tDugsALvaglgJDv6KpeWq4aFgUKF7BSJg
         axNA==
X-Forwarded-Encrypted: i=1; AJvYcCWF/hmIcWD//USR8S+UFDU1UFCVasyrY4zEYEsobNlNFmClc44JgslhGfK7Iiv2J3KKflHjeTspWAWi4hljpy7KBPEYamIwdqh0R8C1sWHfMepv
X-Gm-Message-State: AOJu0YyiTbUuLOjv0ULGAxGKoc3K4/H+Z5C1xDy/zVmotEYMUMdGnvw4
	oefB1rCbkOoTgZuzYNnoQWb0OVouaELUlGiP1jHJAXW0I3spRW4bfpF59FNIKHs=
X-Google-Smtp-Source: AGHT+IFZTYGnkejti+WCUV0bUYklgWDkRIQ3OpYZLpgocYTsWqEZ09TnWQAenfEV9LOzKDtQuB6hbw==
X-Received: by 2002:a05:6512:3da9:b0:512:aa52:5cce with SMTP id k41-20020a0565123da900b00512aa525ccemr5583650lfv.12.1708956146625;
        Mon, 26 Feb 2024 06:02:26 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:26 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:52 +0100
Subject: [PATCH 14/18] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-14-4fa1cea1667f@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7gKtKZ96mpebE4/UyNGtTbO/tF9O5foCSjcP2W5e+6o=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JncDRU2NBAq5rld4NoSuR28KwMZlIfGU8IBQSkN
 SNQJ2tqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3AAKCRArRkmdfjHURfDGD/
 9m97Nzpk6hOjVqK3PFbQax0+QGFlRuqovyHNa4EU9vmGuGO8caLPUuugYcx559tE8h+O1jkQCrwNWX
 Q/XOJ1FDmQ6RI9Q+XZF3AxpJllFfCjLhgqxMDYasFUG3w/1ZZ+ENS9Nl1WonR/58W3CFvWLABh6fqV
 N3JD01coH9rYNalJvFiv512AS5tFcJFWbfHDgxPE9yPGue60swyFLkrzI5+2j3X4SrKoM6Dgzqq4wc
 eojs5yS/ONSWbcY0vq3o5QMLyQkPdZBm5BLautmVV3Jy3SHMqvwmuve/casoFCf5K/J3MBxJDDVhqs
 OxpWXaazPI1cPcWxo3B3pVoK6YuwDtZb6QH3dWTgiJlmdorv3ErELXiBUZy6Sua5s3+zvVJS8RPz8Y
 VKeco0kB7OYIYUWEs0BT0TVeGj4sUqqyV99af0vY4kP21ygqowS6nN+yioba0wVhvNidAcRHZB/qoL
 lkBf9JDhphrOQl8xUhvVGCAmMxegJ6est/k6fJZ7hCb1UE3biVtE/p7RAeYSlt8/nMBrXK+2SO58XW
 AC5zcWZnuO6QzvwI29ZugDYm0/gxJx+tHTdzK7IqfeloT5QeH3QDzvxl0JQBbP3FUXC1vKm59Or25T
 LhPQU64Udhs7slsra/bjBBFsekuxfIFzBMn9iRPU7SDoam+8QkzwtjU02C5A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140229_322852_2381CCB9 
X-CRM114-Status: GOOD (  16.14  )
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
index 296b434caf81..671020037a99 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -314,3 +314,23 @@ config SND_SOC_MT8195_MT6359
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


