Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E251CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=; b=NVnMIM2JVw0R7aOcvk0dqNwan4
	PmlwOoMhu9UUrI+BPBrHSxsvN9JzSU4N3yj2023BjGJ5UBP1eCeZrxL6DBfg80fQx1VVr61F/ZQKE
	KS18rcQSzwOK0co5Ly2pGh6Hbz/iNqWPYYD137MPeHR+rNnhSvJc9BjeJ7QqhzX+3C+4KsHnYcfKH
	jA2DZ7d9WkmDsd1Fg9jjOhfLQSVo1zUMYUnL510NWoVfodwfDu4MalrbiILaajJuqddzX8+oaZ+L4
	/Jnppbu8uwxmdExP0kHqqevGLD6RrTE/mzAUFZROHn9C7ZX+kytT8My7e9UjajjHkDSvT1K4yCXoa
	aVNJNC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTp-0000000GH1O-07Rv;
	Mon, 05 Oct 2026 11:03:37 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTm-0000000GGxl-3FEX
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:35 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-88b4eaccebcso1270151b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198214; x=1791803014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=ehYqeCmEAeH4OjNqK0dxVCHfhWJ+9V6NeDzJQo0rH3amsDfwzgAm8RzRGO80iXgjCN
         3sZ03RMW2z4vUs2OW3qBnBazBK1/z/aohJb0DTZZqVnacICOE0kZilfGWdC+qHHyESR3
         ys3OVkmSeQy5HBDKZqKn0iw2NLKWru3uvXhuN6NMCbrwKaO6YULoQjhQWs+7bkX+tP0I
         fna7KJjDVE++5FdpdWCbKuQhxuye6xnWAWLKqc9VkWHdNcmdNIjF4YZXzW3O3W7D+FHf
         iDdbUIjugrxRTBZMjgtNkHuizqNUtV9/8rr5PBWoWAEG2hPWvbq2Bif8JMbEcev1nx59
         XqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198214; x=1791803014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=jamr2fh7FNg1hloHNihnUdUilKMqTPlKOW0sroTlt1+AwnZUOhaVwbMs+Tq7/fhsls
         +0+b1wyQaf/2d2xDm+IaAryIpSm3KpbjLXGGYFpADt9AyjLBy5+L+ZzJqPwzdCUP3AOp
         CQCiWKnD+hw8Y8oU1R02P/9217YY8oDtNg9QF3oRDEHTlS8qQDrNpic8bQSqoOlL0sHR
         YkN39j0e0dxewHOFn/rem/N0+dy7/RznQDN143613uGkoeg7Tn+EdhaSTmyr0Typj8KW
         t0uFAxbrU1TKUVyQW3dZi2OiUlYFuSdywv69+ATuJ94PcGX10ChoLM9xk7idaMMu1c6F
         0UTA==
X-Forwarded-Encrypted: i=1; AKwUvBz17KeJpqaD3HuXpsu8TMwNeaMHEtx//cPy8MIUNnLwyQO01XUxGlzro7lFkP7Fp1hrI+sDPTwM7r5tS/98Jg==@lists.infradead.org
X-Gm-Message-State: AFuF++k2qVKccnyv9Xq9AAzuuka2oUed3cz57bNLKeHfwXZu+qD7DUYd
	2RevIZ9fFVSFTdXVtkMWFaXibUBYH89dKy7FkGgTmDPR3TbKCuDprOf2
X-Gm-Gg: AYBFou2LKjc4tLgKU/Jv6zxcQEblAoIMOqPdwfskf+Imje/69vBbqEoZuy09KkwMV+/
	vWB6LLqngS06pRnIOU2S8VlkxVNe00OSIo7HUhBA/LUH+ghPEo9c9RE7QWi8fzxToDP2dCrdr06
	rloF3f3TmXcH1zjOEMifl3gWnUCA/KHABEHrEK8q8893nXsNML/8XylNfvO/Kl7USHBsQdJqLaJ
	YYGylUKFzCEmU6Gcpc5TgTSD/EZXiKpw3otgVZ//j5S1PiZj7paBHnyK74DEKZpoMvqEgkvTiKJ
	nq/3F6ivQctiRHqVKZ1xyEdPv5SFUD5WlqFOeBf9Asl07eZ7ZUCXnPiByiN+vH7sN6l2xkAPl4r
	ChT+6VrCJYcxsYB8vrOKdPSodUSWeUDSk0TNHjQoqGcoNep4tEDxOwlS7ujKKJ7wtMC/wl5iV6j
	ASKZlf7SgmgogScj8y2PYSCJFot2P6kBs/mfcSHiy83xjtYdBLWJ58pykEma03yuphEzLg2v4g5
	amGX2BQ9aw/rfo0TStbodm2YvyIY8X02azoReaE+Nul27LdphDpwu829xtn1HmWiDHj+PxZate3
	5V2d+L52jpTRvA==
X-Received: by 2002:a05:6a21:71c1:b0:3e0:d508:59b3 with SMTP id adf61e73a8af0-3e0d5085ab9mr6255687637.71.1791198213773;
        Mon, 05 Oct 2026 04:03:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:33 -0700 (PDT)
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
Subject: [PATCH v2 04/14] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Mon,  5 Oct 2026 18:02:47 +0700
Message-ID: <20261005110257.50145-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040334_842392_C0E803C9 
X-CRM114-Status: GOOD (  14.37  )
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


