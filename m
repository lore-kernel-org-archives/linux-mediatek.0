Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F846C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 08:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UrO4JPe033CR2X7wVUMJf38pxfVzKMG2h2ceSu7rzR0=; b=YvqTpw8S7qe4i2
	0SF/D4KPWyEpmXRrzg2/Y+yYYa1l/gL4gLr7GZmeLihKhaiDqUnBnTQ4UZsUGX9bMf9roLwJE+7rn
	0DOGTbG/e9L8hiDShtJGL5vi9zJa/z8aGTvxEKu8oIBUAbxsM+DVryEpfH4nsJqEYMDsKdQ8L9f8S
	RkmG88gJInduYabD1fpBnHc/zG4Yc5D5Bn4amavyk4/KepFf24oQ5iIFikEaZHgXizvd63INYi/UF
	cOX8GHhUF/ji7JBvZEHHxvoaUrS//yP40DkEXKEyXsER4fYSxhKUqyIF/lhuI/FtQ7nQy74h+k2di
	ruTsDauZNxLi0F8smvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV7f1-000k5v-Qn; Fri, 18 Mar 2022 08:08:35 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV7ez-000k4C-2t
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 08:08:34 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KKc660dXjzCqqj;
 Fri, 18 Mar 2022 16:06:22 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 18 Mar 2022 16:08:24 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 18 Mar
 2022 16:08:24 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <sean.wang@mediatek.com>, <vkoul@kernel.org>, <matthias.bgg@gmail.com>
CC: <dmaengine@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH -next] dmaengine: mediatek:Fix PM usage reference leak of tegra
Date: Fri, 18 Mar 2022 16:08:09 +0800
Message-ID: <20220318080809.22562-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_010833_348321_DF2ABDBC 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

From: zhangqilong <zhangqilong3@huawei.com>

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
We fix it:
1) Replacing it with pm_runtime_resume_and_get to keep usage counter
   balanced.
2) Add putting operation before returning error.

Fixes:9135408c3ace4 ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 375e7e647df6..a1517ef1f4a0 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -274,7 +274,7 @@ static int mtk_uart_apdma_alloc_chan_resources(struct dma_chan *chan)
 	unsigned int status;
 	int ret;
 
-	ret = pm_runtime_get_sync(mtkd->ddev.dev);
+	ret = pm_runtime_resume_and_get(mtkd->ddev.dev);
 	if (ret < 0) {
 		pm_runtime_put_noidle(chan->device->dev);
 		return ret;
@@ -288,18 +288,21 @@ static int mtk_uart_apdma_alloc_chan_resources(struct dma_chan *chan)
 	ret = readx_poll_timeout(readl, c->base + VFF_EN,
 			  status, !status, 10, 100);
 	if (ret)
-		return ret;
+		goto err_pm;
 
 	ret = request_irq(c->irq, mtk_uart_apdma_irq_handler,
 			  IRQF_TRIGGER_NONE, KBUILD_MODNAME, chan);
 	if (ret < 0) {
 		dev_err(chan->device->dev, "Can't request dma IRQ\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_pm;
 	}
 
 	if (mtkd->support_33bits)
 		mtk_uart_apdma_write(c, VFF_4G_SUPPORT, VFF_4G_SUPPORT_CLR_B);
 
+err_pm:
+	pm_runtime_put_noidle(mtkd->ddev.dev);
 	return ret;
 }
 
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
