Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB23C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZC07USduWdC7NjdC5xCXcdF31ciW6Iy95zkt28zTytw=; b=QUtZdmwKq8HDhminPZLkUfLWKJ
	0skEvBtMKhj52SNcm78q5y4e74a5sGARiEe7Ars/Dnf3Y2qQLG90sjWKdRBtG2PEW9RGTLJxwYZi2
	Nj1rBpnyjJOULze9Uzawd6xF38JufIjc2s+5/k32A3+rRKKcK701U9pNgQCJ+u/V4QmFzRvkbJqul
	oFylXxvYOxN7I0B3CGU8naAHIPMxtOy5LDbHErWFtkZTewS5e+G+7TIy9lAQufQX0ZVP+3w9mj48D
	JeIT8/dqzBnW/E8iiv2Rq3OrJvuzl+Pws6uXvrJg/I0mPjEE7AbYpxgWgo0+UgVRqFCHB9SjHw/H0
	m3UNnwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurfm-006xhP-1C;
	Mon, 23 Oct 2023 09:56:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureQ-006wc5-1v
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:55:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32caaa1c493so2237546f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054909; x=1698659709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC07USduWdC7NjdC5xCXcdF31ciW6Iy95zkt28zTytw=;
        b=dIG6ySz/UNEoLYPwgtadc2X+sSv01tJlB1FeTRkt2fXnZd+hd82JkObhbIOdPWFYuv
         h7aMVdK7fpOk3orO/vKlmx4IshaW20kZJc6yiqBExPoaaAQB9wNd9ZLO25kKKHZmascq
         3yhpdBkItrKh6vRWx/6/lo3UdeidyKpYFZuPlBiAqWRji4Q9HcC0JZJ7gwrFzJVARCOj
         th3uLemccMQwPX6uyEZu/e8LIsxlBed1NXGhc2BskukDUsUwN43S4DLADy6pp8OtzphK
         DXZ9vWnKPgbNI2SWYoomEnBCLVh64NPnbJjyaZgR0x7C93j9CKvj63tP7Orupqw4MTYM
         nTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054909; x=1698659709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC07USduWdC7NjdC5xCXcdF31ciW6Iy95zkt28zTytw=;
        b=nqfz5Ilw1bNp8+/sKm87My5u9H2cFoxCYfPV4Khuh9Zz2WWniAqFlnmMx0eJAhfapO
         NOyYa3+9DkrQBQZbJZCXges8cTEtmH7fzbx9ZklXBF5tjtV7ruuBaEi4Uk/C+zgd+HXX
         wT174CFMvt0qF767dqz/h+wRoCRAv4NyP/qh6zPlWp3J56t/9ey1KlO97ccGsHUAHbYh
         1i66tDYBGhHCrNZ7RuJYkGPnFWNP2sIgQ1y9+Wsoai0fiiGRR/dFDCYHG8mBt3d2sS6m
         R4lZlOu30n6V5vIvKF2vHvexiWfrWr47TjrizoU0tlaGlk1ZlG4QfJsdMv1u464/OxYv
         x3IQ==
X-Gm-Message-State: AOJu0YxB8NiwfdF6zmUYVmxOQ7+xwGFPQgI+L8EVFMdPzJwZFYchsC7j
	RMrxqOSZ2nAaWlO2fScs0TD0FQ==
X-Google-Smtp-Source: AGHT+IEj7uxeA3nMNUo9sdq2wgfqK3o3A7RdYb9gMk09HGqmRvuI7EP8mG67nJpViU+BpTyEwFeWzQ==
X-Received: by 2002:adf:e80a:0:b0:32d:8c6d:cda4 with SMTP id o10-20020adfe80a000000b0032d8c6dcda4mr6419354wrm.43.1698054909354;
        Mon, 23 Oct 2023 02:55:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:08 -0700 (PDT)
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
Subject: [RFT PATCH 16/17] ASoC: samsung: speyside: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:27 +0200
Message-Id: <20231023095428.166563-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025510_663422_5DDADE16 
X-CRM114-Status: GOOD (  11.29  )
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
 sound/soc/samsung/speyside.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 43519572dc69..79476e8eb680 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -111,9 +111,9 @@ static int speyside_jack_polarity;
 static int speyside_get_micbias(struct snd_soc_dapm_widget *source,
 				struct snd_soc_dapm_widget *sink)
 {
-	if (speyside_jack_polarity && (strcmp(source->name, "MICB1") == 0))
+	if (speyside_jack_polarity && (snd_soc_dapm_widget_name_cmp(source, "MICB1") == 0))
 		return 1;
-	if (!speyside_jack_polarity && (strcmp(source->name, "MICB2") == 0))
+	if (!speyside_jack_polarity && (snd_soc_dapm_widget_name_cmp(source, "MICB2") == 0))
 		return 1;
 
 	return 0;
-- 
2.34.1


