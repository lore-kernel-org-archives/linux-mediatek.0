Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0424AC88E67
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=; b=hqi898reyr+uUeKejQlyLYL+Mm
	TXbMR6xIN4TqdSqtG6kcHB97axv/rY16/cLQq/rCPa2szFYH7/71SOCHbW2US9rzKaofdWnazHcig
	RFTHXauUhmueOrbC2fibHD4EJAhFI90w9kln51giUbmAVdmuzjqfN6cmr5PDtHJ3tZr0oM8+kVe3J
	8vf5x123GMPscw9b/FoS7E3SeJ9PhnleA56N+KNA9XFMesF2YZ8RcMiV/FxkFW9OOU6+kbyT2xVPM
	JjzP8kqvHly2+GTITUKti6fEsAKyzlf0LD+KpABjcG8/fnE7cVyR2YAlQ/mZ79jeAF7nh3LX0ejqZ
	M/BpKnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617l-00000002YAx-1Mmr;
	Mon, 14 Sep 2026 07:29:09 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617j-00000002Y9J-23QA
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:08 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so160915a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370947; x=1789975747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=;
        b=Yq/zcObLTMbt6fKelDJcSGc7zD8aWs8ix8CKH0Bj7kQB36qM+Fmv36Y0PjrXlppi/B
         ao6ffvuzm64LI5SMlhkYhGwvNhkWYeW5kTUT7JOyPPuI3P22++AZ+uyslxGyVNP+K7nZ
         zUFq+xV2a3rr/bmICFDIArs6Ftujxl+0KbvS8yPRv5rA+JtzKRIhc3fK7lRMEqgInd82
         hEWV0UX+r5C7wm53NAP0IHFsVyUcBh9EZ5Tg1UNjt4XPcIb/Eacwk9Mqe2gPEqSBg2yQ
         6WN9k+VNhZc2BF1jWpEN37gBEtoY8+SGh/yzV1FFK6mC08AuCoTDd2t8u76eFt+vZBV+
         ZBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370947; x=1789975747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ogPK4CkcC4kib57hvAPxClAgqXSK/aMlcwvCEMuXLo=;
        b=fwPjIv/4UC7njdXlvfA+ShhiS7JHzx2IBP5gZAcXPzGFOtG66TkzNtKxsOh47IiKRH
         rNoRpwG02JNn/d53hKvUZa0/eG3oj0UG6qP8uyXQPhsizslj4erTO2vnyGF2IMs60n/U
         aEMC5UyhdCpVXbxMNywNbLBDYGLPhEioiYFlISuVudDzGF7SRfHRDuHcc8MMbTL1Ob9W
         bZ3ReRjk61x1coKPL7OP6C1CbkbauaOa/CUYt0+n8dRPVbVUPZiC3UhT514V9kQuJ9+E
         rSujc9nNLe3RkZFGS2daFjJwP8OHDz+CW2PXkBzVFAhKJiZB+wk+f4FpgqvfLwYeiJnq
         Q4Zw==
X-Forwarded-Encrypted: i=1; AKwUvBwXBgvERVEkrS4fx25VE8QAnW8/5pCgvRgWF+beoU1pGP0puXfHir4UTvJFgZsnE1sb8f1lbJnjrai/L2uArQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mMeF1RnTVcfcGBsLKDGOKkmXx25NfGp3ZL22ia0fajSHcmk8x7
	M+q3r9++EjzHjE9bswqsM9ASZ0M70IFPmcFJWiyODwynGZoMsUKcE4ue
X-Gm-Gg: AYBFou0scNwP9xLLU6ZrWAIIz3SerRiHKhhMiconavgdf+vUpdWJdf3S/7TovnLDguM
	IImhYXo5JfntGceFs1ZstxkunUYgQ2bB6fucs9SnJIR+hW4yOwEOBSZHkROXB7N+6zpeZ85+81m
	dKAQGCdd+Z8tioiS7k+dM+5nvkX82qwO897woew7+MV8w9jrOazQi3AS8qnoMsDbWU43emzGUgf
	NXl/M56E3MCWKu3N/f+UYdHk0Oi0oiY+UZ5bxUMGUcg4CRg9g85PhMNmjNoYncC4l1dp7iISGv0
	wGeDhOSBamA0dlUPgMDOsLUGL12nfcXPMcJCGv5TWetc2slb/U3E4dyyKNCTDqhuwDwuW8Fmp5I
	6DaANOvzWBvDCyMDcSemVhi4YHAqDORASCLSEx4UOcKRP6Kx4Thsw8kvNZtsobJE86AwP65eps1
	hV7Rxw3AOeAMhYxvjbcDADAvQ/2ACQXMZA7UnwZAkI1fy7CBWVskoT7KTtHsrW0BaB1DdecWQq9
	txatIbBupPZi2tfK/3+bWmMYE1D1Q4dhz61sKQhLSqJgLH+36WzK60tQhAnPHb2N/2WVPKy8+ML
	pK0U9eHEEhNmKzph
X-Received: by 2002:a17:90b:1a8d:b0:390:84db:888e with SMTP id 98e67ed59e1d1-39dec3d0ddbmr1584578a91.7.1789370946743;
        Mon, 14 Sep 2026 00:29:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:06 -0700 (PDT)
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
Subject: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Mon, 14 Sep 2026 14:28:31 +0700
Message-ID: <20260914072842.24420-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002907_552906_BCFD56AE 
X-CRM114-Status: GOOD (  10.44  )
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
index 63e03a40dbbe..aaf4f7921363 100644
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


