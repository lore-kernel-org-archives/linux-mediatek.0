Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC801C88E5C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvZwvf16j3ZKmO5l7pN+WcP86Sh39SLeqVvmvvinM4o=; b=0zwzpoFty95ALOONc/CXe/8bUJ
	TdP7nLwIWkLEIi1MDYCEnhlGofD7RvBSXAl+NfHHNP4WcvgcQyEwlRZULg099QD9zvLDAowctYEp0
	5J+jXl5jZcr1+60/fR3nrm3I63Kd+jlHfAHJs82eFkkQHUVfFNTUbuwiG2IQfxtu/NY4hedwcJsNG
	yhMPyVkfPRyOzT9YcXnWanYOa2C/1VjONgM3imiAIK2pLhqQAFmHNn1EPuxZ1r3snW3jjR9s4TmiP
	8vLhnfB411AMPVY8PjkEzYxe6z/dNzPeVdMm1zuCFVoThTwRuTYxVS6RtCL/hltIvDzO79kfPfivo
	62f6KP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hmV-00000008Lyc-1aXe;
	Wed, 16 Sep 2026 05:02:03 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hm4-00000008Lg2-2yTX
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:41 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4b37a3a9768so489767b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534895; x=1790139695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvZwvf16j3ZKmO5l7pN+WcP86Sh39SLeqVvmvvinM4o=;
        b=e2SMZldCrGKzj0LPVWBgfmaAF1DuWUK2aq0/ac4FE3VYwsDNU09AVJYE7sQMDka4Kb
         AYxglxi1mjxQKWZIfTZ/LSBt+TaplWrRPAZ4k0dO4WRohGQvaL6KUayerY7BWKJbz0B6
         eN/mxftj3/JelAC1usp4el84v5Ztc8V7A31TtlP/73tOP95yk60xIWggG2ew9v0SduS4
         8PYJP+NwuZ67npGOdLr6wc3UXFsf35UAIGHaCqvPi+K+QrqLYOY2dMlBKyDH7tBwyIjG
         e5eA+zvHSsfUKkwT6UthVprmbNhREBC23SWAMWuS/mMBshTiQUPgK3ppdjZu9n+3BpOt
         cbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534895; x=1790139695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvZwvf16j3ZKmO5l7pN+WcP86Sh39SLeqVvmvvinM4o=;
        b=VqEkeVykFJDq4Yk+nT5WDYpc/jLNK0nSsAPoYaxx56j+KdpBC6oOwA+KR6wYs9fKSg
         nQmp6xAMLylRwPMK75KtpcgcYN6tnlOU65lENgsTVCf0ouVtEqJ/S7XkBXfY9KNzYQmL
         Cfhm0h2jeVxktMDjuxTzXmkTSHbURlssvUTwhQBT49FtdKZiga+RwRgZZcIgMHS4tQ/x
         Q/Y2zmk1AdPfBvwHhUjILIKbeJYwI7eJeqvdvnnMjNvptarUGRgIevTIURM/8udoKWAi
         kgW0S4W+vhjYc7fxgoBasOnPVCTeXiKFDd2+00eqf39UNvOtyl3ybbs4EXf0MulPi2WA
         r9TA==
X-Forwarded-Encrypted: i=1; AKwUvBw8lIBL4/gCEVDkOn+KEBjC99qsLwwT6e0xQrAW5rsYWz/cgO54DPwXzZM55ecyYv3VG8nCsIFfxiPKNHCKMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++k4yEBEsH67mT+JGs1U8MY/bnPuoxeiIkjanloBFjPlRfo4LO/F
	t1mJ4lSzzFwEh3vt3vsmNqQDRNcpfM8lb5Wq/mr+qz2YMWmZAvoA9whP
X-Gm-Gg: AYBFou2jr8zxDgXYbSzbVD80y7loy9DPDXA0X12zViozqbkMe61JEsn83YmGyCwPh2D
	0tcZJTHV77zulVXpmv63iKYQ5cQ/jiYj07iZJiPL7U0Hnncyerd9YHYGoCb4J9XcC2Tlm4Qgx+G
	baubZUyDdYU/FRPYclUKqQ+vI/SKUc5ErY3UUEbQA0ZVVudJ1XSlx7QVJgTM7nqff5KEoPb6cRV
	l3B0QHmQMBnjcozCFQfJ4lKNzpMEzEsVAejC6Mk27strRG/gryEUzJhFQ+oT+s2LXC4+s6kiETr
	kJUJIj+NLmpIkEJ0HMgRLGIWX3X1EQPguHN9thYTaq9Xyl4sdU7wBFoXM3iDnh6AzyS66peho7D
	jju/yue+Iw5FstVEViEeI5YV2N7oTfWjxio3rRNepg1FEU+sXjjK0J38e3TisOeV2b8H5LOcNkp
	ZgIHrCL+N9iLNyuDufeCObR/yP+i3sbl1UWwBHD1C1/PulshLwmP1b/ZF1Gsatfpv6oAZiVGzpR
	7m77jOA1VPpSiE2Iu+l/krP8gi4HxKEZGvBxK29oAaZRNUbKC0WL77cvpa0Pr++oBT/8Dn+E3lk
	C1RN2wJu+LKqyDQ=
X-Received: by 2002:a05:6808:1783:b0:4c5:d2a5:3caa with SMTP id 5614622812f47-4ca497b172fmr1584357b6e.8.1789534895474;
        Tue, 15 Sep 2026 22:01:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:34 -0700 (PDT)
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
Subject: [PATCH v3 11/12] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Wed, 16 Sep 2026 12:00:18 +0700
Message-ID: <20260916050020.14575-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_220139_248789_5BD3E4BE 
X-CRM114-Status: GOOD (  11.58  )
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

Changes in v3:
 - Do not pre-initialize ret; set ret = 0 in the default case.

 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 5d68a55ccc45..9aebd0320614 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -261,22 +261,24 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
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
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -288,23 +290,25 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
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
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0


