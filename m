Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A3C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=; b=CcbH9nzdLOI+PuNBGQlmXwe38r
	vdBMHj6XFVxlvZD4Wp+XLRlLhRmnQLEaR+BOlCr7m+Issl4B+Yy6QDWcT0jCluxoGy2wsa7KJi1MK
	Z3hk/Yvb9jD3++xV3/l+jRVObF5W2/Hoymx8mInavgGOa7N2w4lG3yK41MgvRImIkk3BRnHMcvNHA
	EsigMVxCj6eX4R/1nKESnMCNj6R+dkq2hIRYEWBoOElKsim1wLpkrO4KdOXHFomNxbxT33/iqm/zM
	OAHihUzgwJodIMDPgddd8S8ke0M75X/TOjsj5iLmwoaS2ZybKIqaqVk5lWqj5GwuCinq+qQzqolLW
	crLxbZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA45K-00000005Ymk-24YC;
	Thu, 23 May 2024 08:46:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42T-00000005X56-0rhW
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 08:43:13 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4202ca70289so50650195e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 01:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453782; x=1717058582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=M6ZISxVrLPvvvmUKXQqMSTvABGJIssGy9zaqPKYQ3HcyxBqZhaZaTdV7WMJinqwxg3
         wKL3GvcSnvsUQ7c07CMfZf0Tv5kjF4dVm+DFeQxzT1sVu2hEWSDKgxw0Q4e85bIeW2Az
         kP7Emc6N/Qaqjgzu7N+Wr8oSFfRbUqcES4zovqFCrijKhZLxWX21hajSVYU3huiDOJpG
         4igfQ+MfUHl3Wq5HX3/gP5+9VDNfFsNET/URzi0/0j6B95UpAow6lJwe954jlnvsLMp9
         f72FCj8AfB6vSNdag1EhUcrjxEY4fSieNr5K6zWVkEutMr8z35hNkUQ3TRpWlINhkfHN
         Hfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453782; x=1717058582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HA5hs8xf/jy+EOJ7+HP5joeg+9+VSnSpeoghvWaVeM=;
        b=TQeYjYtDVsOqnIzX8ksK6xCA95JKDYlZIRt9U1WUqAtYoRgpYDS7UG3N5FXxxOXuxj
         e4P/arIZqiEf2Ea/QFAxk3wYSrToZXoSMtKQ7fMfQKQziJYqgpMWt6KRAn3TRS824srt
         h6MD64c4uhH5FQoyK1pJRtsqhNHO9u8H3VpznzlgC/qyq6QPfnlTlPEckzHKvcbR4u8S
         nPC60n8WjWO3FsdDspuocV5/Aw95DOD+oxlujkc/qGDkX5aTMW/1BRfjemhxjjxdgyLK
         Qk7N16HyI2sar/1cVr3nYDaR2QQjkfvyovFRYdHUPMgy4fxBpF+nJG9/yLtTCZQ2LjdS
         7IBg==
X-Forwarded-Encrypted: i=1; AJvYcCWgVNpP3xqyqreFyuTJWIoF3FFXFiVmtgkrXZcvml7d68kdvzF2AtCOtBcCYhK2sNqbtkt6PsCiVidlvYId3WFO2VaCu1yNy5R9kpuzqrH4IpYc
X-Gm-Message-State: AOJu0YyNDO5XQslIDK9XrQ8X8LUWtCWH6lTmPkEtJyVRIJ5MYfWiCOzh
	+PCFv5R3IA/drkXLWiwV0PpcJAQJkdZ56ty39g0q0+vkFZtuOECvqBW7kmfZ7Z4=
X-Google-Smtp-Source: AGHT+IEgXB8XAglpO/+u8eIAozosQjUX70ZSlCyMPcZgIahX51v2m4pBJfTJ8NVJU32cec42EeGwwA==
X-Received: by 2002:a05:600c:1c1c:b0:41f:f592:2fa3 with SMTP id 5b1f17b1804b1-420fd2fee2fmr34719085e9.11.1716453782151;
        Thu, 23 May 2024 01:43:02 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:43:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:42 +0200
Subject: [PATCH v5 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-13-e7e2569df481@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=A2PASoilqpYSI/+vuK5IOoXc5LlU1gMN/yOVGVWPN5c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwGA1rPY6+2jHY0Jdp8w3wCySWSDsGcI3gF7IUbF
 q4jgYFiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BgAAKCRArRkmdfjHURe8/D/
 0YvpKzCTSlToY8nBJfWFSHqFFE4a05PMPt+Im7zQRDtWIIYUJJ6saPOfhv3dyJHFQ4s+iimRBUOikt
 wHkaqQWMzcZ5VIIYk1wMG2qpqSYqfeldl6oPj4gqp8Q+p6+zyQ8VJjHN3nbilnthHesZNt4yzeE0G6
 hMSrGS1Wxu9NWk6sBEI46gHKUX7q2A5kbuJV/wI0f3gyN9SVvxQ5Qh7VNwgTSNvwctCB5BH49ktLJU
 4pEd4tY9+iawrsqv0mL3eYI5VOzptiWsMYSzR30T7sRvCJuGQLX1ALajBwhfs5BxiL9cuQZz6PCGD5
 gRSUJ9ifGgIt9M4BnVnyygb+cRlC63P0f0+fISU1TuWVNomt5EJv83Yc/L9gXdeVZ5SWGxCgBX4f9j
 vyNLz9EsVPPqRBHu0QztfxweHST+kMfWLMzVJevN9cx7gqfxmv/+PxdmcwoLNEqeZwR1j2UgMrxLmP
 nxuRazZr/s5GTBPZafxixC4iOllKsMG1qY1XVko16VFJs3jJKE/DHCHy4sS7C8vKk4mcAOJkE23WSv
 t9vylzNJ+AyG53ZX3MELOEAzQfCrDgGmqZz5zMyngf9CEJGXsi9K1USOCJ59+X+7bgD9ewaeXGMD7/
 Bo9cMRdbTHLVb3EeDVaCMkbn+6PtnxgVn8raLgR8emWibVHRnPO9miHIrBoA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_014305_448574_CCFBD9F4 
X-CRM114-Status: GOOD (  15.80  )
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


