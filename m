Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C19CA5FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j534rI2GLWoLqHJsJ1LpomelkSLlLDjBn+7y/CTenmI=; b=QuIlFW/g9+Z94n52/LxCTYVcgm
	Jg4aFczYnNJjplVVUucKZBmxPgOM/ApGqpC5M/RazV9DDNe/qZ00gutkChvUBverGskjm8ExULgLu
	1CL29yDrg+Su24jCvxcheWZtrG0N3kZPRv2nyLxHa3O/u02VgCMzvc1HL3iNwYLMFPkGJZXodY3AU
	Zh4/BsWus0LmnSBuUqONs3Ihl135PJGt6B1ogBF3wc/AiqhoxuADb8LCZa8MC8M33G2gMhWKhifxX
	9TJ8h8lKC189xgb/IKsZTtl8wahFzte9w16Db3L1s4voddJqe/FSbDVI5QU3OjSeZVXMs+RtvEwBZ
	mhwTuzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dz-00000000Tiq-3HkD;
	Tue, 06 Oct 2026 10:16:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dv-00000000Tg7-2AeS
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:40 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8875d220446so313376b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281798; x=1791886598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j534rI2GLWoLqHJsJ1LpomelkSLlLDjBn+7y/CTenmI=;
        b=SDLPivoK+7aHQEjGVd085drIqN5L9gATS1PWCeSVqOoq46C2G1J4JpoyrhWKNmbdwY
         Nel78U9mlAoJeV6eOuepx7Vgfcwp6AykObL0gCGym0deOOKe7POEMUM8EnCGT28ZMWs0
         zrasugIiCNxFRy7ut9Qmvd3BQ/jODwHwBnSt+fTPjElASLtmmD/RFXqUljANMH7eGeTW
         kIWrpdSkzG1vFRD352OUG6hj0c/fvDJPF3wDS8ZDM3wMg5w7l2QuxmjeTfVUw94Mcuac
         i6YjCV3rg+m9/O6Oj19tolDGKagGTr+6QHYRfWGnjdXiVReJrnp0H46FrS381Mi/pNWJ
         K0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281798; x=1791886598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j534rI2GLWoLqHJsJ1LpomelkSLlLDjBn+7y/CTenmI=;
        b=KCtyvbm1KX/6l+nXJfscxj234QQRftFXikvNbUv03uMyIqKUtLTopOSDIXSoIKv4lc
         Ym49pzllUHzkMN2m/lkHyRBIH27H9dZNhTBRTme4mF5P7tGtzLk3jyJr5AjyBd9pflGz
         WeVxXXopM8RJ58A2VXVl7fsQgs84NF5yUJgZ50MDe8sgB+sOiXhaTQc09ELTyu0pI//U
         0HhNorQXbrAdqqcmlHm870BRTdPaZha/7Bo6rByIKUqnGnd1lecQdPHrNA6obdo8rlJt
         LQW3ttFnFiNKPlKs2Sdly7dJxvYOmAHg7CnHVlzmhr43x8MP5kL2BAMoGtPfy9rbmPNo
         GwNw==
X-Forwarded-Encrypted: i=1; AKwUvBw2V4SIXzV6ub+DMPl8txEethyGhQuu+BGjp9xKvIAoEyK0oxluToQ9fpzSbKfuejZP2XgBPnIi1v3C7B5jCA==@lists.infradead.org
X-Gm-Message-State: AFuF++klJOSs84SMbV2peEOA3E+ZdBf3Ux6XFIpoM8zgpPBjlHOSf7yb
	kpnPaDxlksoaq0wykXMKwxNx9rw51ON47gMQIQhiJ8lNdhZKtV5mTuWG
X-Gm-Gg: AYBFou3BCatfNtoFA9IQ8+6YTAuVkUZ0QxEIt9NbgWNiRXeB6CaJRGRdZXsUU4ow6xC
	Tg60HMJY8P4gNpuVvosb58MVISFOW/BtXeBmfHh7S2XHFRcYeevszsHCepGCI9L728IErcqBN6K
	mAVNjef9PdynHUmN5lR0S9MkpkYI/WG/kZhumBq+LlOQ8C+FIpgwdXU01fpkSMRZCSNIWa3ZvLJ
	zBarAkDLf8DLuAu7ZckmczQ378KIqEHp8n0DtLd7dvZO6hHThFZfDtWqoIKChLMZTLAaAYJb1my
	LwbOppLMHvTcghPVmnifOfhrdnE1R3lIf6Lx2GSgolcmI868ZIqdvPThHWOADLy8+JabjNkQ0Eu
	CqlW8il47egGfLJGQCKfd52H4FwmHrNRuXAvVUaMuZ+FJ8mnPCXS/eDy7Lhm05SljWhU+G8pJW1
	vi9ILiOVVJdSk8A1r3qO65zbm033cvpOoyahrOOnbRvGabstLkQKpCgZxn3Vbx8WvON7TylJ+L0
	wvaxQuKC5kc1NHOpWER6aOZw2kxscetGtsvdc/aeSzfLFaHq47HGF5BSPvhv/hysaB0sWmIf6FO
	xy6lgSv4Kd1nrg==
X-Received: by 2002:a05:6a00:181c:b0:88b:c67f:a6a4 with SMTP id d2e1a72fcca58-890deebe383mr750381b3a.24.1791281798496;
        Tue, 06 Oct 2026 03:16:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:38 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:04 +0700
Message-ID: <20261006101606.54079-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031639_564822_0B3599CA 
X-CRM114-Status: GOOD (  12.87  )
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
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 4010879ad1d3..87d6098caf99 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -318,8 +318,11 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 	ret = snd_pcm_hw_constraint_minmax(runtime,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 1,
 					   MT8188_MEMIF_DL7_MAX_PERIOD_SIZE);
-	if (ret < 0)
+	if (ret >= 0)
+		ret = 0;
+	else
 		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+
 out:
 	return ret;
 }
-- 
2.43.0


