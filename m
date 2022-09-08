Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33638C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXdYxdgkuScJvZiBbyZNpbr6tGZ9soWxfQyAAnGxYes=; b=4zqBighTITbNHd9oD4590TG9On
	XYGtyS1nKa8zczP/KvnkFr+hi6YYTQOeeCPIe/w4hQywn3cCD4C35uIHjTcVms0Mbdxgc/l70BBSC
	0HcP69Y3aACkX0pxn6Kc4ze5JWlRL4jRua+3MQvJXjiRANVgfU0Lw7U6o01W17rmsYy8VhjP3T7tK
	HmmvrJxYcOdG9qkLGROlD2YhObMVgWYg54v5cXE6i7xFGkpSjw0B45cSL+dYONevk0UDosj8yT1bQ
	q8ub4dyu9mmJKILGkrDpIue0lh1MtmSE5YM7jrZsdpwJziXEE/FIprJEMxQWaLRofzPdFNkf8fcPL
	Yw9ZgHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKCG-005dpD-Ll; Thu, 08 Sep 2022 16:16:08 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK8Y-005bBB-8u; Thu, 08 Sep 2022 16:12:19 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 888606601FBA;
	Thu,  8 Sep 2022 17:12:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662653537;
	bh=jIUdtkT4ddNfSHRyN+v/gxKe5FoYLf2qnOUA50l2MJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jtWMhA7rx+v6qQhy1Em7Y3pjtbUzQj8/i1otNHUbCYCcSaCUyEfcrU2ep2jWw7n+c
	 Vi7Kw2+2ZrR9iKeic1dCieNkmsEanp0Dae2wZImJZrWNi7UyhFIG2bX6hvCUjh6S2R
	 My48lMeVEcfu0JzQXZKVWZrHkuDftmfZ9BCePITcAodyj2OABTO2xo4MCuJfO08ZWc
	 meiQP8R/jUvThecyTUbwOfNjOtkQl1GbPtCf1/xoIJwKQu8WwzWVdkHKF8OrnjPS1B
	 uELc+YqiumTjSPxbkalPp1hg7QzjL51eJyZyiKGo2/hawSfVf94nhOdPd+hpTPOI/M
	 VeILSfFXCcBRQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chunxu Li <chunxu.li@mediatek.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 10/10] ASoC: mediatek: mt8186: Remove clock share parsing from DT
Date: Thu,  8 Sep 2022 12:11:54 -0400
Message-Id: <20220908161154.648557-11-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_091218_483684_75A1CA3D 
X-CRM114-Status: GOOD (  13.75  )
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

Now that the clock sharing for i2s ports can be configured from the
sound machine driver, remove the logic that was used to parse the
properties from the devicetree.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c | 30 ----------------------
 1 file changed, 30 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index 7e8cad682c83..f07181be4370 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -44,7 +44,6 @@ struct mtk_afe_i2s_priv {
 	int low_jitter_en;
 	int master; /* only i2s0 has slave mode*/
 
-	const char *share_property_name;
 	int share_i2s_id;
 
 	int mclk_id;
@@ -1140,50 +1139,26 @@ static const struct mtk_afe_i2s_priv mt8186_i2s_priv[DAI_I2S_NUM] = {
 	[DAI_I2S0] = {
 		.id = MT8186_DAI_I2S_0,
 		.mclk_id = MT8186_I2S0_MCK,
-		.share_property_name = "i2s0-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S1] = {
 		.id = MT8186_DAI_I2S_1,
 		.mclk_id = MT8186_I2S1_MCK,
-		.share_property_name = "i2s1-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S2] = {
 		.id = MT8186_DAI_I2S_2,
 		.mclk_id = MT8186_I2S2_MCK,
-		.share_property_name = "i2s2-share",
 		.share_i2s_id = -1,
 	},
 	[DAI_I2S3] = {
 		.id = MT8186_DAI_I2S_3,
 		/*  clock gate naming is hf_faud_i2s4_m_ck*/
 		.mclk_id = MT8186_I2S4_MCK,
-		.share_property_name = "i2s3-share",
 		.share_i2s_id = -1,
 	}
 };
 
-static int mt8186_dai_i2s_get_share(struct mtk_base_afe *afe)
-{
-	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	const struct device_node *of_node = afe->dev->of_node;
-	const char *of_str;
-	const char *property_name;
-	struct mtk_afe_i2s_priv *i2s_priv;
-	int i;
-
-	for (i = 0; i < DAI_I2S_NUM; i++) {
-		i2s_priv = afe_priv->dai_priv[mt8186_i2s_priv[i].id];
-		property_name = mt8186_i2s_priv[i].share_property_name;
-		if (of_property_read_string(of_node, property_name, &of_str))
-			continue;
-		i2s_priv->share_i2s_id = get_i2s_id_by_name(afe, of_str);
-	}
-
-	return 0;
-}
-
 /**
  * mt8186_dai_i2s_set_share() - Set up I2S ports to share a single clock.
  * @afe: Pointer to &struct mtk_base_afe
@@ -1252,10 +1227,5 @@ int mt8186_dai_i2s_register(struct mtk_base_afe *afe)
 	if (ret)
 		return ret;
 
-	/* parse share i2s */
-	ret = mt8186_dai_i2s_get_share(afe);
-	if (ret)
-		return ret;
-
 	return 0;
 }
-- 
2.37.3


