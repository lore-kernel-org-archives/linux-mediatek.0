Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFBDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 13:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oH+QW4+Kw3eZGZlyIYcLHoIOUvOQiCIuRBoPoVp9dQM=; b=A5RL/X5eJLDLFYG/rRo6A+EJeW
	AifQEHTzeMRcQKjct4nys3Usg+hvtyyAYalVcMFT0uLd2eOewL+6llwonkpCkSeWUCFfwf6vv8YtA
	ddRX64cf83jgsC+HrapYsxvA7uhcphbExwpxh0veo05TTnAd0loSkOyNusVG1KTqV4WX4JXA9HwtB
	e5Lqkwv+NdfHlC+xsx2hwOzblR0E5KeAVuZGCu+Swn8aSH71DjGzaaTElW9EQxpIB6QjwgxKPeJ/f
	5hhA+9mE703quKKCPrgvcfxlDdHAQQdf3CiPBJPXWA8rGwplOwfBfEKitZq8ylFkeibBjwBRsZzwM
	EXonVHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9RnS-00GJfU-MB; Thu, 07 Jul 2022 13:43:58 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9RnD-00GJZC-P9; Thu, 07 Jul 2022 13:43:45 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LdyH55BXxzhZFF;
	Thu,  7 Jul 2022 21:41:05 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Jul 2022 21:43:33 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 7 Jul
 2022 21:43:32 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>
CC: <msp@baylibre.com>, <vkoul@kernel.org>, <chunkuang.hu@kernel.org>
Subject: [PATCH -next] phy: phy-mtk-dp: change mtk_dp_phy_driver to static
Date: Thu, 7 Jul 2022 21:53:09 +0800
Message-ID: <20220707135309.801181-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_064344_038752_0DC63124 
X-CRM114-Status: GOOD (  10.56  )
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

mtk_dp_phy_driver is only used in phy-mtk-dp.c now, change it to static.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 715bd2336c17..31266e7ca324 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -189,7 +189,7 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver mtk_dp_phy_driver = {
+static struct platform_driver mtk_dp_phy_driver = {
 	.probe = mtk_dp_phy_probe,
 	.driver = {
 		.name = "mediatek-dp-phy",
-- 
2.25.1


