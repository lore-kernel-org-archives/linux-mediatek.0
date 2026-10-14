Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9AFCC6B2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=; b=hjNUrn7LgG+8VqPMjSNNG+Clce
	+paz8wN3wuonVnDwGG/ksUtiIOBPjEZ2WTUW+/RlllRnEeFqIenXHc386D/J5j/B7Mo0tTrVy769Q
	agVtHe0DfS0o8WIhMeBmfIEuRGHuNhhTWr/TYNfegdASac/JscLrQfwBSnMQEOT8jGBpezddrxTJB
	7glcPFMGx7XKkCpnk7kGtMV3YPXR1s7nVriE86gAuzZR2QZUm3QbcYr6+yDLT/Gw0LO7uulWbbUly
	w609yGc+ZqQ/swevhx5PNZb3TJvvdwiyLzwFr4qPFeHVHYW0Wet3IlNsVMJEhSBOEUsfRSwQToLLG
	VFnZo7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBH-0000000FKfK-3O92;
	Wed, 14 Oct 2026 11:29:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxB3-0000000FKTG-3uM6
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=; b=UUpRchSRbXjpfSluX9BUhCACUD
	aLCCSegoibOE3NoQVYuDtInIf1MHfxsCtcyMS6TaErV1909NwGKsnT6lDbsmabap+ST1EHrdx18ew
	RGub2kM+AKef6uyWDEXG1qFIqCGUHE//ZECwcfmT5RaK3u5fW8k6VXnCtbY+NUCX5Bi9jcfKpqqMf
	uYDoYjOqdpsQAIznYIC+tKekMD3dxeg5zoTs7mqOSRWHsgiwet50/49nCdFxhR0BEOFTH2XjGwxBZ
	NitNsT3CHrABfseupQXex/AEKe2J1kvia4Q3UNdUYAxKKWT+nBBnfwe0dszAiLtdEcK2sDbguUJgB
	OJYveWLw==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxB0-0000000Ggpw-49Ou
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:44 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so2910644a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977381; x=1792582181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=LWPgpnfVpev7kvpAFNtZ03M+3T8UPmT9qCPW3/19VtQxNRbnWzYTbHTwEruAKuk3RZ
         YWN4H9ob3TSPsaAdT8TMFraH7nNUFagoLJ5pOCU10cP3/b4bnc4US49Zxygq5AVPurko
         zCJ8bq1g0aP6DZBbRmrs0oWVfqVVioFvBb2wICYVbgKIU5C0mCdfy0pAjkIV/jtsOqrA
         827MESdNl484VOuEcoCvn4+Bw/rdYetYOc5Xu0tT/A/fRr/k8o5NlHE2ul9yULA37ACC
         33A1YZIGBw9MP7s9/iv9uHR3UrEyWR9/0ATzg9BPnXrBOSPSOQhumgRLgjJWk3niHpXm
         qidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977381; x=1792582181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=2fO06umh1mpLvCz6GgGSAwcKjankfgBCbhUhlYwUQ5ZHQMmBZiIbocLLbG/MxAU1q6
         a4EvBUNIYHgtX32q3QiHxuPbHN50xU0yo6NG/9svtPaBfSxoSnELqoNkDH0Oewiwmz2O
         cseQRA/2C6EiSzV2qijssy8w+y8pwTYQFnrRKIDHRkfYmBw1NukIoQ24mH0j0eg+Lnf0
         4aI/9S08WIX1T5EDetbczGC/QXR+ZkBTuBR2MWKkyRP3czI8e+J5f1LfDO6C5deCzebe
         JNMBEhQDbUa17yb2oaDfNC5R5pVWKs81c77v1gkPboRSo5yl08MIOm09Sdko0aND+lPR
         A4Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwWoeLVOWjcnnc6jsV6uNy8mqgDXIVAfVBhIb/sIL53w1QDhHiLad4CguyW4Pen6RbGb/F4tCkP+YvBYSdxHg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJVWA3sEu2FFGVRs/o8MrGRMLJQajM0goDWhUaL/7jrx02m74gw
	9kZBMBQkFRHA33CK6+UTwjVTcp2meMi/Rp0M822dOUmA97MwZYxjK86I
X-Gm-Gg: AYBFou2YAsdbWlxa/vFnrkgqkW0stX0+zDmIyJSwOM+b/p30ikjyPPq9SK0nyJHbdNF
	bsfT4hQQuKN7o3Dnaexqrc0CR6uA6ylkDpPqmXj+F08EipMsxZ71G9L0evsBA0twCTbfPLls3gi
	5GzyZqKD/179OFr7+SDvKGsTil7Gvjsm/dKjAM2xTsFrdcoIycsAUcKa9VxgVbHCk5z/nxxGxxI
	60poQD9RQFrNbhNOJ22y3WGt23Cu9caHaUTXiDW13hnlA25oHBzDSPf4MPFgOICoAm+9Me9ymWI
	i0tmeDmypwNT+FUPz2jp4Pkreki3zV+6MFb0oaF0y74nYgstPgJLjHbZVa3oujAXPQ3LU/Ca13P
	6WlN+SADEgExr8djMonqfagDexO4VM8tzLU8WyrtUfWkH4U8ZSHL+g1cNrLgvBSeYpJLJ+N/7YZ
	GvsBunzoraFZwKU9eMn8T3w0LlNGzXPT27uYmBaJOpUVQDirTvXd07mmNUsJEio9yGs9uaDRyYG
	hxQu8RDnml4ySjJZaA/H1VFMSzX8rQdcwbF3XjvovqYjluyhuwTnPLe/wtGyUv6H6/QPfi5dHS8
	l8zZmh/AeXIgog==
X-Received: by 2002:a17:90a:10d6:b0:3ac:80dc:f40e with SMTP id 98e67ed59e1d1-3ac80dd0197mr393878a91.24.1791977380867;
        Wed, 14 Oct 2026 04:29:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:40 -0700 (PDT)
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
Subject: [PATCH v3 15/16] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Wed, 14 Oct 2026 18:27:50 +0700
Message-ID: <20261014112752.683032-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122943_155770_E0D31264 
X-CRM114-Status: GOOD (  12.47  )
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


