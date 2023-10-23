Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E56C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJErgU+nUAjpf1N+MX3RFSZtoYrYFdNiReNrVNbPccY=; b=rKpG+4a/UcYqSOHV0TDchi9JUK
	Lej97goOrQtK+XqvJeMfHHqivn6zUO3MRS9dzuU3/eCwDGkkgxAUp2+/rsbdsvRQxO24Qs6dOMEn8
	p7zrygdXLZdrwl7r2wb3iM+k7d9k/eWDrgvmYsOQ/VC2RrrI/smjETQoBWXk81DWtMTIVhu9B9suW
	+fCQnF0Fw/cp5vleP2BkHgo154hirq4DSgXBrRzrfYNUFR06jC+rQEeaa05ajLwUSbYqdnW0Yrhab
	NecRTnXIl2Qwq9iqwRlD1yoErW/XIFoPA6RNM8Q2RAjHuzm8gQxDUux0WkwuD7VCCuUCf8lcYO5X6
	PUDCnkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qure3-006wEx-1I;
	Mon, 23 Oct 2023 09:54:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurdv-006w9G-0f
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31f71b25a99so2082847f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054877; x=1698659677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJErgU+nUAjpf1N+MX3RFSZtoYrYFdNiReNrVNbPccY=;
        b=hn2QXz4HpBOS/dSKuoFDO12npD6Kfhs1aDjN4EtBlT7QwBaNfLxflKyxKdy8TVJy3F
         5RLCUGrO02VygmiMJBOjNs00FIZv8MWk9XV9FmYo1TV+sZYyaZ0+GinF4FPS4cXig4hs
         2nH2UJUTg54t1OBRCpr3iuiYo3yU0MWXObYWXDdawHgsKR0mNU+YuyKZC88k1AkVYPVt
         1bjL2NQp37wksT/1KjCG61ANTLEhCtwmcu8YJaVXYrcH0xiPLULvKglUeTzpX1s6zA1M
         iDUh2m+z7uDBFm4prgEn4P+mQlJ3BVXdpED52qlgux0sRjW84WKX00OfoycqanCSOS1P
         +bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054877; x=1698659677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJErgU+nUAjpf1N+MX3RFSZtoYrYFdNiReNrVNbPccY=;
        b=xNkCVyh7ow+/+CVD86pO+66EoMHDipgU07837aIXyub4Ebzdi0G3UlKw8Fr+coYkzx
         uYp7hBP4rV9skaSQVMfeZvZYqa/DYmWtRZbdOxvlFw8OWP26YMc+YiUHbKYJMDyjo9bp
         UW6tYSB4ISgpHfXSDCsqa/5Qxo3PfbSb7Pt12jOqxMbrFlQn0NDdfvYXh6hHIAoCvWRF
         I4MnXZ5DCAIji9gOFJ1CL2MYpXHoGFdLXPH4K1yNiGZfHKhnN4dEOSJBwuyt8E2FTZPa
         kO7mVM04Po/vPn0QU6qMJqYnzTTPHJyf3YzndTXsORR08wAWtMMJDBjYNIuOAkv4o5KR
         wwUA==
X-Gm-Message-State: AOJu0YwblpPNARUY94eDWEKlgOta/P86WQNzNxH+kphAvaEtvp6xp5sX
	XC8nc2uTwQjYt+oebEdYs7GZ8A==
X-Google-Smtp-Source: AGHT+IGm+wzbFOSTt4RIIX0gXAgxOLyRHhiU4Y3meUgY+Qffx0kn9EZ6h3swR1er/PSz6I6OP4nsNQ==
X-Received: by 2002:a5d:4483:0:b0:319:8a66:f695 with SMTP id j3-20020a5d4483000000b003198a66f695mr6356947wrq.55.1698054877529;
        Mon, 23 Oct 2023 02:54:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:37 -0700 (PDT)
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
Subject: [RFT PATCH 02/17] ASoC: codecs: adau1373: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:13 +0200
Message-Id: <20231023095428.166563-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025439_260216_1FA4931B 
X-CRM114-Status: GOOD (  10.83  )
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
 sound/soc/codecs/adau1373.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index b0ab0a69b207..3582c4b968a0 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -834,7 +834,7 @@ static int adau1373_check_aif_clk(struct snd_soc_dapm_widget *source,
 	else
 		clk = "SYSCLK2";
 
-	return strcmp(source->name, clk) == 0;
+	return snd_soc_dapm_widget_name_cmp(source, clk) == 0;
 }
 
 static int adau1373_check_src(struct snd_soc_dapm_widget *source,
-- 
2.34.1


