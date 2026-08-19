Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6880BC5DF6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=; b=eI1+oPTUYbJyfr9uKYw31N5eWO
	4z6RKy1RAgJedWCVxb5qn/6Xz6SOzCS/zZsrCgUkUC23vRPo2x0QQXnaFPrLV+g6JgxG65298CbhT
	c9R1DS+AWLJRTU6ifE3mNX/QAA3XtoUa1cNIZcsv5aJfetdWqp2gGycDAw65ZtmPmca0pmTsDTUOH
	MrQPP4CY6gI6t+Z0RPi1M9QK8wO3jfM3CsIQMehuLHcZlGihMhD/lSPiY/5ZpcVuVc+6TC+6ZScUB
	h1cp3XnTSfsvAgUqxhZ/kEjN48sY1a+eCWnAawTcJvENdIhcM1ocaqAbxEUnHMI+jvsE6k1FlEQ29
	zNcqtBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdN0-00000009VQe-09yX;
	Wed, 19 Aug 2026 10:18:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdMw-00000009VOX-1DUD
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:18:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cbeea240819so407370a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134681; x=1787739481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=QOMz0bWqhfoBUlyVQTSzDV/VNdOcrHu8zeULU4GzEHJXGyrTxbotEhGKa0d3f6geZ8
         CtlCBHiDSoYdFAt19BlyGlw/LyEDcJNO66lxxWhXmwlIj4fJdLHkL6u7GVytWOqeKZIX
         Q7m/WR6iyAOOdJuM1RiUT+ZcXq28rFJWsK80qXtXXC85DqPNmVK64mXo1hWkR/ffBmip
         sPd27lhshb86QQBDJWVK6ef92fZpFC3HZxrHmsxqkNSZIJQD5FlmwKpiNGnvTdIxL/7j
         PpM4yt6uONfwicfFBWRjdhjrK25b6JUokuiruSKQ94LOQ0i2gCRKL2l9pd6JFPKnZjBW
         2Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134681; x=1787739481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=ZL4/TeCQzuca0MI2WBvuJPMR/t4Ow/fh4pctg8goT8kAdSlp+DCPM3kpgB0PMi5mg2
         YNlmDNNRMnglQkvBc4Km3yiWdCkAeiZlaeKGHa8fnT7mVtO/65Wf1NEBsB6jpqpiDOYs
         TVn7eL6rqEAtuyHV6uhLABZZG2f7YbdMRDMVutFV4creear27jLIbMNt7BrfAruPzRMj
         0I+r1WO7c6SwgrVCkaKfzc5vhZmxYrp5JshDyrfm2G5mnqi5ayRVU+7mSk3Rp7Ih7fLQ
         khGltJd+/lf60560SLlb1ze+E+NQ9PD0HDf4zOo59BLAFymtEy5qzO211mWlqgRbKeOU
         SsUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9t7Bk7IqkO4hGpNcT+jVbKU357WmbJjXJmuGR1Ysufsl+g0g6/YgSR/oB/KX+S+MmsV80vHwIBrA7Vgih2Q==@lists.infradead.org
X-Gm-Message-State: AFuF++l57a3LU5kDR0r8frui1B9hGlCpperQasXSR6sqtuLUSsaRwx5s
	yMvnRTSbaa+NI8Xb+bc2SyQIq7MoQOdFG7gtUyMQyol6Qf17bpmfUiGI
X-Gm-Gg: AR+sD11k4PswpYX1oklxFnO2L1eS0GX8rMI54AOW5/31RjHRtbGXmqg0VJ5wCZywI5a
	2STdeau2WdnznaALyu+ZBoyg8ElxbSk1ucMh+6DgmRycp16zWJe4yxUJzrTZQzfKp4PnQBCNIBS
	iuWHIzpTK3qnXWq3wZ4CNkPaZYetb1BsyVz3tvTIm/I3lsxwz307Oot4xyrH3kJ1O+dUQWu+Mdr
	z3s7CqqtDy16/i0nLfQKcctJCIaQ57GxVHhYCe1RAS6OTWiCAyLAN5o2BN7uvVVsitOobaAqZQN
	aU6jRqrCEDIWC4nq+Rb+IQ8UcfB6wcYUSvrblegfLdjDMF90NiArdtgFgNnaPOrxY9B02158b4j
	w7bWZZKDWCAjn7P/q2DstOM8/ViPc5xJRIDbE7drhmquyWKr5YoqNASuBOPgryoDxppvg1ZYLuq
	tHT0XHikFHgDWIemqJdEPgN5KTkv0G9JihdyOqQdJde0Q9brAVdVp6wVYDRKy22DZIYpf0SWCyb
	NC+q8tL9OKdFkvOnPEdUaLBFqOmITAiBMeyQNoxsqFV9P3q1x4BF1YJJ9OyXvL/MX0eEkCyZEnG
	EKUp
X-Received: by 2002:a17:90b:2b4f:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39580f7aa49mr7033129a91.14.1787134681234;
        Wed, 19 Aug 2026 03:18:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:18:00 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
Date: Wed, 19 Aug 2026 17:17:35 +0700
Message-ID: <20260819101736.67632-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101736.67632-1-phucduc.bui@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031802_561371_D9EC0B09 
X-CRM114-Status: GOOD (  10.78  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 0ac04d73b777..2326496f8b27 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -43,12 +43,9 @@ int mt6797_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


