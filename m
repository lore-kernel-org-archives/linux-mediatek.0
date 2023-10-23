Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8681DCDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7AsNVigM8lbJ2TEkTHkh3DJVAWVStJtaNwYVukOeww=; b=DTcuo/GlWIejHKrcSHrXv2Nkx4
	BdzlfvHFCtD4SGtcch62iri1RivZPU00KMOBTliJNDhsHfz7vfLzOINJ2aGYiL2XdhowgGaM9ckhS
	eTXQqPuVdmiM+6SckQAp7jsu6TGSbgYgGQMg4bXdTXplnBIuDFILH2DDhHffHa4wpQAO5x0vkstID
	gz8fmMZRUO36jnES50rdt/jGR8X6LuVZ9ZBaMUiesk8m7IDT7VpFrcRASrBloVKe+TJqXrOD2oq1a
	ZXCIlltxfQPqKF8zGd45sNmlrx0P1RiDNs7/pPUkFeLTIqN0AjVZZ6YEQ54RJOLx4YLz34ngAjJn1
	dPHUYj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurfb-006xa0-1c;
	Mon, 23 Oct 2023 09:56:23 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureO-006wZd-2X
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:55:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3296b3f03e5so2173073f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054907; x=1698659707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7AsNVigM8lbJ2TEkTHkh3DJVAWVStJtaNwYVukOeww=;
        b=BdSiXQcpqjeAYqqNLxjwANWwQa9DLK449M7QEaf7SOa0JA5wdTbgwbQRtUAcj1HbSo
         7HDcSD5xcgitHX/IzHu4oYY834lUSMh/sUY0p4LgFE1+xzglb9oaWOXG/Y/kC6sEhkEf
         dlA2mmffRcUmqmMuoSZObmWluuDhvb0LbYbfonCN9XXp3aLVIlJCAXzg20fg4HvXmC6N
         KG9kWncf8cR9lQpqUxwtow2Tr9dSswDIc1Sz55iXGpftF0y1XlJHH8mod1uzyfE/JgZM
         kmQveHVnInf1eiFI1u+8wtQbRIKWV4vpLIpujLbWIHCn9nMzzasvvMzyhrP0zP1KvBo+
         jOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054907; x=1698659707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7AsNVigM8lbJ2TEkTHkh3DJVAWVStJtaNwYVukOeww=;
        b=lwMgQL4mJYrnOoQwMO3eoojo+MAn2QCU2ephuMEwVKhEDapc1FJElBiDPkDKzfhwHI
         Sqs7llYLKlb02vDYtQtBl1Ovifq9ARNg9XMF3dqommXcsmFBQOOu7EvDmuayiEr0xOID
         pm76nC+0WPDzldl5jU87hSQJy3YfH+367w3teGp6woPG5hA2gllA/WbP3DGHy+T32Kb0
         9osZogqmyVJAOujRizTwLsn9aMvvhL1X/8Jg0l57pV3dsqnYWu/AqSgDJ5CX4jeZoW3G
         mEF5RJOEqDaqwhULE8M/7ATX9i463ofa2Yhr2oaL0Zv9ZjtsA0r1E6QJmW3io1O3cgXC
         KGmA==
X-Gm-Message-State: AOJu0Yxlf3Jjx0pbMS9U8uJFuBjTLzcASxWhR7kHHUd42lJhASPqfEvI
	eEJIUJrFv7hGEGy3ZCo//g+Tow==
X-Google-Smtp-Source: AGHT+IG0DaJTatBkYQl759RhB3DEXbNMmxDZLlPU/SGS2hOJRk1TRuMc/RVGopj7Uuqttkf+UNyBLw==
X-Received: by 2002:adf:cf11:0:b0:32d:967d:1baf with SMTP id o17-20020adfcf11000000b0032d967d1bafmr5476727wrj.1.1698054907228;
        Mon, 23 Oct 2023 02:55:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:06 -0700 (PDT)
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
Subject: [RFT PATCH 15/17] ASoC: mediatek: mt8192: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:26 +0200
Message-Id: <20231023095428.166563-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025508_867914_E2F4C82C 
X-CRM114-Status: GOOD (  11.62  )
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
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 4 ++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index 4919535e2759..36d33032a37a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -435,7 +435,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 			regmap_write(afe->regmap, AFE_ADDA6_MTKAIF_CFG0,
 				     0x00010000);
 
-			if (strcmp(w->name, "ADDA_MTKAIF_CFG") == 0 &&
+			if (snd_soc_dapm_widget_name_cmp(w, "ADDA_MTKAIF_CFG") == 0 &&
 			    (afe_priv->mtkaif_chosen_phase[0] < 0 ||
 			     afe_priv->mtkaif_chosen_phase[1] < 0)) {
 				dev_warn(afe->dev,
@@ -444,7 +444,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 					 afe_priv->mtkaif_chosen_phase[0],
 					 afe_priv->mtkaif_chosen_phase[1]);
 				break;
-			} else if (strcmp(w->name, "ADDA6_MTKAIF_CFG") == 0 &&
+			} else if (snd_soc_dapm_widget_name_cmp(w, "ADDA6_MTKAIF_CFG") == 0 &&
 				   afe_priv->mtkaif_chosen_phase[2] < 0) {
 				dev_warn(afe->dev,
 					 "%s(), mtkaif_chosen_phase[2]:%d\n",
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index ea516d63d94d..47dc7ec4cae7 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -623,13 +623,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8192_apll1_enable(afe);
 		else
 			mt8192_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8192_apll1_disable(afe);
 		else
 			mt8192_apll2_disable(afe);
-- 
2.34.1


