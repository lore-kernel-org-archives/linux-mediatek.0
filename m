Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5632EC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=15bcPlwJydkin0B+JJAsu+9McxnbVcGQs6T+4KYVyWQ=; b=Lmy/r5TsWOvwGfUMc8DYp72cJv
	YWhU1v5fJN5KJmebEFpRCAuwVSHXSNDp6Sx6fB3fNA/3Ug5VL02VdhoO+zUBjATNCkqJx3wTp32BE
	jr3hR1u+BwTW7aO6X3+QBM/xhMA52xYWcjt26fg//e7e3Sp/2NdD0Q30iHRX8W2Rf7+AgjL7QjP4f
	4ZvN+aBK3tZbwqy+Dq5KiLxiHquh9IeWdHae9Ep9a4CuHLJP7fS9SB8a/EnZnTp745EaQtXqgH0vq
	YaoeLcUnyfEFFrIM2apwqE/Rl5OuUCa8G9tOO8/hvz9yaKZzyg089g6GZVzVh0WHxW8Dj9lHaJWuo
	8aigJxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ubg-006KHA-2f;
	Wed, 07 Jun 2023 14:57:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ubd-006KDm-1p
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 14:57:51 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6042d605dso60997525e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686149864; x=1688741864;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15bcPlwJydkin0B+JJAsu+9McxnbVcGQs6T+4KYVyWQ=;
        b=qGqDR9tSf/ntbvkpkgaO42huIAJWHmk04412CvhnpxAwQb+CiKuF2lAVZw29BLhpWG
         wnEIyLfbZ6V/B3sHUTtyet7DHrb3nitMvWBbaZr/H5reMtDydgEwEGviYaeYGS9+xb3u
         kIXqzZgE/fUMwYd4hwFMmIkC5dye70I+oXc/GMESJ9gC60AhQrvQO9T3suMtQj7N5hBk
         Al/gAm95BjVudokd3ttDVMayJZuc+XjEdNIJkXQalNv29xxIE7fubija+2srf7PDj/lY
         +IYE61jg29t+nsXqNc20nwKC7YQziScASypHutUCduar0YEr9hY5dyOeE7tW9C4rKpFm
         0wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686149864; x=1688741864;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15bcPlwJydkin0B+JJAsu+9McxnbVcGQs6T+4KYVyWQ=;
        b=dU64Xrxc0+C8USfewx6XKUr8oznW2OPHPnbaHhTpH5xIakcnqGlvtmnB+i4KNnA82p
         bxM127NfKgCoQFjQSoAqjn5pwmZ4DyghDzvPIchpjh0a4ltqW9f0huz4nNzTfwp27+ov
         eXeVI4cTmmFs93tx36NU07bLMVDEJPLvZe4vlX9YEjCqZ0D605tEIfEVDe0lEuiesUQV
         DddrTVnKcHM2Tn51CcaoOZoWc6a0tJE/IRXiOhLpSuh3cJiClT0QXb8OemD7D8S7ZL97
         de2L9JVa7OGqfNPQup1lzNSyq6K1SOEEBBq1jJA/diHEEyXini3OmdfchtcYTUpJ6SZb
         g9NA==
X-Gm-Message-State: AC+VfDzzoSoGkJDdPQhqNwoZG2cK5tl7NipwmrBHzLS+m0Mrkjsia8Q1
	E1lITBHFRAZkbcSEtXFdpij5Yw==
X-Google-Smtp-Source: ACHHUZ4Om8wIr2+W8c2m5xch/rF8WjO/ue+qyFCuYy0t+JsljkFHxXGRUHuKnJgvRrjikjox6oNy/w==
X-Received: by 2002:a05:600c:ad6:b0:3f7:e629:9f3 with SMTP id c22-20020a05600c0ad600b003f7e62909f3mr4734068wmr.16.1686149864352;
        Wed, 07 Jun 2023 07:57:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y6-20020adfd086000000b0030631a599a0sm15633048wrh.24.2023.06.07.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 07:57:42 -0700 (PDT)
Date: Wed, 7 Jun 2023 17:57:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Message-ID: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_075749_606274_66EDCF12 
X-CRM114-Status: GOOD (  13.28  )
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

This code triggers a Smatch static checker warning and does sort of
look like an error path.

sound/soc/mediatek/mt8188/mt8188-mt6359.c:597 mt8188_max98390_codec_init() warn: missing error code? 'ret'

However, returning 0 is intentional.  Make that explicit.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: At first I thought this was an error path but it is a not.

 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index bc4b74970a46..5ad8d2a5bbc4 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (rtd->dai_link->num_codecs <= 2)
-		return ret;
+		return 0;
 
 	/* add widgets/controls/dapm for rear speakers */
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
-- 
2.39.2


