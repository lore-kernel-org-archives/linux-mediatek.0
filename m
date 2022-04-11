Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF8AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 01:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9b1bTe7kOtnaKIAuwxj1+FJv4hyOcvLdYOa4Dbd7lwc=; b=yunA+7tL8wAZaS
	bNW0sJROfFbp6SwkWMOxBsv7kKho0bbxKer/zBMj7/UVwRHJPuTX/26PO0FUPa9rjYc4zJEbiBEgb
	e3Gd1zFj5smwl8UNXve8lo32ghiyYZRObOtyh7nc5EfsdOoTzyn7PFybcxCTC2Ain7YBxZVOL0LPS
	j3sNurzFs22YlC9pj/NVkEfVUbqB2aR7OZPYV0qYyISOo0oLLK+1DFCWksEg3Aw6v4nOjdsLzix1d
	leAbsERRbv7VSKqNw/Agm9qsI7eag9zBzuM3jPdrQtTLaKsMfD+JYSs4F8+cM2aiSdtO8GOSk6o00
	8RJrn6BTVl/8Oro2334A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndixh-0066By-E0; Mon, 11 Apr 2022 01:35:25 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndixX-00669J-69; Mon, 11 Apr 2022 01:35:16 +0000
Received: by mail-qt1-x82d.google.com with SMTP id q6so4208677qtn.4;
 Sun, 10 Apr 2022 18:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5q+TBxfRiuRLiZyvkflF0zE5W4Uud4G5UjolfJsOqO0=;
 b=aJHc+ESMg2kCTb9q/UjaX19bNdhMmz4JmkNQ1u7qZWzwjwHaV8i5rKjcrcrqWM5OgQ
 8B2zoMPVi08dzv+f4p0Ihj8mP3XETqqzfVXcVEf6+S/53MLM3TWyDOx+8SF/T6prdVXV
 d8EKm5ry7SHKNKQl7c/bjneIUkeDFGsEJ+f7O1Sj1r8pi8/MjteUo1W5DE7BOf4Gby5V
 XjUzPDxscEpJX7zP1Kaicpq9FmA5UC5oFMXBb+dnzooaikC1IR4YoH8F+1hq+xVA9aoD
 M6iBZX9ltGQTwGd5Vds9Y7ejATbslqj4Yp77H2aB2oAOfoEM9+mcEZPkravyJtGhZcri
 Y2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5q+TBxfRiuRLiZyvkflF0zE5W4Uud4G5UjolfJsOqO0=;
 b=iMbE9LHCyzuZW7eMvzNdohQ29oeZafZ2HlcS0PHwt59Bs4rkn6HO2lzvbHnn4O4r7Z
 zFUVYaZnt4UJRNj0gQCHzqDSIP6cqut6QVLp1PV04UjGTJlMiXtcKNlgGF/M/1QUrc+V
 n+ik4FEmoTrd8IjXDm8FAoz7uzLMtLi/EPfgQhtS0k7DXKuaDBvGgeSg5mKunG9Qpdzl
 6bRNh0fETn4QfehejNFfk8kFyulSYfLSlJPn6QMBrl83gVLW88DjXIUemaCjB4/jmK2f
 xMwoqk8I2P2W+am8xOxriiolqYY7ZMdvI5BzzzCLSnrBFxag7meYuxj7wZD1DoYU/JqO
 NhBg==
X-Gm-Message-State: AOAM530kR0iHGGqUje7PmtmKBtx95EF0V6bO+huAn/Xpkh8vJHs9Dsb0
 CR/XPGBS39Z70SHlFnwsDVQ=
X-Google-Smtp-Source: ABdhPJwTr+7fLDNRrpGR4ByX37LRikwp7wsj/JUZ7U4iu5eTwWsV9A4sWxtRJlIF3JSXzWMd7IDd3Q==
X-Received: by 2002:ac8:5ac9:0:b0:2e0:6cd3:c8a2 with SMTP id
 d9-20020ac85ac9000000b002e06cd3c8a2mr23444675qtd.302.1649640913252; 
 Sun, 10 Apr 2022 18:35:13 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a05622a014300b002e1dcd4cfa9sm25475083qtw.64.2022.04.10.18.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 18:35:12 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org, matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] drivers: dma: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Date: Mon, 11 Apr 2022 01:35:04 +0000
Message-Id: <20220411013504.2517012-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_183515_284802_1EADC567 
X-CRM114-Status: GOOD (  10.31  )
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

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 375e7e647df6..64bad5681447 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -274,11 +274,9 @@ static int mtk_uart_apdma_alloc_chan_resources(struct dma_chan *chan)
 	unsigned int status;
 	int ret;
 
-	ret = pm_runtime_get_sync(mtkd->ddev.dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(chan->device->dev);
+	ret = pm_runtime_resume_and_get(mtkd->ddev.dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	mtk_uart_apdma_write(c, VFF_ADDR, 0);
 	mtk_uart_apdma_write(c, VFF_THRE, 0);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
