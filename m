Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE92DCA0FE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 06:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OyW+xNsyoUb5v+cyVMUmdpEwm3pKImFFyqTb09DNbWw=; b=zhws67h8CxzGTK4D/qlFyrKUWo
	wLPcTW48PJ9qYWmhFw/DBREFbApOd1V70/nEwVHV3u2YlJjJqFuvhIZ1+4f8z1n5xH4kA5idFNOta
	A5MIV6zBuxUIIrpZ6lRUV5oeGr83tPWh4MoaPBZGB1mXoizpNaotCRdOazTQd734AGRwipwRpFqRl
	c/4aOa7rW2KtSSI/F1msb+mMcUQER7mtH9OWfYO/dekUfiFuqSuqLRdqPyu17bpa2tgdrY9YUtYW1
	25BD6AzLH7KXurnU3Lf8MaqpE1YOVLq6YwxkRMwY3HsEXD37NWBbuhFOWLYT97O+lvAeqtSNvoUSW
	/Uz0vB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qby71-00GZZi-22;
	Fri, 01 Sep 2023 06:58:35 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qby6y-00GZY6-0Z;
	Fri, 01 Sep 2023 06:58:34 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RcTMF6QnfzVkMs;
	Fri,  1 Sep 2023 14:55:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 1 Sep
 2023 14:58:22 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] drm/mediatek: dp: Remove redundant dev_err_probe() for platform_get_irq()
Date: Fri, 1 Sep 2023 14:58:18 +0800
Message-ID: <20230901065818.1305812-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_235832_405491_BBBC2900 
X-CRM114-Status: GOOD (  11.60  )
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

Since commit 7723f4c5ecdb ("driver core: platform: Add an error message
to platform_get_irq*()") and commit 2043727c2882 ("driver core:
platform: Make use of the helper function dev_err_probe()"), there is
no need to call the dev_err_probe() function directly to print a custom
message when handling an error from platform_get_irq() function as it is
going to display an appropriate error message in case of a failure.

Fixes: 828c91231fbe ("drm/mediatek: dp: Don't register HPD interrupt handler for eDP case")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2cb47f663756..5bebd8bdd188 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2597,8 +2597,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	if (mtk_dp->data->bridge_type != DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp->irq = platform_get_irq(pdev, 0);
 		if (mtk_dp->irq < 0)
-			return dev_err_probe(dev, mtk_dp->irq,
-					     "failed to request dp irq resource\n");
+			return mtk_dp->irq;
 
 		spin_lock_init(&mtk_dp->irq_thread_lock);
 
-- 
2.34.1


