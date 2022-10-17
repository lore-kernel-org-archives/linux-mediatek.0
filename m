Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD657C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 03:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASVbxEOuDAkCPzsTfH0JPCQ5KKwfr1aC/CvXaTNf6eo=; b=kgcT2ggJab551FDvLG2lN4AppE
	D1Z8yffpGY5Nuj7PaX600lHg746YRAkhRUc4brrRSYJDJQ5bbNOuIMoi5Rr3Jh48IiFlnrIjvNkLl
	8ZcqnX8MzPBW7HuULS/g9Pem6NShOh+DpxXEoBSWreoqzz1p15XsziYLQ41zpwpacPkG7eo8/jTbn
	mBObAwTK5PD8mX4B20fu1Vi6m3cNsq27AjSGE0MryKZGzTofe/eNrF5PuvC5GcLHfRBAvIlWro2YZ
	qQjSOZEJMKDzdLMDXI8OKF5k+v9ZcZfZyrjbEB0TEZciqObkHIJ4gYOsOWacRYxrvtoA/UE3JD4sd
	z9VFCcRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okHBT-006fnj-JA; Mon, 17 Oct 2022 03:52:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okHBP-006fec-Sh
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 03:52:57 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MrNP26TWKzHw4b;
	Mon, 17 Oct 2022 11:52:38 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 11:52:37 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 11:52:37 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-mediatek@lists.infradead.org>, <netdev@vger.kernel.org>
CC: <nbd@nbd.name>, <davem@davemloft.net>
Subject: [PATCH net 1/3] net: ethernet: mtk_eth_soc: fix possible memory leak in mtk_probe()
Date: Mon, 17 Oct 2022 11:51:54 +0800
Message-ID: <20221017035156.2497448-2-yangyingliang@huawei.com>
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
X-CRM114-CacheID: sfid-20221016_205256_540310_770A41C3 
X-CRM114-Status: GOOD (  11.31  )
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

If mtk_wed_add_hw() has been called, mtk_wed_exit() needs be called
in error path or removing module to free the memory allocated in
mtk_wed_add_hw().

Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 4fba7cb0144b..7cd381530aa4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4060,19 +4060,23 @@ static int mtk_probe(struct platform_device *pdev)
 			eth->irq[i] = platform_get_irq(pdev, i);
 		if (eth->irq[i] < 0) {
 			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
-			return -ENXIO;
+			err = -ENXIO;
+			goto err_wed_exit;
 		}
 	}
 	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
 		eth->clks[i] = devm_clk_get(eth->dev,
 					    mtk_clks_source_name[i]);
 		if (IS_ERR(eth->clks[i])) {
-			if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER)
-				return -EPROBE_DEFER;
+			if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER) {
+				err = -EPROBE_DEFER;
+				goto err_wed_exit;
+			}
 			if (eth->soc->required_clks & BIT(i)) {
 				dev_err(&pdev->dev, "clock %s not found\n",
 					mtk_clks_source_name[i]);
-				return -EINVAL;
+				err = -EINVAL;
+				goto err_wed_exit;
 			}
 			eth->clks[i] = NULL;
 		}
@@ -4083,7 +4087,7 @@ static int mtk_probe(struct platform_device *pdev)
 
 	err = mtk_hw_init(eth);
 	if (err)
-		return err;
+		goto err_wed_exit;
 
 	eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
 
@@ -4179,6 +4183,8 @@ static int mtk_probe(struct platform_device *pdev)
 	mtk_free_dev(eth);
 err_deinit_hw:
 	mtk_hw_deinit(eth);
+err_wed_exit:
+	mtk_wed_exit();
 
 	return err;
 }
@@ -4198,6 +4204,7 @@ static int mtk_remove(struct platform_device *pdev)
 		phylink_disconnect_phy(mac->phylink);
 	}
 
+	mtk_wed_exit();
 	mtk_hw_deinit(eth);
 
 	netif_napi_del(&eth->tx_napi);
-- 
2.25.1


