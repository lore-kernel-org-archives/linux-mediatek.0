Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F98AC624D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 04:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=; b=kl8BcmvMM2pnneYfvDHoMPYonm
	gMQOSFyBPuhtHT1otRvx/ZT716zocb51kK2lmH2kkI/5ViWStPgyY5hLHcEs4JUyLoLhrgXf4vMJ1
	tUfjCxyIsKZ345LnSh6U6xRNxsStjypZlVtFT4IuBAmUDdsT4QNBdkaVREu8G8k+M6bNXplwm0mgK
	h8BqCZ1UulJrccEhqWZhHEGTo/FZGyEMBlZMuA3xLganusBACtWZtt5MLQ5YZa17tTjYQEwKpxdAT
	YMKl/xfC+5YoWlwvBWaEr4uN+qhYcYehTAVPFU4xlFP0kTVqZz18q7e6s9cQ+Iw9nTGlq1gkIKyMJ
	CdVBqt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRZ-0000000GLdU-16e5;
	Thu, 03 Sep 2026 04:52:57 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRX-0000000GLbJ-0Zh0
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 04:52:56 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2302154a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411174; x=1789015974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=;
        b=JFJDDx+wVbxidF3lY87/iHmQMGtYRt5Io/AznKqXjTWIGvoqdmiKINXEAb3Pb+IAU0
         PuNf3YTfbSYGqa1a65ky2P8UdBmZd8w/KVvwuOFPi9TbDotfOEwNx0Ttk93GtBCrkgqt
         0yFv/can2BXicT3YyS5dFX6zMxleb1sJqUci9z3/htbkUSvAFXARVCMpzIwb+L4VaXLq
         Bs7+iEa3rSKuIqCo8S9Fu/Fr1ekyiinrT01j3GYfNILupz8jQtavBvBTGqp1U4GEuuY2
         DmS34Sfb0oIsM6zyS9KnAgHSMZdDv+dYJ4+N4fFLTyUoTvdxinz3WZg3xYh+9DMjb02m
         rzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411174; x=1789015974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=;
        b=mTtEMIYY7c6Amt1rH6c2VJp3KRP3EjAZw13OSLkGWJ3BZ56XExocTYHRgKeCgu/gkk
         leKWTvNOaSTYAsl5QElidIJ7N+MzZyV9/qm26lvTiGf28+pH0xhqQdns9HEKw7SCq/BF
         SnjyZN6O4XQ5TN6AMr+bFoM2ecsOZhWVwQWLHgzA1ItO01adcVWDJd5ec97YogYzLxvM
         yjt/VW7l8VyCL/ZFWk/vQDk89ZeR61ixGavHjKFQJamDB3RMmFFGwj/q5rYjeUhvnwWb
         +KOX0giRsLf4fLsX28tbSGk5t25VowplhpzgRq6wiTYx9G9+lV3zz7v3mAVv4DDEEWqK
         X6iQ==
X-Forwarded-Encrypted: i=1; AKwUvByFLrd3sHIc6fXcW0Dnt4IxVlKZE97itgELZfU85/IySHhTPUU1eZL2Kn5nGglgzCV68qtMgwjuUvvfximvLA==@lists.infradead.org
X-Gm-Message-State: AFuF++k9Ue3wTX2G6HHpON3MwXJm5tyWmxxc260e0Fa5ITN5NGSAEs7U
	PZVixk5XlMbzpwfgFkxRGWl3QUmyX5Qj+7aTRuyIFcXT7I0ReQfuHWrH
X-Gm-Gg: AYBFou20DBCIozLd1ic/u4PRPQn2HEDJaj3feRbNoRM7xx45fVauPul9jL9I4uGimQm
	eM04VeLojdLO1BtyzDBfOOfsKSQ+bvv5E1auyUhvKl/MORMlsUWANEE9x5nQeJsOUZLwycMko4M
	OKMHPrtNjrIMUWubUHtIUrXBmRkYD6CQgcJrFGWum2LpyzrAQgmotmgHc9hWRfJnWgrHOghFCxP
	5PQIt2wt4NzMaQTY8saiWfnMEPTUwb6gQl4dmtoe5eBSzPl3/joTkd0eFU3fMHWcG7HPH1oXyPq
	1+dHslNGO9RcdqWkWfZY6s8oHZKQXzmj/ZvnLvj2cDi7GFrbZtbXZkfKlJ5nTJPaZMEi+tR2Ns7
	2VA7WWnsDZtyBTZerngD37v8V2o2AFVOFdxbkg8gCw1crJUbttTPSp4zAWb8HehRZvMqBHKXHwf
	etnjOKxb5cYyrX6oTP/n17cSbUWgfbedcxqcHZnUGI4D09qU5K/0WvX1wK2NZbe+kQE+GR9VgGA
	k3x3mxBwy6fJy2AbCqnDvMw15rXm1GXc8ZoAdhEOKzDNlV+b4jd5ElQjntYFnRqe5JK0xsar4yI
	Ut9w
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr14055157a91.14.1788411174299;
        Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
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
Subject: [PATCH v4 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
Date: Thu,  3 Sep 2026 11:52:00 +0700
Message-ID: <20260903045203.175337-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215255_185343_56FDC359 
X-CRM114-Status: UNSURE (   9.33  )
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

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Remove the goto exit paths so that all teardown steps are attempted
and any errors are only reported.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..dd1a5925af96 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -271,7 +271,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -281,7 +280,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
@@ -298,7 +296,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_1:
-EXIT:
 	return ret;
 }
 
@@ -345,7 +342,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -355,7 +351,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
@@ -372,7 +367,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_2:
-EXIT:
 	return ret;
 }
 
-- 
2.43.0


