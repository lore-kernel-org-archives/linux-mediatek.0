Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B62C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 01:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RdqEOXLN1wdc1llkU3ljCh2GalL/TJg4Xksy3ttqH1Q=; b=b5DL34hty99NRdydp5+XA/LwLH
	kd8qLLot/KTjGPXU50yY/o861tVYuYlpT2mlvziz9rszIu6ssj/vNXxyoHCbKGpkgq84QcclBD1Em
	I5iTbjZddyA0KqItGd23/qojBVsxJULttwR26xQ6Cl28jYtwAGJ9KKrX5x1nZvWi6lDVMF6SD+Hsd
	3UHfo85zXf8m7xJMFnV4R5A+C51n5pOBnFPS1eNc8Xqk0z1Soh/mEl+LFfKP3GsI661vNHSxCFTJR
	7pbLf4Pcibk5Vd7x6bUhlKBrLIV80MU7pogUMFR26KmaHFFCChVAJgptjW1aTZulSm3dCURAeve+a
	ofwcWgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orqjU-00Ao9b-1E; Mon, 07 Nov 2022 01:15:24 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orqjJ-00Ao7X-1d; Mon, 07 Nov 2022 01:15:15 +0000
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N5Cty04x1zHvZS;
	Mon,  7 Nov 2022 09:14:34 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpeml500026.china.huawei.com
 (7.185.36.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 7 Nov
 2022 09:14:56 +0800
From: Zhengchao Shao <shaozhengchao@huawei.com>
To: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <nbd@nbd.name>, <john@phrozen.org>,
	<sean.wang@mediatek.com>, <Mark-MC.Lee@mediatek.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<matthias.bgg@gmail.com>
CC: <bgolaszewski@baylibre.com>, <weiyongjun1@huawei.com>,
	<yuehaibing@huawei.com>, <shaozhengchao@huawei.com>
Subject: [PATCH net] net: ethernet: mtk-star-emac: disable napi when connect and start PHY failed in mtk_star_enable()
Date: Mon, 7 Nov 2022 09:21:59 +0800
Message-ID: <20221107012159.211387-1-shaozhengchao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500026.china.huawei.com (7.185.36.106)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_171513_298392_FE7AE66E 
X-CRM114-Status: UNSURE (   6.49  )
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

When failed to connect to and start PHY in mtk_star_enable() for opening
device, napi isn't disabled. When open mtk star device next time, it will
reports a invalid opcode issue. Fix it. Only be compiled, not be tested.

Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
Signed-off-by: Zhengchao Shao <shaozhengchao@huawei.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 7e890f81148e..7050351250b7 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1026,6 +1026,8 @@ static int mtk_star_enable(struct net_device *ndev)
 	return 0;
 
 err_free_irq:
+	napi_disable(&priv->rx_napi);
+	napi_disable(&priv->tx_napi);
 	free_irq(ndev->irq, ndev);
 err_free_skbs:
 	mtk_star_free_rx_skbs(priv);
-- 
2.17.1


