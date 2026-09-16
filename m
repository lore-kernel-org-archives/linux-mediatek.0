Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E08AC88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9B0Lnz9uNh2cM8wk4dYkQqiHmEJincpWAn3l27K96A=; b=3SRobDAzYnzj7A7cyKlC0eLRL0
	CTCXUOE05mavjPNX2GqcnD+gKt1rSIdjGBhdR5xXhll25WcAmscPqRzO3ctBH/n9QOBdO3Bx//FM4
	SWBWefT9xbW/4pI6BUEv8o+Fgkyams4kAOlZbcuKFEbOaaG08X5gA6YrsQVgv4VtpKyvPwst5sznm
	xmspGSYBBm/G2UwCVusXmEMDg6Ec84FGvBE3ufpdlp9PvUKDuyngK5C6e+2u56D7Wv6AYVdRLnGb9
	oKa2YAeoeXT4seC4G4KnpurkgFfxBXSj53MLjw7/Oc7YCv7yriqamMGUOJSvupq7He/LVbeniYEof
	L/+tY/xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hmH-00000008LoB-2VC7;
	Wed, 16 Sep 2026 05:01:50 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlu-00000008LXF-3zvO
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:29 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466cc88a9b9so356853fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534886; x=1790139686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9B0Lnz9uNh2cM8wk4dYkQqiHmEJincpWAn3l27K96A=;
        b=DOqzzbIthytZlINoFg+DxPKoQOdHdimbaY5bDBlThNsN7BMx8psXBLyEvqxzTDzYiJ
         RR4CNypvZu/0eWQLUFIezTvHPLse22i6b8Q7M/nmhDtbqTpgLL/b+sgxAMmnH6AZ+g/J
         ntKZKlN2r1WxYfZRHERnrLs0nRuErUhnWvbbNFZdTGQe5C+ZrteYtpbj6sEYHQYzm6L6
         PhlV77+k9Z/ffWMj5eou+lQwhu1MN7qrrUowpFoBgFhgBvPm9YWMXj+eX14Jxs2HCNVQ
         ThTacDkFXmQsCaWrixtu769DwFTITSwuqP+dGA/+UKiGvEQVj0gHOvFcZKIk6lhcktzz
         UWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534886; x=1790139686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9B0Lnz9uNh2cM8wk4dYkQqiHmEJincpWAn3l27K96A=;
        b=Th5cWPwsZn50O9Zmf8TvRo9M2CaWcIbOIOIb+ud1DrZcMCKCH7KVe7hSF8MyXestsR
         rNhRScqmF9YKAPhKLNoGN0fasayMJQt5SzdmeG95J23U9OkcmRMjGZJrS3mylW662iUf
         l37Nf72gBuZpKBft/CnmEo7kB5w76kju0+aJDEUwmuVqA1JfQfKYP8LWqZW+OOmZAQjq
         j/QF5xXkXOnYKXBe2SoRNgQ1r10UuXMV7hDJeA0OUl2mIgKBZJV+/52/TKiYulaXJFuy
         Yvb1SscOqxeTFdqnRO6QFiSDPULiwFFXr7YOznXcrSVVoU5vNG6pvdU7wBZEZJeuGPuD
         rayg==
X-Forwarded-Encrypted: i=1; AKwUvBy/DFT+xGLKrJdeaEcZcYFsmZvaEcfb0PYt1dhBC3eDH0qe0vChushDmPIJ5P5MFy72et1MIL5cBZUqWDlrgQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nk0gxA2z862oiEUOTHgovsswdcGu8kdtIyAZLBWqIC45EEpM8H
	IddVtSgomT09/FZwpLkkry0OLXFiUcAEZ1IDJOvEPSpsCYkf8png7YaI
X-Gm-Gg: AYBFou0R8x3q8M31lwWaMdq8BCoUHH7JGDhBmulT99S2d0YSBOSzfJWgr9hAYXAP1Qn
	LJv0hU27gA+NSW1UYM2OwajK/8SsY0Y9UgZ6AfLsobUjKQygz5w4NP6ui5vUDaHYjB7nL5Q/fwx
	ApTPa5pusfud2NUzU0mR70Ar2+sY6cx74EKLxvH0V0zWY3OV03Tfxoku1Zi8ouBoo+QM8zdeu/T
	cn+rWuDa6v5F3YfaGfg+lJ5qaLgZE3qGVRGdeDgA+qaHLF6ru0HxvW3CuTmqKqBFQEYKdfYihTK
	k9+MIThy+I2bdaZVGSkzTilOSM4IYqMrNjvaN2AcjO0Vwlw9d/Pl8pYVbLtrFbgEdvrtSdPlsK8
	qqcbcXEjSIiL0u9Rh1naU1dzmL83RD3fTsFk33XU37VozrBerlXc+iGBs4hIPBsMCQ3oY+SyeKt
	T5b07WZ2kJ+Pzu/uwpDQ/+N+0CQ/n9ZgO2MXtaav0KWyZzvHHvZppyP5F1Kz052e7aUqvxNAhTY
	Vh+b6oG1vXmvy6S5SeFn07ysXGK+5f6rZaUV0FOZge0kzdSWR0zjZPoSfWC2TYWeW/AlPACyhDY
	4eALqQb43vely6U=
X-Received: by 2002:a05:6808:23ca:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4ca49dd720fmr1842524b6e.11.1789534885682;
        Tue, 15 Sep 2026 22:01:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:25 -0700 (PDT)
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
Subject: [PATCH v3 09/12] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Wed, 16 Sep 2026 12:00:16 +0700
Message-ID: <20260916050020.14575-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220127_028802_FBC4007B 
X-CRM114-Status: GOOD (  11.85  )
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

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.
 - Do not pre-initialize ret; set ret = 0 in the default case.

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..8cd5ddf62d46 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,18 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0


