Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23F5CD129C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=; b=pOyNze2uWRSCx/73TtX3ROagXy
	BQLehs3SPopqO5j7wzV3950G+UflNmCHB3AATzCCd1WU+m1uxOeWMnMB7eSceteGYICMzpO8jBfCr
	Kzb1dItqOBimpoHFbIL4EknN9rDZxOaKNk5j9R45DwF86EVFRN6rkdUmKexNlz+sqhMjMPb9Lr0pt
	XC3mYI6MNuesbebG+RwlEaPpnGbEFTIR0pGcV/GUWNB/vWy3LQfGi67zfKqxG3gIWIObPNyKbA/XD
	pqBspp1cSTKKOYm6G5/OIuq4CRjO0tF/bwvTWW0M+AvvCeDtnZJ61BSZMmBSoT4VFw6ywhQ8I1HLi
	v+oIwFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8W4-00000001Omb-1j0l;
	Tue, 09 Apr 2024 10:15:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UV-00000001Nks-3CqX
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 10:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=; b=AtZ6n76uTyzFlDHT9pgvMbayLe
	N8Qn2/BPXu14EqOo4sIz6JXZimxK7NZffQjm5TsI0HN5T5FLquyR8DB98xgZq8mAVs6qnPBxyp4oN
	aB/efjAALfhc6umphPIZgebumnDuZ9aAAIqVUw+Os4JpcxPNpljblX8yInZaAu90eWMC0KQm1i6yW
	/BLYfnAIlsO0QDghvj/sDNAnV2oygnwD5HZv7ylfAx0rJQG5EuxDzmRWCl+oBxOKVws34ko0czORJ
	Bi6wHZqwhPowIKKzpi/eZOQgjPGK5pDhFUvgzTyzFYEl7C88JjsEGRbzt47rRTkF0CzKu7GQlhxjs
	ZCk6wi2g==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UP-00000007YEn-0Pq2
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:14:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4165805e158so17698165e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657642; x=1713262442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=uixsHQZnQROm6LbvwILazCHWkkf3W7DEC8GPLEUxmmNdiH4iYbTCx75BGZTEl8Cugt
         SMwUcZTtx3HgnT1KDKPCaOzXjm3PQW5nGVZafVZzxiE/xfGJldJ3P+xedzrGkTYpDf4f
         +iaVfdWjPFE0d4ru3yUuem6Ybm9eewnMeEeSTsWfCfG+HJYloqGbUPUVMvTXY+E1FpxH
         CjiBkif9RkatDEbnU39udjfmokTRJm54JOwtXtzBoWawMF8xEM1AN7eEf8gfRaR4byIG
         nQGLkF247xpQD7GLy+CY9Uu9Tf+eDo5adOxtae7chR4mJUbCYzhqtuyL3eymFENZrWgZ
         TbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657642; x=1713262442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=Kpz0zo8uxEJDa2Gyi4Xc/FjWBFyQ6f1vrHdky6kmdmNf/J78o2+syo84dXe+WTQtS7
         tJXrcSFmq7GWJKuO7ggujEN8ZS0Wn4SdzU6uB0Q/KVpr9fdFswO2sVNh0Sj8e8bO5hQJ
         /FPqvLFDdXM0S0tbj9GHg4PLUJXgIAGgi+y96Bo3ru7KM9Mgac5fwvonwZj+hCBC+dKp
         MFFZbp0SlD2nCoEZ1h0cjX5OXARS5Fl+LgzQytASI4XRwh/LHKt1gOMraRtc/Y9Ki6Ig
         nI8+dgCPyJpoUlRummQcIE2lFUilbc/zc9tDln7snFbBfnP8//k2jfJR8dPqhf7qmTMb
         clsA==
X-Forwarded-Encrypted: i=1; AJvYcCU1dEN+MB6Q/LUcgQ6PMDGLRlF3+LoRpoIHd+5a4Xz9A23NNJSeeb6CxaHHQUrh6ZM4JWnAKJPDHhrflehsIqli630oXqtR9YF9OQSztQZILVSJ
X-Gm-Message-State: AOJu0YzaQWQ7sukTA8GoWJOicUMvUNtk0v7bxNIy5i4TdjJZX3WqilPw
	dqTrkP7RvUdAXi/BBwhr1BccnsuChwVhh6IvxDrUUNM5lNtWxza/HKIQ5MgCp3w=
X-Google-Smtp-Source: AGHT+IGg+qyK2mz9YWd/JqH50CwAtlrGTRYl+InjvJ2xy4FgfQZKzqEtNGNqbRovXDbYKqTzZPbMLw==
X-Received: by 2002:a05:600c:3108:b0:416:4923:1f2d with SMTP id g8-20020a05600c310800b0041649231f2dmr6513861wmo.30.1712657642630;
        Tue, 09 Apr 2024 03:14:02 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:14:02 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:35 +0200
Subject: [PATCH v2 14/18] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-14-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTT2q1kS4mzy/NybWoAbX8cukntMOY4p5dixke5
 /AoCuiWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURctOD/
 4mrGmtiYDjbfFa+U1HcWmqlwWqpw5YBSVzqMwm0HuwtcYbgBYCvy7BsPTIKM9b/Eb0dPNPuvQUEXo+
 +PwIkV1XZOqs+akViaabJZpjcym9VBidjgxZ8HiRJNOD6WnJ3zwAbqkLlb4LJGovQk85OeAGyJRnJo
 VxO4UgINR9o+b5qo1a878IOXYPjgsXw2rQUknZtFUW2SVtDM734Aij/VLxPzHobadPjSqhEGStU1vb
 D0j0KIFFdfdptvwGji4fPqvcA+MzJAmpbQiANyGpdlz7ZK15Lr1Z/QB5bsk5k5jOvNpePCnU8tvUlx
 5mRjbtLL/qf0oMSsz+hAG5KtwJglafv/7bbsA7nBmEYejG9JNX34SrIO9yeRbQ9Br4UZknPO2592Ho
 oilZDSgVzk4yHg9hcqV+YdcY+WyvnHtjasvI9lHyMuuqox6fWkn/zwFrgY/fn+62T4Qe9e4QcPfR6A
 8kBnD2UItlMldFJ9+YMFjzhIPv2KByIxNy7n6Ip0oLZzd3hmkjESst8P5AMocRMdcu7HjmaeodaCZE
 BD12RuC4m5ZXo7RNAo3UoaD5KatuyibL8h/PZT2t6zbc4/2YTLVvfJBz7+XLB23LQqNJoAm3enhBt2
 YyI1mYbn/6r4TCxea0jX4kKyXJpl4p0/TSaUa4PlzBCJ4j1GZTQmnhgoWsow==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_111405_801162_D17B453E 
X-CRM114-Status: GOOD (  16.13  )
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


