Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EA2C5DF66
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjuVd7RI5k4hOIJinQsqh09SXyNVhRXdR0rTOUmxNmA=; b=x3al95beoLU2WGchIJI+IhO1Zl
	rBiAVX3sbWoobCx8sF1Y62eMPOXo/0XJMWs8p3Ub1Q+Fe/Wq46c+Xm6TBdDo29uNPN9s0B74dUKLJ
	gl6VVHjQ9BSNHEVton4qVCpYepCmYR8igGJ58D3g7k6OUtOZqf20B/BDzXntZ9ixQrqk1hqhWaayB
	uS5avEeO42pNP5wIs3luEXzRuQvBynzHP2p1E7LK1BZxw+nZuXg2tXo6zVRZwVEUNNb1hErHrRJ9b
	QV1N8ripO1Qh0gaX1KrNsuJ+zX3VoK1S32mX72JbVn2taA7+U9imnf99lASzyuoLlYvtigL3MV2i7
	UglfkGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuuo-00000005xgI-2m6a;
	Mon, 17 Aug 2026 10:50:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuuk-00000005xdi-42p4
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 10:49:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d01663d816so27957415ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963798; x=1787568598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjuVd7RI5k4hOIJinQsqh09SXyNVhRXdR0rTOUmxNmA=;
        b=mDV+NDJi4JnqbO/tw/0OO+ooxtgGA7M8rr6WGphmu/ydUPZIruU/K2ZZv4rSoelS/e
         ADxxxMGC5GEyrflrIbBYmIHXfLBZOxjJahEC2chTQ6zSO3j60TalPTzz6pnXtkW3+t4m
         L3rOVXYQEctDzOJsmnpUA2ixUEkaLa2ULfLnO4uZWdDuUy4Y1wd9rf9Uw83qMMDCNMZn
         wpxXgLLj+ZZ/X3GL0Me/nqFoZAirpz9HcI/nSpZT5tvXdqbSWNI/3V147o8ujiKN2vUM
         3eG/8tpV0Nj7RCJVzIu5B6/hthWFxqNue6TSxbFnHE3cE7ltkVrJ3fZN5qnpQJt9TqoR
         byAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963798; x=1787568598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjuVd7RI5k4hOIJinQsqh09SXyNVhRXdR0rTOUmxNmA=;
        b=aRVYG2YJVruE8KFv8WR+ld9GOCeCrIlbNkdgsby6h25cp5BbKPXYdA7yAah3xdhdNK
         tU316BrhCZ4qF1+Ws2xW3Lz9gnXGrLvu6EBTouFsFRmn/ti6UZR2PqsD8gWLKj6QRKUf
         XUv/QyJrNfx59J12nH3EjSHjxnF7MdZbuFzN1O+tswnbs+iQLcbC119PZTGGcyYvdfW5
         hfgX88LZMapdHJe2/rUio4tR+cKlSXMdsUuZtPRTXiJJoCy+y2CHAQw4hY4tHaj/Y9E5
         zQ22mq1VMAr1owxcG1hmsGYY14cTAwqoKrmrOHeByMR/J/yf1QqTn9jhXEDtiyLbl5Kl
         5dtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzKlC2rRypoLwCBzyIzbAD80QH07nfeTKdeFMqz1HhGM9dZM8p9hAAxfeZqzxG5t36vKoAAKL4t/vB9gLqJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZzhRD+LWKwxRXuSJ8lxeH0GVD8UiXiZVFTRdMq4BHDRDVIE+q
	FCTODz2tYLFLO98IyX4NxqhHGOFgpwtWygd3NN1NJMZTlhK2hNCDVXhx
X-Gm-Gg: AR+sD10CvzmLsO570MRzRBTFK2LAHttwbO1TFC4ewamtPHDIUxjvL0qqwH8pCygrLA6
	V4/8DE4mhRCp22y3JCpi+fN1vheGFRp04cLPam4sScgOt60cmun6P9+v7PBtMYAIV5P711SVfrq
	DBNIBAS0SZDV5YDomtnCeWFuesVkmVdk7r8wuzSaEcFUPdjuRpEeLhCQUAsrJUQSyY1L3ywGCBe
	0g7JpmpZi6hR9UJ9jMndPrUGH0PFxAU0AwzJMYsM7gvsq8deXs0DLNLqRo/V8+D36/ObvpjJGDU
	tkz13sahH7IWtE6YEXmKmcI/SDstTQfZIi9fTaQofvWA9HHv42J20VO5RSGpRqu0Cl4POgrpiq7
	etgntmj1ER7KmbpMnShJZ6f7PvuFyRqrkKBJbGRi7ljjNeUcWPNo0DT7yN1jP0vQX0TcjzbnSpn
	b0eWiAioXC7YOlsd5EkVEbsLOWxCwioLH60y523ebiJCk+GX5qtqtjrF7sCHdHc0SCtcCQo4l22
	SxHIzmvPvSvmSPK3BNuPUeAaCWZP+bwPrtPnfd/zd2/rR32ZDKZt0eLVW6X0gFfF/tlIgfZABu8
	Rp7O
X-Received: by 2002:a17:90b:3d48:b0:381:528a:808c with SMTP id 98e67ed59e1d1-3933b8939dfmr26013326a91.12.1786963797943;
        Mon, 17 Aug 2026 03:49:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt2701: Drop redundant probe error messages
Date: Mon, 17 Aug 2026 17:49:29 +0700
Message-ID: <20260817104929.63152-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817104929.63152-1-phucduc.bui@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_034959_009766_D2E759AF 
X-CRM114-Status: GOOD (  11.96  )
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
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c | 4 +---
 sound/soc/mediatek/mt2701/mt2701-cs42448.c | 4 +---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c  | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d56b498e8c0c..3c5a76591ea7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1622,10 +1622,8 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 778a9dccfcaa..af833a8daa2a 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -366,10 +366,8 @@ static int mt2701_cs42448_machine_probe(struct platform_device *pdev)
 							= codec_node_bt_mrg;
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-	if (ret) {
-		dev_err(dev, "failed to parse audio-routing: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	priv->i2s1_in_mux_sel_1 = devm_gpiod_get_optional(dev, "i2s1-in-sel-gpio1",
 							  GPIOD_OUT_LOW);
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index 84b3d6cd77a5..25ea3e274aa8 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -137,10 +137,8 @@ static int mt2701_wm8960_machine_probe(struct platform_device *pdev)
 	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
-	if (ret) {
-		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
+	if (ret)
 		goto put_codec_node;
-	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
-- 
2.43.0


