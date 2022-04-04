Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0+n/6P7bdqEEMLFU2+k9oraQ5+KG04CDq+iSdCsLlTE=; b=rPrB9kAiPduFOW
	Qtcgrkn0AX/p1KPGwO84vVwBhEvvEsHPnzQL78MksQioVHb16TdVhw0Q3pmqIndTNnSFpjhjwoaZe
	7V3qgJcqyOYxYTWm/wlFeEzayiUA7e6XBl3kHv3ZC/UN1vtvUHjgwmIIg6ue1Tlc4E0QEN3OKxR0u
	8oAdV1i7uLKWVpzZPCDRKgokdgcj7bm0hMUhrfi5MbpTFM+nXuIkm1k9aQQDs2KPF46tiEXEArVh4
	KSiEsRKsfcgcMn00CmVTe0vfA7xh0gUdePNGiOP+GBWUsd0OUiN19jtpRmYwXewl6Cj5+2KQzEUz+
	lZJ40x1l6b5dSuWKbFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbJ1X-00EBRv-Sj; Mon, 04 Apr 2022 09:29:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbJ1N-00EBMe-5Q; Mon, 04 Apr 2022 09:29:14 +0000
Received: by mail-pf1-x42f.google.com with SMTP id h19so8439225pfv.1;
 Mon, 04 Apr 2022 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=25rklRbKCPsv/fRQUYfQLO06IirkCoUcr/CH2yXPlg0=;
 b=nBv0RJtYmfjSnEU9JW7F8vPjVAc38XVKIiB+Nv1Pyj/2Kl3CbuQTBfdZsewPPKnt6m
 eRu9uOkrg/e9NhZhQ15shTFSGJfOzGjQatHbtfehqNJ5f4GhoTGlVd3F/RrWhucFZneO
 WU6vJl0X1XI03mve7bJACyyr2/piw3Ai+Xh/ApNfdN6YuT2F0+o/kbmFKiRRrXd5ibzz
 S0mgTCO0YWRYrIhQbc+xuAnvYmZHWVRzAdljZuvh3i2qDf4JPYR7qGxiVal1ii7mWz76
 t/V8vil3Q32bQhtdLFQNEN8AHLnhaZ1LIXIdbvZDLNmkwEpWugRXsYsJYgrUa9u9h+mi
 /+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=25rklRbKCPsv/fRQUYfQLO06IirkCoUcr/CH2yXPlg0=;
 b=bbkNUd+ns6PvwLcrM2ruSwGDya+RVW7LTjoDKE1ikm7XbHR1qyh1XKQkW8tgbnFaNZ
 eyUfrtkXCYmd5D3+I9ABjjnB7x1dSlpyNvht3otxSJLhpdkVP8oBNrqrIPiPVA0vcVIb
 RSyQFPTFK5iZDTcUKUJfKH+tVa6TctB/jsbnd7Vyec95+XxHEz3TnSvAM6rv8qL//hrh
 0zD1t9zow7v//bzId7seW7nUXc3blukWpmtUKRKkYomWVYiS0RVrUBaBheHHtPkKmZf/
 b6iwq6ggx/pWtI9j7iWQblr6jDl6FY96BiWJWMnYoUG2qFHZTzcodoy1Nh4K2DU0SypU
 meEA==
X-Gm-Message-State: AOAM531wiUD2+j3qSvznt76CbmazjwUqVgQP2Kfso1yLd6DQpYCxcHwU
 vruRG8dxf9Ba7I/qQlmTOguQGnq70bPi7SG8
X-Google-Smtp-Source: ABdhPJzDhNqYIqvfdG6d/FBo1eOl6xSsWZwI4Iti4exghBFyDjhz9X/Fg/iKNHzjDK0eLF6hNJVhjA==
X-Received: by 2002:a63:3344:0:b0:398:2527:a122 with SMTP id
 z65-20020a633344000000b003982527a122mr25559649pgz.140.1649064549916; 
 Mon, 04 Apr 2022 02:29:09 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 h189-20020a636cc6000000b0039841f669bcsm10063032pgc.78.2022.04.04.02.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 02:29:09 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Miaoqian Lin <linmq006@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Koro Chen <koro.chen@mediatek.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: Fix error handling in
 mt8173_max98090_dev_probe
Date: Mon,  4 Apr 2022 09:29:01 +0000
Message-Id: <20220404092903.26725-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_022913_244912_FDA4D09F 
X-CRM114-Status: GOOD (  12.60  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Call of_node_put(platform_node) to avoid refcount leak in
the error path.

Fixes: 94319ba10eca ("ASoC: mediatek: Use platform_of_node for machine drivers")
Fixes: 493433785df0 ("ASoC: mediatek: mt8173: fix device_node leak")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 4cb90da89262..58778cd2e61b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -167,7 +167,8 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 	if (!codec_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->codecs->name)
@@ -179,6 +180,8 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
 	of_node_put(codec_node);
+
+put_platform_node:
 	of_node_put(platform_node);
 	return ret;
 }
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
