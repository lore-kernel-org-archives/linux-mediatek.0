Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D13FCA5FF0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=; b=UgvMamAV/KuU2c+inKsoiBFlyp
	yyecQK9T0+SH0/5RRSsc63nJjbh97HxvbiBhIE7H1InKIMc1IoMHkkiUfIsBhRDRpa3xjENlmWgd9
	kFb9dFVT4+GICAA5wrnbqJOGtPJoMZJjdOph/tqlaJZDlJgE6IbrmPb+3xVHc1bM1N+O0S12la7eS
	2wUNK54t7LxvmusG1kDu+xZ5D4+kkRIciFqGuKppYC/dqE4Fi5SKgDqKye0mpQq6tH2gYlfDDTZIT
	MlBLA1mZexaXzQohlL3+oQt+OOa/a7pCcW2SKh2I5BwnMcZhEAcW8JirlktlqeqeI/SM4e4Ql58ua
	KwN0rVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dr-00000000Tdt-2hej;
	Tue, 06 Oct 2026 10:16:35 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Do-00000000Tbs-2amz
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:34 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-88bc25fcd0eso2291956b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 03:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281791; x=1791886591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=aZ5M58PxYOuk2x11beT3Sng1M+OrMhp988rwCoAc8Od3s4jsH5mIvQohv3bRGNtBnF
         M6eBCKkBLSLXmZ4eb7wM2TstCWVFhoeUu1F2R1Rky1QhMnW3RXsXJKRfGHgy5DX9qHzV
         1tOuHSSOJ1e7g55Cp6xzTKKuQt6GN5QfVN4OKicvxEM67f+aAsDfFo5608OBmvAoQLlo
         1ITaGnshBbSnwTl/iI8lGcMtPJ9r67TPYWjFgV5pNuHghv0mupi+8FmdDrS7YoPEXBXe
         6oGRHQL+W2WgKf8Q6DVlpiJ+XULMZ75pN6sFsMnPPMMrUqh3U5UeYp6RhQJa9X2XBws+
         0QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281791; x=1791886591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=jUjpTtjfKc1Of2X86OPyTKIyw0U4pC1tei/RGq/PNcVLxPcS1rSD89B7hha91cypi6
         YAXmiaGXKnWZEViGU0oz06bRibWaBK0wsyhE1siufw9L+WY8gIiw3wSDaiONN8at0GpT
         lJ275XtxcZh9Q83MtzQzneuc+5sJq+hLrm0JSJ5D3Wcw59ZZpSnnFx1THDJpAYPpm0RP
         TgxiT79/rWF6WUUF/Ql2Lo85Cs5wDOyveLGdXp8DjTNLQZK0g7LAFwfCOPtcjjYIkGIc
         H9TZvDr1b6kjq5sWRB8i0ytGf41oK7wDZH8EcjG4AjZc8bFS5kS8hpkyWUs+W1m7veCm
         KTIw==
X-Forwarded-Encrypted: i=1; AKwUvBzKQlGMKCmFPGdwXQh2nPLwRGxdoEjs2+NoEcKRgtnzz3Njg3ZzVavl8q5WSG3ASyVEhPzDiDg+QfLlK4BCUg==@lists.infradead.org
X-Gm-Message-State: AFuF++keQqhn88SXRJy7wptErB8kiuFlqJsdpCi4ERMxuLLZJr97koLB
	fo8wnt3V7FP7vltgbdt52vAh9o7Tdu9sUbj2XWe7dxTqjTv4Pewq2Y7C
X-Gm-Gg: AYBFou2UCeb7JHK9GXHdGGovIzda3Niq+Rth1S43xOXSguUMs+SRHVU96NPikL/VVRc
	8JJ+4b3HP2E7kIyLrwRd4YELlZO/MIxgYKKr6mQI09yfZ4V2mJ+Q8KF5/8D3bDzWWTx9pr5vc61
	AkhG7LJXzLVfakN3nudSXFCBvhE2jR5zHFfnP9tlXhe66xmk5epGMgirn2RCs8XoKnf84HHEQ0z
	U0okw3jAfc8FZHpYwaQsKLwvZX+HZe95krCdRd++NPq0wsRd1SFh6Zx0yZDSQOJygATVAnYbRX7
	xRJAMfkuFA9kiQX+L9qpurCKHrv2wD5l+bzyqZVCgYSFzi+1z3F5c5lsWn3B+7dKEw0LqO122yJ
	GNGK2Hrk5GLKQ1JpIDY+3UdRCNunPd4yCooicI53Xy7DpGLYWzzGFhKWpHQ8vFlOLE0aecQLSaB
	YZBYmiIDrFwNDGrAnzGJ/Z0dggqYFrfO8NSQyGDioeeZO6Czjv4KVApH/10SeY469ef0mV01DG+
	e/S3JpDCCbiiqjnhF/rYUtZNjFHKr64bLQa4ZPwjRko2d9Vr6+KCETincHFTJP7OOfrrdyOx6pZ
	uy3TyTiw/klc5g==
X-Received: by 2002:a05:6a00:14c2:b0:885:e24e:16c5 with SMTP id d2e1a72fcca58-88c64d112b6mr9929947b3a.50.1791281791595;
        Tue, 06 Oct 2026 03:16:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:31 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:03 +0700
Message-ID: <20261006101606.54079-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031632_668972_9E221FD1 
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


