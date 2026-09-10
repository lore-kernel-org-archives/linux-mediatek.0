Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615DBC79FBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=; b=qcT6HcRMDq14TYQppuOxUCi5iW
	F31kYO2nzKITEw1YF3jYi2qHff7zLL1rtrNr5XkCk4VF6tEp0S0zBs3qzad/NfxvMpQoSgd4HZKp4
	fHQ4TOOk+XlMsq7bJV5/x/pvizmtlXoK07V8zFp8Cb51kLNhqqL5jtH9Y8AV1xZbxQZQXr7/Knbd2
	FsDGZx3S4OVkgOdIl9HEk15YDis/m0HDki8CRKJWbw9OMxJCGG7TWHe9r82AcWHhdTRwm8U0y77zV
	nEwK+Osy4Z/lie1p/hCdOIj1JGfF+vw7LQH6ql3Jnw2ZhoEjMqPmw8K9ANyqhynVekEKWSB5buqh2
	nv6thI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMn-0000000EP9H-1mB6;
	Thu, 10 Sep 2026 12:59:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMm-0000000EP6s-1Bgc
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=; b=DMXWQUiZy11Zq3I2iFofvMH1xF
	iMaU8FYhHZYNxRaR0bYzmmgU+HkwOfnJnthGU6oOrQFce+cMVwSvnZEy40eAKy0Lj2xnT+GspEIc3
	RNlpvdKrSwBLr7yj8Al4q/A+/Tk35vMmWzs2gjiS3U62DDtm8QmyooCPFWTb1CSjPZdb3cRrVET9Q
	f0wByNbawMxBDHdrLbVAjVXH3HIXQdI2M04XsGz3LdiZbXyc9mb/bxtYLiBKb0yYpsewb3ExwzICd
	XkPwXzXfajxsAFseMOL9xAtTV9AXXtMd3QrbgGLzgk1e2ynMzndaijngpIqn35Ik1mbGS44GLJw7A
	vihdW5vw==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMj-00000002V6v-0myD
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:58 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso1868707a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045135; x=1789649935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=myOcXLvp9vNt7ik4Vmv1Fh9rUKmAvFbjla9iSvoiqGa6K/T5i8oL7OjfVDVpd/szmd
         Ic0SDwlWHw1jDusIUUlJPLRdwLLxLpxiZlAq25M2I2YlETmrh3kUyQvfT+pOKUs+t/9/
         2W0RRGTx1KCj2U7pJH2HUW0H9kOhcfyMGZ1MUChNuye3YCFLjskB7y+jtcAjomNAGPP/
         /Opzx91Xer4DDLFZZ7ieWNG42X7iOmvY3iPHjCGGlyAzEAbJfsRdOzhOmYdXpEQU8tXj
         wiMjHdHdhN5tyPG27ORjvCArSPSk7Un8PSaEi0qqzh3RQQ0JtZ3ZttLTDWJ8IKY9VW3y
         O4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045135; x=1789649935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlGnqVAUzYoXB3nTaQam08DX17fuCUu75lyq1+U5jAU=;
        b=iUlKw+mdgppuL8zROcdjnbnXZ3uL87Jwq6PSa3g0HfOc5f3iJn0VF5giUJZmBa7kY9
         dbXA5LktDzNJEx7f3MEqvaPPJcaBl1mHf1pEIU9ehEHqwGVvFERtcPGpKcm+p5YyDJ7+
         6CP4o2FIiF/9p6pQFUxdaomA7aAeGg2b5UhfESdyNU88d5PS8fWvicDBwt9ZMHS2S5gx
         PSQUhMQblYBb02sbMALm5jNb/mRUeE/1sgv6PNEb+WmysoJVwrydUo1E/Ky4uZr/XfNs
         PMhh4EIDTOoWQZz35SCZI9xCCR32LA0+UPqas79r0UXLRU5HwIm4P+plPehSw6dI/QLS
         uR7g==
X-Forwarded-Encrypted: i=1; AKwUvBz9U+2di+p8/ufI8FZEIcgTHEdnP8omEE/jX0QiWTvmUsnHg8D6PiBGArntGBtx5SpiOXIR1CsS7mMYCPrfvA==@lists.infradead.org
X-Gm-Message-State: AFuF++l/yALbv9+NdQTfc91zbiek/G3UUPtq4+rE3xfYwyMqTzZl1WBl
	CmhyklzV8n77VbnN8pQE1wla/P1unvlpAET7656PxTGf5kEROFDB0ctF
X-Gm-Gg: AYBFou222myTACTfLlDVyun4GmOrEzahGPtg8FAuQR4pUtCg2a2z7nxTHN+zj/qb0e8
	vTQVNAf7oGjfAGPF8pCs73T2UBlrz7LYDOAstIgR4jouFE+4rFz2VFcjCUQq/4QtP3xRiMislYf
	OM5TSvUph/VO15tpX4V8cSOWDhpP2U5L5pjzxzx470i1OwCYjn1PvKvtLSSLFkqrSBCCgRyqRfg
	ZhIKXedMVhy3pmT4mNw7BtfCPL4QOHbhQ66uKmvzsFlDRekxHfdu6fh/c+ougw5jccbB9wxXAnQ
	19MHV2J2z9+QsVWfR7faUwdyByTvi3TkygQ2cgVsns5jljmjicWMXTmkCo8weh/bT6ysVWZDYyw
	6mCrZ+h8xDauj9YPVsAE604CZ6sK2HKa3NYIiZO0pT/R0yzaf7miqLrx63//qW8u+JsBAKh0TWS
	K9y0vz/l6QfsQdyHTDWHt8MCd0ACACMyz7rTA+0aS1duBiWMaAt6v2wVK3IEdxHzBOYUDhDBx38
	h/+2/ojgXG8H32ysRlgp3/Vc7Qd0EAKCZ4hOLLyit410FRjvUiNmcrbks63fFclYQpyQnbRwkqd
	7nxuWuw+o98qeoc=
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39bac3c452dmr19487586a91.18.1789045135450;
        Thu, 10 Sep 2026 05:58:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:55 -0700 (PDT)
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
Subject: [PATCH 12/13] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Thu, 10 Sep 2026 19:57:41 +0700
Message-ID: <20260910125742.150902-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135857_376832_858BBC77 
X-CRM114-Status: GOOD (  10.72  )
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


