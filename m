Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0437AC61DB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=; b=j1ua414OFrA7dUSKoabbzB9JXv
	faR9Q8Tbb57WS6RMOTerNZATNfnD9WYmckFzY+LIv/5H7eU253cyafdvpt74EXdgMGO1Yv0IA06yV
	pADnZzl0FNPn11Jv3QIOYwagNoGwS0D46MPAvs2nqSFgIhKobxJsUeWZW8c52NHdIoQXqIRRmhuym
	HFVIdJJUEKIv7+UOkNZMDSMxBo/OjvVIvsY8gaiPXG5QXDs4At1uKWC0sqbX4DewV4UX1ES43JqWD
	zQ4YiMqRW4myXWQQIrJeF4I7RF72RwybpDACvroDLE5+OOh8EDw8lIcOKN2RvPATv0QTzouhnoMs9
	6tugqnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshE-00000005QWQ-0rcn;
	Fri, 28 Aug 2026 09:16:24 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshB-00000005QRR-0xYv
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:22 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8525efa7274so713923b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908580; x=1788513380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=;
        b=LSovlaTRWTl/41rrZcdJqi8zP9eZb1BGoS1VW23uXRHi9XFxTuipn0GpFi530Tg80O
         DU6GJkWUOUVd/gtTSg6ewd0zNrFDyZLKuIXPrS4Oqr8TLGSz0vW20rJyoIwXZeQKF7gT
         JJDtL/sqWSYz9rGVoYhmZDPhYw2I59p0Pzpu81ZvDABMBON30o9nrmU7Q1sOeOViJJJC
         k2N7oiC7Sqp1dSRq3+3PQf6x1X/yR69b0B9VIv/lxklsXmsG4tf61zyNULAfBV0RtDEV
         KLtBP3P7Bzssl6aWy1pLCeqBama8pynuaMoEtE4JzOHGOO39ACsbkm2t4u6ieNVI76F0
         5YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908580; x=1788513380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=;
        b=Gwa7VVikdEs8yDGVYx27o4272QUFmK+IP5oU4MvCWk1hB4zUyjW40OEIH6gCv1OpgB
         3NTT3Iu7P+4wqZnQZubjNGLmvN61CS5fkeSkUVfiHHfY19889GKaLwtDgScr9lrmEiKK
         YxnTfGfeYVXqcucyNfvPzHu8X8KthlUH1S10YGpiZsU3RxFpa308PYWd4jKgK4NqU45A
         CBtCyr1u3dvV0N8BKg79O23AOFuOLLn3TERcC4QWKYn4wp1L2mSRjVf25njPLn4BbeGn
         919BY5Cus2U1T2ptjRIt4Ar9OYNN/TpNKEbIaGMl8YlemhDVZT/ncJDeFiff+AdT0sZ2
         1t9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrUBdla2ZCl2BQFpUIYuEIlLC+XqamQ9XXNv9A5ksjFlU6C/LBE78iXCb8fGKVE7YojPIFGWsTNSQloyykmHw==@lists.infradead.org
X-Gm-Message-State: AFuF++klzQT8UcRX53Ld+ZlVqEXnqFObHv8wnN3w2Ehxc2ByZ7H7hz4y
	rGKaSCzALVxUtH2WqsO/rFUVJayP3wMtWLvjhRmMOg1/7CYEq5rcxWkN
X-Gm-Gg: AR+sD11Wsi+nJncQ+ZsNYMh7iESoRtZMiKyWcrJi75PL4byQBbM9yZKvN/v++Q9AVwb
	jLC/r8QQif9z852OsUlF1Daf+u8bR1Ubf0J8ywyqjh/xWVg1XkWC8rl+ji6qh3xa1rzFDt3V3TG
	0oRx/41UmpTZ4uciekbpvXNE0DNWH8LvWjyCtTuv1VfG5mxEtumw5weuoGToO0RVGclhBLs0aJU
	+HltnMuOUCVf45me9fqc2jlwbq/lPeIeigbgsXQUhIZ/hFZ/+lSchIRJ+npCv/FSN8k52enKBK7
	n2omBy3B82AHKJdaKOy0Ok/fJz1UYfyHuhAdQdlBd6ln1PtcXTdNRIBoai3Bs04Ac3//eKEsSV8
	zcGSdZrIvBtpfPQgYJ6Y2ybCBPw7gLejzX+0ktdXY1bKohHugYOj9XZdP2GJnHJjOsQ3FEKXT5O
	l2UvkLRQxpKa7eHjPPsnkQW7cQyxJHsrptKTkYHp76HC4NRjWQrO7ISOaiVzHZwv0uyZa/d8+C8
	peq8VJ7FndECnBfDL7A1ORa94vDPoMlDuXr91UrOJCXs+VNosVIb0gQCF2GcecwdSeAo4b2LL4n
	GOVv
X-Received: by 2002:a05:6a00:4109:b0:852:38ea:3fd with SMTP id d2e1a72fcca58-85629a252e3mr11093863b3a.11.1787908580220;
        Fri, 28 Aug 2026 02:16:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:19 -0700 (PDT)
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
Subject: [PATCH v3 5/8] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Fri, 28 Aug 2026 16:15:29 +0700
Message-ID: <20260828091532.600047-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021621_337065_AFF02FB4 
X-CRM114-Status: GOOD (  10.14  )
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

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 85fe828ca5ae..6d2871254e32 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -536,7 +536,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -545,16 +545,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


