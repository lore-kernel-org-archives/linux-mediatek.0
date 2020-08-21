Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A35AC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 11:19:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268232072D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 11:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rIb6ddzN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g8iv19BU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268232072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z6jJ7c6s/cFDrBqIRu3BViC54MNCI2x32xCny+9l7eA=; b=rIb6ddzNRW1eAO8sWsdzTl4CwY
	D5aH/bGEGuVClTGRAAzDtDiCATjWeLfbvY5D2WoHBPf5tgSCA3V65qvs4JU7yKguCe3ZyEtVMybN3
	/YMSkeBy4GNFPEQxPFk5VNWBCFSy2gHXjnuNLFNaXtPVgcVuF0XEdh0fefcoONwckIklG+iGMwkAx
	x47ht8KvUt58vGAm8BWk0+cGG8h0+Ty7/74kgXyLAEHmWr9tJc+ObtqKaRa2iAM1djCon6qftZNAG
	ni+ZOYz747D3F4yH7BszinTImuX5srZiTAqZHxyYSqXFLYieZ58m/rhjwdZynIjtk1eNuTAtSIfYM
	vohM4aHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k955I-0008Ao-SB; Fri, 21 Aug 2020 11:19:48 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k955H-0008AN-79
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 11:19:47 +0000
Received: by mail-pg1-x541.google.com with SMTP id g33so858833pgb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 04:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VIeirKC7U7WGWxGmP4oRtrh71NIdS/JKoywFCrHktQ=;
 b=g8iv19BUauBM54+OaGxIEwnRevuDpN11JroVr9XjhhoUpwbDGmNMYGxZyruJZIF65u
 Sng5gJC2U+duUzp9VJUfRYkuhqKw47vBKo/JTk0vQ0WRR1QMg5SEp6a1LMRhomUMdwqU
 0M6WQrtnvRLSZpDjsnoDAQkUue1O8ysZpS0IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VIeirKC7U7WGWxGmP4oRtrh71NIdS/JKoywFCrHktQ=;
 b=YnbQdXor3Tw4p52sja7XvrKYbmwBXtq3hQNfLMZWR7YpwfSh8eqm7uHDHuaAm7sSaR
 vSUFaZAFxW4SeIUzI0Hg2uYLSKPR/EnQeyGOZgWEtHgFFyroO0wiXBEaUzzjmTahWzw8
 4xzVSStylop3VMHONuTmYbY3fN+EEwdTza27wTaPNVx7GJntdwrL3tg98sktE8wCl7QZ
 q0+aZ3kt5+MTw92V5MEX881FRjx+7sjQjLciBWXAdWRx3ydP+ClprpJ4tW0DFvmcS/pJ
 ai7T5UL3pua2Rx2Z/SEHPYIAqzwNXU4uXiFPDk3bszIWtqe0rRc2kb0g3VzFNfnUmmZC
 4Dxw==
X-Gm-Message-State: AOAM5331SaZKvvC9XfppqaNzEmA/zUipB1PT5Zp4GEZYGhX6hWwK7seD
 8C99WC9u8yOCAXxDwkZL1T9A937WDJtZtoI+
X-Google-Smtp-Source: ABdhPJzVqnf1RyIgIZ6S3FevYn5PI/d8NZHy8ofqSoD4DTDV68i+kCDcddYWR+B+ab6mPFfxG2R/4g==
X-Received: by 2002:a05:6a00:1343:: with SMTP id
 k3mr2146199pfu.91.1598008785422; 
 Fri, 21 Aug 2020 04:19:45 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id p9sm1860786pge.39.2020.08.21.04.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 04:19:44 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: [PATCH] media: mtk-vcodec: make IRQs disabled upon request
Date: Fri, 21 Aug 2020 20:19:23 +0900
Message-Id: <20200821111924.2328306-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_071947_312034_A2ABF327 
X-CRM114-Status: GOOD (  12.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ezequiel Garcia <ezequiel@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The driver requests IRQs to disable them immediately. This is
potentially racy, fix this by requesting the IRQs to come disabled
instead using the IRQ_NOAUTOEN flag of irq_set_status_flags().

Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
The "media: mtk-vcodec: venc: support for MT8183" happens to change this
part of the code, this version applies on top of it (but adapting it to
the media ToT is trivial). If preferred I can include this one on top of
the series on its next respin, even though it also touches the decoder.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 5b5765b98e57..a6ba342f7bc8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -259,6 +259,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	dev->dec_irq = platform_get_irq(pdev, 0);
+	irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(&pdev->dev, dev->dec_irq,
 			mtk_vcodec_dec_irq_handler, 0, pdev->name, dev);
 	if (ret) {
@@ -268,7 +269,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
-	disable_irq(dev->dec_irq);
 	mutex_init(&dev->dec_mutex);
 	mutex_init(&dev->dev_mutex);
 	spin_lock_init(&dev->irqlock);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index d6438cb4eead..2a4136e6e867 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -311,6 +311,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	dev->enc_irq = platform_get_irq(pdev, 0);
+	irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(&pdev->dev, dev->enc_irq,
 			       mtk_vcodec_enc_irq_handler,
 			       0, pdev->name, dev);
@@ -321,7 +322,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		ret = -EINVAL;
 		goto err_res;
 	}
-	disable_irq(dev->enc_irq);
 
 	if (dev->venc_pdata->has_lt_irq) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
@@ -333,6 +333,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_debug(2, "reg[%d] base=0x%p", i, dev->reg_base[VENC_LT_SYS]);
 
 		dev->enc_lt_irq = platform_get_irq(pdev, 1);
+		irq_set_status_flags(dev->enc_lt_irq, IRQ_NOAUTOEN);
 		ret = devm_request_irq(&pdev->dev,
 				       dev->enc_lt_irq,
 				       mtk_vcodec_enc_lt_irq_handler,
@@ -344,7 +345,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 			ret = -EINVAL;
 			goto err_res;
 		}
-		disable_irq(dev->enc_lt_irq); /* VENC_LT */
 	}
 
 	mutex_init(&dev->enc_mutex);
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
