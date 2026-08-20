Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCE7C5DF82
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viEEjaaD0HZpFwginbzlEKGXqOy8NFo8cx0Pc50ZQ9I=; b=TW7YJQqH6K8VUUkjlxDDNDhJUh
	H9MDFkzhmvvIVDGXPH6kHZc1kgMUzzxJy43yx08o8f1lCK4PSAv3/tbwalz6gKnv5bAuqjaCg/4OC
	2Cim8Zfy2bvcn7G2y28iB9YihLZ9j+M2jM1lZahesF49cJMVIrV1ZFQUQv0DAU7pALRzxdlX1mDZb
	Shn7iC2/WlhjBM43igre+VIFavoktXZQ1ZxRmBfVCKiyppOxI3sodrORIMglTR4EoGq3yZGfiT7a6
	e5lPLIlGGqtaBa1RivDsHzsiEa06iqInxaalMFumjVJUM94NAljT68vRikrU51PHLa3rGAgyAIL9x
	fFntXI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iR-0000000BQKF-2eKX;
	Thu, 20 Aug 2026 11:13:47 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0iO-0000000BQFN-3hFu
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:45 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84830c774a0so1750809b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224424; x=1787829224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viEEjaaD0HZpFwginbzlEKGXqOy8NFo8cx0Pc50ZQ9I=;
        b=Z/l4ofyjWqm15D0n0xysIu7Z2eb3sqg4feX7rM50d+ffebQqOQLWFbvZmF05i1aYgT
         etHR4jeY4+Djxk4Y1qq+v3Fa1VSXSjUWSdB2+rwTJ7HgBVKnUd1LksxlZOLua1/q2HW4
         XOqCgV9a2LbOGxoQtD59vY8C58dNIwTr8rceoSNtkCEEvhKdpqw8rejy052kWh9if7C+
         KlBvs24ynTtdL9eiBSNrr5aRdM9eC+6mF+RyjxPg80Qs3an+kSLHWStl8Ophtj3oZgnV
         gnCl/L+UNAtyOPWZnFAEZF/uzgX+r4a7gGfGL28S512ciFpdUBQzY+hGK1Zjj4HROsHo
         2O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224424; x=1787829224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=viEEjaaD0HZpFwginbzlEKGXqOy8NFo8cx0Pc50ZQ9I=;
        b=H6Q2yWWEUlKPjoUVSjAqhzkEYE5WVAGMM1PNmvSCUfY+IqgmVb1e7tNZ7VAztAxXgl
         PI+Rj7mqtZqe616YPGXBYu+37TLsv/EtodHp+jW30gUpJBgL6iIfy4Dp4joOOnuUPafs
         Ow1jXyfQlrmTk22s4CroaHagHKqqiGQB3UKkxPpT+oyq69G4pyUdhFAavVfdNE1pW1Ye
         1GG2CNrBUz2K2LIpFXbvpey8XgdR0OP7EY4MF89NoGJisxpECqvPPIPT7N9MsnZINd7T
         AvDnWaYFGJ4cys04dWw5Q+gAhD1j0Ek0GlFUkF6tChHvrOKHewfuWVinvWOkKbjGEf8I
         TEPw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1VK457rCXBWHOE5bcJDym+EI5P5tnaK7Q+CPQ39wqbS1UqGpvCsYGnjoiYbaZvbdfHBP4ejQBZpEdwreYNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywshv2d20xmUZU4c1xM3eYs6mLmY+irZK5by25P0hUnjUlB+Oim
	+sM9mOtZ/UM3g7QA28RjC1CBrDes0KRjA5W5nUBW36UGENN4rZcFHIyX
X-Gm-Gg: AR+sD12kTWaV+GuPqUzW7L/iGNUzyhFa6biukDh8Ipyn30GBwZT8WYdjB8U7C3G5jhT
	+z5gnRD23gfTi444dSAxVE+j5+lePtyojJWQAgbeuKG7CLb/vRrpmMAaraaMxbq7GZQC5uEY0dW
	N6E75ckjC5ownP8WKl1W20a9UD8kd6zkzkIRBfcMQuA/GO4e71momrQMwP1z3OTVEWFYP1hSAhN
	oM5S+EEPJYMs18QLSZlHeOO28aJSUfiFEJuGJ+f7m7MOnOd4KpCc0PksjaEtMnBAV8T+a7AzOn7
	lq4ItSCrjwaz/bUG0BGUCniq0ZWVYL4jJAcM3RXEc2I4ehUP0PfdMlGwdQi6ulIH5tougPrIh/8
	3DTOlvDfTRtZMIyfnmddtBq7Gt8HtnyuMsDMQq2ubC1nS+RmdMLmsWoQrUSje7BjGnHXb109MbU
	pKqpXr/t8wzLMqkFC+c87Pekpo+ln+hpAf7XEnus5DpsknsJuuyTOpfqtdmebJaTfjoa7xUqIDb
	KCwTeigtiNJZsWHUcp066xyniQabWGQ5BzYwBzb9PYeCDK6LU+61xqokHVylixjDVwbqIUFv19I
	wfuxe1cXblnmTHh1reN93b1DQyw=
X-Received: by 2002:a05:6a00:9296:b0:84e:24f:2667 with SMTP id d2e1a72fcca58-851d38a4dc0mr18511585b3a.8.1787224423908;
        Thu, 20 Aug 2026 04:13:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:43 -0700 (PDT)
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
Subject: [PATCH 4/5] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Thu, 20 Aug 2026 18:12:52 +0700
Message-ID: <20260820111253.97866-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041344_937132_7B407A1B 
X-CRM114-Status: GOOD (  10.28  )
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index d6b0174e2655..8cc8eb8022b5 100644
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


