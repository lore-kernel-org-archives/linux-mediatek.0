Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990C4C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd+caGpA1+JnK/xM8/qW2ss2JaXBB6utGYvREHIO+Z8=; b=s3vwd38bFmutQj/AzGHf+c+7E+
	2cRswfJUAXGGzZ/AXR8afoeqiM1E1IE41HcT0HYTbqjXa2LpFPoZYXJL7tdTh+/zJA/ujvqfwmGfv
	+Oo22VVUE8wPHlB47u1lAj+UctVjqUFcpbt1Ui/9ZxqI3KHBZEoNCuVUOy0ABUIlhycgQREG3ctI0
	5ZKGa1/kYNQWeSvcERVl29rFlsJt5LXqdHqDPlVhOtpNh9v0SSHYQaNDyoTCUHf9yq7bJFXVt3H7C
	0qfdLIkwBeTBpGUXaQ66htiAqN6KikHfHKrG/RXthBtIiLEEUsXAVc/RRtJTXBhOgFvijUQqyVFWH
	cmttLnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okHBW-006fre-Tc; Mon, 17 Oct 2022 03:53:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okHBR-006fee-To
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 03:52:59 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MrNP269VfzHvy4;
	Mon, 17 Oct 2022 11:52:38 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 11:52:38 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 11:52:38 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <nbd@nbd.name>, <davem@davemloft.net>
Subject: [PATCH net 3/3] net: ethernet: mtk_eth_wed: add missing of_node_put()
Date: Mon, 17 Oct 2022 11:51:56 +0800
Message-ID: <20221017035156.2497448-4-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221017035156.2497448-1-yangyingliang@huawei.com>
References: <20221017035156.2497448-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_205258_169053_11490DF6 
X-CRM114-Status: UNSURE (   8.48  )
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

The device_node pointer returned by of_parse_phandle() with refcount
incremented, when finish using it, the refcount need be decreased.

Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 09bbd05bd83c..65e01bf4b4d2 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1072,7 +1072,7 @@ void mtk_wed_add_hw(struct device_node *np, struct mtk_eth *eth,
 
 	pdev = of_find_device_by_node(np);
 	if (!pdev)
-		return;
+		goto err_of_node_put;
 
 	get_device(&pdev->dev);
 	irq = platform_get_irq(pdev, 0);
@@ -1132,6 +1132,8 @@ void mtk_wed_add_hw(struct device_node *np, struct mtk_eth *eth,
 	mutex_unlock(&hw_lock);
 err_put_device:
 	put_device(&pdev->dev);
+err_of_node_put:
+	of_node_put(np);
 }
 
 void mtk_wed_exit(void)
@@ -1152,6 +1154,7 @@ void mtk_wed_exit(void)
 		hw_list[i] = NULL;
 		debugfs_remove(hw->debugfs_dir);
 		put_device(hw->dev);
+		of_node_put(hw->node);
 		kfree(hw);
 	}
 }
-- 
2.25.1


