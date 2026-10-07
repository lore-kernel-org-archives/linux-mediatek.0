Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9E9CA5FF1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=; b=ch3RIAYNJSG2Rocujp26n4VrWY
	lqo7/spzWItce+BNycKqo92gv8oZgAj8aRl0wTvQWy+XceRan++IQ1rRWI/rJLSay/iesT3l8KotZ
	wJYPml1tOYslc+2hhLEHYtQ+kFE7dq8HyxYO1C33R61Z43cv3osFc/XgiljDub+NBMKRT8byIMYRm
	t3+vnCap0zA8wR0kHUea53nMrG2dPhkk1YJEv3OpRu6FfUDILdFhOWcPIjNQ/ojKWRXVJitF282Q2
	FXTktX6HZdO/CcZHp6+xpOLy2G4uXTMDXvs7sXWwnGfJWeBjpa90IMLeO+TjVCQo6vIAeMrT3v8Eb
	p8rNvjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWq-00000002Gt4-2yhZ;
	Wed, 07 Oct 2026 11:09:44 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWo-00000002Grr-1U7o
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:09:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso357686a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371381; x=1791976181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=Lb6chD7/ojGsvVrSLnJ5t+4U+gffkDq/oHB126o5bZCWvxSwiTUaD4CS7MA1l+I6fK
         M7p/qWdMXbxYe+p8U+OamwROclxKcn+61zQDRNwxmoMSQIzZjqmlDquKOLSJ1vuGzmAu
         ro0IbT8kguGIa7rtKXNXPxyWTz9CU39VY1QDUqp+o9lYVTatdyYR1mksYV0FV6GxxwjK
         57LHbIBIJTrGPeDjx9B04xBF6A1f/2mRnmFOolWmnNL+6tobF/pq+FFXw5mqIuchtXb/
         NhLQEmxnUbQccEhH/iQYfPsv6x1r19kTM1h+5PUqrA3fuZDY6uhtZefgrrewYhtOS5HX
         iAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371381; x=1791976181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=WBJcExZHwFIXyIMdSGgrLRcTPmUg5+ejxdDiZ6HYHOxwGL5R4lNCYoHSMatvjdb3ye
         L7zQNgKAlC1yID4Y56k5+6g4piXD1y0HI8urcOzWsB50noSWWWUrb+2Tq7GOjdWhrirt
         ZVgxJQ9cH/0AoaaOekrAAFT5SuCiHpqOJl2kFLW3JHv6Bpr2BqR3uno0vnwt1Qbsd9RP
         +hOFxwViYBWC6K407F4x3WwsfyOslES+9F/tQif9t1uyYNmeyetntYGd78wQikQJxxFl
         5v3KZBq9Ik+fggruKmWsaEIufCkhQ9LM39sV/4vYhCzdlRKyQAfQuCWiKXtP0bTp82sz
         lL0w==
X-Forwarded-Encrypted: i=1; AKwUvBweZtqBUUnKSqEANAL+DGR87c4oQ9x1qvLHWUQL+hl811PN1NEAIVhIg8rWJBJhw2UEsp6NuBhQHa2mOVBq3w==@lists.infradead.org
X-Gm-Message-State: AFq9FYLiZ51RxJNM93p0AzJILwmtfZ6X0/2XqorfPUFjPDNwxZh2039a
	gMFBmsfM8ho7/B0uD7pa5X+/ScBYFTpWgwBcQ9r09RfEDZdkboV9nDFd
X-Gm-Gg: AYBFou31GGJRk8vcF3rW+jMeF8VtU4bLVenWC4RCD17BdR0vImJ8Qxc5dC70nKwnQd6
	L9wzLjJqeGnXrBEValuwx3hQUD0n9eQzW9xtlWpY+Cq+9Io0/mchztW2vWQlb1MNWqnxLdPi7Yk
	8qzW659p74/s46sTrXPukoqiL9MMX8BWH5EnJWv1KSj75zWKneDcFiLaTtDXoBevmP10JMfuG6V
	nrKtPRf0PC9FcWxmZBze5EnflE/p+oyOcXtnWQ6Nx/W8MwdWlrSXbQATcnNUppbCIbDXXQq+IOu
	E8b31EmjMT/cR9Hm4UMDXuUAbGdOIn4bQWM3zJU/FTN0+AUSWNAGZ3jJ0hOWDoBpWi/vIDvnNF+
	S3CRjaBfxXbbxAnCdTkh9oJVHwXCLvmETpcAJC81IokdxtkY4NFHbk/NlUnl+Cf5HnjO00VJl7n
	Jepe9tlEXrHpBXhUyBunaa4QRTUFkU8eDVGJoGGw1zIcPXDH6IOorkZDACs5CYPGDJVPJFB0R+n
	G6FCUaKj+ricG92Moya5nkiIfSd2Aevhzc43kRJJQSNKsdOCQ7HOjyaicx20/GjduMphTH0/QVQ
	o7/jUbA4bewdOQ==
X-Received: by 2002:a17:90b:2d0b:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a89f649916mr1577999a91.6.1791371381444;
        Wed, 07 Oct 2026 04:09:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/4] ASoC: mediatek: common: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:55 +0700
Message-ID: <20261007110858.509341-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040942_393398_89D6477F 
X-CRM114-Status: GOOD (  12.14  )
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mtk_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 283b612429a2 ("ASoC: mediatek: implement mediatek common structure")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 948f606cbaf2..ec99bc4a5d5e 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -75,8 +75,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -88,10 +90,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_startup);
 
-- 
2.43.0


