Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315C5C982D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=; b=hqyt2HfrabC/FSF9JuLNsSgTK8
	Gn9Cx0Ja0y/igBuKjj11mkPQS6EaGpUTzZL/zvVgTtAexh29DwkmiIw3CcR7tOA5xetNOrmWht82X
	qCVnylLptuIePY17Med61+k8Aqt1V5hBegDdcRPlS9x2SA6RrE9fWDrKXbwj39VX+uFtHcfSLd0SW
	MWnFGOGoS2T9/45q4GNz0G4gT43MEgUQGBdBzsNWUI9ThBQ5/uNvkRCDOUiTzbwFV8MfZ1qfO7X89
	eY8ang3LomG+nTUoKYL4srAq4a6s3Nq2bsem7zs5Scqy7pS7VFZErcrpZaYMkNHWtoOMANnc5pFA9
	7aqCiHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ypp-0000000EbT4-0yqL;
	Fri, 18 Sep 2026 13:41:01 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YpZ-0000000EbCP-3BQw
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:47 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ed9866so6368125ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738845; x=1790343645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=;
        b=ijlLtBzsZQOk9keyphtAbaT3tVGSCRnUu5vtC4Z9DHIK/I4Hy6dZ4xexQ051Mu8VXj
         VBuIChijV1xqZZyuKyUjeS8kcixOw/AbSrQ6UdP4Em1UK292P3K4Y22pif4k9Em3gMKp
         ZD07DCJwhOOjontpUS6CAsA192CgvB8UYIIupW7cQWGVirCczHY3nRZ1sIGoZ39V6ZRR
         16cSg46kqkFbLeEWp9IwjLJBFWUBrvSFAyBqHIkvcm21bsrS9JFh5AqTmWM+klX3fYG6
         9KflDxOQPjJE1ZJcFNrlTSD0ZgE4lTSoGSNmQaOFMNxFWDrtnXZ3CHdzgR/fXmcbIXtP
         jPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738845; x=1790343645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=;
        b=H4Vm+HQibWnaJMTkcuW461qPL3SDsPBnIDOromAzR9BZUlDQghdW74PcPIdqtfDSp7
         NbG6HuUXnOYCmKps3CHJHoLrKBpS8IOca4YjJD6nxwtnwC25yz6RtWS/9E+Fyxm/3EwW
         Sf4kPs/LJQj9DW43A0pQrza2egp80cAVYJihKj9N0J1+Jnqnux4LRJ10q43+NvTvqthZ
         6WQ7Epr1LqjSXX+A22EaIu6o61nO8Le6/mROplx/r+ftGz6Q4WpW9MT4EY5I8Vy88lxB
         jEsGwtJYqQj3dINfmc7Vg2F4z+18t47fHQjzq+U/Ro9GlYMhP3SOoSgNNoJ7Zixm4864
         8m5A==
X-Forwarded-Encrypted: i=1; AKwUvBy87TW6XrlkE8p1aPc5adA/63tOheKqaBaNk+b5QH0O5LhgZshHLgL5XUiqr+KONG6YM7S5lEInw+9Fx3b0sA==@lists.infradead.org
X-Gm-Message-State: AFuF++kUayj+5gUMMy7Fx5tEEMOn2FaJa2ojz/cieUj0Grc2eL8VwSr6
	t4T7SFSnsLfADRP9fhms7CLlzj2RTro9PrKGOYUcD5zxoTkLouPIZbyW
X-Gm-Gg: AYBFou32wEwYH0NtsoXo3kPsuLJLjEY1f196tIgStmelI8BW/CQNzob/n0Yy2BWVtrr
	ya0Ee7Bknz5yS2vDmpcepti3Z7cN8+KZKxesd32rmRB33U9dZ31Had/rhhaGaDj/z8Xn+s6IsPb
	cqxoXsuRMvYxDIMHE2S9JTFzBZCSSlJBQS+ddzmwQ9NK94v68UkQBUpJNU4rzEsNmx4Pf3pRbc2
	GSUUlOzuH9J0RIizv/R8PgD2oY4IMB1BbHFePEsdMoeL5wWd4ZZkoBQTzqF2yjzmBccG808EgDs
	qofNBeo9e6jO9H14l0S+IpcYpUjxioUUSJwdYMyTArWU+GsvPaMv6lF6TPt8V/OS0lDnIKNNaJE
	i9232bK6bT537TRYbq3LfuZJSHxT1ujelkp6eQW7CKydKloeyd8komM+Adlavh2cHC/RpnCTFUq
	Hs2mfp6feG4k7ehgDmGHyxbElLq27t9LrjhXYlqnLA38rJIexI9tNh7MmbBrwVcM3Ir2xGdrcfi
	0ne1CUmP+aQDA9eTpJIQSeVmdtBCth0jprksTJRhMXV5rIfWeDCwVW4lftuvHpDhuf7UjU4lAlw
	JgA1ez3d+7KE8NP77rSq6Khq
X-Received: by 2002:a17:90b:5588:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e54cbb4a5mr6454551a91.1.1789738844971;
        Fri, 18 Sep 2026 06:40:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:44 -0700 (PDT)
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
Subject: [PATCH 13/15] ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event handlers
Date: Fri, 18 Sep 2026 20:39:09 +0700
Message-ID: <20260918133912.133799-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064045_819050_BBE6483E 
X-CRM114-Status: GOOD (  11.73  )
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

Currently, DAPM event handlers in mt8192-dai-tdm.c ignore return values
from mt8192_afe_gpio_request() and mt8192_mck_enable().
If GPIO configuration or master clock setup fails during DAPM events,
the error is silently ignored.

Fix this by checking and propagating error codes properly in all
TDM DAI DAPM event handlers.

Fixes: 52fcd65414ab ("ASoC: mediatek: mt8192: support tdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 49440db370af..36fa0f32ed1c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -250,6 +250,7 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -261,16 +262,17 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, tdm_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, tdm_priv->id, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8192_afe_gpio_request(afe->dev, false, tdm_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, tdm_priv->id, 0);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
@@ -282,6 +284,7 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -293,7 +296,9 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8192_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		mt8192_mck_disable(afe, tdm_priv->bck_id);
@@ -314,6 +319,7 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -325,7 +331,9 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8192_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-- 
2.43.0


