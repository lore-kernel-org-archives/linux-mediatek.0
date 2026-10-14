Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D485CCC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=; b=ITIK9KIR2Bcic5KhH+9GCnHJhG
	r0RmO7NjFDT2xNYJgXQiVVMaumRcVBBCa0xBp3M5UDDLMhkSn1eUbYF7E9xDNcUG/ZZXhO4GHtpsh
	N1hkW778moaQadfR2xUFQbhh0Xla8mM3MXuFJxiNW5RsOGepK69H3mdsoEirZTO0cCNc1iVOb8olU
	UYEmMKzVvSiPl7usnVOWbhtkYF4Zvig6CGvSA4Q1QoS7U1em55d4rKNgYIcF1/q7DbnWInKc8uwWW
	Ps1+b/ur4gRI8pFffbKox5Bzqj1lxpCYryMBLLXpgW0j4pU9cYslwDftRyCvxWHrYA4EOIhbHAhXn
	u6oLfp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAN-0000000FK0m-3iOm;
	Wed, 14 Oct 2026 11:29:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAL-0000000FJyg-3qqU
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=; b=mHEOrDdiMLBE8/5N54oEFOEDsC
	eRyTy7mo3Ii1Y0mk4Tb2FSTjGFj2EDP+oidRVdjaqCvXJzwUBQZICj/7/rA46Xq2jEi6Y1mZmexOy
	VArCmG3o8pzS7iH52DvT9P+ih9JBxlHcaHE5oRe/RCHlb5SeQpkosC2D0/o/K6K4p2ruU36/F/vLD
	0rEfPCILwSN95rCmr/HvJAkQwOc545Jp+UajXMJWAdLkJKtwaflwWTUnMkGOQP2OUZUjnC9e5X6p2
	Lqeg6aBfRBYspqk8akqunxOqBTOveM5INQ3AlPgDg6Be7C9fBMWCr1qXh4RNNJIISmeGzbBG0y/BB
	eMmESTNA==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAG-0000000Gge3-2CsT
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so162055a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977335; x=1792582135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=edaFMFD8cudq8iNs5d+sbfhNO97ESR7AC8779y5xSj+bJYxkZiJsYvvXRg6qlNh5eU
         BTUuVCn0ckmRq9U+njie6CGvRNjNPnCfpdkAJ760Yz3EYLtfEOLryrvMKWytI5njVzyw
         /9wsus/WuWbl134Tkjr+rL5z20mHXbC7DMpmnBi+cijksRjH8U11TwD3P7UY1bpUNbSl
         JBHu2ON5Y+Zd4Jr7J2HD/42rNEyb1lpjK5eOf4IOt34fYkxmURBH2LbU9J2gSjbHMXif
         8LdwI62qL5ikEC1X9pZBafrh5Ck7XdQa/xlg1izcrUEQ7OsyJ23Qt1dR+Gz5ldPgrqwf
         Um3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977335; x=1792582135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=W58TCjkzZePE5GwMBSt+bbqqVD2MihrUVN84PkMiDdxOrwdFSaTAUYuIbLT9gaSOG5
         snOQVsdaMTJPBsaZHPIUfKPLsXOKhYhv5csIgzfwCVQhtHDmOMXjesw9geTcOqrhU655
         GZ5J4OymmgnECJ/nccADAuMW6s0pkYbBsJbzp224k6Q0s711EG+++b25cRccgSmaxHHM
         mxrzw3hUudk3gLoPCx6ACnyE0koqLujVVXQFSSzeO6qNoVVfhDtOkxIGQ+ASD5fHqKbl
         jLo05NaQmkn2l2RqO3YouZEObL7Tf6uWHxLsKpR8NwSjMZosVln70vUtQz8jvcW8v7AZ
         7X2g==
X-Forwarded-Encrypted: i=1; AKwUvBz4J4s/VJ3sjT3MEkqyPcisB2OwpxVlvRJGZFG0RM16n66t3chMxajbANSBNgAFM9AmeRfqrjpwjBTE80b4GA==@lists.infradead.org
X-Gm-Message-State: AFq9FYI9x/P3+RoddSxeo4LKWLz6RvOJ9cXdTNbTWlpzNgsgX5AfMXzG
	umIjQKDgoj9I1/YwuVqfbP95GLZfK5RRtiH5l3lerZMsZvtvBZBf2z8V
X-Gm-Gg: AYBFou3hVn9OAFVXDHdD8/Zxz55UlX8h/zQQlI8Y0LhrHf8blWbs6wQ+omSG6oK8Y2t
	UMFCJZzx2bYeJe2UihCaJZujT8Md2K0pXsEa0T/x2Gj0UAsNGOxWSI18unBPEpinlFMixEtrYhp
	E3Dqktv+dHFfOwSlLkvDG86F0Lup5Ur2r5UgIV/4NPuuSKqX6KphQka9nmBKMJrb/GXTGZtg8Gj
	yxiQzz4CnvKQfFkGq5upnV/xh71AAQUepZ/0LFdT575eJ758v2qP6FEq2H/V4BM7QvGKITVMtpO
	FIfBKjMxk8hj6s66sP7IoRSbcW1mqklNPl0fum6vRyYegFu1KviukK8IkOeZAbptIxb67tXwBvZ
	nPPWApxa0YLrx5owOV7kDKrieJfqEocDsoyQIhVygjmSbdxdhO0Z22yK7ExilL1p+wLelpRMOEx
	XXKIhZ7mCPgsO+x2ENVecqVy+gQLY+Ys1yWWe+aa/rOaiuPYzrce0uwCDj541HkoKibmDXcxlSJ
	6iJm43YbvpHT/WBFQH2VRrh5Ng4Rdb2Nx2joRo9NojiK3CGG5LCl9Tp5R6+1mu35XlyAZWSpkfG
	AGkV7XrdEK66MthUluYQm4qh
X-Received: by 2002:a17:90b:4ace:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3ab3a97a06bmr15236496a91.57.1791977334611;
        Wed, 14 Oct 2026 04:28:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:54 -0700 (PDT)
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
Subject: [PATCH v3 07/16] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Wed, 14 Oct 2026 18:27:42 +0700
Message-ID: <20261014112752.683032-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122856_834463_6B5B63E5 
X-CRM114-Status: GOOD (  14.18  )
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

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 44 ++++++++++++++--------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..02736949ae6a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -364,24 +364,38 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
-	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	ret = mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	if (ret)
+		return ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
-
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
-
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
-
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
+		goto err_clk_unprepare;
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
+
+	if (id == MT8195_AFE_MEMIF_DL7) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   1,
+						   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+		if (ret < 0) {
+			dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+			goto err_fe_shutdow;
+		}
+	}
+
+	return 0;
+
+err_fe_shutdow:
+	mtk_afe_fe_shutdown(substream, dai);
+err_clk_unprepare:
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
+
 	return ret;
 }
 
-- 
2.43.0


