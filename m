Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E5ACDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uu/sTtccUwF0ah9E+SK4dukpMAzlv54jZyNo0CSiF0c=; b=XuaazySu2PvTQXWidfDLfj8inE
	51zObn3UQ5dNZ6QiXdn0ZQkKi4l7EPDlRJmfAdNLTIbJFLHHBVA9O5Q/Iitim9Oo1I629kfvU/ki9
	7YabM4EyRsANU56tTwd+TsNFAqZdFLtgqdXXz1TZLvZIkLJm2nIKNgzPjoNjvq3zbMH3V9+84kneg
	zt79ivqIbiQLJX/zeHQ/S1kVlCvzwuVFTG6+VQzxpK+c8vDaf6UUR25ZLl6cHfkLyGnI0UoZjbYjX
	inD3g/Z/m8QVE4GoDPgWRDggZ6YiAEJdm0xVKpLRSXkgAysM7NXTlhJNHvJYfF4CUz9e2UvRhwSa6
	wIattr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurfF-006xKI-1E;
	Mon, 23 Oct 2023 09:56:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureM-006wXN-0q
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:55:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32da7ac5c4fso2149103f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054905; x=1698659705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu/sTtccUwF0ah9E+SK4dukpMAzlv54jZyNo0CSiF0c=;
        b=Uotgxo3bE1iNVmngUF9VtWlO7cmMEMza37WNVRYfRPOCHV14xJopkoBfkRNfAGVmVU
         /y28OnW+2XdBdpfFrPZG+5wDMaFLQ/FH0sYY2iHkoAO6MVssL8FG4be4Dc1y8Q9ejjYE
         9OKvLiuffjsXAWiiJNakxHVR3crcLBeo2IzxC4UCiF0XGRQa8OUmNAScgkUOBcV1C++M
         Teqpqaqk3xbbdwWTx5xm9Ky2K9CD9ADuHdvZvi9o9sxx/eUwjAxF9aQ/YP9TrlQUtvG3
         af/eeQ21Ao2Fnu3J2mnJVdRQ1H/QzDsC+IsEmvdVoyz1CbWJLp1mJZYXtsEk1xACHKzS
         TX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054905; x=1698659705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uu/sTtccUwF0ah9E+SK4dukpMAzlv54jZyNo0CSiF0c=;
        b=tmHAGllx0dlYS1PFbwy41/kHqQXQT+4nnKOjGIf4OXA0bJ/Nf903ru6Xk1L6JKWcwW
         1PIUP8LsD23ZyhEb6zV8c9ro2Rtd9t1f9EP7qqyakwrPSExAnAORU3N5j4FLXwSWi2oz
         LdFdd6xXT5WibGYdPRRE90ZjG+c0LgMqwoMvJ2iKPkshSaux5cGSg7Zgz5eEAVg1scls
         1XsdXCZElaPoSPQ2owbTJKVYdpKhSrasfircq3qNUsJDHJYXnH+ZA1L44uWfYL8ZjxR7
         Z0j/9ZHzhwV0UhacpOlQdEby1IijEhtjqNhKI1y10tBbh61FSMt4ap39n4/LopwWljBm
         fgYw==
X-Gm-Message-State: AOJu0Yy/qbPHeceJGE/QnnxD3Co+uksENLdZA1DRQTNLUYyB9o56oBnF
	BUsDl4H8GkA0RJKd7r1QO6Nx/g==
X-Google-Smtp-Source: AGHT+IFC/yAsny5qrYVg+EkJz4fUi483BdHJQWDTMZauGOFIlXds5DqFSdeJFZSj0XyhBOmMbTRyIg==
X-Received: by 2002:a5d:5267:0:b0:31f:f65f:74ac with SMTP id l7-20020a5d5267000000b0031ff65f74acmr7213785wrc.70.1698054905019;
        Mon, 23 Oct 2023 02:55:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 14/17] ASoC: mediatek: mt8188: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:25 +0200
Message-Id: <20231023095428.166563-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025506_297627_985A17DD 
X-CRM114-Status: GOOD (  11.02  )
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

Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
to include also the component's name prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
index 16440dd0a89c..2a48f5fd6826 100644
--- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
@@ -576,13 +576,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8188_apll1_enable(afe);
 		else
 			mt8188_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8188_apll1_disable(afe);
 		else
 			mt8188_apll2_disable(afe);
-- 
2.34.1


