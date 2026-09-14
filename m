Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4AAC88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=; b=ySjhX+NuslaicQcp65Ms532i/l
	tcshMGSSVU9y6m3Irwk91oJNyqKUgPrUHkPph/IgT124msD5cBghvTmgUoZ2fcTHPyVuUv2R+jsLD
	9KOTqlRgcmWiAXdBhYemJJET4qTPe3cO3f546uE5S2g7HknZAaIGMBzqepo3Da3MoHLA7U4wGTkvk
	If2pkziuJfuZZfAqRvnEOVxw8mRXatO9BfA4upvVAL6faCFnMHP8Cl+0sW9JZPZa8nqmllkUF8z4y
	J7oTif2FeqaJC3+rpIlE7gIClgIeht3FIqc5ZQGOrTf/2qLx+qAosDGk7vf1b3/yQO99U/fq0RJ4E
	8m0LOFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618a-00000002Z6q-3bEB;
	Mon, 14 Sep 2026 07:30:00 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x618Q-00000002Yt2-17OZ
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4493788a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370989; x=1789975789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=gamSCxY4rx9cn1jx+A7r+zDU4NG/3hlqprf8IvbkbVtOy1tdTJUUtUnuZYSnaUEUTP
         LPaQxRnMwEwPBMeQcVOZDEBWm8JV4hFWmNeO0iEGutK/5658qPkbnqUrYtIKThuU4KaG
         erzBmbOHE2fJp2JmZW3hz3CT0Rvfob47m2kYJaY/JJwdd96WkjZr8qxt+m1MVZtx2hkk
         QH32R+QX3++/Un4g8YSw/1N3aX8YGZxFLYJatSPXcAF5OsRkT6g6zP4jeu1KibE0nP4o
         Ar8q2vGbquyaZVASzU3BrdDYyjjiexlooezojmfM8PtG1fKlaNlON08WI9GiOquK9fbs
         8dzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370989; x=1789975789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=ftGxdLjUiQ2Dbb1dmv+75PpM84Q0uuX/N+NvyrDYzdnL3Wg9lw2pvjzNo7HjZ1DKcy
         doVZCb9veRIjN2loFY+maEFryqHVOTRLd57heqnFqw2hDqykRrq8EQMZ4HET0DAtCflF
         6ZkITHxM2uFoRaz/afBslHebpPtixI7m3M6v7W/l5YDgmja035lMVjgUYHVpKylf3u9N
         eBbgDfOQ+fMoEnr+POXb/ydNGGLDjcm8fesZjCe2hP+mtHw8Mz+S9ycvGSPdNjp1ljSi
         CnQWhCCvLsdaXNc8p1tDY/uU+FmPM62A68FxFVVpn+8MQFAk6YgN/KmXDzCWme6fEOOv
         ihyA==
X-Forwarded-Encrypted: i=1; AKwUvBxXzEoh0/Cxq6VaMXoZ6Qq/eMzsOyaWEk0tXf88LBa9ReW8xm94NN0tmH/zA1Jbay+XqdOqcFwqB2aHdtGRKg==@lists.infradead.org
X-Gm-Message-State: AFuF++lTH0cSG8SMOMkhB/gVnsQm+dKAYSTwgMUC0slUiaCJDuvrLVdL
	t4N3ciKtsYoaxWSIH0PlLCFDSVj0BZqv059E1TEtldR5tbGBlzduwumg
X-Gm-Gg: AYBFou2T0TVhOThbZbjUH4E/DeunWnPqNZk9Nhd5QGOWpMP6bEZE7gAwy/HkTUlpAap
	vlH74je/v8eEIczfmvUL4EBVPgkqsRRb4eou57cqIe0gpfDW8e82PjiHrGnURj/L4IfAVIfCCGF
	ckalyLrjtgWGhkLbqq7XAYXkqrXkFAvpaprHuupaxGcOnfMbr6hO4SJjLxxAykW7PCOB8kULmU3
	O2nooblgJMojU3UeM9qqDDrXkLCgrQzed6k86ezqwCxXKucmh2xct5AD6e5RARaOIYFbkwzIfkF
	bYmtZj8R4Qq9IQ5xC9UIcY3mjVp5qtAiIBbr5s/uj4Fziy38Cf3YxHWZw8w2IQDgeUf99BlCOMt
	5xR2yDEvUPWPC3tPSRqsbta7ZZtxpUT5VNOQjFVyfzn1uZRmp3OtXZ0l59UekfrtNEuBOOPruAZ
	3QWffeKMc3VN/CLSXZN1V5ZYQIXtdSI7lBQADNNwVhSlSxWOX9KajQdpCETbEgwqyIx8pTNvc1R
	1SLXGajaYH60rwcfU5Be55BCadJMcJF9gXj+izoWMJJAQEKmcIZ3cn2uSgGcaGcLi1ckShgTC8C
	PajgDZ02KPuFqE0=
X-Received: by 2002:a17:90b:17c3:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39debf6cf10mr3012416a91.5.1789370989442;
        Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 12/13] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Mon, 14 Sep 2026 14:28:41 +0700
Message-ID: <20260914072842.24420-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002950_311391_41C2DBDC 
X-CRM114-Status: GOOD (  10.80  )
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

mtk_tdm_bck_en_event() and mtk_tdm_mck_en_event() currently ignore
errors returned by the MCK enable and disable functions.

Propagate these errors.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 5d68a55ccc45..1b51027c6cf4 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -261,22 +261,23 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, bck: %d\n",
 		w->name, event, dai_id, tdm_priv->bck_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8189_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -288,23 +289,24 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, mclk %d\n",
 		w->name, event, dai_id, tdm_priv->mclk_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0


