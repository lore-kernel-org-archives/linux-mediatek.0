Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3F0CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=; b=lrlWXa5r9J3Xif69183Z91+g3l
	h19QboIlpXY8u8XHKzPCY3zweGSmwvI6eBoFrGJ9EAGUyIk28OyE8tOS1Bg7MkqZDf6r+YJAHIXtQ
	t2nxLSCBrNApcgTqWY55xmd7mTRBLgp5LoOHdPjnxcBxPESpe0o2rGSb0WXiKV8loHOo3NKwXvGo4
	ZHj7M7vbGU2XeiqHYH1NO/+yGkljyv8EsoEZzd9FhCnCF+0S/JCh6gvZsaz1+BbF9s3d2qB07904N
	vB7fpixHx27Ql8J9DoTqpqNohucvBMc1awb9endjbHdL267cM8K7g/VSauyUlrkb/sN/nDdfFtXGU
	eT2zZ2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPX5-00000002H32-2OXI;
	Wed, 07 Oct 2026 11:09:59 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPX2-00000002H0T-2H7c
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:09:58 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so1004038a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371395; x=1791976195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=oXh5CxJz6sz99i4CeGqA0jJaDCsQD+KpVXpLgibNU0dH2sIKWij8c7GMcYD8nWjC8a
         pDLbFSpcONsix3XNIKSoY1LClF7h5vj40xtxjTsUddI1lr2HCEu0Yso+m1e2oFRY9u8f
         GkZWUMkMecTwvEV5Tr5VYLdD7wYL8CqfGElLuS3lr4J3JnUz4OaQjTOqfIfH6zzRFlbW
         2Gm4QLoOQVT2la92T4ugBu/40qdH4x44RcMg84sm9ova0V+u56vHlZIlj1Mbw8QQol3A
         OaKTSC1BsdQnFk3aE+73Pd7p7ZioBjXUgfT/IaoVsGVx5g2mC8NkVRYehj3e6meMttTa
         +DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371395; x=1791976195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=sRMOBPXDO9fHm5VZpr1Fey/QgeYlGI6le4Jt/RXlpU/yWNtNYQ/aC94oJTUi6aJS0W
         LY7te8e5S83BFUh6v4BZGXpmZc1JcWcgOhvDbqHNvVG1Wpdk/b/N2AZMxdC2IGyc58LH
         T6tGvqc2mFCgyC3LBgX9FkvDVrgr1FrfvaHAaGTm87pKw6+f8HR8q7HpSpaRYBy77NFg
         Q4wJPXua1qAgWSTQ/Kjafk7pZ0psx95otoSIDxTQGcZCMwvHl5no3hW80MpjUNdEW7wB
         mYLwrP6NjkCB74e/84ZRddSw/a9rE6t/cFmM9Zq8a6AtUc5CKtQEJJtCOSfpXOzUPyU7
         FYhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy43UU2HKbT0sy/LDL71AN0PNIUU7ulijVIRPJzDgzbKjo8+JO7wCwcG4Eqfd4sUS18xUiBar0p7M0UIeca4Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYI7Vxp8Jozgj7H5xA7xwNKpfL8yVspDWNpJXRlgmhPbXSTh/c6D
	bPomZUnFcmghJ94egd60eZDYcUft1vG1bbw9fKmZ9qKi8fQH/X2sACO+
X-Gm-Gg: AYBFou2CDk0nfxjplsZWv+6MO5rB9n7TwbALi0DovbUGFIyLTwF3Dli9lg+Ro3kmreb
	aOah4OLx0hJ+BzAWyjSz+64vNxPBldFux5qktkg8aSNQGDJjw9l5QN0fbfR+zhHWOLVOmIFGwk9
	QjdRMf25dHkB3yeAe/WXeXAWt8hifVDOBhSf6cj4uwh00DTGivkxvI6B8Dvvl8T+kGQhaIVGzum
	rdXA9UmoHnP42pW33v1g5TzSknCyaUZNJM5FwlQsy8rUlpUCK6nK0VoCxaYgUENi12ecJDYc/pI
	d0+T8hlL7iD5Ji8u46Qo3E42//3xxuM1WP/SfbrWNp9LEwiS7/StuQOR6lMkHt8sDNlA/4V2bSy
	Yl8wzP0a3Tto5SRcS7bHtccnWG+xYvx4rK75iOZSuVo4ksXYF1OUf1Z8v/NyEAuCzJhExQcsmBh
	WZe4v7Fl71rn+fbagGj2i4xSuaFmiPnK0mTaXykUO2ZGgk+pOtR9uCfbj2KIButXlDs/OtbYBNx
	+snll5zY6kaJ7UdrIPUmOxtqcHz5e57olOd5UxCCPxVECCfjYWsbzu05QVkmFYgIpnHkpUcpiZN
	ScVnR7Cn0MatBWM=
X-Received: by 2002:a17:90b:37d0:b0:3a8:5d57:a5eb with SMTP id 98e67ed59e1d1-3a8a19478d4mr1407044a91.15.1791371395353;
        Wed, 07 Oct 2026 04:09:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:55 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8189: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:57 +0700
Message-ID: <20261007110858.509341-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_040956_581872_5A96C56A 
X-CRM114-Status: GOOD (  12.78  )
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
from mt8189_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index c0f340a6cc09..eefa96b701a5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -155,8 +155,10 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -168,11 +170,11 @@ static int mt8189_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static void mt8189_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


