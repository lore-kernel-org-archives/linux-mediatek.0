Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E626CC6B2E
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odTbZLgwCb6DBPfwUfr7A5D1sZLLXU7jZEEh/Gyu020=; b=jLUg+GwfgNei0VcDi1OvkNnpTL
	1DyyMp15zHWKJCv+9bqLoObL5/U84qreZ0K2Kf+Ij+OJqDm/cyvApJ0nG8kg8Jzg+4EkwVBDoNvKY
	gNHbcTq43lzMQfBr2fUzPllbkgCTaH/wpE+2UN+h6g63BS4J7e5JR1CCB9OKS/vUmmXhcVVJTYGw/
	lObQRER4VWo9LVomdtP5VZBgGy2dSQJ9RRI8BLN2piP0BhCwcMa+cs9K8DF5yGeLfUrnZkYtbDmNn
	Y1NAmNmgxz0Zow+pjErZUHjM8lnB1AlqVCqs0PNNzTvTKKFxNL5+FO1tABHxZszN5CIT+bKt3DlAS
	0HEh4X1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAa-0000000FK7Y-0z8b;
	Wed, 14 Oct 2026 11:29:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAW-0000000FK33-1PdY
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=odTbZLgwCb6DBPfwUfr7A5D1sZLLXU7jZEEh/Gyu020=; b=a6Qb8oYnGrfMTsmpuabVG/4Uih
	7eAD/Uim6hC6z3JwJu5awuxaC5N3euMD5fb68rZG6MtFMxnTKq4nyvcfxKWRUQK3HIkRArpI8BNuZ
	qJ+un/6icwFDW4RtTdUM3I6MLmK4TcmFIFx1cp4XZ+YURJVrs7SUsSBnBib8oVDw6Y8jn9I4JNU9n
	DQXmVfWVMTszf/IcEW2l66yVOEWdrBC5MD1z6u4HUVwB2OLuDCISqGKoO93Vq5dYHDXsEQ19ijBI+
	ewLfRk81YDsDv08fRkM3Pf5eBBSmoX8zcNtSmCJqBaOX9CxSYG+nokOh1UyH8Pgx4ID/rzoBzeX76
	83w4lQFw==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAS-0000000Ggh1-3dcN
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2050062a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977347; x=1792582147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odTbZLgwCb6DBPfwUfr7A5D1sZLLXU7jZEEh/Gyu020=;
        b=bJtUo2Q7NNp/0NebBGyVYMK0evSj41h2dR/Ojbcsvck0oOpWLqf6CvLdqVadGaP8RX
         wmstZ0GEKWfPvXMZHt4vWJ7PlPpfBOjPmMxRlwe1+Wc2J4oiWbyhvgwU/GFsjAqu+jdr
         vu0E3x5KEMASllxdx4v+f7XRIveQVsrvXuvdHJPdTlNPbXdQpVHY0BBBB4DXwYLiGkhH
         K8zdyKn/giVkGMa6gdV9Zv/7201+pPi3CpEWtDucse7lQm21yfKXxbhMMYBCTKooILyg
         nemVcQh2ob67Ad8obLm2SyrLvY+NOl98pJeshGE8clZGteqfwGo4D5cuFZxg98eOnr9n
         9few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977347; x=1792582147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=odTbZLgwCb6DBPfwUfr7A5D1sZLLXU7jZEEh/Gyu020=;
        b=glDvlporoND/9eEFGs3AP5FgxGIyA/Ibw79NWmy4uKknNeDoM16Qm1be5Rf39ZGopE
         R/v3Sf8iG1gAFeID36WA5pdki+ndW1zSPQcVuDSxfG26Q/Szjf/PWT2zZZ+iGgGXbyVu
         fR5bPWPKGxHSbEpXNk72ER0XJ8L8i/S4zNpiSCdiCzP8c5y0i9eT4awot2uJ1pp7i3fz
         p0ZJtwU5GFSlWvzsrjMNeef444StpHpk0czYZBGxDNtZCSvjNl2/DSCMdnzEzGGSnD+r
         EmyoW/WvVuVpj/pdeU3yTE48CNW0wBdOgnzGbOz+TzI4CBJrNKzvv9CnGYxI+xEYtti9
         +Bbg==
X-Forwarded-Encrypted: i=1; AKwUvByVe/5fpYw15AQfiZ5Z8HwarMvs+xXdIUNtHPVgqjaveyJDy1CWUKyG5hGBqerUxePUo7eJILQRTjg+Q7zaAg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLyeeQoihdbqQ9fDC3gef3AFzvyy0Rgle9FlYn/diRC6MT7mjZA
	ce7MAgQoKGY6zcNMhIQmhKRZes0JlYhJhd1MT5twDv/xL+LGbLDQ4RJ+
X-Gm-Gg: AYBFou1sosl6V/XRhpUXZLuGE2UuN+JFq/4dTymMML1lK7xBbTmvysYqwpyRUv9PeET
	7K8RQEvDFqmI9GRZpOhVpRlHhgbYqbO/Z6R2qw1CwgF+1VEUb2dpf3XSeFni5Jt2t4t3zsmaWcL
	8o1coPQcCoikfkqYYLklK6jgNYdYHO0rUpDkgnweSQGmbAKa6PVoCNfyCeozMA/3aCqmK6WLYiM
	HTh/7kadEYIKZ5B2AJA5DSnzhsYEMIxy2meDi55XA2J+ozbtluBbJ3AO/FyRAF/Xr16NPnANlJm
	W7/xPClk7+tbMIb3sOOTIAEFS30Mc90lEej+2iF7f1Znb2FONtHhIFc+yXucgXQwJs4Jkq2xse2
	VDMLkPTPyhmyWYOHbyqawv5wrjXfpM+5fb5/uNtcpJzKzk5mQuw0RKCxWJr7pMBCzW6dUVVeRfT
	I9dBicBXzKrMedYjz7fQSqJgskgqUS2UVhOiOwYkx4THShH7KZK0WLoZhlIkSvYZS+fpTQzY4W2
	lIk8GuNBqVpq6wyO5TsB/BAk5CwdV7RW1sCt0FCVL57dfWf93LWBE5kawnYkQyLZYdcBrkjtljF
	T3FKVnvCmDqTdg==
X-Received: by 2002:a17:90b:5343:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ab3accfc54mr13243703a91.41.1791977346715;
        Wed, 14 Oct 2026 04:29:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:06 -0700 (PDT)
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
Subject: [PATCH v3 09/16] ASoC: mediatek: mt8195: Fix runtime resume error handling
Date: Wed, 14 Oct 2026 18:27:44 +0700
Message-ID: <20261014112752.683032-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122908_962600_36646381 
X-CRM114-Status: GOOD (  12.96  )
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

Check and propagate errors when enabling the register access and main
clocks during runtime resume.

If regcache_sync() or main clock enable fails, restore regmap cache-only
mode and disable the register access clocks before returning the error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 4216c47a56c9..19047887ee21 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2965,18 +2965,31 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
-	mt8195_afe_enable_reg_rw_clk(afe);
+	ret = mt8195_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_restore_cache;
+
+	ret = mt8195_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_restore_cache;
 
-	mt8195_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+
+err_restore_cache:
+	regcache_cache_only(afe->regmap, true);
+	mt8195_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0


