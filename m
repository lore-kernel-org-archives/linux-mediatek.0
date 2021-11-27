Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CACC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Nov 2021 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kTL3Btq8DDR3hhtnvE8NURd0vimoa+IzSmG9v8F9+Zk=; b=ATJiGlNGrWJ79M
	muq19I1pwKTsITexMElWAUxCxC5Wl4uBW8UDPtgIKpybDgbniEvP6nvkATG8Yap7kDRXWmLpenJ64
	3L1aLLukpwcEPP7g4xIOisQz+ONvE6HRSZ9lu3ZhB2O8Otn92DRiSh8lwguG+lk2IqJ7njR/KevMt
	q8J1dq8cDC14WGorx9RRCVWm789K9cEWhcZO8/j3UY1PA8CxwpgxDLk8i3ApZh7GwZ5ER0hWyL9G4
	Er/Iq85lbADxqlK4idRIXsCBq1DFIvjgAj49iVABYkzTcI8DR6JyzkFsIUGOhBXMe8pcFYzo0yMVC
	OzF2Md0XDtxB5MZRUGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqu43-00DIdy-Rp; Sat, 27 Nov 2021 09:32:11 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqu3o-00DIb3-ID; Sat, 27 Nov 2021 09:31:58 +0000
Received: by mail-lf1-x130.google.com with SMTP id bu18so30303701lfb.0;
 Sat, 27 Nov 2021 01:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HK/UIXBF2kOpn5IjdhG/KrI+jx7IUToPR1d6+HQopis=;
 b=WNAzxL+wbayZqi4bbW+2BQjcp6XE05F7ahvBbVc3J8P9LK+PZH4LtMKXX3qJOK6+Vs
 Qkh3FTvDTWYQcAd/3aZDl/MszdOGh9J9ZY74STWpPBGgupcCVEETZtt1ak8wf0IuLYef
 BNjWVyJRlQbr8zL6LtwXoJ6EVPLYWqFK1PF63obGOyh1hA5R1cmoC3jtg/LvzBYg8EK1
 TOttJ1MeJPqE7mUVDAqhKZbPiTjU4r3UMpQx5PFb7X6qAHS5InPvY1iid3WTGOt3/e+X
 KyzZasGBAstZr6LLlD6zP+425qW+deIfZOOhYtQYNyC8RklEtPhQeD3R+Hvtrrd7c5YH
 bU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HK/UIXBF2kOpn5IjdhG/KrI+jx7IUToPR1d6+HQopis=;
 b=UjCjuWPV4rV3ZuU9pQ+ua1Q4xTGB0iiavLi6/u5YTpEhHyNkvHVUwVJafBzh8YeDAI
 G7ZoFFOI/QsgJBxh3+6mwAQM8ND5jdeFecQlQGEWVk8Z2kbgsvhSPPo7jKkV//o5UZej
 gAZrsbnuitreC6qIqvLHVQbCq3U11xB2jnDBk29EDKGflMiuDarEYRhpi1e56wy0g33M
 7HhSCcKtQXwIZ9xuoYG+/CjUokEpMqKyI4aiQORCrHsucFZeO8RSpEXzvP4XLibAGEb5
 8LFCPQLQhELMS3/bA+iQsfMQpOa1/3j67YDugkV/m4jSaYhEkdaPWGjAlIJutc4q5Tla
 4GpA==
X-Gm-Message-State: AOAM530CSLHQ9Em1KrL9WOknScGgZgV0g0bHw7X099UjFVKZ8jGOdQxT
 A9OX6R4qNFlfdUc664p2cus=
X-Google-Smtp-Source: ABdhPJyoQLwsRHQuuIRIzM8HLrG5e6b/oBLwUOnb8ih5rVHuodC6f3qZ4pTMksx4IaDda54BPbE+YQ==
X-Received: by 2002:a05:6512:2314:: with SMTP id
 o20mr33702170lfu.51.1638005511997; 
 Sat, 27 Nov 2021 01:31:51 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id x17sm757851ljp.95.2021.11.27.01.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 01:31:51 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bixuan Cui <cuibixuan@huawei.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: Constify static snd_soc_ops
Date: Sat, 27 Nov 2021 10:31:47 +0100
Message-Id: <20211127093147.17368-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_013156_628095_5D88849B 
X-CRM114-Status: GOOD (  12.46  )
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

These are only assigned to the ops field in the snd_soc_dai_link which
is a pointer to const struct snd_soc_ops. Make them const to allow the
compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c | 2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index e103102d7ef6..9e6b54e19c23 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -421,7 +421,7 @@ static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				      SND_SOC_CLOCK_OUT);
 }
 
-static struct snd_soc_ops mt8195_dptx_ops = {
+static const struct snd_soc_ops mt8195_dptx_ops = {
 	.hw_params = mt8195_dptx_hw_params,
 };
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 95abaadcd842..e22e5fd40984 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -391,7 +391,7 @@ static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				      SND_SOC_CLOCK_OUT);
 }
 
-static struct snd_soc_ops mt8195_dptx_ops = {
+static const struct snd_soc_ops mt8195_dptx_ops = {
 	.hw_params = mt8195_dptx_hw_params,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
