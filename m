Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6798EC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:39:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC9D61622
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DC9D61622
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zeJ/YNeuoqyxWoZTRGlzeyUEB/OYPeTLn9CjgoSC6lU=; b=Pda9hhJnNiG/oTCNYNKCDu1F7A
	5TCg2FFiTt2ivCW2TXR/iu1X6+pc23xDr+Hjd428c4wvv/pHaZMIeWkiklNI7orKVY1UDkRHlnjy5
	oCJudqlzgL717XtqafMH/u40DiQ7zB6iC5DoQ4QVmoSlBBTxZvpxkolvH5BT7V+pphLkBXRB3pTYP
	LKqG8tvqfiiJbS0r0Bf+/yaY1pm/eOBs6AQBnGKzeKFbcj0amzgoNufEmVH+GaYfLe0Emn2NAu5tm
	1C7BT0zNbQusBSxZyGuxqlqh4+Iz1G6bPK07XxXhNnOHYdglo09M9CjpwvqTAyDiifUN3gT2KiLb7
	2HN6xqEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRfR-00HQoS-2j; Tue, 11 May 2021 12:39:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgP8w-00GnIe-1N; Tue, 11 May 2021 09:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=r1vXvLmBCW9ghtlY0wM8tPSZKc6DfiSsFH1tdWXFPfQ=; b=uHqNYGsgsfxa9b0G0+Hf88Yu12
 z/ntaXr5BCbc2Uh1OcKF3v816XSAeJByWFt3XQXOcjuDuDYlICyGN2qZ71QnMt1YsGoMCE04fOWFK
 Z62FjqfDJ72/J008ljfXaYKqjJtMsMMj7KyaZ2QWoHVCaFbZVFIuzxUc8M6dBBNFE/zzQvJChGDKO
 9XDwgPLmP5Awt3mX3vpj5Q9qfCKffxLYTaiy5kxt73YCgL6pEvcgo6fsS0BYfCIO1CUM9rwewdIC1
 9c0N/ul4DtPVx8fhn+IItS/HLraxo9dMyzVLypT51kYs/Vvqe5c8S7utpV0bJEz99URTThW3bR+4I
 747cxLBg==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgP8t-009S1T-8Z; Tue, 11 May 2021 09:57:32 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FfYDm545SzCr1p;
 Tue, 11 May 2021 17:54:48 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 17:57:18 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] soc: mediatek: Remove redundant error printing in
 mtk_mutex_probe()
Date: Tue, 11 May 2021 17:57:14 +0800
Message-ID: <20210511095714.4991-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_025731_487180_DBFCB02E 
X-CRM114-Status: GOOD (  10.41  )
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

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 2e4bcc300576f5c..9e6aee24c92cfd0 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -481,10 +481,8 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mtx->regs = devm_ioremap_resource(dev, regs);
-	if (IS_ERR(mtx->regs)) {
-		dev_err(dev, "Failed to map mutex registers\n");
+	if (IS_ERR(mtx->regs))
 		return PTR_ERR(mtx->regs);
-	}
 
 	platform_set_drvdata(pdev, mtx);
 
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
