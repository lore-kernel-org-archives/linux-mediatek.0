Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C075CA5FFF
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=; b=zalCmEKnX0QSr0mbc4+tnW1C0N
	t2/SMPCP9ih2P9/6F0P4BEasS6qNfdL96I2LYPIY+ZIEczhVE/5pZpL34bHUFHy/6zuLU1uO2Agjk
	ZAozgrZ+OAa4IZA6tuKNuc8aWyx794mW9fcstAaqa72Q0mCekT8txNSw6g/lFSfIZeOS/C6siWRUK
	ER7Rx5IEhoOCdcfJvFq+NIYkVrMwqPHoiWDhj+vn1ylssSm7yxqqPavjtnJQ9khn0lQJP8UgpWPXL
	3cBi0WddRW919LEardNK9p6gF448cEZPYOfrzF8wI91mBsOdbFEOGAfsd3jzcR3Tbz/FTsQVvr2R0
	kszEvkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2E8-00000000TpS-1hhs;
	Tue, 06 Oct 2026 10:16:52 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2E2-00000000TkR-1IbK
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:51 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8819033dbadso300422b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281805; x=1791886605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=KLiKJBW+gRwbNxr3jbSqNaxae5khGQHBmLnYTVMKK/P/J+W7p8e+tmGeY3SfI4Z5Kq
         l9zZDV1gKf+EYIsYqzuo+rXc5IL2+qLWGqF4+7irJPAFkbx2zaAAd98Oe9G0ALELQK+z
         Hk9iZfWauDTnwXi0S9vuZCU4u0cp0zKfxbQV/Y8dmqX6OT7jEmsSspEOCGaWhzpnQQpt
         xAbkScFF+1gYEuREuW5lnYOUttWxwAimYhTfwPlx82f5P0JL6nO0akc8VRX5gRBWNxJe
         sC3D637JT/GdUWTW6gzQVcCc+JNjulP3JLIp2DunqnbTd9io2U1yBRtDJ4ze2zxXxRxG
         hoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281805; x=1791886605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f/MTd/p24/UUitH2lVkrRpF3QAUdU24FyYEOQgmlyU=;
        b=CQZm0BCk60ruN0Unlmdan5uNVWS5dhLgMu7d/lZt50ifgEAYhM+eBy3ZCnSiQV/9Rl
         tUlqShEABfTWsryBqVYD1+PMwu25wM8wMjrh1PrhrL1ahJ8td7utmrkAGbUYhWG7gRH3
         36wPVlnQXFXr369boYK563WiYG2w4lnsQU+WbfgH8LRBZGdCCs8Xb09OeSdQR9KpfStT
         HjyCCtSDgKnzWj/ITVL1srDCZy5DH9Md2ZLw8LVGj/PlGJzW9UGNPSrLMYOm4k79hwHt
         /jtMZxoYipl+4W9WkKHjSjgm3T+7r9559xoWiT4yYJNdtJ4QsSEEZ+QAPADECwHdJW97
         o3TA==
X-Forwarded-Encrypted: i=1; AKwUvBzKJx5ISM1NvZ5norZ5zsPHFGgobCiKeEa8LLryvXujJN6zA1dWXQm+xsQK0/Yg2aml5MD9mxqYgcg/dP7/Qw==@lists.infradead.org
X-Gm-Message-State: AFuF++nXdXtBsdJ2AvgIe/1jyGVocQB/Bj2fQLVzD+9BvcAByI1o6cM1
	Hawe91+t4eydGaS91OZ7BEV173I40q2Ct5QYeKncP5lHci+yKvPzg/7a
X-Gm-Gg: AYBFou2/NXdbNIKG7MePq1IKRilmNuNuSoLClH57P+WbHJT37jZoHLI0DFRx8vj2LBz
	PTBnW52kKgwgctMQ/l1Cjwa73K4kajgR3lgfKL7x+G7NWNvf6ApMOog4liobxtFHLqz51mxu4hl
	dj8KqfH9n24b3wIyqZI3lDKfqPU8RcRPGA8x9Ej0zE66muHEEPC6Z3L4MLCWeEAfMFfvkqT6sHE
	3zWCKz65upmYJeuATkSldebr8oAtzl8IudaewRNzEOzXc+WybBOR/HA6hXY7081E+Z6iDxm5r+y
	PLvfWpXYS8Pz0j+tlM+jmrPCCSm4hVZiIH8qdGO+KcRs6nx/z7eWUihB+cEkaDd51L7xAPUIX6a
	wDXx04cNI4Yl6NiWYQPscMFq35tZe4lgwRndxRMJUP3459cuS20iG9ducWjeK4RFxjXbemx7qjo
	T0+sXReDaS3Nw6HhgI2py6mQQg7JE58cVlt1eOPocDNlUYwsbwC26Kd0uWc07KvntfaDsg/PyYN
	Pcl+ZZZt+goBdhDjjlhRXRjF5Dmy22p+3v6DvyR7hHDszU9Unbak4kaHVP1+Ca2Lo3FJn6Vhu1l
	gOsR6tLxI8sZdQ==
X-Received: by 2002:a05:6a20:c70b:b0:3dd:a196:69ec with SMTP id adf61e73a8af0-3e12492c658mr784333637.71.1791281805254;
        Tue, 06 Oct 2026 03:16:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:44 -0700 (PDT)
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
Subject: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
Date: Tue,  6 Oct 2026 17:16:05 +0700
Message-ID: <20261006101606.54079-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031646_364905_B7F0B282 
X-CRM114-Status: GOOD (  12.94  )
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


