Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D996C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 04:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=; b=vOBHBnMlbtWYtxNimJ6RjI5jrv
	iW/TlFzqNgPxc3Dyn858z/DJgEN9GNz8yDy+dF56bpKf/FUys2qZBnh8i6NOsFaSWO+gEbIflabKM
	UeGADBH9Ed0G9Z+TNmf62X7q+YCtmywGF15/tgDPmwhnz5HEcS8BDo6grrLP5ZwMjkyseJCR1+mm8
	qGT9NK88cdUASbvjrwR6tf3W3xm3mYs2kzyG2O+KmdR2hJOutRyRJzJvbG/JuvuvhTMFMC78jzlbz
	kah2UgmUstbWgBmwGjdGcTESrOXH6Qx0EZniGyr9/q9VJWAQzbvpuIKkRnT8fjSdTDUgC026F9EuR
	Y1nHNNcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRV-0000000GLaJ-0Ndp;
	Thu, 03 Sep 2026 04:52:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRS-0000000GLYT-2bL2
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 04:52:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ceab75934dso24930565ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 21:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411170; x=1789015970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=L4n/IjnMWe8u9ojAErzissk94cABSeScdlukMxdHpDx2jKpKqajV3HwtTY7n9l16VP
         SpAC+01cGdK7D4kjgdi/Imv+TRmSwvlbfCctXBdKZmHZwxPPZfaTmrsKkvI/TE0hEx4a
         a4mTXMvf0yNQL+2Q5VkhZW8bjqTEsM1iwwzf9kJIKs3tKesp1XXhs0bZX4l3OzWY23LC
         JrUe+uJJb+7ANwxDLBZZGBy/jSvcG+5s9es5n8LVPj2YqLtW9bRmUP/ypMnyWSK8O8p7
         pLoqjWLAwIoedpl35PQHTds61LnobKNJeXrhRD/vExz0Iemvn/2Vyws9081x7q3VBVkd
         mKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411170; x=1789015970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=BLGip/lEXgFj9X7byoLK1CgLESV8QYFGYaR0jkbkn5IiJDZHey3iRLvYI1x1DTtXvO
         57pVYIjM1ktwAV+su+hJlexa0z4ncu2upUkd9il6seXZb5s+cwBQydPLvf+pPr2tOM8T
         +ppS+SkPyylfAcvEDPMHjYshWI70ZgIsOG/z+ZmfIYWp6pwrMH4cDVsKvk0UIkd0lIOK
         +896f0t1TvQtCUINTQoBOWHQJ/IfmQB+NRPwC3j8VkK4WrMIkcT8YCUhmItsdBG0ZZzO
         kgZkPdHY13//cfqiTSEPcqX6yFO+DboYXTbEW8uulVdQE/zKcy322icXOPPBH8ERE+CH
         K1Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzzk09mMpeeUA/wmvLNSLmXgWdZzP8WyDoe+iy1rwgzzAT8LXvJrupJF1X81ee+WFwFVIaKGuDKqG76Zm8D1w==@lists.infradead.org
X-Gm-Message-State: AFuF++kBkyG8820t+uDiwqxbIHAlXGb+pRMoLoJSF5ss78MHvoMscPQ+
	9uXoECqOFt75rGOsp8LIgE809ZMO282dmX8dCrYyYW/eR+8ZXeo92WJo
X-Gm-Gg: AYBFou0PClS8GQHohQk3YbTpaO4A/64A58iU8jYrO6MfcvjLz/Xx24XKfjz9bALx4CF
	7tRG3zswV4FP7o+LqMMixlVVEk8+Vs8CbG/5vnrMKq73YLeTEpvtIlk/lHbSRrpT6NBYGV9q2Nl
	mf54kOMrJ59LtlY5Qgp4g046N+DGfpAE9m6jmSAwTNRFlc7mQs3OgyxzbsHP7EtOK7vJU3/vJ2r
	Fl9ulp2JFz/PAGeTUMdS/XyZHilP49IK9jJ7WhQCootH9n50vS7ASbvqOnCX5CXZZYfrUts2S2k
	hcNBJ1+vcs/V89pZMPaAxXH45KPEJC0kcZeQG6IkNi5Ch9NDsqWYW1ADSXWyWbIEIbWmxbOmB3u
	/qV0wuAXurguN+mIi4yow2QK6BTneWYOdSIeKvo9+ekEZG2z2jz05lcqqjPZX0Ss3s7nNtAw+Ng
	Cq4VTjhDAODQNHaWCDtumEP78QItiM/CHT/cIbK3MK0RSjLlWvcx7D/ZBeQZQweI4OURY6KV56a
	LuaQixY8vU4FxjmT/SSuIF4nUQn23eY8r93uJPkTcY/Q9HwQNjVz+4Ac9ykL3Mi1lCyH3+P9+sz
	65wm
X-Received: by 2002:a17:90b:1811:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39aedee9313mr14120611a91.8.1788411169700;
        Wed, 02 Sep 2026 21:52:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Thu,  3 Sep 2026 11:51:59 +0700
Message-ID: <20260903045203.175337-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215250_672671_25F4A7ED 
X-CRM114-Status: GOOD (  12.28  )
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

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0


