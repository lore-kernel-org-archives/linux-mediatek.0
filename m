Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D9ACA5FFF
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=; b=RWxK08RHieni6ESU3F7/QjFBtM
	tX/HyeHK5VybHt1XfiCpuxv2ma+BWaM+59DBqiISVNPXTKgT2j5G/zMz9oQ1ps2F8ZVGRDxlV0zmR
	nyaiA7AjJkZXDX8irU419ODkmZ2694fK5sbjJeEIDdImdgUYb0Haj/TQDOr/HnZsbdGLkpLoAM4yF
	AgJ8RipDRZ/7jzGvDG/5SUEvVkxhaurXoU63oTMVfUL7m7rL79SQ4eq/PCPx9FOTVSbOTgU13bjA9
	RLLc7YLnLiepQ4qIyUVyqKF1JUDfXRLilctFMvycpbG8vX7wVR4aWHvGqotXxzUv8/FDFJY89bq5p
	J2hNuzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUb-0000000GHyM-2OFA;
	Mon, 05 Oct 2026 11:04:25 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUU-0000000GHpS-2CWU
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:24 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc502d509c0so453770a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198257; x=1791803057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=WRt8Uuig5PZYuwnqWul8KN7lDOnzZxGkItQ7OedCIYBZcEB/ZwFIT3H7urY9j4lArs
         HO6fyAW+Vz850L6QUGFOgmuUxALuN6Q6918pXg8RoBOWw+SyXYfLEVziexCe2VTM47iY
         cVcynuigI0viQhAzJWj6RzQv2Xe6+d8AUxL7FQXkGc8yVPnZsB9gufW7oDNdqBnyO2M2
         j+wRp3/JaaPBH3C8QjgnSfLG5qgJFsR1rx+FMWk+o/nLd46rE1ja4JgrO+8GNwA90RYz
         KGrNt86IlOSbiA4hUuS1iOGwpH0xpHVuijzivoEkP6Vbhz1pCdfJd7Iwy6el7xA4nN5h
         EgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198257; x=1791803057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=k3vkNFy6gGZunHhpv0O7k91YSvA0ugaqA9vgeuAQIKwnEsJjAEU7NYxYlAYy0mbVxC
         TD6xlBdoJXEQ3xGR+zgDP91opo5X+qjg6PVHxXstjN/DuhaQfRt8pY1xvpod3ZhBHN3g
         nYCRX+LBqOApUsG8/5K579sj/sywNSItPVa0xN1I2/xXGcd2sT7CFxoS2+2b/iKwdf2v
         ADHkebeEyyLLB8mrGnRw6WDksBPyuxC1/xrVn2Yg7FzTck+RiG61BBm5wlXvN/5J3Chv
         7mhnfoC61OI4efU+w4+aFeB1024YqFgL6pFZGXi2s4v4hwvCPVJNR5TNqrCIsgTjZ8Cl
         Cb2g==
X-Forwarded-Encrypted: i=1; AKwUvBy9DgnlbhT9Kyl3INBzIqUTBi5x7PEQPhDp1gowZfTz8qcxnXmOxI5dWtwSzyHuRV6LHWaPYBAwVVOKaeBBTg==@lists.infradead.org
X-Gm-Message-State: AFuF++ncEFnDrS2FMYEti3tauCplpQy1hrzzxpAgEZ5Owj+bg2kVXxEm
	+otYn+GFZrir1DDTRpEsb4mAGlzgbLf4ug29TuU9Aff6V/ncKoy9UlPQ
X-Gm-Gg: AYBFou0Cez5D7Yw9PSo7OhUztdZNAs/8uyrSuhAYksa8+rqO1R1b6xBClc1CC1eA0dU
	HnYukPeLwQmDnmGNIvmurZPcNEFvjRoK9Z7PgI4jdig9U/RQFHFNiY9drCHZ8+Nt1OtO2+8z9Tv
	Net/YuUAJ9M02an11JM4fXjgPlE0eJzKkTYJ5Z+CvMee9nf5eYLXnhYq4YiFexTvIt6HMokJOtE
	9ffp50oqyuN16reaUNRSDiqN6L6hdUZzEZbLx4X9kNvOQp4q2mrZmn44SIko3w4MxqOiKdPTbbE
	HGbOZObGEgqdWRUCIC3+s5pGoZbOIuIf+h7j6OUBaiSkOMpThIE4/plj4hfrQC/4PX8iBFL2/Gc
	dvDDtqenIRqridrAVsIf7VTvAiqMpZTDQ4I/6a5qrZlermHojbHuK29RGoFSn4/YfcMdvUjfAPo
	V/084Wavw6Vj/pBAHnyA+h3Ypb8GG1PDquHLcqALLq+HnTzwM5tgzOf33frhdZNcGYi0cWTa2eI
	RSf+LaXWQuCPjYjTErJWArqtpPFFcgXvzUTezczKacMyHbVZwpCF+l/dmTM6Vx+gefOCZqVf25G
	aP+aHoj3wihusg==
X-Received: by 2002:a05:6a21:6f16:b0:3dd:a195:fa1c with SMTP id adf61e73a8af0-3e0d6d2f55cmr6485653637.65.1791198257419;
        Mon, 05 Oct 2026 04:04:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:17 -0700 (PDT)
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
Subject: [PATCH v2 13/14] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Mon,  5 Oct 2026 18:02:56 +0700
Message-ID: <20261005110257.50145-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040420_560203_2B964155 
X-CRM114-Status: GOOD (  11.40  )
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

Use pm_runtime_resume_and_get() to properly handle runtime PM errors
during ETDM probe.

Propagate errors from MCLK configuration and enabling instead of
ignoring them.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 11317cdd14ab..8fa830a57502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2503,6 +2503,7 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s id %d\n", __func__, dai->id);
 
@@ -2510,15 +2511,23 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai->id];
-	if (etdm_data->mclk_freq) {
-		dev_dbg(afe->dev, "MCLK always on, rate %d\n",
-			etdm_data->mclk_freq);
-		pm_runtime_get_sync(afe->dev);
-		mtk_dai_etdm_mclk_configure(afe, dai->id);
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
-		pm_runtime_put_sync(afe->dev);
-	}
-	return 0;
+	if (!etdm_data->mclk_freq)
+		return 0;
+
+	dev_dbg(afe->dev, "MCLK always on, rate %d\n",
+		etdm_data->mclk_freq);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return ret;
+	ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
+	if (ret)
+		goto err_put_pm;
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+
+err_put_pm:
+	pm_runtime_put_sync(afe->dev);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-- 
2.43.0


