Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2C9EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 04:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6l8m5h9M7Dr8k4NdntXRrjBS5Qyk+YtWNxzvxS8oYGM=; b=EbZa2o/I/QxIVwGxDWx3tD42t2
	CTmwnRN0gi0h7bcFsVDcEXOzs6odwVgEh1PIROIlgESxgyjgqi8WUsFc+yu2aehemcaCuUESwX6TS
	PHLPOLakv83jMCgtcMh5awxI6Rat+7nyqdnQs7IhHYP+6RbqpFVD63qGncT+qH8FOokhamplQTdzb
	NSxfyIb4jM16bFMhVRvIdBk+OvpwtPEL1040xTU0Y25jIlEsmFOel/bAs3IKkcEw1c+8THgJRtpae
	tX8CCswwCX02NQK2XrLUvytmR36mVxqn3b4O88doflnn9keXIE3CpxlSPAvqYHrYIcSfru66lnCZR
	vQq7KOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPZv-006ash-39;
	Thu, 03 Aug 2023 04:04:47 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRPZp-006apk-2u;
	Thu, 03 Aug 2023 04:04:43 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RGZvq0m7nz1GDS1;
	Thu,  3 Aug 2023 12:03:35 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 12:04:37 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <robh@kernel.org>,
	<tomeu.vizoso@collabora.com>, <steven.price@arm.com>,
	<alyssa.rosenzweig@collabora.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 2/2] drm/mediatek: Do not check for 0 return after calling platform_get_irq()
Date: Thu, 3 Aug 2023 12:04:00 +0800
Message-ID: <20230803040401.3067484-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803040401.3067484-1-ruanjinjie@huawei.com>
References: <20230803040401.3067484-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_210442_108647_8C06F4F9 
X-CRM114-Status: GOOD (  11.45  )
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

It is not possible for platform_get_irq() to return 0. Use the
return value from platform_get_irq().

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 28bdb1f427ff..641a43ae4e6f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -1073,8 +1073,8 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	}
 
 	dpi->irq = platform_get_irq(pdev, 0);
-	if (dpi->irq <= 0)
-		return -EINVAL;
+	if (dpi->irq < 0)
+		return dpi->irq;
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
 					  NULL, &dpi->next_bridge);
-- 
2.34.1


