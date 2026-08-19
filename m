Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA79C5DF86
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=; b=kZvKQETZMYyPaI51Lz0qNenJBu
	Ehd5AvMchvB9EbXAujmBoYdeAMrJqq53Ls0+pGq6JJdoqAVvDgD2nLzGLWLiB/vpYo427OfGqWimA
	i/XNms/xCfrReBO7rPPi90ttDtjk8pvno+abrOAUYW1Dx9yoIQ338N1+Npx3NQMXETY+vIyLq0SAI
	HP4sHbUMwTIsUT36o5tTcsmQAlU0BhXZ3IJFI39vOsNydVlCXCuspgcYIaYxk2LAWXLGqfsi9KEfA
	yDokpJa1C+wl9CFlCYQtxVbVB+tomkLkH7M22l9DUxdtY0r0eAinGUxOUxOMCxVTRJIP51VlSIZws
	uzii9g5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOV-00000009W6v-2CE7;
	Wed, 19 Aug 2026 10:19:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO7-00000009VoO-3t6u
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso843250a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134755; x=1787739555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=UZkvVPd9MHdAe7M8FurdskBB5tjvPt5cWf3ek3uDpHJCoinwy1G/4GH9CmUPmh7Y4+
         kbg5FZnEMestsiuwtBlxTBwgbkIQHd3LeM8jFi6CGOW/EnGZcVDRXPy8C8944nveZUHw
         QTc12KqsTZI77M/HrjPaHikQwfHgB9J66Lg35dJbbdMTOVVL6BogVpYsV6maJbPIwDQB
         wcQLpscGvgZ/LdBiSJeiTUUhQWweCL1kldLpwSqwg4jaXNaiaKlLSE/LS6GsgcVTS45h
         6Q5oZg+paUSl5NB1JCL1Slu2P0sF7OGWo+6/26ie8uAwi8V13gLX3xUaiVrth+4xwrpo
         VVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134755; x=1787739555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/R8GtrWGADXhpWF6ZZO6tx1YvN32z2nTVacJoZ8tOM=;
        b=LbzVAkDTMKMQV3FkCag4KdT2PJem2FfqN7+uD6Hr+GeTbA3YXF0arfOnGKxKIPlaTy
         ETX3jnUYof20pxwby+xJnIZMlXUz0o6m1JXmLfFxgDfE4M3PmzMvfLgy/RaJPzRjhC1l
         SMvjvgnXJ0bvOi+X8gmrbPfr2mv6+/N6UBzhajzyGezBUe4Ztan5fdWyA7Iw2vtrJcUe
         HOJeFfvuk37Btc8QGFXRASMca0d9F4DlhB2xXutshEhZm2QlTeg3V8caU7/9leL93l6L
         dbqkrzJnGohXAT6mLS7/jsPTe3BABZXor4RkzblsI2UBuGTPHnbKXgUsW9y9uu7fmvA9
         RgWw==
X-Forwarded-Encrypted: i=1; AHgh+RoBiqt3a1c0vHOT3AzZPkiNLkt1Q4QmaertTavhUWRLwKYqLPCUn9jX7erD9SmkUDCccFTQ6iYxuejvuKRZWg==@lists.infradead.org
X-Gm-Message-State: AFuF++nrl7Grru7FzAAUPzU4/uA42caMUv5kuOhPojPi0jXPQlZ2kASs
	B+iUkxX0fN7aYO/r8FdaqebYs6WNbTEJi9FSInSbSy50lPzh8RIY+/nO
X-Gm-Gg: AR+sD12NUGewjwhsIXqs9u80hOfRXYq1GDUO7RhrbmbBfpl3u5Lws5pAKZ0xV5rgbtt
	+HgCPIn+Zh4qt/5uolRwYMDRaii4+n3+S/vVqVbzLXKNi97VwwHP2CMSRktHAqdUE+dpL4y5d7g
	J89vMqf/s+Qkwopb0m6VHunDDAmRdgdYZGDy2CrBC181M/LnNJirj259822BK9e8dr72QA9fc1U
	BNNBqik4ymlUU63Sx5RGseSsShxi15ulhtC1jSPBPdnS0AGD4giR10DdpeaZP+J0Jg1T0xuC1Mr
	16uaUEpCOlLSarWdWGaoHPP0Ly2Pydojc98++KQiHMg22Za+jKdrVnAtERFQv2cmR7v9iV3hmnT
	bBjsGi7MrXxzzWy4G7LliH4KtasVtHXsWO4LRGvWw7bQIYy+GjOw2HaszjH6kg7/FYjfVKS31z7
	DNmrmKhlp2EQu8HspIrwph35JHAKOVqXKy/QOahyqU0n+/UQO/dEpkOwVf1yo/OHE9dRi26BbCF
	lSmLZxP32jr6gvqKxXLIekOruSycJzM8HVzsedQvJM9YTZcAM7pMDCzVX9vehE3n7jgr4bSRf5R
	763Bo4tCeIkYASM=
X-Received: by 2002:a17:90b:1806:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-3957fa95452mr3353886a91.9.1787134754818;
        Wed, 19 Aug 2026 03:19:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Wed, 19 Aug 2026 17:18:49 +0700
Message-ID: <20260819101849.68010-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031917_764644_DA3DE114 
X-CRM114-Status: GOOD (  12.20  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


