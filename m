Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70989C9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=; b=XiDY6VTkZutpEFtDltYeL0NQmF
	M+xu4lPqkJHa5YLLDY6pajIwV+8HtRISzZk11J9PF6IBhbPVdQPc49KAcOjO/169quDHl0H2MBLd/
	EI4TqCD1lKmifxT9BG/jkmq5xLBZHvDimb6rZgYVdgGHAaxhxE9aZELRnPMyh3Ql0PDXe4l3GI2U3
	TK4TbjjJCgXixfUpRi71HLDMEwNqpKoxyWFd9fm4TPfAZvFNg2xKuHiIHgPfc4psQ8Nn1xIew7AEX
	L0vWr+H11yoZk44I7jopRrGK065T9NyyDOUy99cpa8c5pHRGCpgpXLaLSKKv7ntuMquurotZm+kFo
	tjrwwIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtS-0000000Cdmq-1lUY;
	Fri, 25 Sep 2026 04:50:42 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtB-0000000CdXM-2cnw
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:27 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso413087a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311825; x=1790916625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=;
        b=h+K+x9c1wq6ZgJ97XboU0VYIRMOmLU+637/bK8eZ64mi+PA3va/rYWGaDO90nZ323C
         7BGUXI+XxO2r/mBN8Ob78ZnpvH6csSAnkmGf6fwnX7R+5DCuPnobyHKXFszCUlcXvHz6
         UqFVjK9YZYhYG6ONadl5GVdcU/f8PYikLeRrDGpueQKh/juBNQsba94sqthvA5AEtm7y
         6NDnjY6HgYjN+eblf8B/Mzivoa0YlWPMB4MH2I9jJQXTUOlyOjFoIuHhbBvoQWYmaAhA
         VekjHD1CANU4/psqr7jK88JeQ5IF1DUfNerRqfTb0px4EDH86uSc3+IYV4sxpNehDtku
         UR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311825; x=1790916625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4GNAjod76l6NOc1BH/+OGpfP5lfIuJmdZBB1uffkhg=;
        b=MJiOQcMXKoigbCx5+NQKHyviXdckVzF9YdDvOU9y8aFFPelSs1jMuRZAE1lTKioMHv
         CqE5pbU5tLUfApgq74sQDrUJwbCnaizhCr/p/907Eu5a1jXt/f3CL3RpKkyNIRBIkS/i
         21q+h0IkQeLT97ODpuK1X8dSCXDoYR+S9jcgGoGauZUiKMCBCiywIjuUg+EF1G9LFSgq
         XBq+ZjKfJbCKqzbmP5H7DmUgCQ0+JOMH9rasGlP1B6eqqufNp6PZD+wKtOrpHGBwcyZ3
         kG0ZjwwhV8X2sMsupPff6bbshFkrDqD4t2syiCfFsGaJwIkxlKkbB7HTcBr+FOJCefGh
         btAg==
X-Forwarded-Encrypted: i=1; AKwUvBwxNFCfgN9hi7l1m3vD4MFJbH27KsAaNylpwha/yRsLBb3QPTVhW7CTI8ztHLX/6CzAVu/Mu5+TAjkwZmSmQg==@lists.infradead.org
X-Gm-Message-State: AFuF++myjrOFd/l2TTwg3eZzGX1E8bmTDFkw0CBQtkE0uB9t7F2hIsAy
	koGw5oRRlGHtetib6qVoSPFOrdtTCHAPLCraPuVkdXfu1f+cSfmNoU1Z
X-Gm-Gg: AYBFou3pjGExL1nuPi1YJmkuogIGcsp/gXDM6jimi56+pr/LLYjqP0OnSQcmmMpxD0E
	anovYbetty2948Hw/N51+qCLv7sevsn81/7EyaZeoFk37289tNsIP85Ymlr5N7gXAHDppEWDh5N
	W6l2CNMJzd1oc7urq7+xsh2GmvP6DSFJJrAe+rqAxxqNC5J2fbhCZF569139oFDw1oKP7mMlyU5
	Q0TPR6uoDlg495aYo04mbkk8s70eFPScIMp0lBPWLl0dGDqVnTdO5KXQYu2IO/FVcZACAeU7I9e
	J6+Lm511k95ikR/OVd3pO3rV6LNyWIRwo1FDecHjUtGUWzAvBmoVXxNb62Ynv+GjalWj3nHLzqX
	a4Pbi3KpEWz3FHXo3vH4YxAaUKkg/C1v2bt5i8jPVrCvCe/Glsvuzo5x2E+ym7Sj+wWuxnNGyGL
	Mj1mse62BtgnrEceEBbXsvtobta78esUqCyxLSzqO9120oAN8N2ecRc07xlM9xncG17/lQQK0lB
	/FrrLfrAIjLU+3O8mG7MBC5qJ2+kXbRLm1YKRfDa1orU/RAhDjnCM7r5mXzuoKGJWc4uq5g+Kx/
	ZLJavpEyE20qHQ==
X-Received: by 2002:a17:90b:2c88:b0:39e:b15:7950 with SMTP id 98e67ed59e1d1-3a0bb5789eamr919112a91.23.1790311824883;
        Thu, 24 Sep 2026 21:50:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:24 -0700 (PDT)
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
Subject: [PATCH 07/14] ASoC: mediatek: mt8195: Fix runtime resume error handling
Date: Fri, 25 Sep 2026 11:49:01 +0700
Message-ID: <20260925044908.450775-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215025_718544_15FDC170 
X-CRM114-Status: GOOD (  12.18  )
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
index 5e76625915a5..be150c0f5472 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2958,18 +2958,31 @@ static int mt8195_afe_runtime_resume(struct device *dev)
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


