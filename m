Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8ADC25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=; b=1g8XqWH+DROMIajRN5NHk8mrwR
	VPg9lGbKS9aMOentdJxBb8qT1daYHRlGmSkOwh9cr4FIkmSPV9GcRSftS4Inr9K/2C9PE6Ayn/+dR
	FxGyKauJrfd9B+QeuEnfN5v8r75juomNNBTcNqH8058/sVyI8i/HQ0BMCOaTAFcOjPh9r73yA0Kua
	U7aM84ZdkylbxlwUVy1rkIMmuxObrvS0MzkpdhpRzhhtiO8RGDve5mn4hDC6baqppeK/yfBflXgYl
	hPpVYxII4551QAkrdbeTWn4GQxfdOJWKCyWvL6RnxPWWqcTU2ktcyl3Mpia7NpwDQAitlk4U0O8nX
	ixHA4Y7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0QMI-0000000DfX9-2zNq;
	Fri, 26 Apr 2024 18:31:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PHp-0000000DQlQ-17L4
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 17:23:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a51addddbd4so289353766b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Apr 2024 10:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152180; x=1714756980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=uQ3RGR32Y4hw3IHRPNKAKygEeT3JG9XDAnfZIiw1Eh+Ik7rAafGzUhPZyaFd96CmW2
         OV3ScSCt7glmGvzctcq59svOQoZlkO/lELnjiKs6fCU7S253YiI8EIkNMpYk6Ne9xm77
         IhZcPsygBc1eCyCtdCK0IzTwdNkbl27KN2KIOOyM6S8CirHpu6i9qkNjsoiaBiH+Bi+I
         MIRgAMfdYnlmwIaYvBvXJBHoPV4yRGbtaAtmagaDEZaVVAlgFl0K4M/jUg22lfwdktvm
         1l/0Y5aQSRhy+yddnrUt6nfLIXjif5/RLv7UU2/Zf6dHHEVh6SbP2xsw8pne/PANnOun
         nXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152180; x=1714756980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=EcziZeb2d2rEWYe7oa4VjxPaDMKOQft4ZQMdO7+enVBIMs7KhKSKVN6RyoBZEzisbi
         HggV8oBoIarWEpRnyRtL9RfBxJW1Yq3E6fI2PR5EqdL57R8n+EkbT4BQsk3Q0TGZunZ7
         YiQs5zUk7UJymZh+it+SAzPkniSdN9pXaS6kx5t+zno70g6RkNgKyPdT94SKZJQy6NSx
         +s9uGh5UmdwFYcnRVx3wmeQnZzWi3UiDYWHtOh2BGnBGCS1IZcYB+1CDXklD+omtPrOw
         pvwCloDpmZgRTMDNhQqlZDtsZTN4pXctG1klLiCVkf1CNgX1mPssQzV9eyP1hHAk4Q+v
         LSow==
X-Forwarded-Encrypted: i=1; AJvYcCWQ2E7VoGpgYZ2plnMES4V8PgYvP7x/1MNthie81O5CeywcSSy7LovTM70AL3WmbkANGGsV8GLgiHMdYIPtIVoaBcPJffWnGhhWqk1vlcQiDDpO
X-Gm-Message-State: AOJu0YyyLz4PXcMfq0fqL8WQmtFISYsxe9pbXw8AIuB74wmuEDrlJsSc
	ADDI5eZ00QnVOzEHHH83PCCAIDTRPAUx5kV4zDdoK6x4SVZx5UVuk9ijZbDR+H4=
X-Google-Smtp-Source: AGHT+IHbc56Ak+iiZKc6UM6Y4436Jjedt2ZE6Lfg8rDGrCH/hYHwl421b4ny1eWhX3iqzBHxLgcC0Q==
X-Received: by 2002:a17:907:20d6:b0:a58:828b:554e with SMTP id qq22-20020a17090720d600b00a58828b554emr2613172ejb.71.1714152179855;
        Fri, 26 Apr 2024 10:22:59 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:22:59 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:42 +0200
Subject: [PATCH v4 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-13-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+La2MbhNuLjWxwp2m2IbEOSPve0e5649hcdKnUy
 eFfF2Z2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURVS9D/
 9wJyopXYFZ8sHNU/hOFop7d7AhUUMqWMTq6ghx4GKwXdqRxY+U+1R1ozjFG51w0l2XrMFJTEZp5NNq
 /R4N1hJo3MUpx0LwK+xh1AgS9m1BGfZeGvy870ANxleqrn2Th5OzVYYub6CvHmSTwazS/OCu/LW8vU
 ngh8zEeFys9AcCIoqgEjBdF5vCzsRGJ7n9PINqZqOFiPxm+gf7ZYexa/TNOZjjm/nabcgXvyFXdsou
 9LCMWY5YxWbSNYnzpemqgVdjdDLPjz9yn1w0uCOuQvbJsBLh4I1EcLHyRBkSwELYE2F92zhHHFoFxP
 nddG05Yu+XTwsO/xDxzn4sj5+EA/Y7gKilUEvQiPECyAD+ANWhSY3DDE/nuIclOYFuvRFA4DI3Ya8Q
 SNwNWtpdIQSeMMotCEoCKHgatqCKzTP8BUiaoCkoIJwhfFFxKHjkOqnvaMXoSDKZjzu1Zlxx3ftWZR
 HTGGofaOk+LOade2EywQL7K1X6pwIX6uSW/T0XkT7dA9HSVee2ne4Z2gojbAW6saTNssOTHihVQlqa
 6WsFMzHqNmh4J+Te9JsysGF8q2RU5jmV8iyDnhBb58KNGPKTaQjScWYIw5aqRjObOwoiYj5y+GSCB3
 RubdN5kTRddimfOUPsFzSFR/lvjy3GHo247bkweyYeUh/PXbZ9014W5fGMiA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_102301_792834_4F51691D 
X-CRM114-Status: GOOD (  15.81  )
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


