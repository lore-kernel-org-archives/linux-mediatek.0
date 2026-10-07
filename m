Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BA0CA5FF1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=; b=VgvMTC5queJiahoaWmR6jhbqz2
	LrhTTdScJf7czAhorHGG2JS/MXLODW8KhoMBPs+vpkvQuSMG7NlfsdNJdLUsEh8EOjBB5s7+YeIMu
	q3D2YrHWrUEpdxFhVV3+Svs7Shzv4KJRswXyOSarv38AHPW9MrE5aXqu9VXtwZXdTEHagkbedmhYQ
	/XVggv6sXfcaC61ynu3cBU6OF6ybZaC883+5u67x6m/5Y7AFsum91CPA/BTx9XIqCaS6tjzehuT+P
	N4zm6X9lMWQVon6TVkrQEh2YUDb/hAgNOt/1p9VbQBh6xra5CoXcVocL6Gm8M0VNm0QF67bmvcNgU
	oV5+w0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPXB-00000002H7j-2cUv;
	Wed, 07 Oct 2026 11:10:05 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPX9-00000002H5g-2bRG
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:10:04 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so744262a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371402; x=1791976202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=KZ7ZKc7ngobJE9hDp/DfqTqzhrMZiB08t0tY2nALoUOIrvYTlEBmlr5nohCiKoJ9E2
         W8rOKGqE+umlr6n+xVicM6//X5dE2pnY+i3E0L2ycnb36X8muQTiupRBQb1+kvBsdte8
         XebKSrLhmGEI9+2ADojvP7fXgowfESetxVnQcuWEhI43LmhbOQbOe3H/I2mTXyjJ8itx
         Qe5qeT/8IFLIVYKoAfB6Uc8PcL5pALJaWjWi941uamE7oQA3nsdqPfvtrcGJ4UOpfWAR
         2sUCaqypPiO9YzMrBu4Dz4EVJJgLLDk34EUEgr08Q9WkKWOIPnJ08s/AaJ7sQAOWzclV
         uo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371402; x=1791976202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=Yl7A0LJ6zvL5NQL6xilyj7dcQDmXyAZEP08PFMl1oKHaWAHpqPbgF0T5vjAl+F50Eq
         TKBMONoT2pUplHBPmBjiaxiIaBSCzY87mcUPVsLMCTXSiBa6zhQCFMnnbkPVAcXWYtKg
         DPjKe5HjTrFwtbsPqkA92NMSbZXIStPad8boc8wK1u3ymu/QXS0RPXRx9wxjfB6JGIYJ
         s4eBdO9bd1Fz+4usay5IDyTrs3L0UrDi17Ix23GBHiNnaGwohzAiFRW8p2qkFUWEYdW/
         7P6S9Gg5fgRVDgS1Y8MN4juTNnbH4324qC6NYUMPlu2o2gRq0LJa6Qesn1PjJXcnlKML
         q6LA==
X-Forwarded-Encrypted: i=1; AKwUvBzSzT/IGYgIETlwmdeM+JoKIO9/HI3kqGXbdga+ltWw1v5EkY+ob2yyZKGPGr4K6+kmIKq1Tr19jXbCY9gnig==@lists.infradead.org
X-Gm-Message-State: AFq9FYIXUrPmjVF4E1DLH07e0LNO7yH9zfQ9V16U4YiQPqTIWtFSIdzI
	I6mQSdIO3pT46/ooDfKnQONeJd95rz9UCz6OvjLpKvAxctgECVDL/91t
X-Gm-Gg: AYBFou093JBwRJDtHVQB6LCDoxizLLSDsTkuogHda2skt1qmqX+SFK5/D2419Lzam2q
	j6o6Z/JcEWQu5MiGcLfWUi32iHumQYDFRKoyupUgfdT8ZbSfwavrVNQbdtBZgSnsO4z24t2l702
	A5hWXHHISpQHFq5w1MsxBJq1OXyyo9KJKJksRSjsmD3ytKDoHUWwmVYWFRISqLTZSk0lqzxR17T
	bOhrMneYCMNY4VtT6UqEJ+BAvqTRqa4fizweD2oDaHjM3Xkm5kPJBQ3FG44hlJWGJtrb0lCLBii
	/me+rcewpS6nfRpJqZuQNpd7CEf4r+505Tl4CNU34PLO9f+jPkMDnrMp3eNBkLOhuE/9xNBCEII
	GumH3pRRc/fUnz3nzXRRsB2ACYkLL5+B9rmrJipoCcUxSW/VtHymMPUxEYsFj2LHNMc1OGXsojI
	2idNUZXgAW+0CgVIW4ADMWhKfmCz5ggrdHacURgDVliGS3b3KVerNtW5ezP7e7MQ/uh2xw5yQdG
	ZnVvbHnvPOuGFVmzkveULxVL2Or+2rMDdq0QOFNlGFbmaQHBJVCUdpfHbhZXJMnjdH0ifds/fwh
	+3oTEzrJg+Bl5A==
X-Received: by 2002:a17:90b:4cd0:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3a8a08354bbmr1628776a91.2.1791371402126;
        Wed, 07 Oct 2026 04:10:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:10:01 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8365: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:58 +0700
Message-ID: <20261007110858.509341-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_041003_659989_A13535E7 
X-CRM114-Status: GOOD (  12.23  )
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mt8365_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index e9497246f37c..314235557fdf 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -514,11 +514,14 @@ static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
 	snd_soc_set_runtime_hwparams(substream, afe->mtk_afe_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	mt8365_afe_enable_main_clk(afe);
-	return ret;
+
+	return 0;
 }
 
 static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


