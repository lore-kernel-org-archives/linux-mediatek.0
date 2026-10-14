Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D82CC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=; b=iKKr5EAlI1cDWHksMXSlgWCetb
	KYKMsbnlZHw3mR4uieWAa/+dhdvzs2yByfqq8B4MW2PjZx3ChVyVBMdpO3TmiGjj31PhRTd67Ywmd
	EDkhqJSodWyr0kujdkNyK7UE3OG0uNiC/O2s9f6jdQ0u7C42XwdJl9aLo1ixbVf7n0w1PZHdqYFyi
	/X3tyNPpoHYVEsU93VRsJZ5sLn4PCFSycuC6nn/UbAD6PIhQ4NRgV29t6ENoDM2PXdo4icQq79UDw
	ZdsKt/XPAwvcQKcHRB316NZQ0QCSIx0T9znYjKu+0/cHeZ6IqhVWLBwX4mZDSqsn0Cc0+U4dgrfJK
	eXSp6O5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9x-0000000FJet-26uu;
	Wed, 14 Oct 2026 11:28:37 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9m-0000000FJaW-0fG7
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so2909750a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977305; x=1792582105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=;
        b=D06YMWys9jvQgjL1mD4dybmOA8wt/owjp8t50+Hu4zyIF5tWF9VVSv0ue1LbZy1iq/
         g1vy1o7r0J6t6flIVpTtWXTMuwLXODzE9b7c05oORT0KOkG5/dNpHE6S6iPmY3guMaZH
         KftEqOV56MA3x0ogJBPeKROpC73SJaVxi+nU3Cz/rdHe+19DOdRA1G/1ZkVQUhQojDm0
         EDE+TSTeNOwlh0/A7b1vh27i5Oo/F7BURawOp/AMpIC9GnpnzrG8wfbyehX6Q43kIZgT
         TmMkmQRNYX6VcQCZi7KzYEBk88w0Vu4iX2gEQz4cdOUPwA+ZI5ZAUXX9XiwbcB8IJ3NA
         M+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977305; x=1792582105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CExJJFNeVdJxJ2CT2z02fSyns9MbGRw3UzVN3YUCwRQ=;
        b=QbYA7sJSJ/eiGaM/BlT33jN/zTq/QWvVM4+yqvYh4P7bXQ2nUzBvVEW82hrIo2DDLd
         rhFnUKJYMyBydT6ugQi38UWH4ZXeCKuz9otSpqkHUA1tXDG0LFuR5CHP73jfLNFLGjjS
         2ONtXuCjTvJeUKx04SNWiMe6tzROazjB4raKFMLDDRNd6L6ZJSOP+dfdEmaP4ar8qxHD
         gqsSCDAbkgwm/rqTUm3f7NnLKdI7NZTF1DdQg2SAqIP/bF3E63n6LLyVDqi6IxBidEDA
         IrQNa0t5va5RRz8mB0HzNf4eLnAKSiYTH+Fp98p3r8/biI/kpEOnN7cjYDG1ZBPacAXb
         0e6g==
X-Forwarded-Encrypted: i=1; AKwUvByPJi+7QeyHcgxjzbicLX3T37dFltVNFdK2xTkAgIkWl2sfwJ0LUTEx5vF7aRhGDPm76x+znAubX2f5q/szmA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL5iDTUmizDrXZMOWi8oDipXndAFrE571c+cgYHQ/wwURhfuWUB
	GLSDOHofR2vBDavp57Q3n8vOuHQxuYOGD01XoKADsA9jsTAWcEAD+2M8
X-Gm-Gg: AYBFou3BeV+Ny4VCZ5jCwciAMrFISzq2G1PracX2TaemS0TOCShaaRJXq/ynqq8jfb2
	xQ9ACO4J1jjwMiKlNB5Z1Mgry/FNVYtGpIN7AU7yVoIZgYguI96RSQHzLscUp4BNWvPR46ken39
	KHc9O1xW+vUFxEkYfqd/K9G4qY/1gfxcu2NIEsZf5MIprmdQKt+IhrviNDss0qwewnnCq40O2S4
	Hy4O45pMqvPr7IQgNTvWcAxA34K+k+z4WhTniUCY7og9AhpLDm4OoEOsPK02VFTQm5u4SeRvG4F
	jcYsl/LGCsWhhi6s3wNWCmko/3FCVP6TV+rCv7YEn3kxu+1cN2dNPgT0BlgizVKByxZ2plZFRNg
	1ZGgn9d0STtuN4344l2jopKKJ9fFc3mS9vCc24eohHrOSmAYbpiXIpzwkOV/PDNvdHGZJqmcFK6
	sGn0iX0YHp/kkJeOj0zPpFiTa3P90N33Z9fXSdeMeLDpv3tGHSIfHL4OnYpBVBk7ClKSJeqwW0l
	Fnn5hQE7OnZx5UtxMQQ1eS/iDgDK31/a4Z5oETdTvjHrFBydTpDWwtbDhr+BeGH52dDMDcJfS5l
	FapfnyaucW2eaO93ywtn2SlT
X-Received: by 2002:a17:90b:5343:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3ab3a9d3dfdmr12082597a91.67.1791977305154;
        Wed, 14 Oct 2026 04:28:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:24 -0700 (PDT)
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
Subject: [PATCH v3 02/16] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Wed, 14 Oct 2026 18:27:37 +0700
Message-ID: <20261014112752.683032-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042826_208222_BD6A416B 
X-CRM114-Status: GOOD (  10.32  )
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

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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


