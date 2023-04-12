Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455B2C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKrCLmlIffh71h58MgK0xR1wolinne9sXsC5EuDugW8=; b=Sil/5HOOOtGgnm8uLyPjLOgas8
	0MQDsq5AvopwQxoK2wLAdbOJK2K61sx/hRRfR3cjaZJm4/a9VpAUWWm03aUqP9uqnouhfkGUrhuNo
	eXVEm3iv1qtp7BNH/F9w1mn6WrjqEw70RWBLeGvPsVj87vUIyJBrJEWMKi8aRlZB1vIcnMktFrLAR
	2ePsYm+90h579cA084Vvvt2Ld7d0SxlY9M/jggDkOU8/9c4XK2KtN4Kw1sJ66By18Xm4G1I3sTOUn
	8EhlhOuCcDDOoCxdz7A1Hysi0PmYZ8MgInezm5ITXSQCHs8CVg0VRWAmD0M7FaqtOyUlVw0Sr2xI6
	kh+PelvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmUFn-0020ZA-1y;
	Wed, 12 Apr 2023 06:46:51 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmUFj-0020W3-0c;
	Wed, 12 Apr 2023 06:46:49 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0Vfv9Pbn_1681281998;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vfv9Pbn_1681281998)
          by smtp.aliyun-inc.com;
          Wed, 12 Apr 2023 14:46:38 +0800
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
Subject: [PATCH -next 2/3] drm/mediatek: Use devm_platform_ioremap_resource()
Date: Wed, 12 Apr 2023 14:46:34 +0800
Message-Id: <20230412064635.41315-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_234647_420159_7A5044DD 
X-CRM114-Status: UNSURE (   9.90  )
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
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 434e8a9ce8ab..391fa0ece22c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -104,7 +104,6 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_aal *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -117,8 +116,7 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		dev_err(dev, "failed to ioremap aal\n");
 		return PTR_ERR(priv->regs);
-- 
2.20.1.7.g153144c


