Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB71DCC6B2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=; b=rXunQDp/CxZVIa+ld8xMomXZxQ
	i3U4CmNXCTg9ZvqYTQYw3AdAbEaojQI+KN+NHf4NCcZz56cMfQuc/bdyEiBxjD4rxUOrFxbNCsrV4
	KCIytn6q1htoWyIus9yVSW9nZMMZ7/BrJ80IFX3fak3aL9SHzoSGXolvI7rcx1BoiuzP2ZVlntKAI
	AGlWx06gJRUMlaCyUrRdhLgAcd38iSMqRPfBQploO73hJxd7wxa2L5eicFakmci7Cn/BLrxKMQk7t
	QTvzNa4l+tkX9Q/byw6gkJUAmei3hVK+sRcS/s0Wkbrl85WSxZRFsnhqSeHbNxLJc+NGee/DLEu3c
	vj2DUJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAH-0000000FJug-0MCv;
	Wed, 14 Oct 2026 11:28:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAF-0000000FJsv-1xMc
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=; b=T+tlzLfWB0ouIHHj64MgrdklZ7
	NZkeLbH9IOyQ2to3r9lveUdAk05GoTZDLSKJH1Mqg5ZaJC/xzVQra1/bSTIBhu+qFxxTDHeDA/iKU
	gf/oFKRy2WzNyBk2XnGW/QGRqBUON+pNLgBDP4OJNSBCkr/U0bfNB1QUNCeSMZlHjY+Q4eMkNwo2S
	fhxXrgyCcviSOyxDWY3YQfOCI4Xdg8NRN25paha6taw5jyItPMz31KvCWo9nyLO613iHgXb6Nd1/q
	FVRyWuj2n+PHfYESIo1AXMPVWAzuW3Vxa+TiZsObVAN7UKrU3QmaGwHmgJtIhBLUDTvYMaB08V8Wu
	zLY2rHQg==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAB-0000000Ggcz-1Ffb
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so2193317a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977329; x=1792582129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=VY9tT7p6GOFAFVGTIKz0vgT7XS6BqhJb2Z1BUkZJSieh9HyoE/4TYEIKEQJKLeDcH7
         A3EkAKLr5UWwchNTgzyeYJtFriqfcXQ/IoFyKXm5uTj8iRHueBQh5RF9PZpU6ve/Mld2
         iUKGO5J6l9YWpRwRRDdcr1MJ0vsCoIqWOoyi1Rs6KKpcG2TOsoxJshJlrgd6GBHcy3NL
         9pJS3OkO9mQ5K8qHgGL9FI7Z5CiFkcRRF6VflNC8yvz9wwxd/UQmFCsa8JzgZQTHgJxb
         B7JpglR9oKV2iA0y4+wziy7ePDlH3vUtLbc0ah2blpVi+JT8C5gWu5v1QmoJM9VQ4E25
         gsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977329; x=1792582129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=tr6/xMJrEgY1iAQfld/TBXu+ot1BOYThHURkYRZJ2Ydn6qSg+l8TYAO1EmZQablN4U
         sRfjq4BbOEEZqtvazYzK3H0ngd7ZHxnY+qvCVGe711brFpPCj8eK9Hlecsy8/9agwz1y
         EIKaJgZOtWtPCiQ9rDtaPkWoNtwRBvAw2dIdQEwjMJCePA7Cok6oND28ccKjM+j6ZERS
         /VGAsminhhIlclWxU5Z/mGNwO5mSagc7LsXejd6h9gSlwUyM5gmU9cmMS60I5xSG7Dr0
         5Vsu7Y9OwplcEBVlOa759CxUg4Am6QKZWLPII5YmtoxGNZqa09QO+6aeBjPL4Iek2U+X
         dVTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvObxnCK0cfG5WAH9G8xeExEk25N4aGIC+/WLUSQG1jpg9qxF8nPVc+Dk2NiELNb9GAvk5gcntxulrPLS1YA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIYpPdjyN56xVSV5DVsKk3vUWR4jtgPCQjcfqfKkyz//pmjzbg7
	2jPGVhyYTIfz1+mWpqymbgB+cGY7dkrIiFOm0ZxPtEfHv8nBhl0iFCnx
X-Gm-Gg: AYBFou0J5jva2Wkyye+Ahy0oRou7p1tCdZ2UlxIREQ5V9ZHMUiT6ykPM1N7lcKMWvy2
	e4swK0P1XO5kMGM6+gETfkRv1ErmVjGkfSuLbNdPr12pMEEPwAK2EiE+14KwpMgQO9ZV37FNbIa
	UKmvgHBmzJcf+QIwRm1/GCKAFe2VPiKpnQdvKMF/IZ2U10p9PBo70rBCjdXj5URmToD7t1mXMyy
	vbGRu5wviaunAaxnevIZmVxHrw4mKtLHC7WPN6XuLcES1nhvC1j5dfuxWczUxJODeC83dpxuU5s
	4rkequnMOtExCdzoidkEV57kNvpAzPkI2FSxSmW6FQ0bXKXr+A9GIitOewupxpkDgeZfQ/5WC2M
	IOdSafPn5djb6IN9gYbQzNsNkB6yspFqIjdhjSNYiS5tIjE4cXbahX4hsrOIQ3rtLr3hZjyQA/2
	C8Oj2CRxT8rsZ3J5/YqergyLz5b1TNu5WcQQiCmpJUr9Ypu3v1FGlYG/K9b4FM0rsm+Hn+yiKF6
	LMXvzL8e7GjiKEEFPrnHHr1SmkapuZZgnRwY61vPsbr8spFFEBG6pJPpMq0BQMgmuxfZWsgr4fe
	igxSXyucsOTQswo57pHly7x9
X-Received: by 2002:a17:90b:534e:b0:3ac:7f4c:a690 with SMTP id 98e67ed59e1d1-3ac7f4cbb76mr561876a91.35.1791977329145;
        Wed, 14 Oct 2026 04:28:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 06/16] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Wed, 14 Oct 2026 18:27:41 +0700
Message-ID: <20261014112752.683032-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122851_457248_82C9A46A 
X-CRM114-Status: GOOD (  12.79  )
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

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0


