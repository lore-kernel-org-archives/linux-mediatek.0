Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EC4C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G6Lo+18sIXzxNcuFSTXduKxmc08cyUDjNGZNtZkUahY=; b=3tkDGSWeJWkk735Fpwomv7jzXD
	hqFdJFXntXNnV9uxQBVEe0JFKIS/uvwMzlFx8FjHkw4IWvJfk7veL6tKBgjgF2OuOgot7QbsD9vPA
	KYNmTj+8BXQzDua6vnvShl+Y5ZM7TmsEoubQFwUB5K5GV3Oc7OVWZRQccbRY/pkRurRBEdB4kYSgO
	9sW87vxLHa0nWysV0azEqBGuHvWh2poE9FDoPDZs0YbXEG0hu1LoXDw0SqEY1szao4kR+4jPgEueD
	clsne7GxVBURzc61cu2bR4qwYFmgHo66cJjn7UMpcChOGKPJ41Xy2FWlv6ahFXzhX98ShGIaMR2to
	50zm/KyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pg6-005IVt-2x;
	Wed, 07 Jun 2023 09:42:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pg4-005IT4-07
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 09:42:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f735bfcbbbso31424725e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686130919; x=1688722919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6Lo+18sIXzxNcuFSTXduKxmc08cyUDjNGZNtZkUahY=;
        b=AwLzbIm1zg0K9edsLuu1NPocZIg/6ycVQovwysMtzw1bJxOUTxjkJrih+FSr6FZL0S
         oVilKsEKAD/Y6IbWIJZBBNFhrz6P5rEMXlaQ3OPDg/Yqlvbz5ZBuANiBDrcpSre/F1Fw
         pXbSiPDfbmN/8xL919riWuZgDoVDRT2BKp0tZDKEJjH0O/YjAkZzTJtyICE94xEOb741
         aL/VIR6a++MpCXo/Rblos5rTbmlJlhRiMrKqJXjfecy6eEofY3JAkDU2LCsSQvGyAUEL
         zHEPAkEfJxgZ8HzN1ObF4l1/T5/CgOi7ZLqZsrhg0idw3yyZj2eudGlAKt6DhSv7aWKC
         aAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686130919; x=1688722919;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6Lo+18sIXzxNcuFSTXduKxmc08cyUDjNGZNtZkUahY=;
        b=lEL9aKOng0+J3LEYxKtLU2FHrEV2v0o2Ex6JabXLLlwvZvl1E35TY1DszFuEYLj6Op
         ak4yWbTM3JgmJ8kUHbVTWBybGIaSs2gTRn3wCk1hNi4Cou4XvgJnM2Aow4Z+G8t84WEb
         BN6bXOXPgRgeHqazc2k/ThFv+SZqoEE39d5aL9bSfdNxkKUFoxMJRhk79JEhPATe19XS
         L/m3+z8Ev4flUY/r/n6tPJYHOhzihpKIo4l5B2IfFwEUOUWsAyXfWWcQXnOc7V8cRZxA
         LeWToXrCxQkQxvH0Xunoy6VF2kVABxc/tRMV1cOgmG+7qPqym1CslifD012yUp3aK4GK
         rQhQ==
X-Gm-Message-State: AC+VfDzC30euwgTMZ80SzL+CGNjBkvtdKWwxTlZGZXs9WqzizFAl7rN/
	oImG9fUt9j6bVzCWXE7ij60Bkw==
X-Google-Smtp-Source: ACHHUZ6Xh/LwcZ+rZVHzsTOg4l/H6d1/H3rWqOqZY6ABx67wn1KYIBuLFgv2YJrWxIXpyw52rn7ENg==
X-Received: by 2002:a05:600c:287:b0:3f4:2452:966a with SMTP id 7-20020a05600c028700b003f42452966amr4432811wmk.27.1686130918955;
        Wed, 07 Jun 2023 02:41:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y8-20020a7bcd88000000b003f4ecf1fcbcsm1541154wmj.22.2023.06.07.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:41:56 -0700 (PDT)
Date: Wed, 7 Jun 2023 12:41:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8188-mt6359: Fix error code in codec_init
Message-ID: <f1d2f4c5-895d-4ad3-ab0f-b7ea4a74b69b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_024204_077533_A2B1BB1C 
X-CRM114-Status: GOOD (  12.38  )
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

Return -EINVAL on this error path instead of returning success.

Fixes: 9f08dcbddeb3 ("ASoC: mediatek: mt8188-mt6359: support new board with nau88255")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is based on static analysis and not tested.

 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index bc4b74970a46..ae02bbcd5d4e 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (rtd->dai_link->num_codecs <= 2)
-		return ret;
+		return -EINVAL;
 
 	/* add widgets/controls/dapm for rear speakers */
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
-- 
2.39.2


