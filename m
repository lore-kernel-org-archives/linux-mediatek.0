Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0148C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 06:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3luzA3XwiYkWB5fJqDhFh8NGT45ZboOxe393Dof2dmQ=; b=Y+fLsKDqU6FogXi0xkifAx8hA8
	coLe4roaXguWf2et6abtdKZZWJy4CJj58iZCgIWMePXDqFacVU+GuL0G/zZi6V8Zxpym2a6SvAkOv
	hf/+W9aLpsQOYdrrPPxi2rn93M/sv5yLCoMrfgWlzkWTsJYvpG6h3eSRlL7XvNfaHSNk52C7AY0vd
	bPtWx8gLqsjPU16RNIybCVs9imtDUFKdw9h6NPScFvmg5YkwDmQ8sKo50H8XUhqug7i/G8qDa6/lh
	MKDqnzK1UfHJm2pQSAK0df+EMjunjivkcsc08/SHGg+kMmTf4jlmESVx/ZxRrVKpV92xPHXKz52ek
	Y6Zs+1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmUFu-0020dB-09;
	Wed, 12 Apr 2023 06:46:58 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmUFj-0020W2-2C;
	Wed, 12 Apr 2023 06:46:50 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R821e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0Vfv7ahI_1681281995;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vfv7ahI_1681281995)
          by smtp.aliyun-inc.com;
          Wed, 12 Apr 2023 14:46:36 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next 1/3] drm/mediatek: Use devm_platform_ioremap_resource()
Date: Wed, 12 Apr 2023 14:46:33 +0800
Message-Id: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_234647_918948_691F80CB 
X-CRM114-Status: UNSURE (   9.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove variable 'res' and convert platform_get_resource(),
devm_ioremap_resource() to a single call to
devm_platform_ioremap_resource(), as this is exactly what this function
does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index b640bc0559e7..03aae9f95606 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -185,7 +185,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_cec *cec;
-	struct resource *res;
 	int ret;
 
 	cec = devm_kzalloc(dev, sizeof(*cec), GFP_KERNEL);
@@ -195,8 +194,7 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cec);
 	spin_lock_init(&cec->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cec->regs = devm_ioremap_resource(dev, res);
+	cec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cec->regs)) {
 		ret = PTR_ERR(cec->regs);
 		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
-- 
2.20.1.7.g153144c


