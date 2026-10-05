Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73028CA5FFD
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=; b=qy4WTc+fIbW2bR1xnMNG6GXRQN
	aLWOgyT3PTNTHZszdsdDIennBSLKxZ24vd1N0RD15xkSmQup6cPuJfXfLoxurIPBkOD2QA3ziTLtl
	xrcitHXzihGc0JJ5I73uvVIgN1qjepDa4YwBfixZ/SYAc8DxfU7nNNcH3pSg0NiViudbWB5hsakD+
	gYhkQlbgzb0NR3GS4ab+a47TQ1mxy/7HcpuevNv9CUPtPd8uZGwabwjQ8I552cvN+vRtGj0rqW6UT
	QCbLUYHvWAzP/V0UH4QaY2MqwQ8chnXHiwE8JyxEn+6jcq/4G0VjjcfDCuK+R9gGMIqKiqulp8OcM
	CDgoBrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTx-0000000GH9W-1mg8;
	Mon, 05 Oct 2026 11:03:45 +0000
Received: from mail-pz2-x16.google.com ([2607:f8b0:4864:3b::16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTr-0000000GH3o-2bx7
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:41 +0000
Received: by mail-pz2-x16.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso794395a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198219; x=1791803019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=HOgZbCgyBwOi5UEOgVp1OG4XctPi9rQAmEE4BCh4xwNGVuGthpOuJQeRDqucXPZp//
         /GyQuIW1MA00G4WIFXNSziapm7BlcrDm+3nClRo05Wr3/7IwV1hELabKIXO0PFDJXmk9
         PVdhmkPa5cCOLrz2/pFBfc0aFAaFVe6f1TS4mywEpl3bUC+LYtHR21RxS6EqLGUdn5qf
         1Z7/cciZg+kLPITZhwxd0A4WPfu+fsPElkmX1OROKaSWP/8GgtvyYo12mUIXyZyXsTjD
         tgimA0gG6s4+2ebTAtY6qOYbrXLminXfwt2ClugIbwTkov2b2EejGGIcnFp5sjIslJqE
         /xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198219; x=1791803019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=GhfkYrPhar0a0qk7x+SoWD0tfpkxumsNMZGQKTrTSotekzrpRt84izcifjNKlk386x
         J8wGP12sj+/VHBcPz2rbr+q/LVboy5hAyiub3mbXyE02bhpXqchczqpEiEckuZdBuzDf
         VfWuN4FCcAdznxr8VhOoiYe6DWeWpbBw2ehwo9Wgc8VV720bs5CaSMw5o8/U8ZyfTV8A
         9DCZtlQaU+0EOVskJfbKssW7KpugEWWLmU83SjkesR91SVoaHdRcmjG7KJzsBgb8Ytjt
         vuY5Ty0Im9PtBaVxIQJJeNs+gilXEb7u4/LEXz7xyi54ufO6oZSYLGzW9samvNdx4aoo
         2dzg==
X-Forwarded-Encrypted: i=1; AKwUvBwAZ7bpXN0PrF8An3Qo6nHhcAXP36J37tUSkEX4JcMy2ckR1KjQ8wqi3ZJdUZZS+HnMO07TNrTdZ00palZhBA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6QJfPTn9D0iPxeasZLxsOOf7A0dH+TNBkCwe3+QdSdND+w/HO
	SaFwdjEk6EhHQZbJsZZxFEOOiCw5Yx8gosvldmXqwKYagJI+fJpCu4T1
X-Gm-Gg: AYBFou2Nzqm9MGwxwN9gSfARy/zu5rY8FWExJwM5WhzpnS+EOwdmtabfhegYj+MIB8y
	3q/yug+G2tOghEeiIky62OQl8kmb0Jw1hh8PjqglSy2rw/3xFyd5zeXuGZ/uEe9DB/ppmSO25XJ
	QhT9tHVjZH36ex/XjojSqWYp/t1dqACy/o7cenzKt8AOi5xlM4SogftsfQrRX4nFrhYKpV+hYW1
	dn7HItD3qBzytqiQxPNUMwxdEBJ78T/MElPeXvM7Ki/qtqsN+aSYyHo/0ccz56vjW7t7wBEn/iS
	U5l7rQcdBzLNkj6rzVdGM+8fwCMaKHCCoD0jNNWT7h3t9RRHnfyHrJHhNfKCAx5pIoTEWck6mgp
	riQByglMIiT0wkYHO7IRgVUg5qrOiE4D46nafVqU6M2Rbl1+d+dMNxkr3vyuPWR8oKSipHpINMo
	S1OCj0tLIrcQFzqa/BiicxeIO7zTMDOFmMf7G5fzjUr+rojazxKsLAOX8h0mDxd7Su1Dxu4i7zH
	7kPAQ0IcreFmNtUlTGvEqdR3FmJUoHSdBKkTRoyEDGTaosI/BcBzI9V1FrQXC/JggtKtvgy7Nee
	DGhoW18ccO7h4g==
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr9784031a91.59.1791198218535;
        Mon, 05 Oct 2026 04:03:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:38 -0700 (PDT)
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
Subject: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Mon,  5 Oct 2026 18:02:48 +0700
Message-ID: <20261005110257.50145-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040339_668664_9206B031 
X-CRM114-Status: GOOD (  11.62  )
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

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0


