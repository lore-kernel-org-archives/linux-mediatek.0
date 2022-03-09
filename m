Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5389CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 05:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vp/YY/Ejetmb2z5NyTsC6w6yKejtl90Tsvh9G5W++d0=; b=F6noMty6SHkBcP
	881GvAXEpanGIna20bVwQh69TmVto2W0sPnUFCUv8qbyeCNj17ctcsPV/wkZjQqBCQaHznAiDl+Aw
	sNeAr82z8Tj38m5Bjorhu+yEK3IktHET4oOWdju1biTxtpgrqkU0nUaw72Npk+9jL82qulfQblECO
	eHL/kkOd2prppSjzoVsojeHS+We79YGCxCR+DajPIbqoRnW5cELZyR+5iD+mvwr37fZbuYo1KJq2C
	TYsDI555UDukqo7C9iOgjETcBkE1hOFTVC4+m2UNEHFbgdMduHqW9L9R83q7UGs2lvsllHgZJWrqS
	cEjLYVPAFxnWbl68qIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRoyO-007MP5-E5; Wed, 09 Mar 2022 05:34:56 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRoyC-007MNK-NP; Wed, 09 Mar 2022 05:34:46 +0000
Received: by mail-qk1-x736.google.com with SMTP id 85so926528qkm.9;
 Tue, 08 Mar 2022 21:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eEOiHkHLw1HT7AI83/RNoNHRJV8b25WUhn8TCsdl8iw=;
 b=MLzta2Ud4ZYjpzEm9qBps4Ic1bwLSV2sHprzrery/2uH9yyBBgO5gyO6Q6WWTA/uqz
 v9+4b/QY2khNUDS5o+6xVYBlTJfpYBcbhU39r26BaQSfVNybUv8YqjOvzx/A694pgmAl
 GJUCJb8fl2v4VoyQU2TsaIvWpPBMP/hRzDmCWuWXJ6xIAr1UIMoTnWkeeHbDPnecqmv4
 rd1yWB0AAQL1gV0P5k/exMR78XeoipWVvrwja3DWP25EK0EgKGMfFMDJeAUUH3zTix7T
 2w6C/omXTGiSZT3BugY1tkcbOHknDIsjcUVzmfmKsttgOp6flGcKXMuuIow49ArqIgI5
 gpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eEOiHkHLw1HT7AI83/RNoNHRJV8b25WUhn8TCsdl8iw=;
 b=p/OpsEPZG4/h5wV100yWSD3Dnn+XAnjD9l8OESWiZJlFt3u0t4xJ43sUyEpzNOdWCO
 bo2HLXbOcv0BF90LPXBuFIhePRifK8ZDzQOu3Dlmrv/ybD+qDoXPMOdGB5nwWQM6159B
 4MY+c7j7zIEeVHNWyAQBkYa0goUoQSKy2nq6MLf+1OOHsyjG5UqN9D2yQNRvbwmOnoa5
 BPCSST7jmwHfn3icZNYF9AWGZzsC7fIgav8/diJZub9Wx2HI1GENl/7QKsz/LBzuW5fT
 RovoCsIz9Mf3BbkXe5Lfpxyt8LMp1ORLxoZrz+SWFNV8YYfdlmgUOKOgDt5hIqm1CVwa
 ko7w==
X-Gm-Message-State: AOAM532Ghou/E0+p1CJ3SjEo1DudyZThYGvHt80eS/MzEftRUmjhT036
 bha7AhF4YUZ2LlpTv/PA3RBeqp5xUh4=
X-Google-Smtp-Source: ABdhPJz6MrSiIRkLEG2ik06dKmSz8fLFV7GhsXEvrJMqJtuAUqIyHx/nnW2rnOLYMQLguq0jOIGgNg==
X-Received: by 2002:a05:620a:24d6:b0:67a:f179:984a with SMTP id
 m22-20020a05620a24d600b0067af179984amr11963508qkn.474.1646804083270; 
 Tue, 08 Mar 2022 21:34:43 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 186-20020a370cc3000000b0067d36e3481dsm302003qkm.17.2022.03.08.21.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 21:34:42 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org, matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>
Subject: [PATCH] dmaengine: mediatek: mtk-hsdma: Use platform_get_irq() to get
 the interrupt
Date: Wed,  9 Mar 2022 05:34:36 +0000
Message-Id: <20220309053436.2081066-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_213444_813162_D57566C0 
X-CRM114-Status: GOOD (  13.54  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

It is not recommened to use platform_get_resource(pdev, IORESOURCE_IRQ)
for requesting IRQ's resources any more, as they can be not ready yet in
case of DT-booting.

platform_get_irq() instead is a recommended way for getting IRQ even if
it was not retrieved earlier.

It also makes code simpler because we're getting "int" value right away
and no conversion from resource to int is required.

Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/dma/mediatek/mtk-hsdma.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 6ad8afbb95f2..d04d09016e83 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -897,7 +897,7 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 	struct mtk_hsdma_vchan *vc;
 	struct dma_device *dd;
 	struct resource *res;
-	int i, err;
+	int i, err, irq;
 
 	hsdma = devm_kzalloc(&pdev->dev, sizeof(*hsdma), GFP_KERNEL);
 	if (!hsdma)
@@ -923,13 +923,11 @@ static int mtk_hsdma_probe(struct platform_device *pdev)
 		return PTR_ERR(hsdma->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "No irq resource for %s\n",
-			dev_name(&pdev->dev));
-		return -EINVAL;
-	}
-	hsdma->irq = res->start;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	hsdma->irq = irq;
 
 	refcount_set(&hsdma->pc_refcnt, 0);
 	spin_lock_init(&hsdma->lock);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
