Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6347EC98306
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=; b=13naYkuMTFR/uMMmOpBa54sz7a
	LILTGoV4d/GSTT/6vdqxOZqU6PnXf/LGFcR3ffPNfNexB/2mcGUf0CSTit5RLHeVTKHnrpGJJRkfj
	MuU9riSorCA170/i/ehYpUcCi5J+94aBtwn+Bxo7D7xZ47TXlDh/gHFfvw53KLpb782nIHXv388Q4
	i2lws6ri1W0DFfyY706Dht0VCljCJ8i3KFRT/6Ou6NlxOewB5866fN9VatSlWMvQZffxQEljj2yqI
	9q7D6HEs6t8lxaCFHKL1emGRdNjkjjdGTCmiQLqFSvhvII5TLHlCdvfgp2fzb7RS/mWJW8WOpXLrV
	V9xj3vZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xt1-0000000CdPb-0SLx;
	Fri, 25 Sep 2026 04:50:15 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsy-0000000CdNm-1dvr
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:13 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb65437so344643a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311812; x=1790916612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=FDHGKi4bi006AuAGF63fv+uG8QBIfTiD/gP3sK3CSASR2LZaK0GaANW7+BGr1/lA/2
         DC1Kj9v1TkJJXzBsX5KueLenSYgqHbF0VrI/oZeT9OIX7vOpUKimMaDV7ULEEg9nSXx2
         5nu2CfWjrKfV+rfCg1Vt1k5be7QD7hhwvQX/n94/yZu12/JrKORPI6Kv67obkijRje4+
         NV6EzUWjKoNi6apFIwkciZnUeZjgsKN8DARG256M3t9+zzT0e4nOunDGMJudHggk+BMw
         ZBihIxV1mwTB69H8Mr32gWzmRb+k8G1gLkPJqhw30LfH5g5NxDww+k5Jmuz3xEDgJLh4
         f6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311812; x=1790916612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=ZQl5EvuOSEOc9DHv1XW576KWN/orvV7bL5T57yJ9M2zp3qs7wgWlSxKqhUdQ6XzWoN
         eN38KEH5LTKv1HC21JifWYWvzSEGy4nk4J1aCvNOjZMBD0p1qRRcuxND7ghpR6PDhMNd
         Q7QnY7lv9Rtw3cHEgIGHUxSiKjSfnEAkKXIXZkIDeK60bzHAUD0cV/zP7UVap5OOdu9i
         vR9PbK05cgndTnqwnrnhtWRHQQgm5YEeZIZ5avtP7I8Y06y4r3LfD1ECwQbUPyj0v1jq
         83PuqfxvVkAYKd4wvk4NAd5qg6oexbDCJ1TD/shi66D0vvlJquil9IDmbTbVWOrX1+T9
         4vkw==
X-Forwarded-Encrypted: i=1; AKwUvBwhk1+Cesbcl7Y9EmYWkMecE9Ols90khCzPZ3E46xuFUgu2X3xnjVCa5Uz890rROBsXxdHar1ndcXV3X9YLqQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mgJAw7keUI330vuACtgsX6nOCE9P0rDZeOmK4QL5ufrQIqBbEQ
	7Pc8BeBGZ3cKTG77qgvNxw2MHFC3Dy7z8GVtXqZP6H2tscaIBTigmm9R
X-Gm-Gg: AYBFou1CSXWROGiyi4YFuwX+JoD/s7bTrqZ5revvPtJkIHgS8FcG25RnTGH8ETiDlO8
	aRCK4RQ/3ugRsTE+Mu45eoLTNcx/wa6vX+b4BPdAj5R8J3ONPYFWsB7csdaiNnsPuKjk44hQfin
	fnIvzJCUs2qwKXyi2ggFJ6fibWPouzOOoDVuApTFGVUkIcDkQR7L8L8IhJAWGVJAcPVHT6JQx0o
	mTqGY73EV2pTeKSDAK1kKkf0XpLrvtMa9hEUJ7g7Fgrr+TT6AGMEzbrih0uXvD4wxUpS8ih5X/j
	mw852jsjTauSk40uvq1aNbKCGBFOoboninaACR0xS3V9qwlY/ACxtSxDCE+V8GaF58ySm2l4l9Z
	NRrOX/lYZmBV3KxKP8PjK8tp4swHltv3PgQdoKYdHx1BYJe8Sl9DVEjf5auoaNnmGApZcqrTaxv
	LVDY7fnuSLH92eCtxG8EMeN5UfESIUuH7EBxAUdGKQW260perWSB7UuE8LjDZq/8me6v+StoleF
	zqd6mxvac0ak3rsJz9fIInK493QuUSgj65I+zdJJwKMeQxBtFanYGSDyNdSwYQ19krpLlNFYvhn
	l2PZLANCNGPzqQ==
X-Received: by 2002:a17:90b:5404:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3a098ad3c2emr3883170a91.14.1790311811708;
        Thu, 24 Sep 2026 21:50:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:11 -0700 (PDT)
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
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/14] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Fri, 25 Sep 2026 11:48:58 +0700
Message-ID: <20260925044908.450775-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215012_453817_25F151DA 
X-CRM114-Status: GOOD (  14.66  )
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

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..ef7a62fba6ec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
@@ -707,7 +716,11 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-- 
2.43.0


