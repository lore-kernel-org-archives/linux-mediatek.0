Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D64CA5FF1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=; b=szaX4zTcxeYdQcyaT6lVdMJv/T
	8orwUcEEeKUSyNQc8oA57OWfL98KZ1YCA7x9m1liIABWZ98fC4VmNGHsEC/Lp97ezd+uk8HokRKtR
	KikRZuD6MzXoJEsMQXk2XXE+zEXl6rORHOXRtt/80WiNkOd6TKZMKGVCGZkPk8bYKOAg8uwDXDZQ4
	bk4drcF2KrjP6QLdKp2J742FiHC2vjB4HXxvCwQKeTuzNkn+ji80MlBFb7EpSEvtNWSKvi1zPEUA8
	b2eJo4uY/bz9VjpPkwLWLuUlCuDHH76FAjWcg2NsTohQSdaKR1eWxlfbQ6gfdKp9s1uB1svyA+SvM
	GBy77teg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWy-00000002GxW-0Tje;
	Wed, 07 Oct 2026 11:09:52 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPWv-00000002Gve-0uFx
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:09:50 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso1622799a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371388; x=1791976188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=;
        b=FILUy/Ri2Q+Y5ttK5Cs0lYHTeDUlEk4yjCvVlU5DXrjCaVvLeuPppqwRZ/7FGqFtTd
         NtHQG08N+/QvngAUU4rLukvkDLA8AsY+7Hs8fnsuaIKJq7hflvfJKPeOTNuWO2MnCN/D
         jDEDnyZAsqGLJHRcelwu/ZkHuKcdiXF3a7Prf0bX1JRkLZnQwTgWctosEENjUJI8P1ud
         HNGBfZOP6rNbniAEy2WkTa5NWuw4Dh4e2TLOfLnIr5iTuMFKUZSrDrCMm5FrIE2C6hMJ
         nOiiN5SeJNHUe1T1270Yc0C4bYFfspUZJ4P8hatBbn9RhJpvSoP/tHK5av+py87nXHda
         2m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371388; x=1791976188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNV1bGZ8s0HMJS7MZxacnD8sWRhxmo+yws19q0+WRZ4=;
        b=VCw0yVIYUIccjDRvwtRXpc/MU6foPtKHjiZGD384H+B9tyYiwFk+YCgj7S99Ka5zZ4
         FTs9vf4vM6LZERvvkqBk/QQ3Gchp7s5+tw8dZewuSS8EGNMjJmgdZ+OVsq6EdD9bf04g
         6sdZlH0m84jDEDuTBWkrPWorumlGM3AtYCjSVKIdpiCfpgzlfTcj+KutHRynTq7WMkCq
         Gts2BnaM705rJq3L2z9VkHgfMp6U1n0O41GI56ojk4UPh73VMv5R+gtDhiHvi2BENGPG
         fWBIZFtblb6JKz9BRyV1sVtG2vMPsq34Fwpt9Xl+CheR5vQm4Y9wvz6mWKWiE+EoxLyR
         91fg==
X-Forwarded-Encrypted: i=1; AKwUvBzs9NSr5Z/7zDYz6EuNpuLy5ZtkNYHSYRD2E4Hb/eiE8gOQtxcan9RegOz0o8/YDa1zMD9suVvFISlimJjgUQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKNwPqTAFinKFVFd/MC3C2KL5Hiw/1DvT4IHNyh1bKuinOMsDA/
	wpk0p9JmSv9fuNvImvDwbiej5YMXh4q561yKR38Pv30w8WlhBiSAM+d/
X-Gm-Gg: AYBFou3MfhRscyWHmxcOPa4Yq+GwBio+hl/dPbFQGa/KiuOod7eCyij+WMPMKtBZDjq
	cRRAuzmcg+sJSDYX6jPc9cfpfByWTidCTklnDC85F1kMohX7opNtgQBw1puSYXV0CdEVwwWsbSO
	qsOukxfPyLrTvuXEAAQtk9anjWqfOXxu8WlXN0mdq4C3JUvc8yWUn4IUo1rCLA+6VplSEV16Kxr
	TujPMTGE2qlpepP3ALXebdFX3UL+OAFgcvqHpCvSDg/TvbOtG4BvvJc0AvLPzoWUB5o+u3PR+2m
	nL5Lo3y0dNFggciOOZ6J1193epj9GCUCxZnE8OITBkUJwRAEFmtHDRa22VdZTfzxnok56fVUoB6
	vJNiTGwDoEHFQlTY7cAF70yIcUZWJ5ZyJExDBoVGeUygeai+LNnKJ7CXdjH01+1wjLvxRVpO+Dl
	f+pkei57EPDIg7vQ6WR4S7f62IrxQNgTavWpdClx4Ky/QUhwa4nRPNrZHinxq1h5aphWZKmwqMi
	HHJyN5YP0Wm7E+jQknXFixndr9u7w3/l/cCniwlvgMZeAiMHMsHI4yC2b7s9qWcR6Z/FcjKGak1
	SixfSKCjxIw+ag==
X-Received: by 2002:a17:90b:288c:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3a8a1969c32mr1650916a91.18.1791371388256;
        Wed, 07 Oct 2026 04:09:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:47 -0700 (PDT)
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
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8188: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:56 +0700
Message-ID: <20261007110858.509341-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040949_269755_77C214D6 
X-CRM114-Status: GOOD (  11.25  )
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from mt8188_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Simplify the code change as suggested by Cezary. 

 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 4010879ad1d3..b2d935ae8668 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -320,6 +320,9 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 					   MT8188_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
 		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+	else
+		ret = 0;
+
 out:
 	return ret;
 }
-- 
2.43.0


