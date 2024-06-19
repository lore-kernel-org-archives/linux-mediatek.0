Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2824C2BA15
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=; b=BSyDnFlK0CpxgV+GEJMflzL61s
	RKa4A0fhZNvOROnxQU9p/QENOExTB8/5hvFuetc9392c9kCvYpaKzMUQ1Kv5IN9ZKeE8SDAFS0+Xe
	PWsNTDLPTUIUUq/HrAd5uU4p107b4STBR3pqumv6xjOTMNhfqLrPQ3TnRLZ8vwAYPt2Y4wEW4dvse
	au3xnGpGS50cn9XFDnKNRfiCYNASKQ7D1ko2eAbZOy6Jq5dp6yF50Q5rYs3R/NcL3p0umyyiKR4jM
	jT7huHd8iObdO398YWQntTXlAswZzQhubq6bIWTNAYT8PPjJd7aSlD5Yd8VRjwG9E1JFcTrtNSRrf
	2vOo59QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwc2-00000001dxl-1o4V;
	Wed, 19 Jun 2024 14:48:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwag-00000001dFw-3SG0
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jun 2024 14:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=; b=ZLsvoDFuW2rq2UZjUBEfOQG/0O
	0mJVG41WQgcxTxA6XPMgXMJSt+UNbj5WehEonE3jFBMSupS7eAtUZeUk02ORn5tF6JiUjo1V/+Qqg
	0bhWPQ4Alw0eF3UPJ3RGHkN2ud9jzfl2IwV+XrqRqRjQM7ccy1JELfFr5p4izmR6n+2oz+StV1HZP
	YalFv5+kpZxT2BmNsY7f3e2aX+DsrUCkgGHjD+rez5rTLPFCwKY1YpYZ7E5qKM61qSaGQrs34fL+H
	FMPPEQ69srJAkwKDM9LFnRxW28dNU4DxHFfSMidtmcY5Ndq/7DBvF4LBfBvL3/IRksExP9ncHarIv
	Vw6xXWKw==;
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwac-00000007Mpp-1TlR
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 14:47:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a6f9fe791f8so152197966b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808428; x=1719413228; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=xqvzahz1QSvPap6lunGvbvMXAsi6k+VmmnN5AZP54ZgObsTPi+LpZxpOQYGjfNuVC3
         VHfvEDgFHW7NgUYR2gBGgYYPIwHllQz8UXTJx1fSGYhGh4+ONUwxB0FTz3S5/TNbsxSm
         ehyYMc3bPj+6HChWOEj8dLPTxgN7d3ctlKcT1hJmAq/13jSIRnxOPlnGPgtmSZLFguLf
         h46N3XYO+Nt0tm1zHpO1HaT93cbeam4sDakBtx6bCNE/IEzlCd/g0U0/8twgv+Aspwr4
         aEAg4G3bJcP1ZK/jId6AILzbQgQflAcdF16hK2uy6Eq9ExhS1aW2oyjTpRNyjEkrwfMM
         3UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808428; x=1719413228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtNAnqgNG24R8NK/m4hXcoIVXnpKbw66g/FsBrMA5y0=;
        b=AIEYvavQH6tUs0T2ZTD3nQ+KBJY14+KhLP7N1K7ze1kKHeu4mlKVX8MT9HSzCTXg4z
         t7PFl92vTD9TCbv/bbj/xVIazHfWPp3MIzYnHRJX0uPB0sJ1MznfaqypATCS9mDu6ifT
         LrS8KCqhZg8mIFuc8OTIf9ZsmM6CmUr9LBcvOnbWtt0xZfNE3L8t25eIp30QF3DqVDEF
         HuwXqqohU9/Gdb1LAqPSQapyki+z8uNJIR/Q1JheT6iX0FP9mSuHwjNYMDYQjBc5f3Te
         mIlKNSiekE6zBfheEq9onAcq/5wfXcMa7cNwjsHwZmJwsK87DSq4NB2n+U9b8ns+b83+
         FMdA==
X-Forwarded-Encrypted: i=1; AJvYcCU/U1jLPzLq+T4AL4PsJCDWvX51JV39ubJM7k7u+hDHpf+YTzq6PNHnyukQFfOJ8V4wtlsZRQBJwrfjvRRQqMy/iYjVKwjyZ9XudQ6A9fzKayyB
X-Gm-Message-State: AOJu0Yw7fs4hxP8s+slWkM/7EUkX5bgtWjmpJAT9Sc6GgcADoySIlhXv
	/JJBoeQkgoGOwC1ghiO7scuZgUGOuDl99GhM+bbGzFQEQLs74j5sMbR5LlRRj3s=
X-Google-Smtp-Source: AGHT+IFv39hM7/l8g49ZpE5FDQEiJIiaQKcf6Hu3dgwo3RGzqjnnsleD/QS3ueaABfQwUjrDhVVxVg==
X-Received: by 2002:a17:907:c24a:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a6fa4109c82mr170872266b.12.1718808428102;
        Wed, 19 Jun 2024 07:47:08 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:47:07 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:49 +0200
Subject: [PATCH v6 13/16] ASoC: mediatek: Add MT8365 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-13-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9RBTFZeOuKXLXrXwZoDyc1QzgOCCMR27WWisOY
 1YDIi8+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURYhIEA
 CeXVUCni9rqNKd2DLi8IUlc5fKgW6IWa3fAQtP/LfODJVCGNrNVaCeHEsKaySSSiZ51dV7Uq2gjT+E
 a2JVk5eBflZh5FLqax8aVo4XB5BLdfoBmXx76vYPkjKj+eUOgSvkJrqt130CayO7pLPqJ3adUcqJWY
 LFuskW96CnzZsU6RBHianwApzN8MgBLGth5bJfkhxJug1Fq/L8UtN99sLrhBNw99OiKT7IpeE18LPv
 PEr1dyv/Y4jrVnjaLCvTl7Chlzs9iT4GsCyPvA1hhTKiipSGOLl9bvL3LatVpP/tA1a4HLBEclPylf
 7Poi5Hz1XgOw7AlBWqPavi0xu3DWXyEDJrzIT55eOSidGmuzhIhmu6YP1uzxNg0TAuRxeiJihcpsu9
 aLIiJPQEjlnbpHGTJhSWBmaXIfRJuWXpkOTIzGVX20xa0LKYatEjl1ExK8FFt+bPkLq6Je7Dr/Mt3L
 FHv/OVi42in/ARSAcVCuG53Ahp1V6DnqpfCqFknDwQQy0mb4UlZ+VBjSTHN7rzskOP8LBoejaU4JaT
 HXIz1AS9YEynRGgj+7VlYRasTcwS8iZ/j69SP97pCOFZ8ooWMp0DqbAwlN/xDx5/y0au4+I0L1U7Kf
 mXvttQiAEWseJQNaSwkaM+ANg6kj2tr4XbjWjTZL8OnPnRNs0E6j8ZbOGIrQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_154711_000018_EC082362 
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


