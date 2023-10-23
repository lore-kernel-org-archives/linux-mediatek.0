Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C95C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iygGW2h2lVMWeGfG3UfW0SGTTyTrk1COvj9PMOD/Pf4=; b=jld1iihRFXdquvJXVL8pj9rS/B
	v16uI1+pGMxObBENCfOGrDj7a33Y9Vp7UlwtQkrOyJiXLU9vBWGSw87wbuLlWq4xnkt1SixqhHXz9
	QCMoAMxGYDfrXHr4fZ2t469WFThQ6TyK6pOXb8a+1GTxn8KM6vd4GSUg/VHQ+ZFYQNYntl3az7E0f
	+Kf+nODrIIVrZeKbVg+wOyqkVAaYC0I64BCsILLNlHLbRkbNCIXqA2xN0nAuj/nc3Uvmia4xLOeTw
	sS3jCxUvugOJChbB3O5tWQxbej8K4d6440dCowzKc2dZAhfhZ9+q8SkJHfvf5Iz2k6nBxTjHgCp5j
	SpMW0T2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qureX-006wiT-0d;
	Mon, 23 Oct 2023 09:55:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureA-006wLN-1u
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:54:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32003aae100so2389402f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054893; x=1698659693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iygGW2h2lVMWeGfG3UfW0SGTTyTrk1COvj9PMOD/Pf4=;
        b=DyRd7VFzmecXs5Ikr4BixC8DARKe6wTTaT/3gZaD9zNJgvkzmwrZypRGlXv12X8u7O
         S+ZnxMbWifDHn9cWxiFOUcVl+W+INrMxKZugGhgnpLwIdAXYF747sbAs0BvZo6Mb7LSS
         y0kH8KBspor5nPJoxx+fuRkY/7WI3cJoYXD5WKZ7n+QLmK3yudC1MgFA6iBJSnusRaWN
         SCeS3m6/hpMP848dpAbSY9uF+LhJ0Jrcwiez/kAJSngd4jjaM/GnwT5aw+mbeJzpsYPC
         8/WIbcteLLJZ8fVAkUMgTdwmHHNxTC/YpA7Sm+oeNk7T20bqUZ4e4iGCt3og1CuC1Pn1
         yorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054893; x=1698659693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iygGW2h2lVMWeGfG3UfW0SGTTyTrk1COvj9PMOD/Pf4=;
        b=QuoIIHjBBLAH+LrQcxsdI65KcwcTa4N6zxeBMkSktUInAA1yG8lIoi97NJksyalLxg
         6iBuVzwZky/DcBaMXA7ccRV7IZCIliJmQzMYodAKvGroYfSUp2PHP6CqZIdqg535Hbsl
         FXNl4TLaBdcsOWdSgM7uDQW6+EdabmBWMwlBt8LSe9UcdvIXlwpyoScmzY5jiG5Pootn
         NX9/oAZinFbp8c8G/7ucdMKyFCOPqu3ilwfIQUqY32kLRlbp2VKKdszS3Fpz3PktSXqA
         ISI95W9yYUk2eznUWhszWcrWgYnymWaO36Kw/GiycW6idTwMnOHIdcW9fUpTJpu/biGm
         YrBw==
X-Gm-Message-State: AOJu0YxOVpGogNAJDs0WO00p+w2azAEjxKGuF2FqBWRrGCU7pomkSmV5
	QkE/+w2Az8W/WYAXtlgsMJtGsA==
X-Google-Smtp-Source: AGHT+IHTc2UW0PcRRtRg3EJmwXBDKZ0rRGICIe4tZ3tRk+SG6RlHUvnvHSIX5664+drOKrq+nZy8rg==
X-Received: by 2002:a05:6000:92c:b0:32d:81f9:7712 with SMTP id cx12-20020a056000092c00b0032d81f97712mr8264026wrb.20.1698054893380;
        Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:54:53 -0700 (PDT)
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
Subject: [RFT PATCH 09/17] ASoC: codecs: wm8962: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:20 +0200
Message-Id: <20231023095428.166563-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025454_667608_D6D5A98E 
X-CRM114-Status: GOOD (  11.40  )
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
 sound/soc/codecs/wm8962.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 83ce5dbecc45..fb90ae6a8a34 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1854,10 +1854,10 @@ static int tp_event(struct snd_soc_dapm_widget *w,
 
 	reg = WM8962_ADDITIONAL_CONTROL_4;
 
-	if (!strcmp(w->name, "TEMP_HP")) {
+	if (!snd_soc_dapm_widget_name_cmp(w, "TEMP_HP")) {
 		mask = WM8962_TEMP_ENA_HP_MASK;
 		val = WM8962_TEMP_ENA_HP;
-	} else if (!strcmp(w->name, "TEMP_SPK")) {
+	} else if (!snd_soc_dapm_widget_name_cmp(w, "TEMP_SPK")) {
 		mask = WM8962_TEMP_ENA_SPK_MASK;
 		val = WM8962_TEMP_ENA_SPK;
 	} else {
-- 
2.34.1


