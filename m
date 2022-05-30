Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F537C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hDkTfPsU1iknRPRjAA8dOiE2LsJWcV0WqwvVSmqDMCw=; b=kqSVxyUO6VMaua
	7gfbzM2oowF/hkKM6joL4Ohrg9bBgwnwA2UJAJlmwrW+swjGt/QdmuWX+JslHfg4Ew1x+V+r4jN1R
	W74E9iOhkXnKA1l+XYMRPvIegbBlhzt1HjiEa3bqb8oePLukfO3rXkO74+Y9hrWdBZOKO38vJ63Q0
	AGLlftjafsdjzqpcg2ImJA3b9yhuxptfJcnclKx6wwMmMKZm2MQsnewmFcBmfTSlMJBXFc/YaRyLn
	hUAFpTlPcGN41hiIYxc99OF6q9xNwpYUZS5hikczr8am9KwUCHnQZ+Qu7ZjZir7JMWGTM9luIW2AP
	TDDjA6BMt0EgOhHbaQqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveg4-006XB7-Me; Mon, 30 May 2022 12:39:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveg2-006X9r-Tp
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 12:39:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id r123-20020a1c2b81000000b0039c1439c33cso805943wmr.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iOg84BIL4xQRP3MO/aXO52buPBsvauauBaUk9MIZub8=;
        b=tyRhSVq0ivqjvgv19Le2dDbG9CZp5EUZ/zREh2B9EqSFvQ0bEXEKG1+csR4Tpd7M/H
         AHPyjbUVOaWUemrfWMJ9iOhH7XjqNLtKq1ynVTRMM+nKleZY+jmoMjBHMxH4gAq9fXrb
         J41Tn7SunmiKvWbrDWG9UMD4X/pps9yTdP81ARlOHjFAQKMGWjyqZ1hUImkvqRpcWUXy
         ZYJT5Oa8XawT5PyDKgZ9uoiGeYprUlV21rdPlbppNaVA4sSN0OXr/jpu7vpAfMJe/Y+3
         EIge7ArubAowZVy8ugPDj6li08SrGSLwX+1vy3NPlzBzESQIoDLhKaNmE0eVofOyY6a+
         3AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iOg84BIL4xQRP3MO/aXO52buPBsvauauBaUk9MIZub8=;
        b=vhVO7TsVHnhCYcHUJnPQ8wtkz3FDbR+Es0bBt1JIkkAdeg6d7QY4GS3ZbWUo6fyu9t
         GpLQXXWd+SA7Hsufx7yHYWAUFoQ+tNLN5YC9zQz3HEbYgWbOwT9e/aqDkaBbqXENRvP6
         dqh/fGF6rr94/37D1pUMsUlYvTPeDSOMWGFl77BCv8c1j//2FagObsOv+BEAsi507Yfm
         hJGA1UlNHTKv8oXi97wWHXYoCtc16GIjIstrbWUruT0xy/nfxZGvrKQq26LYt7dkkyLh
         /drjLaeZZAI0GsTduXnY5iaogqj8rXPyM7gVs3alkkucNWTg9qR2wo8HsmZ68FpfHQ1f
         Jefw==
X-Gm-Message-State: AOAM533VhmB7bVSJEvthPFeTVctgWpcVHY+9EslLQfQtuvpSTThyRwL8
	PtGZzsrFpb+qK9xz6gP002VPUg==
X-Google-Smtp-Source: ABdhPJxcmwC4nGeuFy/KRdJLKioMtzoK88H6jW8SYyE+vJtOjc5C4KCm5edQ5ur75NCG1V94Z2fwbA==
X-Received: by 2002:a05:600c:2182:b0:397:58f5:c6cf with SMTP id e2-20020a05600c218200b0039758f5c6cfmr18471215wme.86.1653914356468;
        Mon, 30 May 2022 05:39:16 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id k7-20020a1ca107000000b00394708a3d7dsm10137222wme.15.2022.05.30.05.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 05:39:15 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: mtk-sd: fix typo
Date: Mon, 30 May 2022 14:38:56 +0200
Message-Id: <20220530123857.692076-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_053918_998498_9032265C 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix a typo: Fianl -> Final.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/mmc/host/mtk-sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 195dc897188b..c7d196f805ec 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2318,7 +2318,7 @@ static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct mmc_card *card
 	else
 		val = readl(host->base + PAD_DS_TUNE);
 
-	dev_info(host->dev, "Fianl PAD_DS_TUNE: 0x%x\n", val);
+	dev_info(host->dev, "Final PAD_DS_TUNE: 0x%x\n", val);
 
 	return 0;
 
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
