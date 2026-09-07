Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2565EC79F89
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5w7cNdqAAPAfRdm2XbkiqT/MAUxRyfM6lBKgPA3/pXM=; b=gK2AmvqBPLX3xDzPtT/1yRH7p9
	AbiKGwGAvkqQdVSE8Bl7tfX+pcS7fvqwO6x3BWMeeZfz8TMnmf5suvBaSsnCFE59mx2NRaPJSk3YA
	EEb8iIHcgFddpMXOh8PlanVUlmvrova2f5WTq3AQ+y3lkTA5RajZ2/51kP3xIw6IavDkv14mMS3Yf
	imRkJdepGFzfYAh07oDHSjlHclTyyDA54+tbhrJgaVRAKIaL+ox8BJm4nlSzkTwI+CHY09KsjcLkR
	7ovvcNlmTnOq+ZxUuEdYZXtPLlnrV9ooqwZS5I4a4yXr5kSrXvigi4ZIASbvPQq4zPdLnpc4L9Afu
	IVlwcEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y50-00000006kZp-02Ie;
	Mon, 07 Sep 2026 12:04:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y4x-00000006kWO-1ujc
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 12:04:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d560775ca2so23336275ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2026 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782643; x=1789387443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5w7cNdqAAPAfRdm2XbkiqT/MAUxRyfM6lBKgPA3/pXM=;
        b=HONxEV5NT71ynQ7/mzzzGq2JVH79nxVhbtvcFDLzcLHr9LZX4pVPyUjR2NN6LgrG01
         PmdPK24VdD4z9bGfIjsAS5OE0sDvmUmjHlmsqGXjgIpKx8fJiOUgMsGSGUQNjasu9CRT
         fcRv+GbU3Bl7Px2EtXyG3eBx6nDMCJCOvOavciA9XH3xIsL5U8TToZyWgVwePagios1O
         bndVUIRPxUiL/xLoGaBxssBAgsOJ81+14uvzo1CReGVsFdz/IYe2Vf3W/AnWQxVreAYP
         OQiPjnuhd7rq5Ehmhs8c6mTVKotd7LAi46hVXnmD7mN69ke2liVk6ePf8rZPmcq0FBHz
         BwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782643; x=1789387443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5w7cNdqAAPAfRdm2XbkiqT/MAUxRyfM6lBKgPA3/pXM=;
        b=WEr6MfmYzJxNdlC0IsIRUGbAjizdZ0RzrDI+vsJnZBs/qgYaxBavqBWFZaSZFSej0B
         EYpxypymG/1RCKk232PKMNRIN4fLSpDbdyF8nZFf66+YEDv0ofjwPpZNWwYSyBnHpw1x
         JNG/A3jwyhAn/NWwmrvfMbpqzhhbsapPsmj89FcWvpzCLyq2o/XvA6IGuDNoanGIsJCY
         +HW3ZntnaxCqSpntFdE/UZXYnGgJ+q/hyKJ0QhkZc7EM5Cg+Y/1rXMSwx/3USprXLeZV
         UGj1ouodI90nPYlYbKZGmFnLvmDCbBD9a/3GebiutRM9cWO//TxuJG3rsDbOzKzNQ1f3
         V20w==
X-Forwarded-Encrypted: i=1; AKwUvBw1l3yhCxhASG84oBB0AKJDcljhERbP4Gk1uG0u2C3tBjSM7LboQVgrW9XzPrd5zgFyznDW78G4FPZmtMYCAQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lJvtrdiItr5a2MMgNQKMNYlA3dxohNxzPqFtTml+dSmXNtSft9
	F2usBaVAqg1Tq79UyYIx4xleUsKfUTVxWX5Jn6ipDzHQPfOWCKx1LyeQ
X-Gm-Gg: AYBFou1Sk5cpuO3BBWl7YvL4yy8N+FQ+lmb8kvkjdaHRN9tTcYQ6iQzWBMPojsBZFRd
	NTMdhLDBzyKG0hYa/kTQxNKOYO+DwLpQuak0XTPJU0xUtN9nB14ZZwX49lzoqsnBpkXuL8Jy6Ys
	8KTxR9awmJp84i6k+q9Vfu2FWl1vm3To00zH1yqTuePNStKyIun8WICFWgw6HKiOO4f1bPV6AC2
	JlI0YPSkcXhE6RwP3KFGlnTnylG2AZEsgbom74Rk8SnBJ3Pp1jENlfPZHLEcsKycY/m/fk1wyg1
	fhObXzmwKzpibBb61sVZB9VJskPNmy4zJ0Qc7mph3EFJ1tcOwLXyD8Decb0E/4syo3u5h0gAvue
	VCZBtkXCHG9DfO7wfVlhXSTpe3wj27VFnoqHKOf83YM41TgsAQaFeuvLHJMvYTwCSeJQdDEWn6q
	qc01gN0KCP4eWujXQFS2AfWeMd8f/OMPu8SXur/zeX+trjpkizm04q9YndWJ/GSsiP07nHJxDqI
	pdBWvCc14VHrr/lteXiS3MYd3YfeAW2SJRAlzQ3Y7Xl9zNH9nz0hfYotmHUw8yZanglo2mCO/mO
	rJ+U
X-Received: by 2002:a17:903:1a4e:b0:2db:39da:90f4 with SMTP id d9443c01a7336-2db39da9336mr157104885ad.6.1788782642761;
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/7] ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
Date: Mon,  7 Sep 2026 19:03:08 +0700
Message-ID: <20260907120310.135693-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050403_510078_ABE87C5A 
X-CRM114-Status: GOOD (  11.78  )
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

Errors from clock enable and regcache synchronization are currently
ignored during runtime resume.
Check the return values from mt8188_afe_enable_reg_rw_clk(),
regcache_sync(), and mt8188_afe_enable_main_clock(), and abort the
runtime resume if any of them fails.
On failure, disable the previously enabled reg_rw clocks and restore
the regmap to cache-only mode.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..f8cbe7bac36d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3030,22 +3030,33 @@ static int mt8188_afe_runtime_resume(struct device *dev)
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct arm_smccc_res res;
+	int ret;
 
 	arm_smccc_smc(MTK_SIP_AUDIO_CONTROL,
 		      MTK_AUDIO_SMC_OP_DOMAIN_SIDEBANDS,
 		      0, 0, 0, 0, 0, 0, &res);
 
-	mt8188_afe_enable_reg_rw_clk(afe);
+	ret = mt8188_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err;
+
+	ret = mt8188_afe_enable_main_clock(afe);
+	if (ret)
+		goto err;
 
-	mt8188_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+err:
+	mt8188_afe_disable_reg_rw_clk(afe);
+	regcache_cache_only(afe->regmap, true);
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0


