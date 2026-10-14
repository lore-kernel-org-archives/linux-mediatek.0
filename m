Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6D5CC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=; b=3W4FZj3tVzW+EVGh8FRvyW2O8n
	9QGdbZVYniU7lgcVmiFZFIjZOP9gzUJj8yG2y7pCq2qdRSH9dldKpUdY9nC3vkVTbczzhe+cUPF6q
	+iQf3UYXTz0O3Peyw7IjRxiugcSH2qeXkBKaRp+3KjiaaKKX+2CokyKJIwW0UjPt1BxIyhLw+DjtN
	u9U1e4N3MklgGDDQFU8PKnYkIMXB+JGSpbJZZZINyhfFV0ivlMCfzSei68GGnEFLNcdNfyVsz/CJC
	ZSTFi316ea/CyjsLqYa1XooHe+LUbjOz80q7SMD2A4TRVh67zCK1p0VaKgsZM+rfAUhk8O+M4f3Pg
	4edvUKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBG-0000000FKcZ-1Jme;
	Wed, 14 Oct 2026 11:29:58 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAo-0000000FKMG-2tBv
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso1729131a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977370; x=1792582170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=;
        b=gdY9u8xZh3aNZ82UVCmbDdxgnlu42nrrof8hLYTElfbpOytKs4Yq2lNiMeg6m8p7HR
         5Y9Y4WLMZhoFHiBwULo+Sel/3yDeO/png1z4mbLHGrWogGigQ3tkj//OQC9F3USYpbcc
         qaMT+Ws8awhFQaC5FIcSCaYNTDg3xPMVWm+uBtXmQm4TIWdWZJSjnkPLEi/ecO+XKoy7
         6KBTXcdXvvymRL2eqkYUFor+BDnDlX165mYHmeuWkxlxErhgmsq6xU+DV5sXRBQsYc7r
         N4a89vfnHfpRGNQIpfLu/iGD2ulncLnQuCOXPlKJ8uYzew7jp9njZWMWuFPbeVO/iCw4
         tJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977370; x=1792582170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wf0tXzvtZuJlGGLGeU2mU+ZL2tYD6FeowFtUppIfdlw=;
        b=ZPvdQKNDGiSt+k7nOnJviH1vHIhoU8owGVevXw5CkKijVxdOlgsO/WBHBdP5CxDpzq
         00KfJ1800oAtBJHc7TwJmolikxr3GMlH2JLFhWxq3qi7mJ+jinV8ptiubYD1CxnUIZwW
         nKfnDvEAzEDk+p8V87YkB8eMx37Q5W99SbJHvFf66aXRbikWzp3fn8Y1415NhPyxdntv
         KI2YV28i0ETmE6ugKG1ZbLfCoLsKzcihKqw3yNndQy/jXPdGJvKnqBBcxfq1B2WIXX67
         lpzrq7sHDE1U3U5yHl27Px11a50gGiMOh1ZC63XCoijmGZuJd0QFGqkdiHSMjhF6oYhZ
         c9qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ+EuuoNfIo3otW/mKWoko1jEiLwrBiG1vdKI63TvteppArLmMfZkEOyQnFRrpJltJW7IViIZ+ghD2V7X7UQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK7r7N28o9KEMqbX196QU54SL7U3x6rgyehcrPKOQ+L1atLL/wO
	5nG+u5DSfv/8h6Zs8pLdkrLE3s2R7AbMhAVMGKrNA/cpIJA9nHlsahBW
X-Gm-Gg: AYBFou2GnqSizw4bs0FoGQ1oNCwK5Dx/8IqBDEyMdadwMb2UUIYLEUSOBXHcXsYqTAY
	TCJ2rWcy0We00MwGpHs3OdNy9NUbexwe93rMdvg6ymAC8AFV7UWCalcsrPQsP7CBTbuPdiNIuyh
	G0yn1VZNGDKa/p+s0EKUlL7KpKz5zXh5tr1bhEC2Kv0MQoNAw90xrJeFHATjv6hGHLHy3pw0Z1D
	HbmKmBLgxBKhGTjdlog5V81kK5qmdbdG5hxxiHCwqnbOjL40opFd1iFwPmK/pwrqsudEzYZNULk
	Hyh6KCdLvxrjK8z2Czpd1LczT/PeAABIqXAYTWmgHVTRAn2ugrIxntVToEq5l9QAiXxB8Yk9xmi
	Xl7/t6XVXhA9nCf70M6BZ3Hd1WgOPXb/tLQ4URiNZ7ix9XOagin8WeEy0frn3SMKakmP0yq2n7M
	pOpdOGXAVpb+pBIok7z6+nChtSb/Cg/9NkP1m2K5oZ+lNMGLNy1pWU6MjQ6RKcA3D98m7kRkWSm
	no7QtRNwqENhjW9Mf4qiqAbLFhOCaFIJNxsOw5o+vNRKxZTr3TrBqf2BP0F+fHtW6ouUZwwLcqt
	HjkSkwzEm5ygvw==
X-Received: by 2002:a17:90a:d2c7:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ab3a99aa95mr13309248a91.22.1791977369735;
        Wed, 14 Oct 2026 04:29:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 13/16] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Wed, 14 Oct 2026 18:27:48 +0700
Message-ID: <20261014112752.683032-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042937_466852_234127E7 
X-CRM114-Status: GOOD (  14.09  )
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

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


