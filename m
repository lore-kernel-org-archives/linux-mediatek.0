Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940C1C98306
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=; b=oUE9jNEpvgZYGv86qanKZMeMTg
	1nI3q+F1r91RF89CPrY8uecGE+B9qs7aP1zg2vXX4QddyOWcluIL8QdSnEZPP9hE45crIkk4Y6TGB
	JTvdwOubU7Za15OtEdQ3d7qnASO60SquIgsLndg3AB6mNw5Hg7FOhTyR3FSk8aR7+MN0y2DbkWSxk
	phSKKUn3aqKae9EPNH3tqaa09uGiTzRwc48LuHDOWw1Xak3/yCtF6hjs/qMDyO0rL2bIo1uNqARx1
	8JHESArGqcgRWgNjgSgGELqO0Dkoe4oNlGTHESDblJcY2xA3nk7GFwppqhT+jNLr7Zbsj4rkgxxJz
	OdHYgvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtJ-0000000CdeB-3FZI;
	Fri, 25 Sep 2026 04:50:33 +0000
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xt7-0000000CdUF-1TSV
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:22 +0000
Received: by mail-pz2-x2b.google.com with SMTP id 41be03b00d2f7-cc78d5045e0so73922a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311820; x=1790916620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=;
        b=CPvAo+tqDT3QpQ8CDkBnM+p6XLLmLbAk35srCeR1Fye9BbAQH0RG4Vd1Pp7W7jJsTz
         VMRZMnGheKOG4pcMQdaoqWwSgQ/FJW3VQDZM7QrGoiO4KwZ0aBFLxvBTFQ6Y6p5ATi50
         LjCoapMCgFxmddxlMO3YU7gxXrNeoo2SAftFI290/EZeKcbLMAoe8Hp684n5NzeNZXWI
         r8Elzlv6AEgsE8Apf3gNjWzZaU+pJWIJHNCUm8VK/OZuE8c1yo4UxSU0v4UbHysu+bgg
         0ptAgJGQTHcdQ54wLogZTEPBP3vdbpQfTBgd9OZZ69uhdCf/rOB81YBDvPMTSho810KB
         wNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311820; x=1790916620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=;
        b=W7tYSIjL6aBJFWdvp0qHe6tT9jc5sWL0exehHJLKesGosCsnbhNlIvMgcGUPMQ9pKK
         A0OiFs02jII8nqg+PxsTaP6a7CAIw01BZHLFatGSo2SNUGSelE4y4cRszXTPMQ8QO+SZ
         4yTuxgxqexYgitMH3a3X/Q5BgeSYajyDK7b2WFrXr/CmaAGBHFvyS4mePhWnSZr2f82a
         4SuSzLqAMmcx48lMxIS1ce99cbmipicwL6vSXB9KYiUsnnUxMmCEOFiHvVUJzezDlbB+
         lCfzrVgaXyLklQ981dKOPYULj/fkKX50xoML8cMAm2CCL230XCs1fIVRuzF2GioDMvXh
         s2vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIAX18Nvzn+o74reJUUNVa7CCQY7DrR5WoBJTX1cRD2WenukAUAUr09O1hU9rjdDX/yP649d3yynnKZ3UTLQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mVFX2IU7cqemt4i3RiXTWBPXGpKEg3gDKvLuyWabQOT/8Kp1+k
	5Ouz0TE9wYK4CG5JzusgQPm/FN/Z+A43DVAjNnSSkNLSI9QkH0kfeUyh
X-Gm-Gg: AYBFou2JitPbwc/jvGm0ck2LEbHVp4V1zidvOn4dw21YpuTFWSyNolMfSpfZ+1q/Nqg
	vxN6nHc7SdDzAMT0Z2HYzYZKy221Va88ubzYCOFTN4oWOyZvDmi3q24ciokllQCd249drXrUJEH
	moKLqFIwynB6qxAuRR+pG++IaJiJdd0HAv0wRPX4b7TO5+odBPD2slbWQSrejdH0iPG22OcnkP1
	9nRPlpFnJGo4DTVXQyAkGYHjrdBjD05/Kems2btvqFmb4EZszroC71IaKjnCL/SAQNn2ljvkOhZ
	SpD4axEnLIcvmCDhpcDa3+PCkY2AwTgyCkyEjDMRT55gAouryzYYraWfku4gzSuezz5PvFBKV6+
	TBK53zOVCbopot6yCQ9OykRk/aAzkpwvbTE6NiQhBfXAijBPe4LoDScGxWSVWD5W5LaWA1n1kJ9
	Oi1I9GJ91/EOblUf7epuJ8cyxQSxGXg1Fd8i1PXX8xsqlUL0DoDNdyY4wd5kN2ZhaKww20V4OQx
	iiQMTGx4TmVeLYtcxqbDdcfQKZ/kBezNyWtQdUHnrp/GWFjMkIxRyFd60pHMD7I3b2GfOD458Wg
	jV5Gz682//xAsA==
X-Received: by 2002:a17:90b:2d46:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a0bb6606eemr886083a91.66.1790311820391;
        Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
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
Subject: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Fri, 25 Sep 2026 11:49:00 +0700
Message-ID: <20260925044908.450775-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215021_679679_4514DE57 
X-CRM114-Status: GOOD (  13.44  )
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
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 40 +++++++++++++++-------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..5e76625915a5 100644
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
+	if (ret)
+		goto err_clk_unprepare;
 
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
 
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
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
 
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
-	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
 	return ret;
 }
 
-- 
2.43.0


