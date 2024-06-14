Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5386AC27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=; b=HKLPSDD/kCx1l9R/BT0W3rWand
	8CC0zZBRKYVXusPmZGlD4k7oCCM18jYC+381jDjiLQjyoOkoWUAqXhwdwbkP7FG4Cux0BY2SNywcb
	8vQ7QF2qZZ/fWQW+hQo2X3UyT9uBdvSb7rauNrQsJ6bhjC29SLMcFJeaqz1R8UIis/UoqbkBUVzUy
	KV/4rZ/sIdSCImCmZNiKZ7oPFhDON/2/mtLhOZtNK+BM6cOcSQ3xP5A1n3htNF9ys24rkwaBkYllh
	rNiYwnef9lEVEEreY9xZLtMx/W8o9om1intvYa5BlNKNGWyx/yQVxTR3bKMlQsw4RK4AEBZ7DQUZ0
	00NKeqBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Ot-00000001nX4-0aTS;
	Fri, 14 Jun 2024 07:31:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1NW-00000001mlg-3aau
	for linux-mediatek@bombadil.infradead.org;
	Fri, 14 Jun 2024 07:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=; b=rTD2oJdb4GQQGMPWA//JCX+BGW
	vsIs23qu8HsQXvEJBVGEH0KqN4TIK934p9UmNUze9H0WBjwmmwqSUGhP0bXlQ25zReHuVmc96gnkS
	JnM3svHY4LbQMp4Yw2qaz9nj4LjC5yX80HchVMD0mcAwG7ZqaRGb+uzhWrRucCBQxm1k/pA4ge44d
	IUIzRi65UrSVhJ5+7u0JDH3Ch9PcYKB6kEzW1j3NbUIUOk/zdw1i8MY8XOE/LRmBmmJQIXZm6blZV
	GYTT6uD/1jzx3yRXfXF1tGvWb6Hfw5AjKlAoHbleFUXDKcHqDDOs08kGYFxuRK0xF6kBYb3TU6zZ9
	WNb2XCsQ==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1ME-00000004Ady-4BxB
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 07:29:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-35f1cb7a40fso1675840f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350101; x=1718954901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=YMDPQ2FBaWmn/YmyeJWrBkA0tEyEG4iycR1FeZ6iEKO07Y++M51BzxNjOCRy6DleTQ
         D5MUY/ETp1wAu+aNX9cyvPvcXAAmM/nO68QFr6M93jVMuCWhplZWkOBMOQrsr9zKScWr
         NjL6JBk3TcflcZivzybMfNEy5TmO98ZM3JihwOekgBE/el6KXnMlfyEvH6vmLlEBhLpL
         MY09D9RKKr8599VugUOQusGHcTq9W6dyneBhQWjn4hqyogit+JOPnzCqq/RnqZcNd0ev
         NJ2We1FA+Z6lE7ZUqJ09kgt0M8LDLZPrauDS57oBJ3McwbW0WaPlYttEG8Zt9zSonDTA
         JBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350101; x=1718954901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=FDDWoLtLiUOCZXww3H/rNQ3OTybIdKow5tLApX9YzDsUWFBWY/Nb8J548MA1GarDF8
         psTqCrOm99Y3HyuetiOMFcKeLyTLaqjVDG1HiD47jSFM9rkj0n2LKwCqbd/DW6J7eLsl
         3lH22OTjatm3Np9Wf1ELDZQLDCRHxb7hiSmzcnGNU2dtatlCBfVVQQoltJnNBO9zqv+i
         9QQgrLmJY1/5A3hlYLkeJN8sWg5cXgza6bHfCdxuP7G7PMkT/SyIHuUddkxdk6YjRLcZ
         wG/LUNVKr5jUjbEXne5/1hKiRKUyasDvMT34WQe+Rf3C1lkOMo6uF3JsoYATxgmtt7uc
         Z+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXY89zqf35CIKF2hOFm9awwrCCVgXAoCdMUs5U9Yo/1g3NemW0gYy9rEXj/7oDASTAgbETkATVfZKHEHQTYjMSmSM/JFxzUgB29MxmNc4n7V5jM
X-Gm-Message-State: AOJu0YxDg5+1LHbB1oZFjXPkMXDvIztMMoLGVKcH9Rse1UudAj0IOlE2
	K4KPQBkm87gvzaFZraRONQzsXV6eVTR6ObYQOfKN5qcG+Y/uwCfYT3k9HvFl7yk=
X-Google-Smtp-Source: AGHT+IHpHTOl5QY00tqzxh9OhoCQurXEk9QIL2u7zQNMO52wgT/TSDNb/CU/N+DsMPE6NNLY7yq2jQ==
X-Received: by 2002:a5d:58f1:0:b0:360:7a19:4bb with SMTP id ffacd0b85a97d-3607a78237cmr1161501f8f.51.1718350101288;
        Fri, 14 Jun 2024 00:28:21 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:56 +0200
Subject: [PATCH RESEND v5 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-13-54827318b453@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/PHaUW2bvmY9tCiVjihESjYpsC4I7oQKoqwB3
 mHC8l7eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURbUpEA
 CqbFqWc7ZVeRe0gmWB+Yo6vl14789DYula2eT5S04/NlyciCaGMqNlxwJyxvuDRv1Hjl6NISBksh4c
 pD9tKX6C1RlEy1NP+fsqXkUGXpLp1KJoyaDRhwGr7fo3Xdo8yo+AXmTydOnxaDqksESf92YAtgH8Vv
 ag+9kzYhtIfZN9d3nO+MnJBNhCXET+Din9J8EWqe1Wc+phmLXUBF5CwpsBny9fw5+5JkdJ55iqnQ8l
 NVJDLcmmDD2ErJWdZ7rDaoFLMWmuHfL3OuWvjsYl5j5K593cGaPhLRxCDfmKM3nqGM+mo4MOmDXlk6
 orlvUwUehIxEo4pdlSU0oZ8VdoBLJ67jFlt7Hg+59Ziw1y6tdRlUg4DqmhzarAPMA9PvSCYG7ynbBf
 Uys2U/0V6Qbiw1bmveh8ogCKlDV9lQyYgZQ14QqEgkCX2amkoq1GiIMvcBBoW3PZCvVuS/D8kT4zIW
 5yHt6P0LzRJNNT0REWz4Oq0rdlcsn5lRw/ciN+x/aR2hQQNmWWOSR58YhLGUOKn1dtyQDZm+wXraxs
 j3wGYPF+M0fX3Ktlx77mRdkMeQcnhIcgUWcjjSrzlKKDzDwDBgIRcXPxhMNDHa+tqc1X8M0Qgm5p6a
 qCe5OjUo70Shs8K1eV0v9l8cyyxv3wWJvSJSKo/J0MjWS8trl7OEMDIt4coA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_082828_789529_49049F90 
X-CRM114-Status: GOOD (  15.61  )
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


