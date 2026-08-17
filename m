Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E11C5DF7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 10:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlrFw8orvz3TJpMVjqa7zWk7IHsR8vKJ7UcbrcCP+74=; b=GC8wAr+TvNtgWcMzNtu0OhFb2Y
	eWRz8F2C3B36Yb4l9HJE0fse8iQ1PSktyM+WHX1NdvdKUHSYqDOyR/fX2QRrBaHpYjurTkFvEygzi
	d7Z+CASKBWAA/kr8VCweToZd7xZk6lP4PtP1hRx5FD24UeR3hevk5a4Xuf0wvWU+wxqKOFYGvtjnq
	zDlePXynhUqLfWrLKt0rTsA3y2XgiaySBO8TkIShvj/Ohnmd7BdSWhjndPgOKJv5AJmSW4xJG8Aa1
	VrH1XQogdiH488gb91W89DKuesjRS7LMww/M2D+crVss4EDvqNvGSDqNnVpHxVdKEhTazioCfzKzw
	7Ra6RFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuui-00000005xcc-1gx0;
	Mon, 17 Aug 2026 10:49:56 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuug-00000005xbP-1c3Y
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 10:49:55 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so3336308a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786963793; x=1787568593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SlrFw8orvz3TJpMVjqa7zWk7IHsR8vKJ7UcbrcCP+74=;
        b=b3ZzdApGQqEhQq02bkKKDdCSrkuEY96Z2+pbCbJicYx+3maTCL1GWgUFHvN2elDdVE
         xOOvsKB7mtcwFKJENG7w6bRmrltC2G68cRFGD6ESpkmGpI6Py1YezyfqYtek0i1KLTiO
         WL7EYG6wJJTu4F3paFwqwaVU4dW29UuBUrSfA2i3RrBLAAuAew1SOzofn26zXHSPzGHP
         MXOYsoHQzszfNTvLgHxyiqxfQAufKFp8kS/a4vLavIoJ1IXE4NMBj0joRvbvFJTSn6sH
         aoX8yxe2OcPXp7dlGAYDduAs1o4NQhk7UFOHecm9KjtYik9PullzPrCaUrjpD4eZEd9b
         Zmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786963793; x=1787568593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SlrFw8orvz3TJpMVjqa7zWk7IHsR8vKJ7UcbrcCP+74=;
        b=slmn/c8h4hxN1NhN7P1mjmNYOe85vo6CMQS3Rlj3//EwRw+m/4/xizt2EPRSPhtBBu
         NweSbH040W+esn5as3OFesH0heFUEUEgI2N8tTnw0Lql6QNkT3SaDv+GrjjxgVfCSZbd
         NLMAfTrM4/UL8/N9Z2EEJp1KJvPZepGdidB9uV7OcRbFGfcQpPvyiFDgoV3WBCf1jeT4
         j/8S+C9A3NrfgRZcF/+So8mtmOpHLJGY4A/2uGPZx1XqcOQJJjgFBBqWAiV1LBPePccN
         /8sUas/17w5Hlf8pchmuj8fqN2BE0eYC8BSMGc48oDrWhrLl8Jhg0ZEDCmLS1BHA48an
         oTPw==
X-Forwarded-Encrypted: i=1; AHgh+RrLW4I9tlPWJDRq18yk8LSBUjjaKfnJyAVZaYjQ8IME3YTbGCydC1gXIs5NXpfehTPT+WQlMN5GhZkWXOijDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRf7u5pBhOIyW0L37GKG28mJ8BbN4BQGPuyEtaWhj4aLMH1bzk
	NZLA8eH1iuOgyIpv4LanHiM0X1uvPsq0/RRRQIL36DM4GnCkXmdxwfDr
X-Gm-Gg: AR+sD12LmUjbS/KUcpPV091GNW7LDy0GH3eMuzO/duABlF13dGf1D/6sM4YPV8fRwBT
	9x9MYGBqpFUgB3nfjKIuGquBsKtfeuNd6dQC0Iv8cVJ1UJ+L1OJFBjbxIUSa2Pa0jF24P7tSB+1
	tTVTRhyzpWjFTkK7LIBOhtW59JtBDaAnR14U+/JSMz/WobefJYaqrL/uzvUasGu7DB8SmjGGAME
	rKiHXsiokBeqGEZhUkW5kTAmmRNWz3rydtNoPydWhDhMtNNNkgKNh1guU8IpXnWvhXLF/GVmYBs
	jdvdRkO3lX1IwbSlTT7bEh/diWc9I2gPFRDS2UfHSh8k6fomJ48DPCVPrx4li5YlWE91stOzEm4
	m625gSq4GBA1NtyUeujDwEJibH5svtDCN6oUhkRQYFypLODaseodbrj629MKuw43k4GOpQIGBKo
	Oo8In8ZrIKToLk9/v90w14ccN6FH7wJsGDUvi089/QnEPRge8u12fIXX96Fu2sS9shSdHRnQFcd
	UU4eB/1AxvUs59jff3qSuIe9EM238ne4Q05qGLx+Kc+SUiyNFk6PpFvNbu3qDwfBI1C1oXQLe9f
	1Bi4
X-Received: by 2002:a17:90b:384f:b0:390:b41a:b92f with SMTP id 98e67ed59e1d1-3933e648702mr22943522a91.18.1786963793327;
        Mon, 17 Aug 2026 03:49:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d38bd51sm1885413a91.12.2026.08.17.03.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:49:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt2701: Use dev_err_probe() for error handling
Date: Mon, 17 Aug 2026 17:49:28 +0700
Message-ID: <20260817104929.63152-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817104929.63152-1-phucduc.bui@gmail.com>
References: <20260817104929.63152-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_034954_433383_AFDEEF32 
X-CRM114-Status: GOOD (  10.15  )
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
 .../mediatek/mt2701/mt2701-afe-clock-ctrl.c   | 51 +++++++++----------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
index 18f0f27bd8c0..1cf66ca44a33 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c
@@ -30,10 +30,9 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT2701_BASE_CLK_NUM; i++) {
 		afe_priv->base_ck[i] = devm_clk_get(afe->dev, base_clks[i]);
-		if (IS_ERR(afe_priv->base_ck[i])) {
-			dev_err(afe->dev, "failed to get %s\n", base_clks[i]);
-			return PTR_ERR(afe_priv->base_ck[i]);
-		}
+		if (IS_ERR(afe_priv->base_ck[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->base_ck[i]),
+					     "failed to get %s\n", base_clks[i]);
 	}
 
 	i2s_num = min(afe_priv->soc->i2s_num, MT2701_BASE_CLK_NUM);
@@ -45,47 +44,43 @@ int mt2701_init_clock(struct mtk_base_afe *afe)
 
 		snprintf(name, sizeof(name), "i2s%d_src_sel", i);
 		i2s_path->sel_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->sel_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->sel_ck);
-		}
+		if (IS_ERR(i2s_path->sel_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->sel_ck),
+					     "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2s%d_src_div", i);
 		i2s_path->div_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->div_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->div_ck);
-		}
+		if (IS_ERR(i2s_path->div_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->div_ck),
+					     "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2s%d_mclk_en", i);
 		i2s_path->mclk_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->mclk_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->mclk_ck);
-		}
+		if (IS_ERR(i2s_path->mclk_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->mclk_ck),
+				       "failed to get %s\n", name);
 
 		snprintf(name, sizeof(name), "i2so%d_hop_ck", i);
 		i2s_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_ck);
-		}
+		if (IS_ERR(i2s_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_ck),
+					     "failed to get %s\n", name);
+
 		i2s_path->hop_ck[SNDRV_PCM_STREAM_PLAYBACK] = i2s_ck;
 
 		snprintf(name, sizeof(name), "i2si%d_hop_ck", i);
 		i2s_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_ck);
-		}
+		if (IS_ERR(i2s_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_ck),
+					     "failed to get %s\n", name);
+
 		i2s_path->hop_ck[SNDRV_PCM_STREAM_CAPTURE] = i2s_ck;
 
 		snprintf(name, sizeof(name), "asrc%d_out_ck", i);
 		i2s_path->asrco_ck = devm_clk_get(afe->dev, name);
-		if (IS_ERR(i2s_path->asrco_ck)) {
-			dev_err(afe->dev, "failed to get %s\n", name);
-			return PTR_ERR(i2s_path->asrco_ck);
-		}
+		if (IS_ERR(i2s_path->asrco_ck))
+			return dev_err_probe(afe->dev, PTR_ERR(i2s_path->asrco_ck),
+					     "failed to get %s\n", name);
 	}
 
 	/* Some platforms may support BT path */
-- 
2.43.0


