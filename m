Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAD2C98306
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=; b=c8Z44ITLSvXq/MZgOeC1phLK00
	4IihaZHDKroKty2dWHfbh+vDf4otHVSjvC4Ulz+rkB6E8AVONeJPCyB80ITEFtreXV820OWomf9s7
	O/GEIILO6k6kU3m1QJH0ByOSr2Yh/NYy1bsTLLEgIc1xQ1vqr6Q6+jHcmEiGtLP2q08//gogWpH67
	pDN0o9rIt7aCxyr49XULd62hqxrHh4TZA9XBNoY6IW0yTcT7FNCLBb2+srbW42hkDGmnYmYSag3OE
	tKnP/bMqZ6BSqkskCVtu3uQikeKs1hFqTW1zK4XwdVcOcoEZCxinBp5hEd0TeuayheP6QQiTgxfJp
	B+YBHNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsr-0000000CdIA-2W1X;
	Fri, 25 Sep 2026 04:50:05 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsp-0000000CdGl-3CE3
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:04 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb65437so344596a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311803; x=1790916603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=ULRfCcPHqh/Kt4Cvg3hZns6KVXWx/XiwxdJim9cLPbphUZeMdtCkGS7EV+ruXD4Fb7
         wNKwOsW18niOmSzXo5bLbV02PvIuUiPttHvW1f6ddpQG7UAshJw5VcXf1zPExoo/tz0o
         ngr5bpBut2iYRTP4JrPvLvXZl+xKkYkvgq+uJa4N7NBe7yEqAm5Xn0BZWC8e/+X64pnj
         lar1dVV6gFwKTtW5to3kH+nxYmV4eW+xO/dh0c7Mv4PnvY0otO55h9CRwJEAYQgQt9zF
         ZwtlSBobV9af1az0Qly/pEkxBKIJAyozYa5a86wxM18G8igjbdpREC10hVxZdsrpoeUW
         m1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311803; x=1790916603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=vxRxYbZtB82ePTX7uX+OySx8J4N7t1AWsJ9E4Tn+A5fEr+zOGAzfADSop0qXn7USAo
         yJd/yqjH7bdIn290JwuGKl3ZqgW3sue3aqGKDcZO6ztDVwnZgPGwdNN5pSjv+XkCfzpG
         u5AN1yY/Phl2cbnjFMNQSBLEBsmPKC6zFmha4OkJ3HkBZbOrPez4RV90mz2hoAGwmvV3
         M1Qj6ryu+7WjV7WbQcYQIM3hFrpCZARLm8VFnlJVieBaZD9gs3lT9fb87rTXqbozz4rb
         49q4aoGXibFioTvBPxpryrh1M18NyPKQxoPrBsSiGAG1Pd2b0SVCQI4pZqhcwrPVjD3H
         /oDg==
X-Forwarded-Encrypted: i=1; AKwUvBzqqgKzunRGZoUk0P/gSl8eiNgKNN/vWs6OF/11Ji+dqQpS1fPGhZt41HlN24T+f/zHLQBUTUSssehERZbL8g==@lists.infradead.org
X-Gm-Message-State: AFuF++lnGYDGwUgizYArJN25sMCvHVx2lpw/anvacClhheSwAU75qyzX
	Ulmwx2ScA4GbG8INXNUP13MEJk1ZMXz9SUCKNJXtq+fzrrSMoBMyxeli
X-Gm-Gg: AYBFou16naDc+vttNp7wMIL5LdHtFFpSkBQ8OwHrhiEUonCxUkCSuQP+aiPF5KXzatp
	8NW05aeSd/oQs88hqrYTv0wbXVWhtmUTxVbMSUrx8aRD+pohd1HK4FAC7QzF5ymFkL6MhoO036F
	gM8UHNCD2iV9SSzPrril7dTB3Hng0jqpgOvu4VjTfInRCgsMCo6r91fXn+6rdE+FWb00Xa4KjVc
	y+DqWKeRTeofR+l44hsnDA9+T0v69ed1CT1mmvOnJYU+0WgkDqmJaLUGsZIanKa8Pn6tvKZwbiF
	kazKSfYz3zyQ1R2pqk6y+i/+DWcQ+NndRF9aMxD+z5eQMdRAw9iXlxGCEH7J0FhVHFoHfiip1+7
	qt5l103+i9Xe8Hm8T6ht6XxSATG/TjVgOBzP7ha5xmTU4XGm79MFGqM1H7AGQom3VQZeSCnbHrF
	rsJLt/oGgNpPSNAsXuQjnXUNWZSeEKFmek02uBOQLN7Q6gOS2P7js5c5EL4NLsso8XNRjzEuK+J
	Ub3/IzOvUZsrOnijOCrcd4PYH/VAvTIQyB7oksDOVUrmA1Z02gwTFRgDroFK751h7jlM54B4S2E
	/Qy2wGsPMKPlUE40rTp6cc64
X-Received: by 2002:a17:90b:3c51:b0:39e:6c6a:4b79 with SMTP id 98e67ed59e1d1-3a098e41273mr4074558a91.67.1790311802879;
        Thu, 24 Sep 2026 21:50:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:02 -0700 (PDT)
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
Subject: [PATCH 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Fri, 25 Sep 2026 11:48:56 +0700
Message-ID: <20260925044908.450775-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215003_816652_DE786A1D 
X-CRM114-Status: GOOD (  10.45  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0


