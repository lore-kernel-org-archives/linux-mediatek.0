Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49901CC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=; b=rIN9pI9Aw/K+W1KlcTJSkMGnQZ
	Ljb21kGscSzXVsHv634HQS3Mgo61b4QSowAWuNweBl6iyB7WAfWXRh2Q9ytdHMPMmgqoTjYl4gLQW
	k8qmfFXlpSc+Jxk6AgI21xA895wbOXRHorlbvAntPIlVoyWbXw0CRAJQw/XxBCJSbB5z56JC5p+yp
	jeJh9MCOcToy6SjWiYkATA2E2mpldGJm6tNSdQasggC41gcoezrqSq9Hf4DfmGS/xYyo7czSnv9uA
	3mMq1Tq2/i6asspl0y0gNkpdTZScbU4u+tY8b3sjef4Vv91xQjW81BxOpbOdimrk5YNCD3JZI4iea
	acuIzRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBG-0000000FKbO-042u;
	Wed, 14 Oct 2026 11:29:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAz-0000000FKP0-1s9Z
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=; b=JFHzyMyFcolUfLZrz2UmD+pZ2O
	32h/Wyjt1+ZyePRA2tsOHDidkorT+qUZdiZunc/baAE8EZlHE6xN5uKasuyjKbrA5Xj5JEHY3smTy
	UXuP2qC9vHY5g1RMer6ZdZUKTgfp9Ui10fZiH0jrSuhaFNI/gyv1m97W2eDkbZ2c1Ijxno/uTScR+
	vyAVlwlKtFIBx7vg5FwbHHs8hpuAxRJtrn4eXSasoX5qFC3FOXCAsXUTxZ7wil9PUlz8+hFZexZz8
	dYy8sLOfHh52acShVonthwtXNgcTAq3p3vgMwp100yWeRxJJTorl0+0he9kcdu/oeeyUwHykb7lcJ
	pOHwdZXg==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAv-0000000Ggoh-1BoA
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:40 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso995187a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977375; x=1792582175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=pqQ1lAbi6hWAmTNliudOVWeleheo9rbjf0Xu1YMl4crcjdeC8wDZ6PQ9PyCOSpexcx
         oa8fwlTQMwlbOunvlg7bLm+83bXiN3pemAOgi4VbovIXqQbRPg9rJ+eZ9VJTVe3ZqXB2
         BlJzugIVaYWBuNg2RDPoQAdPGEDmGA2Cq42EJYEo5kmAENxrH7zdvUnNvcmOvb6X04Wa
         i5HCvfIT3ZIkVlwAbImdAqedH62QCUChdZffLjVYAXGR2BCOFapT26sNsELOm5fVHhvl
         rxCQOEq2qsctxSztfX+3jT4W9CVYo9kVod0B3KGKgqPsMYnDENS05eOGAZhLQ77Sdpch
         mV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977375; x=1792582175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=eUEXdTcDyBQ3bK+EaMscrKeg/xUC/mvylayQjvMjup25c6cckJ5Rn1t3FtpxGDbh/P
         tU8nHUhPKno4VF+rwPIF8jvEROwFUQlMCkFWZi63hAeyUjBJfK/7kSsrvthrEPxTLRYO
         UjiwSUhz0ZZ36Fl1FUH66J4/1h1KcLOFZz4B3Ay3eHKLxgzgFout0maZ68nmWY+tVW56
         kiKqTIbk1JYieuIzigwJiS8/OktWHxk5xEc7Z1ixiO/zfYyFIwQ1DJXvIKaXMU0X9I2a
         SJ6mrldORtqvajsWs9NU4owhMV7CFZke+C0Zpo/5KpTzxSEsb3ij3LL54OVmVIGKksMZ
         M1zA==
X-Forwarded-Encrypted: i=1; AKwUvBzeRNUyZjuKksiaV0SfBguu/6n84OazoKeVJIVlUInMF8X3Ko+al5lh+YTXmdXJXLNQVSzMIvATrOUMboQ7Cw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLZGRG+kV7TjBNNqDV4wJL9JPxeiqRYcc4u4n9fZWPPf5zdj/T6
	cBbB3gFfbV41QgBtMtjJHcgXgENQpYtYqsYwHPqwcli0qPpnY/ywsR3z
X-Gm-Gg: AYBFou1OoQB8FGUB1qVie1wOHXznufvbZYJ4sGn24hnLocYBwcOkXv/QU60NJxzb5oB
	LSIgrSqFNX76kdQm6e2/AjFkjbFw398k5zKdZkSeaayskBkvPuoZZ/z1S84sgtMHr7VSJVcVvVt
	klMdpYiiyQmpT049JVw9SL8tz5+dj3AnLTmjknmmosp1zTjOEyQOVikWUxw5bSRj9rE179Ae+Gl
	L+3YxEQr/Qs3WYVWW2vLTcTN1mN3zRgp326j9pED0oNu3K5/lP/Fjm0fzmLYQt6sKy5rVxt3F2d
	EykcYQazD3uzmZIC124pG8MTFqd19PDBG3A3x2xTRNkiQ2qCmtXnmGaWPCz7eHC2nHxO6bJGc43
	XtgNAEDigaiI950LciLM/hHE8VfHR9OzeN7WZccKFUO9V75QtAFucXMiQBWqCAQhlzKoaIg/TfX
	LtV3A+HPzKqmKDJ/z9ZGaHSBInhUCL3yRneNcoLxlUAAWTbi4vcRgRH1MbGSNmhE7dqgNElzNgt
	zr0hboi/OM/wL8ByOYB06mpZ6l7/1nr0YSZqr1x2MrvI7ywR9jOV43uL75IwBXBrhEsfl1+tuk4
	GQfY1TiRMxrOwQ==
X-Received: by 2002:a17:90a:4ca2:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ab70412990mr8076731a91.41.1791977375198;
        Wed, 14 Oct 2026 04:29:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 14/16] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Wed, 14 Oct 2026 18:27:49 +0700
Message-ID: <20261014112752.683032-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122937_359306_9F3433BE 
X-CRM114-Status: GOOD (  13.05  )
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

Check and propagate errors when enabling the clock gate and MCLK
during HDMI TX/DP TX startup.

If MCLK enabling fails, disable the clock gate that was already
enabled before returning the error.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1270fcac6b3f..11317cdd14ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2321,13 +2321,25 @@ static int mtk_dai_hdmitx_dptx_startup(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+	int ret;
 
-	if (cg_id >= 0)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+	if (cg_id >= 0) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (ret)
+			return ret;
+	}
 
-	mtk_dai_etdm_enable_mclk(afe, dai->id);
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+	if (ret)
+		goto err_disable_cg_clk;
 
 	return 0;
+
+err_disable_cg_clk:
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+	return ret;
 }
 
 static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


