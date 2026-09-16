Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AF9C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pql7MOYwKZW3o6yhPXEQuRrMz6C0eX70Gy/W9byUq7w=; b=aBjh/y4oZsDjJZytlKKWBHzKTX
	RqnONtGIzOJ18JL7nXVNjN5gdB3mYP12Vu5rbnP5oPNPftRzkRLwu7gFT3AaE3UQ8Bv6/7YEXpmv9
	/d6uNmWyG38o0MGIUZ0ZkqbEsjifhATLjDOgdZSIn4cbwhj7sFObSLnxteOwymCng9ceIvPiKzkCz
	Hri9uKFtPjrT8owPlu2hURzlo5z7Nfqg6bR/do1R5ozMUR1ohFv6wHR4NEP11V5tCqf6ajPQGgKIt
	scShu4aC+EWujrHmovR5NXBNsYLdWy1uxjiChbZTIEYEHu/5CLDCNyNr79LbfHDx9a7wZLZk2RTTE
	DUCHniHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlg-00000008LIH-2yJJ;
	Wed, 16 Sep 2026 05:01:12 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlS-00000008LCX-0kdu
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:01 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469f20513so403512b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534857; x=1790139657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pql7MOYwKZW3o6yhPXEQuRrMz6C0eX70Gy/W9byUq7w=;
        b=WxKmIoHcsi9QqaZ07pT/988JMDPYHsx7nXdR5THZk8w2apFJUUnXT6KL+Tb1huC2NV
         6/+KjmFVcuo+1Su7vCgGxUNBDR1dvD0WmAi5nEf7zz+jzPrAZLKFjlHEniqY/jJmh7JJ
         s022EpwibULNrM0MFhWpnk12TOJbils5aeoGBBxcKiimUN66VFbyWgITLqxG2MY8Ybzg
         OkpN2wu8Xx2voxZREuKj+moAUh0DBsMSFHRnP/T/Qc95LNv2ti+/287EAPXSuKR+KsfW
         dq+Hk1BVH17jdlex1pYAzpZi9JcxASFE0IzHM1GRh1GYtQWPCfYNezEy2zvFZqWigvs8
         D8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534857; x=1790139657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pql7MOYwKZW3o6yhPXEQuRrMz6C0eX70Gy/W9byUq7w=;
        b=rZbfaA1kHTGFXzyMlBleB5N0TL3WZdXByCzco/ZCHBI7XtwxkVfgMvL/iq4YOJ2z4A
         lXZ9s/dRkRCFxUK/9hDynz088wjJR+AyfDvJwsO5zRLsrCvllj+DHrT6DOuhs3054zqA
         655vMU1/ghtLlbYX248h/7xQjvb7aQ6YvLCstwXzPX06rs4qIyv/TGY0jAe94xMRWyqQ
         RK3IstD+BC2QiQASVxAEX1pAD0R4tvB/7FArT7sPb9j+pQ1v2unygfnQ7Gnq+3WZhiFm
         Q1CLLbK13TPz7zF1+cWA0249Q5aEJsp8moNKUEuF1hMTx8KKFlVNG2j2gZqXoR14mh9J
         TJhg==
X-Forwarded-Encrypted: i=1; AKwUvBxy+785u2CrFCtAp3o4rWmdrlZXonhSbHEKPJQE6YKeQ+9/SjHoKxWCkL048I8Yw2QMxz3GFwPUfPZmSGRMcA==@lists.infradead.org
X-Gm-Message-State: AFuF++li3Zwl+zkSboa7E1QITx13tZjH6Fr4DpnrZvXriJVhC3vR+Txk
	wfLl+7ZY0PEnoeGjZg0bIfikL4kiN6+5Ul11qGuCEE/DBqT2/paNoyCS
X-Gm-Gg: AYBFou3viA6EL/np34Qm20XxxTNOQ4ln/4ZRUDqXjYjgeIWPV5e+bUKRTGV7e7ReIrd
	vWMpWeJ9hoqmFUuEyKVH7crKQp+59PTcAjK1j7UCqm3KQAYzruCxslesqYjQoIwf7JQldfG3o7B
	A0Lozjk9E62cK7RflZdAOGUZ4xaYjkmM95TtTzRHgwzpb6AyqxM0oCrotMKWYp7cRVngw7gVYVF
	oTeGZ/0Ujlr+nhHpzgQpeiO4bzgYc5qAIQ98Ejw9uIY2pgq2zBu399NPKJ5yaBr9bACniAM4EvV
	tQQ5KTQ4NH70XWfR0WTDCSZsogMqWUksztj7MJ28ShPJZ3ByO2PiwOIacXLoqkWlf1BoSz4H9pq
	2zb/M1Y8SwFX8zbDWRdX+mxqmRLmvayT16LBRVh1nYKzQjWfbQI9L0W1cNN68fHqFRnSz6bqy6O
	yzHegIgTh5U8tIAf4n7ERqe3vWtu3dlD+MfluoZ36TEeutVUnx/dwfU5ZSC7uljNFo5OQ4/Bm/H
	28S/SQZvFNoc6SYOmpGgsoyn3cM5Ms0s7zIqlW+Z7EgEcqxEZTqcYOBlAHTwYUEPdiNz/XcBbtM
	ASVfyEk8AFURfNU=
X-Received: by 2002:a05:6a00:b8a:b0:86c:f33d:e3b4 with SMTP id d2e1a72fcca58-872378b6fc0mr2276748b3a.8.1789534842957;
        Tue, 15 Sep 2026 22:00:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:42 -0700 (PDT)
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
Subject: [PATCH v3 01/12] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Wed, 16 Sep 2026 12:00:08 +0700
Message-ID: <20260916050020.14575-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220100_057678_02095A8D 
X-CRM114-Status: GOOD (  10.73  )
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

mt8189_apll1_enable() and mt8189_apll2_enable() currently ignore
errors from regmap_update_bits() and do not clean up resources when
clock enable operations fail.

Propagate these errors and roll back the clocks and tuner state on
errors.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..f088ccf80448 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
 	if (ret)
-		return ret;
+		goto err_clear_mux_setting;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
 	if (ret)
-		return ret;
+		goto err_disable_apll1_ck;
 
 	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
-			   UPPER_BOUND_MASK_SFT,
-			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
-			   (3 << UPPER_BOUND_SFT));
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
+				 UPPER_BOUND_MASK_SFT,
+				 (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+				 (3 << UPPER_BOUND_SFT));
+	if (ret)
+		goto err_disable_apll_tuner1;
 
 	/* apll1 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_disable_apll_tuner1;
 
 	/* audio apll1 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
 	if (ret)
-		return ret;
+		goto err_clear_freq_tuner_en;
 
 	return 0;
+
+err_clear_freq_tuner_en:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_disable_apll_tuner1:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+err_disable_apll1_ck:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+err_clear_mux_setting:
+	apll1_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll1_disable(struct mtk_base_afe *afe)
@@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
 	if (ret)
-		return ret;
+		goto err_clear_mux_setting;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
 	if (ret)
-		return ret;
+		goto err_disable_apll2_ck;
 
 	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
-			   UPPER_BOUND_MASK_SFT,
-			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
-			   (3 << UPPER_BOUND_SFT));
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT |
+				 UPPER_BOUND_MASK_SFT,
+				 (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+				 (3 << UPPER_BOUND_SFT));
+	if (ret)
+		goto err_disable_apll_tuner2;
 
 	/* apll2 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_disable_apll_tuner2;
 
 	/* audio apll2 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
 	if (ret)
-		return ret;
+		goto err_clear_freq_tuner_en;
 
 	return 0;
+
+err_clear_freq_tuner_en:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_disable_apll_tuner2:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+err_disable_apll2_ck:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+err_clear_mux_setting:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0


