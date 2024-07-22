Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EA4C3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 06:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=; b=sOWsDMHA/5gRic3VpXJ/BdR33U
	yyVJvz4AB+3qTefiq6V0ayzMCEEZIGKYDNJ6UdvJ0OtbqwFg0yOV72rZZ7ea2a3RAVugSHUnyMj14
	s6jw3zv6J8emHCEiSNdJoa6y54KFoRHBNl0Z2z6gyb+bo3IYteX8pAzzqJYm8IQldCB4dt2ys7HgT
	r23XGrg2Eq/CnRERQ8m8SXVrym43LEei3eKQdGRfow0fjJQr7Pww8zCVOF5T2CL3T7dCz5nkutq8c
	PSxClPMguYNelcHX1gl2bVyNFNG8OeJanqyT55DklBvF9DucMAGjo03nJUJrAaPVkjqs76W3w6vZg
	573WGZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmzs-00000008c68-2xOe;
	Mon, 22 Jul 2024 06:58:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmvw-00000008aOQ-47Vl
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 06:54:12 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a7979c3ffb1so199467266b.2
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jul 2024 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631247; x=1722236047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=LELjaX0ID6nEhOEQdOgwnE9mRNChiXMpngcm/fqTmCWSqoh692RXYxmRn8w2X3y93n
         7tqlegKEt114rdtlE001kFWcNUfhTlrO/XmrvPJc6CplL7MHiXA7kg6oq6kfQNbbOVsG
         ZCxOWjjEWPTJLuF1NfUeKY2q10Le6170ze1U8qQ6HG3q7D9FU7Bni6s7jZAqFWiAEVcw
         +pe/BJQN3At7ObOJo1+UxvUlkEKs7vLbQ5Jwaz+bFyH6k57B1qcSNNa/i3969onle8nP
         dHiASck6xis9/Hqk+7tx/9CiaSvG4Rmuxf5npbASM4bM7Fl5ZYrwTHFdRaF9VP3++k7H
         ZI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631247; x=1722236047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=A9W6cB8X2+5C/hE7wVV58Bh3P6xb2lpI6wdGVZY/wSTAUvG4XHeMVUOlwaJxA2f8yj
         3Si8EfcBheGDNX8KprI/d0cGZnnn7YJSe/QHKTfCAJjJfitrmDWSAdB5r+rKKF1Rpz3g
         /OW+qNNQpTPgUjQA6xns95celtWv9tAtyWYk6gpp19q5no0TVS/cks0lus6Odo3J9sg+
         ilaPAtTWWeM+slIj0WukpGBDf/8m97Zs/kSiz6AtU1KjU9XBc6eeQDlfLuE+XuEptV6+
         bla0FPAnGGQR/qBeH+AJdxFu7ojRZTJFw5H3G2ysY+k02RQG1GcV8MTXaBrq7apbvRs4
         zy9A==
X-Forwarded-Encrypted: i=1; AJvYcCWDJFfQOAV3JdKNoYswXq4p/8xzRO1lw7gdUKnaVJUlSfK6BH9lwxLPODM4SVZZzbrLRrPCu9zF1fOU9Z2Dq+M6VKqNRtaZXTZY01AkX6g57NE8
X-Gm-Message-State: AOJu0Yyy1zn4FYaYjltcaGyn2ZmTrLe65uPUBNQAh0qTRBMtWrDNrRHx
	aQrf4rp3hlcOvMsoXb0O69Dtxvngr9wLuqNr8t4V55kmaQ48+vDgUOKPyVyNtUo=
X-Google-Smtp-Source: AGHT+IFbwYRzzUmRf/OoPJE+V2otzxTtur4mA5CfELlQGEzRRvmmijhQKr10TxEyvnGIljPrOtFCEA==
X-Received: by 2002:a50:d713:0:b0:5a1:4f76:1a1b with SMTP id 4fb4d7f45d1cf-5a47996fdb2mr4097864a12.15.1721631247621;
        Sun, 21 Jul 2024 23:54:07 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:54:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:42 +0200
Subject: [PATCH v7 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-13-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vnmd2mVApxPLc2R6K6xVxS7OxGsZNFmbe/RXhcwO8AY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHxLhHwx66j1rggHVESaKaFcYr3S1EhfXZdoGR6
 Rje7IXqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8QAKCRArRkmdfjHURZUhD/
 94ddsu8PR09DqcBVj41J3lBi/flpiU7BnukO+LFefq9P8A/V0ybcL+/l3vy2J8Fr0PK7h9p4tTMOE+
 j1zsP3RErNYgP7Q2+L+0LMrg7Te8Ai/xFx164rRqHYwxf71gxCWi9YG8yNzsDIkdW1bl8Bea1sxE3g
 /SIgZKsXyw1IKNjdj7somThkysldLNB/zACUS00m2sAjG0tlnKqGeB2JHhsA4nbNRSJE2aFwvyDgKC
 W2N8LPXQD/WMNqIafA9d0zsw7459q1bgUConXMUZqW6MlIOpTIUfNwnt/xGIGjgAcBfvYxRvcPJSIU
 e67LH9WdVjsLjNlFNSqZjkbwbcqmRMssvRSxA+e9oS2MIFM+BNQFJlCgZMytwsgCM3GXZb3sLFskCN
 vQArUtPx+ICBnOGpiMQouk+Q654mNDX8yXoPw0V32Kk4VoZFaaO8fba3BGzVwOkHbvJRpPYk5TPwTp
 p560UcHJoMWJaiIHNHqCEl8BiXReWOxgMF2dgEUFuWWJtrhE+lY+lO6Ct8qVpAJbm/R+DSmYcDEvC/
 N/O4ELUTJ+89rMER+930ldJ20FzHOkeedGw5ne3p0nWwWAl6gCtsuZxFpuEYmKsUDrOV9ZqWFlnx/I
 /KRMDy6+A9IAbMjHF59JlZJJbh7B53Au/+Jcjeuo3cWnF1sh5oNIfRAPbemA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_235409_122604_E9EDB04A 
X-CRM114-Status: GOOD (  15.86  )
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


