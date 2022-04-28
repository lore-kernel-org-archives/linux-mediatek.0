Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F84C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Hgf417LPkdNWt9b5vjySHjEdrUqFx1614WJYl2aV2A=; b=bJLhRCUYHqqOT7
	zFZ5GVZru87TqILY4GNXY/36dqqDAGvMg9WMhQXPywfM6XLG1Z0vuv3UN3ZZIX0Furlm98zryzhGE
	jA220/KDd1cmx1S6PTpLlEgfSZEE3lGFDe8C7DFV2Z/W5f00Barmf4gLf2z8iU4KKZAgGYRM75j0f
	kq/AKqm7sIJ3jOY9YH5wOphqs4txTsknGNb5MGgiSTaryg1oB9s85jm8UcJUPCWGkYi3n7kr9TcRw
	liw7a0U7pRwZZU1uHoqo1+8qc1gBTR/Tv8Pf50IwBrc56FEzCKybVzatAROOncUlcI7DhLNtOvD8Z
	BneFmNLT5NNMflqb8j6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0eU-005naV-Ac; Thu, 28 Apr 2022 09:41:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0eQ-005nZ5-Rb
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 09:41:32 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KprFs3DYLzfb8W;
 Thu, 28 Apr 2022 17:40:33 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 28 Apr 2022 17:41:28 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 17:41:28 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
CC: <dan.carpenter@oracle.com>, <andrew@lunn.ch>, <davem@davemloft.net>,
 <kuba@kernel.org>
Subject: [PATCH] net: dsa: mt7530: add missing of_node_put() in mt7530_setup()
Date: Thu, 28 Apr 2022 17:53:17 +0800
Message-ID: <20220428095317.538829-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_024131_106008_D83C98F7 
X-CRM114-Status: UNSURE (   5.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add of_node_put() if of_get_phy_mode() fails in mt7530_setup()

Fixes: 0c65b2b90d13 ("net: of_get_phy_mode: Change API to solve int/unit warnings")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/dsa/mt7530.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 19f0035d4410..fe3cb26f4287 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2229,6 +2229,7 @@ mt7530_setup(struct dsa_switch *ds)
 				ret = of_get_phy_mode(mac_np, &interface);
 				if (ret && ret != -ENODEV) {
 					of_node_put(mac_np);
+					of_node_put(phy_node);
 					return ret;
 				}
 				id = of_mdio_parse_addr(ds->dev, phy_node);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
