Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B00C61DB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 05:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=; b=YyiXYuEq9STGSWoh9BqLpAkGMZ
	qTxN66fZjKOd7p0DOg7G7UmCDDtu2/mrd5s+jmeeJh5QrHxpaplXODizZSrMRW4I8zrgdIFwnGTLJ
	mH/uNfRVtJq1e1ZW1yUpKEvKAA1/HLoo/7yg3/Fj81SYC9iV/2n/bNGafSwn8Avab5Qmyvuvdu6Bd
	uA7bF1d/4sysBoNq2to9F5q/Jo6rAYbIOzJNQiLmoawcOXXwdErcQRxw1U3iYOapg9jx8jRiijbir
	abUTI7Y6/kj1p19sSt+GEVKBE7+SEJs2QH37R+IGPVsOevyX6em9k3bIJKj1pVrkGJ4K9iBFZVw3w
	t2fd1moA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzoms-000000057pI-0yy8;
	Fri, 28 Aug 2026 05:05:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzomq-000000057nk-0Mcx
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 05:05:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2d530328efbso5813545ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893555; x=1788498355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=VHjg3oET/CSzWIes+4+e4tde/gbrVmTLNoNOHszY1UxfSnpHi8jp1db23PDB/mGBaz
         1lqbIpPtsRgOhBe5hUEVxKM54PpFuyF1T2/rFbDWrll6MlH1G2W6S+FtufPt1PQmfWLU
         mUf0nVHi8xF4K+tLBnNBZNvKXH2abgxE2aGoUkVKAo8CnNm3dQZxRlIwpkSAw/2u9tMu
         YoolEW29w8egOqt7YHOWxrU/KQuQQAlH4W8GiyJsZkOR7leJoU86qUxE3WlvNcjpWP/P
         BUg1s7h1SctoDurW9lKd7A0DA9JoTcX5KyqevadttGsqKrQQtuEoYFRU7iMXcyFuWEfY
         uRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893555; x=1788498355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=Zw76fVl8osTrZBwFnJB+8gygKsmiAIlCHDULxISY8p6cCQAV7xVDtE3XHRodplHii0
         XPq+ldXLkq60gdwFAJuGMmC9MQ8t1As+y2qdJHk63iqWYkItvHvTQJpnbdESh5JFcpny
         8B+oHedcTd6oDvzAKZZqBTaMv3msqkbvMRPLnHWvXlL/3gJbI1AksU2RkZHWiscyNOnj
         VRz5EHu6kGILCOrVcFxcqht5Ux9J5sZPMKDQIpH7tqjk08rVI3ck/IwIBYF5dNR374Mv
         2TwMvhp55DTH+cpeT0Vj+MgzpbcFyvnE6xWyQzJnsRpBpBNW/A1lz/mDLB3M2WaMj/xt
         b2CQ==
X-Forwarded-Encrypted: i=1; AHgh+RodB8TNmhwjsNiVQFP4sDPOt2o/Z9hLAqINDy63VQezRTmJfx+wtIKMqKo34OETJd+xOLrxXDZwQ2477wB3Mg==@lists.infradead.org
X-Gm-Message-State: AFuF++lJwLBP84QR/7sNOpfjXfX5wNquMBobWDRpEoIr7IEgAKjc7v8D
	S3I1sxM59AYra+D+oxZzMn/FnLJ9S01uhA6cDEcpvEV+MF7B3i4UQy03
X-Gm-Gg: AR+sD13F+5kePiqku2PTUddCq1YSgzvwDd+q+aLF/GcSiLcyKt8re+nLxqbNfBe3Q5f
	vlZmp+kMJz2SR2d2rNwIf0Ibi50YDO4CKS2puL2/3Dk0KWAjL3japT81yxpvfg2UsI3lOHA0UhS
	fmWnS8fOxzZxIXEZIfhPrBeUFjjFsWvRF4PjicmlDwAF32OqOslYUDBlAfb2C5uXUY9DywavVBD
	yZi4aId7JjyhnBJ6zKV5JRSLoNHhKKA+5UkXHP5WVBUcgSTTyF3gXtkiwZ3xPvFrq2HEPNug0tG
	5YBk5ndpIYVNl62Sxz1VZl6SUkCcgbcm1TbdU0B0SlgW78tNIV6mfJnBpm6gFeu23bIvSTgeelc
	7i1/cfnxp+TA13sZvYGR3bjGfknUk5xymo8CnWpaot9Gn1bowgokrg+bW+0/Ijz24k9CF1Rs91H
	GyiuD1MyGr4/Jpi4rt8lCS3GBjzP5gOpL/v46Eh/8xYUvJI4vFBx6Du7a4KK11EL4kUuL3gO/sJ
	hssma1GphdDXJUjL13Z4VMR+KPhXptjDvlgHn+Et6PiZXwHKmz8WvTZdDH6qV6g+qFuYsmFkFD4
	4Z1h
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr8090761a91.0.1787893555138;
        Thu, 27 Aug 2026 22:05:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Fri, 28 Aug 2026 12:05:22 +0700
Message-ID: <20260828050526.590761-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220556_120863_F453BF9F 
X-CRM114-Status: GOOD (  11.87  )
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


