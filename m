Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B311C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaRWK1PxbLteLkMq7b8+dA2nXiGKOdN1dmpy3IbpNyI=; b=ket+Cyy9EgNdRUUUtoAkrIB7Kz
	LsSmOedR3Kj7ZWfG26uUrUsMvQGBwc2e0hc2Py5AqhaFXTUUo2FZdDqo9HXAmZX2lNroG8hMeoQub
	vuqSbeq2JxzHOEkfGy/ehtBOir+IOyvs13YEVgVPSBnslyMMXjsNlfbXKZMO5hT+L0xI5xOeFwA2b
	K8MrfKhM42ueQGHZb+Syv6ro6pXTwJaso9ZU3y087VZSP4IAueLty+YvgFB4im4D5uZHXYogmzdLZ
	BoHvl5xHp/+IfSmQZIlD28AnWQcLnj6Riu5e+IfLPosOI9pUzdkfThnsDtkl81YuSKqAJN00gSSDq
	npo1frgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurf6-006xCn-2B;
	Mon, 23 Oct 2023 09:55:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureI-006wTD-0u
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:55:04 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-408382da7f0so25697845e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054900; x=1698659700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaRWK1PxbLteLkMq7b8+dA2nXiGKOdN1dmpy3IbpNyI=;
        b=esHc+EoF6WdlPfJmdL0KfxtdYih1kgszrw636u8xCo4G6lsTSt5tRbZPy6Bqyi0QEa
         Jp2hzdORhASP1QFR84inIhdHXW1dULAMvUrqLEKnxU/Sn65JYH74hptzky6ZuAUzQGRQ
         CjHxUMHhMZrJsM+EJXtc4CsoDm10VQQEjln42ed8dpBrv0nWaNEkmUDtiXQx1jQEaNQG
         uoJZ5KKe54hCw0T7b2ncLBFiv5SSZJAEEjNpghNIwHeQaVMQuXqGT0HnXHcU0uEPB7Q5
         80LTi9mqd6FS8eluGAjfGoyj/RAyCzBP/pUD3lfQYtEXjuvek0qJJrGObhH8OaKEi/ov
         lLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054900; x=1698659700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaRWK1PxbLteLkMq7b8+dA2nXiGKOdN1dmpy3IbpNyI=;
        b=b5IEYV5S5lkrvWkpuQ35/bb9Rx/dFB2QB599xWva+gBs53hhcNU9BLbwfLI+JBDJoR
         vLJVB8BCqK0i8I5LSYbpIK4g1+xDeARNV+ltpqT3MWSTOLkhC9cY9LMuSRaRuxYpKW6Q
         0Qr6bcfkD/Bz5lC3HVJU6jUqayp/aQPjom7tUkECySBUnOl/UP6L5IvI/tW3P0ybwqKI
         sm8BxSnSTFscQ6vYVfCHSV2zyxYwnQqUyO9QdGByFEYALNc2FUboQLIR+GxdNYLHjKq2
         DGyar0KZ5s2syrT3Pd9TQ1fsgUOhQwreKEARzxqT/9W6zjRqucSMGyELDeOyNYqwgCZV
         bCoA==
X-Gm-Message-State: AOJu0YzIc5+m6GUGHTyzU6P8iHLi3h1UkMJpeLpPZFGOkZBtnJPNP2cA
	wFP39mqsHbeZZbsvlC1RAU9l/A==
X-Google-Smtp-Source: AGHT+IGcRnlB4vFMFDgducXrQmS80dOVHAS+aDCp1wKs33+friJEQiADUVo77kFzrMbe1bXLDVGcYA==
X-Received: by 2002:adf:fe48:0:b0:323:15d7:900e with SMTP id m8-20020adffe48000000b0032315d7900emr5319691wrs.53.1698054900441;
        Mon, 23 Oct 2023 02:55:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:00 -0700 (PDT)
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
Subject: [RFT PATCH 12/17] ASoC: mediatek: mt8183: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:23 +0200
Message-Id: <20231023095428.166563-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025502_394228_BA7DEC41 
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
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 8645ab686970..65e46ebe7be6 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -276,13 +276,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8183_apll1_enable(afe);
 		else
 			mt8183_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8183_apll1_disable(afe);
 		else
 			mt8183_apll2_disable(afe);
-- 
2.34.1


