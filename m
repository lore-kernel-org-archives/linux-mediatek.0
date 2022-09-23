Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0515DECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fg/Wbe8DkTKYrtba3+PWJJNwkVo0IG5j8DRorVyuiUA=; b=EyogbVeAofcMCW9oWUbdQd98uu
	uQ8Fmue6wCnxu0/wTzJJZaI+w6yQzMSoOkvDN4Q9A0X/t1a99Dpq6OKjSYXCCx7N2MRk3ESo6OD86
	1VNn+zod89tHwx7MO3r0WDrY4x2EfoIqNEJUqTlS0iZE+JiHRO5WzPxd6ESWhrRe7GH3TZvqdT3rU
	OMFt/Kghtt7CNtGivFaj5A5P9+PPMUlQb/4ZqonzCh3n0NH9uHREZKxCzicVP0V0XMymtE1qRpwkj
	DfNFYQ8t4opoyEGGgV0rEAsTvpFI3srepIm0r/1R9sXReG4N0ocHDbu5ERCtsw74ce62lH5UWGYyE
	T0oRHaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf0f-003LDD-HH; Fri, 23 Sep 2022 09:30:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf0G-003KzD-Cq; Fri, 23 Sep 2022 09:29:50 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYmwQ3KbRzWh0m;
	Fri, 23 Sep 2022 17:25:42 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 17:29:40 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 17:29:39 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <shangxiaojing@huawei.com>
Subject: [PATCH -next] drm/mediatek: Remove redundant dev_err call
Date: Fri, 23 Sep 2022 18:03:55 +0800
Message-ID: <20220923100355.16837-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_022948_643704_79C32B4D 
X-CRM114-Status: UNSURE (   8.06  )
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

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c   | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 0f9d7efb61d7..e72d5d8d77d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -118,10 +118,8 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap aal\n");
+	if (IS_ERR(priv->regs))
 		return PTR_ERR(priv->regs);
-	}
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 6428b6203ffe..e096b6fb440c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -252,10 +252,8 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap merge\n");
+	if (IS_ERR(priv->regs))
 		return PTR_ERR(priv->regs);
-	}
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk)) {
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index eecfa98ff52e..d6be2b415f5a 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -263,10 +263,8 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap rdma\n");
+	if (IS_ERR(priv->regs))
 		return PTR_ERR(priv->regs);
-	}
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk)) {
-- 
2.17.1


