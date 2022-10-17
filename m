Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29617C43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKWi0aVHmaIJU7qmNxOcGIWFG/3BLrOrFS/Lsn7vGSw=; b=m71cjNlCWRJ2ohoyih6uD5Dfzc
	FI6zMutUD5LAL08COjtbu0VSxBJ9mmdoXxCLRhoS6ccqEgQYfQYbuxSsUA4SwgQj8AZTgm8GZAs0B
	uRQpxOv4gJpPkfwCfLf9jaigdo9RqLadEKawIPC+BtHgnml0/m5IfnxuLY/3/K7WtxyBuLjm4u6QL
	FcUx0EfdNYqLqNkuzIa9zP0tDzsNMvU+STJSVrblxsuJj8nVirTmQFANeBnWpZEl1VubkS3gLYQSq
	DoU4UGWRYRnlAtcrALw+/qSSRsaNnKu/E3J44C1+i+er7ixgFjgC2WG05l03/6OFWPC10jrXjKwna
	QMQHEVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okHBT-006fnX-08; Mon, 17 Oct 2022 03:52:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okHBP-006fed-KT
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 03:52:57 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MrNP24sXLzHvxv;
	Mon, 17 Oct 2022 11:52:38 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 11:52:38 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 11:52:37 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <nbd@nbd.name>, <davem@davemloft.net>
Subject: [PATCH net 2/3] net: ethernet: mtk_eth_wed: add missing put_device() in mtk_wed_add_hw()
Date: Mon, 17 Oct 2022 11:51:55 +0800
Message-ID: <20221017035156.2497448-3-yangyingliang@huawei.com>
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
X-CRM114-CacheID: sfid-20221016_205255_867233_6AF49B83 
X-CRM114-Status: UNSURE (   7.52  )
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

After calling get_device() in mtk_wed_add_hw(), in error path, put_device()
needs be called.

Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 099b6e0df619..09bbd05bd83c 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -1077,11 +1077,11 @@ void mtk_wed_add_hw(struct device_node *np, struct mtk_eth *eth,
 	get_device(&pdev->dev);
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return;
+		goto err_put_device;
 
 	regs = syscon_regmap_lookup_by_phandle(np, NULL);
 	if (IS_ERR(regs))
-		return;
+		goto err_put_device;
 
 	rcu_assign_pointer(mtk_soc_wed_ops, &wed_ops);
 
@@ -1124,8 +1124,14 @@ void mtk_wed_add_hw(struct device_node *np, struct mtk_eth *eth,
 
 	hw_list[index] = hw;
 
+	mutex_unlock(&hw_lock);
+
+	return;
+
 unlock:
 	mutex_unlock(&hw_lock);
+err_put_device:
+	put_device(&pdev->dev);
 }
 
 void mtk_wed_exit(void)
-- 
2.25.1


