Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703EFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 11:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JJrWX5TdVWuYj2INlgAOvHoKb3zfnhF0aBBc2AMEsJw=; b=Kkv7Z4gA8xKL/YXvJLSS620LdX
	TlQKMad9isvwdTK/KYgxx5IRwYip2Sv55XrmNMA0ROouEd/UMcCqKu6Et1UNGzSdUKnF2H1OhWD3v
	NRDwjcAvfIVTdchPhgMql8LvZ5Yp4FBhjhQgfUXHNmn6qFGauEosq9MFC/ZgEdUacgJp3U13tsFl3
	TLt2i2Kw1QVO7Hmb5LYlT8WBuhRlItLQk9/b+hqWxeFEF12NzjySbLMlcHpVJylUUsKsVRFC+wf5S
	Q7+5dwHdg76ZM05ofYpOBWPRdtrpgepmUFc8QeXHUWK0dLHxVKQ8kqqjS2A2QVMdv5200Q7/GLhlr
	iTx+fdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcob-00D0So-9B; Thu, 17 Nov 2022 11:12:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcjt-00CwLR-HF; Thu, 17 Nov 2022 11:07:27 +0000
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NCcYq18G5zRpKK;
	Thu, 17 Nov 2022 19:06:55 +0800 (CST)
Received: from huawei.com (10.175.101.6) by canpemm500010.china.huawei.com
 (7.192.105.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 17 Nov
 2022 19:07:15 +0800
From: Liu Jian <liujian56@huawei.com>
To: <nbd@nbd.name>, <john@phrozen.org>, <sean.wang@mediatek.com>,
	<Mark-MC.Lee@mediatek.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <matthias.bgg@gmail.com>,
	<linux@armlinux.org.uk>, <opensource@vdorst.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Liu Jian <liujian56@huawei.com>
Subject: [PATCH net] net: ethernet: mtk_eth_soc: fix error handling in mtk_open()
Date: Thu, 17 Nov 2022 19:13:56 +0800
Message-ID: <20221117111356.161547-1-liujian56@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_030725_827254_83AD3ECF 
X-CRM114-Status: UNSURE (   9.89  )
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

If mtk_start_dma() fails, invoke phylink_disconnect_phy() to perform
cleanup. phylink_disconnect_phy() contains the put_device action. If
phylink_disconnect_phy is not performed, the Kref of netdev will leak.

Fixes: b8fc9f30821e ("net: ethernet: mediatek: Add basic PHYLINK support")
Signed-off-by: Liu Jian <liujian56@huawei.com>
---
 Compile tested only.
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 7cd381530aa4..1d1f2342e3ec 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2996,8 +2996,10 @@ static int mtk_open(struct net_device *dev)
 		int i;
 
 		err = mtk_start_dma(eth);
-		if (err)
+		if (err) {
+			phylink_disconnect_phy(mac->phylink);
 			return err;
+		}
 
 		for (i = 0; i < ARRAY_SIZE(eth->ppe); i++)
 			mtk_ppe_start(eth->ppe[i]);
-- 
2.17.1


