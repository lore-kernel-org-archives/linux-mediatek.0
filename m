Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E2CC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:54:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF00613E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF00613E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4UJXM1zpE4UwNhUI76xR8SDkNPrCquykOSYGBHaBlNI=; b=BcidVKJXZ5KZu46yT72JC169r
	sDk1mS+/nbnPNSEp4L4SarmymDx9/hFHHuaadfBZVCorsjAxVuhTVMweSpEupFxh0i/8W4KmPaOXc
	bribTUeXITg67zb6x02wVjSV2qsZgn6ymrL3QNIE/jZOCXC4gWTZNaiseRR8SlkOiEuBURxeSvrxF
	1zemYVDf3CfKRcSTc13LaQJJukZH8AOnpbiIxHa0N+z2b0XFJvi9AXdG1MIL2XkbJvRGu0dcvWejM
	d/fGS58GwDyWSUyZPZ5VSMPCl36MdInBB7fTKOU6CnNWgj8eO+XiCJZzkJtTykSSwFNX0DfY4Rva1
	gyyci5W8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSpp-000IJd-MU; Tue, 11 May 2021 13:54:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSgg-000F4S-5i; Tue, 11 May 2021 13:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=3JIi/2miSYNLgxuJUwy+CLX+dZmCxSzbpXaoYH7kPrk=; b=fxiodrvHUpVNRXQk8P7rrwlPe7
 wUy+Gj/9ByP6igXTccQVtfYNC2iGHjgYcaHN6JdlIkFq5wut5iwUWHPMubd7W4j2Vu8JhY/DTQ+AU
 R286pEDuzSwzLoHiWXQtNySFsazeBGp/ntzJaIqWoXeYjD9z6pDleGBVuqE/8PGeoxRoQAqFd6UNd
 Xr4FbDw9z9b/40PuCPC+efiZfvXg7olpFBWR2L3iqBK4InJwLEsWFL6cl3uIk/cplM88AQ9QLkH3T
 8pT+QCz09HKe6A7xcR6aeBRywSYg5zScGRqvt7hnoBUVMjXXuAyuDKlShd1NpI4fNQdl6Mthknqpi
 p5n53Ueg==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSgc-009dQW-M1; Tue, 11 May 2021 13:44:36 +0000
Received: from dggeml707-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FffGl3nZZz61NK;
 Tue, 11 May 2021 21:41:51 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeml707-chm.china.huawei.com (10.3.17.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 21:44:30 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 21:44:30 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Baruch Siach
 <baruch@tkos.co.il>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 1/1] drm/mediatek: Remove redundant error printing
Date: Tue, 11 May 2021 21:43:37 +0800
Message-ID: <20210511134338.6167-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210511134338.6167-1-thunder.leizhen@huawei.com>
References: <20210511134338.6167-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_064435_084878_C5BA7882 
X-CRM114-Status: GOOD (  11.86  )
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
 drivers/gpu/drm/mediatek/mtk_cec.c        | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 4 +---
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 7 ++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 1 -
 6 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index e9cef5c0c8f7eff..c47b54936cfa6b8 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -195,11 +195,8 @@ static int mtk_cec_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	cec->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(cec->regs)) {
-		ret = PTR_ERR(cec->regs);
-		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(cec->regs))
+		return PTR_ERR(cec->regs);
 
 	cec->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(cec->clk)) {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 141cb36b9c07b74..2b9923e5c6382f7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -173,10 +173,8 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap ccorr\n");
+	if (IS_ERR(priv->regs))
 		return PTR_ERR(priv->regs);
-	}
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 961f87f8d4d156f..48927135c247537 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -395,10 +395,8 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap ovl\n");
+	if (IS_ERR(priv->regs))
 		return PTR_ERR(priv->regs);
-	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 728aaadfea8cfcc..e8d31b4c12b7727 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -294,10 +294,8 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->regs)) {
-		dev_err(dev, "failed to ioremap rdma\n");
+	if (IS_ERR(priv->regs))
 		return PTR_ERR(priv->regs);
-	}
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bea91c81626e154..f8020bc046cb63f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -741,11 +741,8 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	}
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dpi->regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(dpi->regs)) {
-		ret = PTR_ERR(dpi->regs);
-		dev_err(dev, "Failed to ioremap mem resource: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dpi->regs))
+		return PTR_ERR(dpi->regs);
 
 	dpi->engine_clk = devm_clk_get(dev, "engine");
 	if (IS_ERR(dpi->engine_clk)) {
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd922d..89e351dfab88177 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1062,7 +1062,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->regs = devm_ioremap_resource(dev, regs);
 	if (IS_ERR(dsi->regs)) {
 		ret = PTR_ERR(dsi->regs);
-		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
 		goto err_unregister_host;
 	}
 
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
