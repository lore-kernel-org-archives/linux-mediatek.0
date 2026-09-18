Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C090C982E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=; b=Px4LBkDVOxfuAUQHxkxn/sFwq4
	YTWn87BWqOTnEhqjHLJLCAXADXzayF8/o8hh2/CkgE236DrZRPUa1Tc+lp1eBJW9YcjDCs9XwHS+/
	EZSFCbslrSPiDh22Pr2BJWW6A5l+bqTxd0M6bXH3YLzy2FYjnzabA5EVmznwcey2TgSbPKm4OMIGp
	8MOVKnEDQFHgyGBxlXbV3nwOpZ8Ml3dJpuWLIOSTWnz7S+MMHSSJHaxdjF9E2LFKrkOT8k0STrv/5
	X0PlVxGlQJOGVHASIPRZqZEGL0x92S1DBTnKMnp/ThAEWVxs9pHjzkIcip1iU0vzNjVCahQZDxm6N
	WunqBLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypp-0000000EbU5-273l;
	Fri, 18 Sep 2026 13:41:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypj-0000000EbMB-0FhH
	for linux-mediatek@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=; b=A5dGkZnlhI9KNAZUt/8vTCKGTZ
	Zc7ipQEcWlhxnDohziLMoA30q4I5jLfSM3ekqU6BYsen8Jaa3wP2TaI91bjbSDmUIPtQkdvuToQH0
	jM9MOrkT8n/HmwteiqZSWrI1ts5niWIh2zpXWteWtvd+EXrwSFxkv7e/tXPeSIigghkP1wfCv407s
	Ksa1csCs05O5NW3vfqQsFJaKGb/rUM1lbpikgubqdSz46FECMCUqZlGLUsvr7Lw3HBRn4oBZb0VRQ
	Le2LZthyrPPcsYKbO+r3689ztJfICmM9G137WDoqSwXBgFAB8h8j89O1SemGzp6PmHeYEwVFDyx2d
	EiV48RBQ==;
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Ypf-0000000A9Q3-49T5
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:53 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so563749a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738850; x=1790343650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=;
        b=jKKcJcKRN/lRBB39qfr4enYgp7JoGRmZaMh8CbqI6N/Pb4gpVWSDs8XQgnV7thSicC
         Axv/3r6c7ajcTmu2EDLxpdDuy1nq5TtfyrLX3J4MzhKnUU10Jay19ovISz+oxo/6w/uC
         KGieqdOkgNmQW0nVHI539x1GGdoAK4Tk+Qa1zrB+nNmUQq7pbhCQafRUaKiQF5v85pzH
         gQAjKCRQd77e7aUqht94SqGiBT4YBlFy4GnccWZS9xECXiBFSWX/ZJBx4HLSO+F0brYQ
         aDG8UjLyoiRN6CjbfcSDbovc6HG7NvvqD+/ov/emjvCZBid8tRTs7WtrppHyXByAyp1c
         eHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738850; x=1790343650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84KmttxwxJZo38Fsi4kV8h//UiHGZgZirQkHOuGC9Ho=;
        b=T3lsgDcGqbESW74SrulWoBhwAQ4DdFGBTK34j8UXxK7+GJAz5nxANeZtkmOR2sO0bD
         /i3fXzTGUlF0mdxn4Nn3r3iFJDlVvjtx77px8JiNnfNGL3kRwVDAqZA4uHU6avXMMp+5
         pJH5sZ2IDsawHPHSbSPk9fe5omTyr1xSBc6QlyjpnEjPsXGdMPXf3giOV1pdZEi+pW8U
         BLG5fmJ2e3XlfkkQ0mzR/CaqDgFE9zb5bP2Pf0JqHlRR+VatZEhHu7QT5W7buQet+vTg
         oD2KPJyxGoGXzRJIzGBacMAskdWAT9WYmAMK8NCn/i9YTbM8ylLp4G/XHV0/6G2blX8j
         A7AA==
X-Forwarded-Encrypted: i=1; AKwUvBzZMsfRS+x89yf0Y5ui93ajBmsXq6zvcbDZO2BnypPSinGuc8FJGbdBIMZqXOC3h4Tr+6pvMiLleOKMoZT6+g==@lists.infradead.org
X-Gm-Message-State: AFuF++mZIBA4x7yeZsYiAE4wy3PVgxQQZ0MkM6RWTTrKzOBBxibamfEd
	f8iPXSVFMiy55uByJcm8IOTis9fEfWtMdvm0UYj/3+epmtlzX+7aRWXd
X-Gm-Gg: AYBFou1q0qrgUHPH9WXwPYjWPhRdenh88qtNgALsISpZnLCjJ/oC121MZPqXRbiDu8D
	oColduRtvOD7p96AqBAlkHvBsZaxR7oDjhgs7vuJhRcJ1X3+88DEGZ1AeyXAMig2K4B80EgTqGm
	HFtqMDb8YDZkJASY1n3PJzzC57fsRsf6jEaHrHitKiQHMtjIlr9E6/BFg/OMoZsxK6g6D1sLPZT
	r6G+imXTj8I87MIbx0J5PwfSbqP3Z+Sbgnf6zi7IbZrJfdcxb97mD0fXsPJO2GFu7ai9Hu3QO2a
	UCzsvesfLteOBVR0VjKawREOZ2YVwU5BkHbccMi9faBuOZ9znSX8hytewrM4vaDCHIj644lI/w3
	jNOcUTedWUHhx+dMSZChuDw350vzg/jzPGo/0EaG2yBe7u1OpInYxct/1akFlxZBEgZji45Sb68
	eZ451WWoAA9jm+z7N0RGD5ohBIqNCz2AaElKIFD6uCOCqVUouFspFG9LojXn9ppSatlkjkVeV+L
	scBvoJ1doQw7dTCQPkPzJ7UKqfo9NtUxa7G/Ze0AHtmW561L/psVornicPpkpjlAHB2TYDVhdZe
	TzENnOFnXrNZY7cGvYjzpJHO
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr5588018a91.20.1789738849715;
        Fri, 18 Sep 2026 06:40:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/15] ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event handlers
Date: Fri, 18 Sep 2026 20:39:10 +0700
Message-ID: <20260918133912.133799-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_144052_381700_7BC97D65 
X-CRM114-Status: GOOD (  12.28  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, DAPM event handlers in mt8192-dai-i2s.c ignore return values
from mt8192_afe_gpio_request(), mt8192_apll1_enable(),
mt8192_apll2_enable(), and mt8192_mck_enable(). If GPIO configuration or
clock setup fails during DAPM events, the error is silently ignored.

Fix this by checking and propagating error codes properly in all I2S DAI
DAPM event handlers.

Fixes: 2c37b4ed730b ("ASoC: mediatek: mt8192: support i2s in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 1632fc94776d..5608b534af0d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -586,6 +586,7 @@ static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	i2s_priv = get_i2s_priv_by_name(afe, w->name);
 
@@ -599,16 +600,17 @@ static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, i2s_priv->id, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, i2s_priv->id, 0);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_apll_event(struct snd_soc_dapm_widget *w,
@@ -617,6 +619,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -624,9 +627,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
-			mt8192_apll1_enable(afe);
+			ret = mt8192_apll1_enable(afe);
 		else
-			mt8192_apll2_enable(afe);
+			ret = mt8192_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (snd_soc_dapm_widget_name_cmp(w, APLL1_W_NAME) == 0)
@@ -704,6 +709,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -716,7 +722,9 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8192_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-- 
2.43.0


