Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2882C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 13:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hiNobQPTuZKo+e2Kh4HgzReIUSmHMuahrqXMESBMgIg=; b=T25IE/yAa7tVNbKvy29Rhga37x
	axqUbsf3Z2ayv9p141aP4rKiUf5FW+fxd1bq4UcIHHbxB8OzVK1YwmrT/KVXDHif+AXrZneQAy4ZG
	XmvMWpr48tBY3SWmMkIvSx4QA7r69fbxeg6Kkd55bFqIOrTcy8ktbxI55sLxt5hRiLU2blqZavfUy
	fEGKbrUrBrDigqEej0EUKE9of/Nz6Y+Vti14/6jkk3wUVZLLW4LwjqSexxQ0C0XVmxibzTkLqNE1U
	mwO0haLVmgZ2HiupHM+z7JiXzXpCYdiyIVkpllmKxRMkDCRNoejTLdQP6D9x7VqJ2lqnKKqKDRrsD
	OklJmX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6BG-00AuCx-OM; Tue, 13 Sep 2022 13:42:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6BC-00Au2L-3n
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 13:42:25 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRl0W0sFFzkWsH;
	Tue, 13 Sep 2022 21:38:19 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 21:42:15 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 13 Sep
 2022 21:42:15 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <msp@baylibre.com>,
	<dmitry.osipenko@collabora.com>
Subject: [PATCH -next] drm/mediatek: dp: change mtk_dp_driver to static
Date: Tue, 13 Sep 2022 21:49:29 +0800
Message-ID: <20220913134929.1970187-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_064222_399454_B73557BD 
X-CRM114-Status: UNSURE (   9.57  )
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

mtk_dp_driver is only used in mtk_dp.c now, change it
to static.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index dfa942ca62da..6a8c0f4c5c09 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2642,7 +2642,7 @@ static const struct of_device_id mtk_dp_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
 
-struct platform_driver mtk_dp_driver = {
+static struct platform_driver mtk_dp_driver = {
 	.probe = mtk_dp_probe,
 	.remove = mtk_dp_remove,
 	.driver = {
-- 
2.25.1


