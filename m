Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6BAC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 03:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldPIaEy6phqzbag6ryct17fkQpZ8cJF0Ou1YfIID/lI=; b=Kc75vBXI+jXgmZ
	3YIGXV8JEzaKJGU3yvt1nCMpFE04JRBCBLfSdwiqpzZEQy9khpQdXiZEqkTmRWf5t8hKJIhexanFG
	+hGfO9sanJ2lqxpIutx3V76I+7vDfx2Ex1mlfsiTfZUC7F4AnyaZ+pGWIiAOn8mz29u7ezqrv3yB7
	bbg/3tLOvLJAs9igy/TOjbRcP8ErHhQ+ZnTMNmiWwRDA6x5aYFeZ60TGTn2skAPBbFGu8m54QkKa9
	UOt7IY0DZlRzZEd6RYkR81nwDa1LMqvYf0If1yLJmeV7SkX+q6q+geyS9uUH3blXdLzLIlxSeO8fs
	kimtFtP/gcaieMHzA7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbir-001G8y-7v; Thu, 02 Jun 2022 03:42:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbig-001G7S-IK; Thu, 02 Jun 2022 03:41:59 +0000
Received: by mail-pf1-x42e.google.com with SMTP id p8so3665203pfh.8;
        Wed, 01 Jun 2022 20:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96Q41uk4y6XbcZl1Zsx4+krpYFpttRN8NWnLOQ9e608=;
        b=XUstNAd+TkZxYOg2nB0/CnWOe031scydaaFy5ujX6N9OPZ4fDymvFtAI9RQ5HtU9xy
         1mPG+WzesqN4xw/HI+17JlvYsYombwEsWJy+zxHHswmhFSXNKdx6fgFhpGGP8juPpFz6
         5bYIBgfJW5l3glxrFfHyFw6eCaCdbe7URRR2yAselbs8VOuEWjwsNBowqmT0TzePPjrk
         Ld7vQMAppj2mohHZqCfIoa3gjuGIyvzm8iFMAru5vGPmAqdIAAqkceY9mie5fLcqPv0s
         PbLdcJQIxOxrsBdXRC9VtP5+lnuaZfIbA1QDX2XuCNqjoLaG7zeTvavawY9e5kh8Ku/c
         CAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96Q41uk4y6XbcZl1Zsx4+krpYFpttRN8NWnLOQ9e608=;
        b=Zxyb7IMIvLljo8W9cwabD54ED8lUeV4Yid9SyTVUgvSDh3e3A5ssv5Q3ChqqtZ2VIu
         pYu21yMHC9IxBKZ53xEhQNP4UPWOwozU7KT++TyYanvJQLpia3yKtV4ll3wkECV6LFrw
         9GkYNqtGq9qpjeHlwn4Ng+ih0aGKqKFYu/mn2i5ZXR0oWXZnGK0lbOJpiYeWgBmzGnbk
         O8EqMSzX8zEyWqAvKdXgNz9pSvjvxRHg00hSSx6v3iFhV7dWLTJggzbPwjbjf5uL0uvd
         +r1CxC3o19obygNcS5K8yoh8k7tCATuXlstKYv0YzC10gMxViiXbWY1BDdWf3PJMU7hd
         zsmQ==
X-Gm-Message-State: AOAM533aLkPJLrPYkM294HthJzq7QbeYTAwGoOiwcYjg9aUebor6X/Fv
	Za6wGEnnKUkkFR4DMqHptsE=
X-Google-Smtp-Source: ABdhPJyPyKsY1RQq4rtR0YQcNAGzw5ULWmM3dgngCbyE+JjqSgZREIGNeNy4NwVWNPsBK4RJSAeXyg==
X-Received: by 2002:a63:7e4e:0:b0:3db:945a:2575 with SMTP id o14-20020a637e4e000000b003db945a2575mr2354037pgn.227.1654141315261;
        Wed, 01 Jun 2022 20:41:55 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id o24-20020a17090ac09800b001e2f578560csm2104137pjs.45.2022.06.01.20.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 20:41:54 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tzung-Bi Shih <tzungbi@google.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Koro Chen <koro.chen@mediatek.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
Date: Thu,  2 Jun 2022 07:41:42 +0400
Message-Id: <20220602034144.60159-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_204158_661004_4B58D954 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Fix missing of_node_put() in error paths.

Fixes: 94319ba10eca ("ASoC: mediatek: Use platform_of_node for machine drivers")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 70bf312e855f..8794720cea3a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -256,14 +256,16 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[0].of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_node;
 	}
 	mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node =
 		of_parse_phandle(pdev->dev.of_node, "mediatek,audio-codec", 1);
 	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_node;
 	}
 	mt8173_rt5650_rt5676_codec_conf[0].dlc.of_node =
 		mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node;
@@ -276,13 +278,15 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_HDMI_I2S].codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_node;
 	}
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
+put_node:
 	of_node_put(platform_node);
 	return ret;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
