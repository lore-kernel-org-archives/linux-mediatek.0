Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CF2C79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=; b=Svmz2DkFEAto/Kj0oAkclNylgG
	n8yi7vrcci/Pm/CdE2v7jW/ZtH7wAwIoLY96RI1AhsNPNP2Ux7roWP8yPgqoQra3Kh3PSIkIJdWU3
	aRIGNV7vvopUBJT8fODHWCCeJqNmfdkjcIUmA+Hs55KFDNnbtRBFaX7ureNQgtKJss0AL4r1NHKtc
	+DJNcWepPJmzBqGF8szSlG1Kd0hYR88Td1h5FiMaeK0VQ9YQqRRWMQsNtxixlEPEz55IUQtHZvvny
	NvnFmNOCLmwW2OkdD4adZX8XuDmmXse3ObO4Vc0eCMSFvyOfdvSNkSnTqhGDZvohUc81euJ5ujLRT
	TrR3T9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMe-0000000EOxQ-33Hy;
	Thu, 10 Sep 2026 12:58:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMc-0000000EOuN-3TDu
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=; b=BuaZAqijMqtJ4csOgHBfaTYVw0
	eCGcZCI8Z7c+m053wjaiDG8sZhqFmoUxbvojnxFR7QM3s7CUPE8WyJvvBgX5yBdCvoAWQ55JlN7nS
	Mr9GGRbfbs8dSni7cji2kNnzsa4yIWi2Tx0WjAXcz4BUvEGsIa7s3Uc3oNpmRX/9reg5VDrz5LE88
	zzejk1bw4bafDZljCCVH8cU5hbTk0KW1nvsAVfVpZf/JGYY292RqxSIEsn8al02bZgrGDfLJwCwPM
	FA2W5DgM48tz48u7k7X9CJTZvr7/EuBcLmwosiG6VS4BTJ1j0tpBU3rxLPowtqDthZE52D9m2yORI
	8l/565IQ==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMa-00000002V4X-0VqP
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:49 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398beb616f5so1197590a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045126; x=1789649926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=HXMYsim6zYKp16QqVesaWmMlzaeFwjCrrEyKv1/lPPed82544LAyMUvuWrT3ZFlYoX
         rpYU6MkHSeQLMcXbD8WIPYW54qSZC0fewjKRAHqtX0cvpYOPnGMOvm17oKLEMBst+fZ3
         UvgmGR31q4Wfk04tHmYRv9G9TzSs5Elv3m81YdDzCgczQmnjONI3f8foo2A0W63K7+eU
         jReAV/kifrjAZteDIIKc0aXKjq35NLDXhOjAAxGepTHN1HO9PfO0aLHhzYITB8E4cMF5
         gAPm+uog6zxeDVmd2AXvqoOZBzDFgY3XHeeqXk7nnwagvkxgRJZL4A7wavoZ0EhuzY71
         v2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045126; x=1789649926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=gV9hM9APJOY/Jvaa+BpcI+92HGOkCEMjYWJmN/EFVA+CBvoYL7eUpBNbyQ2vONCJIy
         9T27VweFdf1gTBeaYsygoHIDsW43w844raHktvhHP9y/ruiWpQB4GtLuUB3iyxlTJ/H2
         WU21hdIu/HOk843u6aRFNq97jjvqr2MKomHVtMmhdoU0lPy/YAk32dxoEKWq/iDHxxYm
         OsDnMWHVI72iUcWz1i89R87seTICehOYeJljtiYdo5nv4w7aGzbLRFomuETBtGM0V7rM
         GtEiiDlLQrrzHZNfZw8gs8zJSb1R+rl5BudhfBKrnQ/cDwdFFDExaseDqoLUwXo1fOex
         gfoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZXtunum1P4ppPM/h+IUdaNNsjVuLZuZg8iG7PgzdecQZP9QxXoj8mjBIyaERdGiIY170ymYDbPtQScCFQPA==@lists.infradead.org
X-Gm-Message-State: AFuF++l3tv7/BUE4ugR496i/j7fvU0u6kRHJCQ/k8uRvI64iHSMfVYuv
	oIjUqOhj4g9ehKPjTWgrYu21OEnQ4P+HQ4M3NPLmd9vB3IZ5o3ybyjwq
X-Gm-Gg: AYBFou3XQQMA5w7goeg8zuLl4C1Wl7fifIkw+EICaeEDWYX/SpREkJ853wc9G91rFQ3
	2xD+L/YP4Qq7Sxrr7PnrZhWus+GsHyID4ET+Cjqw65IwXIei6gv6ReRfEfJUcmpbuVnfR/TTW9x
	3cN9qfY3DrgJVgRDAq3UDwtvLkV48WWbomq+LnI/yKX2zC2t+9XmXf0Zcz6fyVkDXUAQqmLVDOT
	fJQATG9rDMHUDdzgq3SOaPeUH6HjzREHUELfKkaOpJ31iokgyhPrWQEPSyiJ+mVDODschv29gCv
	q9DPbTcHNeJytHMZGYaVrVlxkmQtNPB6Czebk/EXMZnC8LFKRpRDaPUHc4wEDhmASmVTkOj0dIZ
	uoydHlMJcAfCb7ykpNvQR70sNqPWXhAoFQLqvt8FMrh0aDiBpGpy94pemxTotpLTA8TFV1g0RZd
	mb/z7bJgZ75Jtha8t7kf+HnYqKIeVn4dnv3sGo6E3qI7Y18bdt9HFA9W/Z6fXCgD+HYLenJ+Q8c
	lhKgde6SvnoWRqCpUhm8H1wRnrJ/2aPJxrHJSGA2qJvw2SCsgMRbCkD0pPhUSg73F1RV0jjp3gh
	57sS17fBazEvqRzNSGDgjG/LxA==
X-Received: by 2002:a17:90b:5485:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39d77a1d83bmr3896223a91.6.1789045126242;
        Thu, 10 Sep 2026 05:58:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Thu, 10 Sep 2026 19:57:39 +0700
Message-ID: <20260910125742.150902-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135848_299257_AB4E34F7 
X-CRM114-Status: GOOD (  10.68  )
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

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..f20dbb410223 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0


