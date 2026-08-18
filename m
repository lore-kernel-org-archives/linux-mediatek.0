Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D97C5DF70
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2026 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGfQf+PSVcijIYO8lLYmyCRTogZGdy/Lqy6JTn7dMCA=; b=jQEjtKkhKAW+gXW3YI8g89uxIq
	Akb4KUqIErzL0C+pHzLWfc0aXESWYFHxJ6Se0z6A5sG8m+uSw5E9XpmSbmkNxt6Fi92MKc41i1I+O
	RKh2N6rPwUOEj3Y7ag/ZEEnUyKZLdLF/NL5zTgINTYaXq9rYrvkeWdAbk6Z1S1pZ59wGyBTijqFjw
	59H0ZHHU/f0K4tp/Chzm526eMmxoyIRNpdCi8O/EF4gBzjyHgirddpDSYuhy7dMvn7msl6QI44NJu
	bj3htVFFrayRk5/GW9N5AfTdRbmkg0f1Mp56+ZRCBYQQNN4RjrswL7LF+rsEGdabspjzNn72ta+Lb
	JH1T3K6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIu-00000007ly7-3IRv;
	Tue, 18 Aug 2026 10:44:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHIs-00000007lwF-0yZS
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Aug 2026 10:44:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2caed617615so58789355ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Aug 2026 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049861; x=1787654661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGfQf+PSVcijIYO8lLYmyCRTogZGdy/Lqy6JTn7dMCA=;
        b=L5jkcjSNw0ZmnqGAdWdnX/kClTRwH7lTCbJVrHW25pr4TyLgyiDG6ti2WyX9Wtlpck
         a6etJcDQ6TDtAtn7Cbm65S7AYbr9Qd1/EQBU3XCuJEdotjuHtuRGQ4zPhYMO0Fj1Wlfi
         Vs8aeG7nNDk4XNMS1pByBS9pPRqPN1Z150UdF3spLiZArM82bRr+ZQveBJvXKG5tV9su
         SIHvXYRfyc0fWzVyhgWoCPycEJmHXHQUQ4mGHA2NAu5TRnhJSU/4K3nZrRvfhEODMTVv
         L1Ne0cm23mcxKfxY0hn/lCdlZc9pOmODOOu1Gn56LlTxpwwhanzWydbtczq/QM8pgSR3
         mR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049861; x=1787654661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGfQf+PSVcijIYO8lLYmyCRTogZGdy/Lqy6JTn7dMCA=;
        b=dd//sWSlx3i1OkXJwlpmjjXymMxRmSHJ4ruD6doYd8fBDKViuMKXjsthdY7toJ4KFS
         Ou5u5C+IIG6I6r5xR74M6+AXsAcUYX+FJuu2sGozCFRuMnYrsm88oQ606QWlvapjYNHi
         r2QsX/O7pilgQZQOI9sk1KxLUKmX76oK4uksiwrpBCNxaDi5QYDSVtlm7T9lnXd/1baF
         bAa0Gc+fFxIm1OTpvD5wbtYm78PUyTa3CLN2HaFsmcT2RKzyqwIzSRsrfLEShGKY+gJO
         aZVYSZM3sndc2Q95jaXgMPrlK09qjD6FkUpGwqdIHjPUgompKKCjXBmsSMaeNa2HEaKT
         dmGw==
X-Forwarded-Encrypted: i=1; AHgh+RoaWw/UacA5SkvZE/CImNU6hgAyIAdUoH6Qm4ami82ypRlPiOPHD13mhlyYfr4gD3e2vegRKB4brHYS1X+QxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLz1NPkxq1XrLBHaQGnVa+5iPFj/024vj2dKftaDwEz57cs2qn
	hmiEfUSg5RTMDuWMRV74e+qdXrfjatkK6ZnHWUnCMnCy6pFNHQAC8AlD
X-Gm-Gg: AR+sD12EIQ7zIu6mf0wgB3FfiCncwl8aIhoBfs4myk4cv7hGYk1PXMDfQJbBiLMvN9F
	OJ+WWvU9J3rdcqu7UYfm9REDho6oPrIAT1zKEgxTHL9HjweKX6K+euJ25/BG+1I/jLHwjbUvuhj
	qBmP0/Ar5f/6ruBAi2RkMbVBil79LtGfhgW2KmYhaC3jmcDb2xCCCIAKxQhnfTXIXph3k8ywfsc
	sQUkrecJtfewFOL43FCKT8wc++tJGYJXf7YP9G7PFWN6rIDAVW70QeelNqelNtm9DVuedTfxGso
	qx7ksODz1fpy6rgurbDyNOjEPZWZCgL2cFiaMhy8ilQTztwiHTqmndlWeim2DuXz6ezAqzoumZ3
	uirCEo7sZyA71weViRHyGlG05LCG5n+1Hp2CyRkYYYgElnbygAvMX2rGvRLVFSTEc6NINqFuInp
	IPoX+172KBEElqDU5JWFk7yBQJ1AAKeiyU9qLOYbkGTiR22p1wGOBVOPaRVrYWR+QeiuqwOHVu7
	SxOzbckP1fh4eA20kMSzAdQQGkImxL6D4cKnIm10eYoncGkVEGP+N/Ovzr3dKm2ql2mUWH/enQ5
	vaWu
X-Received: by 2002:a17:903:1b4d:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d3b0de7f65mr391680325ad.9.1787049861128;
        Tue, 18 Aug 2026 03:44:21 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mediatek: mt8173: Drop redundant probe error messages
Date: Tue, 18 Aug 2026 17:43:44 +0700
Message-ID: <20260818104344.37824-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104344.37824-1-phucduc.bui@gmail.com>
References: <20260818104344.37824-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_034422_288923_BDAA7192 
X-CRM114-Status: GOOD (  12.12  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b7c4b24a9cad..c2421f17375b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1091,10 +1091,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8173_afe_init_audio_clk(afe);
-	if (ret) {
-		dev_err(dev, "mt8173_afe_init_audio_clk fail\n");
+	if (ret)
 		return ret;
-	}
 
 	/* memif % irq initialize*/
 	afe->memif_size = MT8173_AFE_MEMIF_NUM;
@@ -1154,10 +1152,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq\n");
+	if (ret)
 		goto err_cleanup_components;
-	}
 
 	dev_info(dev, "MT8173 AFE driver initialized.\n");
 	return 0;
-- 
2.43.0


