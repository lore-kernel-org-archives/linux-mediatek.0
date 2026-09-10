Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F47C79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=; b=PU4JwpnrIEe96IfCQBgbd7EQQi
	s0KNI7hEaATGzyfe57hkjb+4Qr78nnlKifutU/n7Rrx5ZcjY76fWzHEw3MS3IdTVjlA6Updg8INE9
	sIj4LIh+oDWi96f4a9o8LrsWAkW3J7zpYOO9qgHykDt//WqcaTLoApxiivHWa9wKjFx6PD8/VzvMz
	8zidyV47w471PANN9kxqspi8NW3RlCndCUWbvC0El6ewydBYK/XPsEY1uKwGlGbfi+4h5aHk0sqAS
	zjk4iEONRMhyHvwrfKcSXdD+2B/+3T2EP9Fg19Ual/TpPlUxIn5pUNvNAjem/O7g0DDuJ7k48OY+L
	iTqHjiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eM1-0000000EOPg-3Mh6;
	Thu, 10 Sep 2026 12:58:13 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLz-0000000EONU-1FBj
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:12 +0000
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca12086c06eso5434500a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045090; x=1789649890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=;
        b=RW8Dp+o2/iz1atW0gXy+XKXo4VCJgMQ9MWZDjNcM0zaeR/F4ONgbSx8yqo0qDSpfrR
         9a0/sE/uFvxjO7yn/lXVdp6cw6B6wMVUg0eRFF3jlI/4UWv/jxtlD2lIgKr779O6ByIp
         EMt7U9zB2LX0lzoYB4ksWIkAuORaExiGVEduIcf4ULhoNvNq985ZIjvmmdmyaPa6zmJf
         8sFNewAyt5PJv7JdnE8EWQYKkn2tsd6i554gXbDcWs4X9S53cLZdNwOaLwTBZnfjBBx5
         rJB4upjiiN8r8ZsYduzZl+S+Jmx2nSk826H2IQvQFERs8PX7Di443WvVnSgLCHKhpmw/
         UEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045090; x=1789649890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3KOEHZTQKUIeB5kbh5OXuF9axs2TgY2RpwsVG2WXZc=;
        b=s/GWI/WoSFlhxPvv/QA7rA38xDw4gX8v9Cgf1EsS2WI5kr4S9mA44ahojujYC6Oety
         P3B1LCphmXtuKjmtb1VCJKQ1lm2JeEBDeglXKsX9Vd0ObJHzfJwcsuetne+ZNn0+Hl9E
         AoLtMUcNifE6Ufs/tCWfjhdBP7+4586wJcJIIU16FYG1fgq9YJ69QXkBTDhsn1LXgPFb
         KId16UUgvODIk7Jrb8vKw/kht7kfHOntg27W+X7VCcHQCktdWDwadWCmmydu98d/wXdM
         uQVbsECDEC6exqD+P4PmX4yQfOlR8VpxQd77zYaNz9ztKaiFmi+km+nN/gfLI7ky+pL1
         77gg==
X-Forwarded-Encrypted: i=1; AKwUvBzg+UTMDNs9nu7cz9InZ6r2T77geOJlSdzV3NIBfn0rzMGsSJeqG48q1Z7Q6RjCh56UAF8QgkMILerZwKRrHA==@lists.infradead.org
X-Gm-Message-State: AFuF++kIzd/skJI5N7iol/TnaGI/39432iSb7zobtWkhRZi9gU5YHXnk
	J/N9lHSkMYTvoiYDo+J4cL7SGcuY+YVSAYSkvPPRyJtDeRmXjaB7O1ML
X-Gm-Gg: AYBFou2kSCur6lpeHNtbsxY+RVn0u3zQ/lHX7aeskaPHXxHPtOkBnZvTPEEKxA5bBsW
	IacTvT0HlMTQC37oahfmji5rqVmkYizy0zkesMnKwBLySr5qStEbcphiC0X+73u0VqvhIY+SLch
	0e3zR5RXH1obIuA/PbsJ6Uxrbc9v5CduTAIIkUmDJrPU4Zhu8PPt8t+l6jFJOKkUp3iHwz43Jbr
	NxuhKK/rEWPVDnbhjOXNqnHsHSGAgTe3vP9wj9OKGyZWt6ftF/BWGStVnN5jwUth2bOzXOeCtk+
	3+sgycl9oiHQ3pXktW/37RHOZiDCQWd5iUalK7nb5gMY4D3C/dAJZuVhxlWOJDNt1cG1mpyzI4K
	W1LLdBXougs1PzCBkjlWGIQiaul3rDaKR2K3eD2fQvTK5a+js1GupMVJWJCm5iM7ErHq/LGl9N2
	vlo1gGu1kC2XAU7eJX/qVv+pZpatFpP+IQdBslK0uH2wQSgQBBnzWHYJDTwz1/MSmO+rellahms
	ZutWF0DxiUOAsRxYzy1YGXetSpbb/utDkAhuVJIZv5RDlF0F8/vO3jTvKKoXH0EetX0kcRblpSK
	B2ZClwk7wE83z98=
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr63642021a91.8.1789045090094;
        Thu, 10 Sep 2026 05:58:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:09 -0700 (PDT)
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
Subject: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
Date: Thu, 10 Sep 2026 19:57:31 +0700
Message-ID: <20260910125742.150902-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055811_333090_04212831 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 78 ++++++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 63e03a40dbbe..a901be97e75f 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -454,30 +454,47 @@ int mt8189_apll1_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL1_CK);
 	if (ret)
-		return ret;
+		goto err_apll1_ck;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
 	if (ret)
-		return ret;
+		goto err_apll_tuner1;
 
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
+		goto err_tuner;
 
 	/* apll1 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_tuner;
 
 	/* audio apll1 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL1_EN_ON);
 	if (ret)
-		return ret;
+		goto err_apll1_en_on;
 
 	return 0;
+
+err_apll1_en_on:
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_tuner:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER1);
+err_apll_tuner1:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL1_CK);
+err_apll1_ck:
+	apll1_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll1_disable(struct mtk_base_afe *afe)
@@ -506,30 +523,47 @@ int mt8189_apll2_enable(struct mtk_base_afe *afe)
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_CG_APLL2_CK);
 	if (ret)
-		return ret;
+		goto err_apll2_ck;
 
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
 	if (ret)
-		return ret;
+		goto err_apll_tuner2;
 
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
+		goto err_tuner;
 
 	/* apll2 freq tuner enable */
-	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
-			   FREQ_TUNER_EN_MASK_SFT,
-			   0x1 << FREQ_TUNER_EN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+				 FREQ_TUNER_EN_MASK_SFT,
+				 0x1 << FREQ_TUNER_EN_SFT);
+	if (ret)
+		goto err_tuner;
 
 	/* audio apll2 on */
 	ret = mt8189_afe_enable_top_cg(afe, MT8189_AUDIO_APLL2_EN_ON);
 	if (ret)
-		return ret;
+		goto err_apll2_en_on;
 
 	return 0;
+
+err_apll2_en_on:
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+err_tuner:
+	mt8189_afe_disable_top_cg(afe, MT8189_PDN_APLL_TUNER2);
+err_apll_tuner2:
+	mt8189_afe_disable_top_cg(afe, MT8189_CG_APLL2_CK);
+err_apll2_ck:
+	apll2_mux_setting(afe, false);
+
+	return ret;
 }
 
 void mt8189_apll2_disable(struct mtk_base_afe *afe)
-- 
2.43.0


