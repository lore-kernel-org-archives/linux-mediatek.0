Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AFEC004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sijvR+hKjJi+AfXfyjsruHtUHe1YLoATqzDljEq9PNo=; b=uLDdRXUp1pfrnYNiCQhs+e0SNG
	OKlbcXtFHgGzgaMSA6aoxNjb91wWy9lsylJMuOxSnKBxa8OmCGwB988Y6zXWiBM+c+8QJBxSd/iiR
	Xzjnh+3PqZMIx2p1CcNxDKRbHccK3TFeOk1i6uvRgG3GKALSfma/v9b4vF83mpweO2YUUgLdWTheG
	ArWx+U3x+scdnH9MN/5MRYOtiZZg6h/NNjbYLpMjZjACiAp/Lrt0Fplq7A/g/UuAi4S0Mas7WUUDQ
	GUYgide2FyKSTJjQxS2wVwTPyYZCkoVygLNCobk2ETEn2wgMaf855N1ve9xnhElS72bBFUC8zvB2l
	YTWz7CHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurfF-006xL1-3B;
	Mon, 23 Oct 2023 09:56:02 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qureM-006wVf-2T
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 09:55:08 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c4fe37f166so43316841fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 02:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698054902; x=1698659702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sijvR+hKjJi+AfXfyjsruHtUHe1YLoATqzDljEq9PNo=;
        b=mTC692F/FVYfYeghQDaoFCkfGdde1MgeV011RKQC/W6jvzEkQD0I3HS/pfYZogByTs
         IFBdqZC/GD0nwUhj/GNmrhmpPVEaPXWX7b5uXgEQte0+suTg5s1JDkYbgq+kIdEzS6L+
         1woG+LDixy5G8+nLdorXTwf2zfNmAcmMIKvEkq5jRTezUfgpVCqQD3lxvHhy+f8yIxM7
         mhZQ4usMMxw0cEUSpn1OnSXT8ZIPaA2byV+bzI344dIwIJ8Hd11Ix/U448wLvlFgedG+
         No2PRAVkpDXZ4Wmu+XX9GlxUIFQCUtc+VI238vg8XcvXuHbHEVvNxueEeSYZUep0adOw
         tqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054902; x=1698659702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sijvR+hKjJi+AfXfyjsruHtUHe1YLoATqzDljEq9PNo=;
        b=GkVtuZO6zuW3EelFJeXDlF4eCXVGyzZap7y1z+We2LDGR/jlP8sCACYLX/MYXU75/A
         0haUvulXJpAOMJpGK9JCUopnfooUaHc2UEFRsN6+VM7ukuFyOV6Ap3kbpHuY8f2VB3qR
         byoyh8f1UFjho8EDUNpD0CAF9XQLMebWEbdDhNtojxz2glTE6W4AWG/a0R34oStoWLfO
         cH5eI5TkkgAr1/Fk9W5tmPVvJT3lwMmv17biJejAjCdGjEmCopUsZbDkWBxWfW2YMXUF
         ooUxFTt9NhWXGTNuPrHFT2hH6rOVbSU/XnOdhh4/dJZA2OqnQW1UyqNyMS3rDAutaQkL
         0T+g==
X-Gm-Message-State: AOJu0Ywo1ZsRPFrIGXUDLfIlGLz0zzPSq1VsebkxHYlIQ3Sb08dpmNFm
	m9t7E7WUCYBcD1lcwf6rutDudg==
X-Google-Smtp-Source: AGHT+IF54Qe6n/zvNqpT0Lxz4KVrjRL1LPUYGQ1mvRY5NOKen/Ok/2JBtT1ZFsNaf/o7AVD7jqRWnw==
X-Received: by 2002:a2e:a792:0:b0:2bf:e9e8:de23 with SMTP id c18-20020a2ea792000000b002bfe9e8de23mr7862726ljf.16.1698054902708;
        Mon, 23 Oct 2023 02:55:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u14-20020a5d468e000000b00323330edbc7sm7428801wrq.20.2023.10.23.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:55:02 -0700 (PDT)
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
Subject: [RFT PATCH 13/17] ASoC: mediatek: mt8186: Handle component name prefix
Date: Mon, 23 Oct 2023 11:54:24 +0200
Message-Id: <20231023095428.166563-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025506_809196_D7A0A483 
X-CRM114-Status: GOOD (  13.91  )
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
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c    | 2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c     | 4 ++--
 sound/soc/mediatek/mt8186/mt8186-dai-src.c     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index 247ab8df941f..85ae3f76d951 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -321,7 +321,7 @@ static int mtk_adda_mtkaif_cfg_event(struct snd_soc_dapm_widget *w,
 					   MTKAIF_RXIF_CLKINV_ADC_MASK_SFT,
 					   BIT(MTKAIF_RXIF_CLKINV_ADC_SFT));
 
-			if (strcmp(w->name, "ADDA_MTKAIF_CFG") == 0) {
+			if (snd_soc_dapm_widget_name_cmp(w, "ADDA_MTKAIF_CFG") == 0) {
 				if (afe_priv->mtkaif_chosen_phase[0] < 0 &&
 				    afe_priv->mtkaif_chosen_phase[1] < 0) {
 					dev_err(afe->dev,
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
index 33edd6cbde12..75cb30790b1b 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
@@ -47,7 +47,7 @@ static int mtk_hw_gain_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, HW_GAIN_1_EN_W_NAME) == 0) {
+		if (snd_soc_dapm_widget_name_cmp(w, HW_GAIN_1_EN_W_NAME) == 0) {
 			gain_cur = AFE_GAIN1_CUR;
 			gain_con1 = AFE_GAIN1_CON1;
 		} else {
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index f07181be4370..7c4021221950 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -393,13 +393,13 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8186_apll1_enable(afe);
 		else
 			mt8186_apll2_enable(afe);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		if (strcmp(w->name, APLL1_W_NAME) == 0)
+		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
 			mt8186_apll1_disable(afe);
 		else
 			mt8186_apll2_disable(afe);
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-src.c b/sound/soc/mediatek/mt8186/mt8186-dai-src.c
index 67989ffd67ca..e475f4591aef 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-src.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-src.c
@@ -322,7 +322,7 @@ static int mtk_hw_src_event(struct snd_soc_dapm_widget *w,
 	struct mtk_afe_src_priv *src_priv;
 	unsigned int reg;
 
-	if (strcmp(w->name, HW_SRC_1_EN_W_NAME) == 0)
+	if (snd_soc_dapm_widget_name_cmp(w, HW_SRC_1_EN_W_NAME) == 0)
 		id = MT8186_DAI_SRC_1;
 	else
 		id = MT8186_DAI_SRC_2;
@@ -487,7 +487,7 @@ static int mtk_afe_src_en_connect(struct snd_soc_dapm_widget *source,
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_afe_src_priv *src_priv;
 
-	if (strcmp(w->name, HW_SRC_1_EN_W_NAME) == 0)
+	if (snd_soc_dapm_widget_name_cmp(w, HW_SRC_1_EN_W_NAME) == 0)
 		src_priv = afe_priv->dai_priv[MT8186_DAI_SRC_1];
 	else
 		src_priv = afe_priv->dai_priv[MT8186_DAI_SRC_2];
-- 
2.34.1


