Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE4EC43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 03:04:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C282C208DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 03:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="srRdLvg/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C282C208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8hxydu4zEfpEexoUrTx0+2KzEhVjsfVNg2h2Pqk5vY4=; b=srRdLvg/6/MmbwYl2J+X0AObFw
	75LVIbhHUxkOPOwtLuCqV8X73UrePsonl2CxDlmspy7ak8hX4wo98QAdV9vZ6KyeI0thIWn1HIkPu
	tmf4ZZaG38XhWjKx91H9YC2UpQswRton3GTafbmdQPqPFkctqe6+xMHYNouzh70XQ396UVr7FgBGA
	iW7b54FG0MvRhVU3PwVFm5Fn90HZ4xLwEIhucmJtmVK+xhsCllhJKuZ820TsPeR8GQ7VUG4SJVgva
	HgkosBD+aKcbxkS5TMHDI21WAdTzMFVOQLSCGLTQcGet9mPg6Hx+xSwqU7W9lHbqFGIGzCd5N3B2G
	yU7SnBMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI1GF-00037W-PY; Tue, 15 Sep 2020 03:04:03 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI1G9-00036G-9m; Tue, 15 Sep 2020 03:03:58 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1A8CDBD57C749919D858;
 Tue, 15 Sep 2020 11:03:52 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 11:03:44 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Sean Wang <sean.wang@mediatek.com>, Dan Williams
 <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH -next] dmaengine: mediatek: simplify the return expression of
 mtk_uart_apdma_runtime_resume()
Date: Tue, 15 Sep 2020 11:26:22 +0800
Message-ID: <20200915032622.1772309-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_230357_592414_910D521A 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: dmaengine@vger.kernel.org, Liu
 Shixin <liushixin2@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 29f1223b285a..27c07350971d 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -624,14 +624,9 @@ static int mtk_uart_apdma_runtime_suspend(struct device *dev)
 
 static int mtk_uart_apdma_runtime_resume(struct device *dev)
 {
-	int ret;
 	struct mtk_uart_apdmadev *mtkd = dev_get_drvdata(dev);
 
-	ret = clk_prepare_enable(mtkd->clk);
-	if (ret)
-		return ret;
-
-	return 0;
+	return clk_prepare_enable(mtkd->clk);
 }
 #endif /* CONFIG_PM */
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
