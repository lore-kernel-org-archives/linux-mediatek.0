Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DE3C624A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=; b=2dPnYJk3qNaVAW1QTd9bTnB6Tf
	qrYvHi3ej0wjRJh/C3M6i1yUj8HvPmdpOpi1KBBu06n+M7ksQjIsc3ePC4l7SWfDH/Ee+/kanAma6
	zcGsY+aC438XIOGsDGMy94AjWJeg8Qb+SoklDX/ninq5On0+Gzhej6tYyAMKS/72W8yt8UPvJU4uM
	tvbkz52VBc/qFAH/l4luvcP+N/G8blkOYGGKvmTF++YxgLXkcbwIs5vKUVAddb/q9NxUFTFjI7Rzz
	DsZR/wFGqXkOrB2Xe4JhgSFevvYGOLB3IZ18UFJaEx8mQxrPzF6VMwmUaZdm+zDuOVSm7PlV0cDyS
	fBXpPTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkR-0000000GMx3-2xCM;
	Thu, 03 Sep 2026 05:12:27 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkO-0000000GMtv-1Urk
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:26 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso2081079a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 22:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412343; x=1789017143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=;
        b=RMC9hE6IwOd4cm6E/pE5cXx/gGBxg22TBE5zhHpo92DZrak1nBmrV3Q460Ig7yAogF
         OpkcBN9SG9JAnLZtyGJB07SiDzidhrCN+9M+K6dQ8TX6Cj0V3WmN9D+/Fofc7MUF+UC0
         2uTgrabZGOBfnkAGTegLHjZSKi5o0xQdjwUbvzvrkAsWtCYgPzQ9+t+XjABvhaMbkotM
         9AJwVJYHGdiSpwwzn7j5z5HBUoBU7SZtAMccHd2jIGUYSUxYz3JYyotLSVelbaaaAvKP
         hNUBOmFytDedRixdFilCacN/lMCUc5scvMdf7ga1McFQFpMkX8MbDvjDNGyaC6+aZZZN
         QYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412343; x=1789017143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkJ39B1HLIjudCYGC3Enm23IBUt9PIrUzK1D2BnlrWM=;
        b=IaCzhk7NlyeuRd2f7Pq1GxcLeCQEKUkgYqIQgov3RiFtbBUXUA8uKsY8dC9IDa4FQG
         4bVPx4/19hrjTmxOSM0f1sDhRA5hdz0hc0pkW+GyQKZQNviVkLf8HkpWtk1QzY2F49kk
         tyVVsOtTTj5wgTTSf3wNA269bnwUYskRm21RfSS0zipZlqXuZOcAP1eqKmrd49FxFV1V
         kw6a6pvojL4UWppcLu2sYJ8SkxjsZAAcZ6KgO/gy5WmZcSvctRPhO2sMnhyBXkrntFiA
         0SCq3jf07EmOtYmuvbc9ObjOeltUIuk7Mzg0o5FXd8JSbCdiElAff9GIGQRYuqF/X7HI
         Jj7g==
X-Forwarded-Encrypted: i=1; AKwUvBxZi02z5kDUsJl4avOVTZhiZmXZfejcyOzcbih+KLCLmdu/Buw2znt1O8L60CW28oWDCQfJxUqvM53PBW60NQ==@lists.infradead.org
X-Gm-Message-State: AFuF++keZsFs/zkPTGBqV/7GrlYaIzIov5wCTgq9F2K5l4h4Dc/9mpIq
	KAooar4ezK8ycccdNA1EuF5ajfS0pCVZ19bN49NQWFTtmncgbp2NOrjb
X-Gm-Gg: AYBFou3XcxxLISwKc185bjrly99ZEfajOs53NQVnV+Zv4p5Kl8rAf4m/eejwj6SL1X8
	7Ey3LbH7W7evF76a7sZKc15jTNeZG0gQIfOn+QqtTpjuRuFe9614OhzcySb7QmsyR+qnWTCclLt
	tVAaxiY5iNyLyg4vgWhu1fOpA0eYuNnsavwfHc7U0UVGQIACHO8fIjeKyOd+cl/4WJ/0I1lisRk
	gNrsc5Dhc7FapgEwzO8OpGiKBH3E+sChGShUlujXdMDMFhuUSJx3XUCKJubLzpIpNq9Iotsamfm
	ftg+jN3FCScxwlmcRmJYuLBgaCzBWk5qhUl7qi0p05lWafKNlGsmk5BqSY76PBCZlNhFtJQ2d+s
	4wIYuUUSjcphAKRTVhlrdB83hB8UswZebtZyMKGW2uOo9YcDkJSYSicK6yXAhqkreXxbKaoTCIT
	a27hfpFwDietLqngYV1fr/8r3nDdX2PkwODWIdF/Uthw4J6+v6IKridHpfFUCWHItvlceUase2D
	+Rsyg/eInZJpc0t6+X6or/ljh5xMgsK6/GpFiNUDy4yA4jh/YEHhBCV1XkoslslnDdeSFitOhBo
	ErL0DHYHiibENxqf
X-Received: by 2002:a17:90b:1c8b:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39aee0ab6f2mr12102665a91.17.1788412343352;
        Wed, 02 Sep 2026 22:12:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 3/8] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Thu,  3 Sep 2026 12:11:45 +0700
Message-ID: <20260903051150.178057-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221224_400362_E0EABF0A 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

The error paths in mt8186_afe_enable_clock() do not consistently
undo the clock operations performed before an error.

Fix the goto targets and cleanup order so that the audio internal
bus parent is restored to CLK26M and all previously enabled clocks
are disabled before returning the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 3edd0dd20eed..685dc27c7780 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -288,7 +288,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -315,24 +315,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto clk_afe_err;
+		goto clk_mux_audio_h_parent_err;
 	}
 
 	return 0;
 
-clk_afe_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 clk_mux_audio_h_parent_err:
+	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
 clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
 clk_mux_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
-clk_infra_sys_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 clk_infra_audio_26m_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+clk_infra_sys_audio_err:
 
 	return ret;
 }
-- 
2.43.0


