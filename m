Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA65BC79F89
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=; b=fGUZcw/MSdTyyYkdr3ZuGqu9kH
	zzl9M1wWkj8uS096cWQMCAVfB1rp5eTKMFbCAnm42fhKlcfIbibcORXqkJMfmejf7LHHyk8llVH/Z
	P/pfXuT75fl1q+ZJ5sBl9Iz03BYxOp1mAja1j5s4WUVLrSx8t6t+rExCmVvAcPIDoy0G40TQomySX
	0KzzmsQU7nbcKCdBDz8FDbbmaREBFNKB+uJAJxPBwlKTJhxWg364LDpa5Qrvz2RvTYd2ChqvJ7tzS
	URjdTZCpmcj2bwdzQ0gUzQnaee1U5IgyIP4HRwK1bll0xu4X9zPhmI6Wh/kDDh1kiIJ1U7uDZ/BX2
	khqxkP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y5B-00000006klH-2chC;
	Mon, 07 Sep 2026 12:04:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Y56-00000006khj-3sNw
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 12:04:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d8f265cbe6so25757275ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2026 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782652; x=1789387452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=;
        b=PVch0mF8Tyt1ivRvxlXAaR3ibL+f956MpUOrYSIREwWpCee6HAz6hCnwEUiT1mnwde
         fbnRHPCq7TZLtFaq2N0RwAY+VkgeYfjEnQ47Y/ak+cjcjIVnwwqkWvspw5fCbQUs4R6c
         60nh4LapgGzkpXNd2ZRr7CkdfXishlAcAPExpIicu9VOx2ySamtHbOC+zgBYQYFcwM7F
         VMEfkeiRzHn4jNugib+eQlocHScWxOHoEOT9f80JmGUYYa4dS5KKr4kpI3wgomb4+t6r
         Xhzah8dCiH0hxOjRpuGjQMk1YGjBpLy3K0aHW0kj/a4bqDQkEsS0jPI48RTeNXc0AW5j
         FYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782652; x=1789387452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7h2S3qXgjH0d2/zuTeGXDlTjAza128Ox3NWLM9is1c=;
        b=JanXrYQjPPxoajZAFR0GBZMtsstIM7x/xF3lBAvsdD2HwN1P9v7CypfUXZqRnzS50b
         Q2TDzXDzn+9DNwrkPBv0WqxbJQZtNGMSloW53nNuQxzvsvObqLNSdCk1eJV+EKhRAyRZ
         ZXfYSLbGt1faJsZVNLQQEAmCMor28owSODSful60LGu12kbNU0A35PPDce0dhO69KvDT
         VuAu63TbMGA7mZgTXSdxipiqMsw3mCYkuzhZ5OHd698NLRoB2FtJWfqMwUqXCcCvh80o
         NWz0a3fmeG5hAJCr9XOm5T5DB5q7jB0np+uCgTmkRYDCC8FBnMviA+lp1siO5wwpUPKj
         MK2Q==
X-Forwarded-Encrypted: i=1; AKwUvByqVQjLpOnnavBjd1yc+FFCrpk3Lf4HdSlFGPpYzNnKxQ2jAmXoDUPeTiQHldwkaIQIrAPisSv/pOmwMOeAqA==@lists.infradead.org
X-Gm-Message-State: AFuF++neDFMOxaiqgbJ8yjHGWRzrv2iGH8rhfKwoby6CJk0cmiIwo7/E
	NCNKMUt1NjFrmwvFwh12MWd/ImBhDhafAqXxa2dekVslrPo8s/hUxtDh
X-Gm-Gg: AYBFou2XBJs6LlpxgF8sq1irEwwYNMXJrZPa6RCSI6jPKgghGfKbvdyH/jf7fiSC3v4
	Cl/DzIHX4sYiTcEEGKhTOr/ZWamFTYMQPL4BKtW+FIlvTr9GBYbO0IXeIPV/lA+XA/ZWuiln9Kr
	gu8P1W+11GvvpelW/cH/aRWqOf2cMTYzCTsi7+pcZl2xoGtETC5vwWJpOGzsEasJHEX1+F8FNRY
	+WDvlatg1v5cFZgV5Fst6QCrgJYjnc5U18cCws1tEA+mxtw6q+p1kGhwpSU6rAzs0VLruRWu8Gi
	fWSADhS5Znj9TfxeiZBLzHsMHb07kizly/j3YotDE5CGmtWgkR1G2vskrXTFCsOlouoGQMCgseP
	dYR/H8TTwGJfvujMXoIgENMO5gP3K3EIMqgsYel2iNM8hxROrKuTy2TtG9BwpwWhW9Id9pwzy9g
	td0XIKNNOyxcxywlhkGlo4RtrSt5LN0sHzA33HsyRNi2mK7J9gQpPgDOgqpPvX4/Fuf1tonfr0o
	FwlVUKkUzD4Gr1yB2ZACnyz7I1qnZAcVhxqeYkTOPPflLle0zT97D8HzjROavpBEQ1rx+P3P0DY
	WPnE
X-Received: by 2002:a17:902:ed8b:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2db126d8fc2mr211708425ad.12.1788782652165;
        Mon, 07 Sep 2026 05:04:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:11 -0700 (PDT)
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
Subject: [PATCH 7/7] ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register
Date: Mon,  7 Sep 2026 19:03:10 +0700
Message-ID: <20260907120310.135693-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_050412_966653_091F94F9 
X-CRM114-Status: GOOD (  14.63  )
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

devm_add_action_or_reset() is called after the loop that registers gate
clocks. If kzalloc() fails mid-loop, the function returns -ENOMEM before
that call, so cleanup is never registered and all previously registered
clocks leak permanently.

Move devm_add_action_or_reset() before the loop so cleanup is always
scheduled. The clock from the current (failing) iteration is not yet
stored in afe_priv->lookup[i], so it still needs an explicit
clk_unregister_gate() call.

Fixes: fd67a7a1a22c ("ASoC: mediatek: mt8188: fix use-after-free in driver remove path")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
index 972f097a13ca..9f3b3a777577 100644
--- a/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-audsys-clk.c
@@ -170,7 +170,7 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct clk *clk;
 	struct clk_lookup *cl;
-	int i;
+	int i, ret;
 
 	afe_priv->lookup = devm_kcalloc(afe->dev, CLK_AUD_NR_CLK,
 					sizeof(*afe_priv->lookup),
@@ -179,6 +179,10 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 	if (!afe_priv->lookup)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
 		const struct afe_gate *gate = &aud_clks[i];
 
@@ -194,8 +198,10 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 
 		/* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUPPLY) */
 		cl = kzalloc_obj(*cl);
-		if (!cl)
+		if (!cl) {
+			clk_unregister_gate(clk);
 			return -ENOMEM;
+		}
 
 		cl->clk = clk;
 		cl->con_id = gate->name;
@@ -206,5 +212,5 @@ int mt8188_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return devm_add_action_or_reset(afe->dev, mt8188_audsys_clk_unregister, afe);
+	return 0;
 }
-- 
2.43.0


