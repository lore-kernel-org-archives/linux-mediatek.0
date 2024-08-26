Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D43C5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNpcBaoxg11kBlTn8I1dFO15BXiAF3jq3JlJno7u0a4=; b=q6UZzCbIrjnZXGVKAmUcpC43Cr
	dlGxvvPyZol/c4JZ/5MfFaSg6j0mYT+Jx2prLCIY7EAEZEklG+Kruiwn/IoMDptN3Uk20oI84w2DB
	sxmkfTTKHVN+yUGQ8cSxtVr0idp6liaeXEH4QKjry6oUOoji4ysNQC5RP6SnM9e4Fjgb83aHGhvqZ
	h8EofZ/KvuB9mYlgdpzIrVcRBODPgki3UkrKpuY5pznDKvbREd7wicqks3yNjQ/XT/K9OttWiBpFl
	LXmqhW6v4EUEma1tSldn3NNKtCiO8H3scQCWySX8QKewcpJ3fw0LCj1iZIXvIaXZS7JnaoJKMo4Qs
	z+5i2k4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siW3W-00000006fh8-3D5B;
	Mon, 26 Aug 2024 09:30:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siW0Q-00000006eMz-1UsD;
	Mon, 26 Aug 2024 09:27:26 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wslfm30g6zpVsj;
	Mon, 26 Aug 2024 17:26:24 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FB8814037E;
	Mon, 26 Aug 2024 17:27:10 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 17:27:09 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <chris.snook@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <lorenzo@kernel.org>, <nbd@nbd.name>,
	<sean.wang@mediatek.com>, <Mark-MC.Lee@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<liaochen4@huawei.com>
Subject: [PATCH -next 3/3] net: airoha: fix module autoloading
Date: Mon, 26 Aug 2024 09:18:58 +0000
Message-ID: <20240826091858.369910-4-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826091858.369910-1-liaochen4@huawei.com>
References: <20240826091858.369910-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500020.china.huawei.com (7.185.36.49)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_022722_706239_4DD3F74F 
X-CRM114-Status: UNSURE (   9.49  )
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

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 1c5b85a86df1..a80c1fae5c2d 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -2715,6 +2715,7 @@ static const struct of_device_id of_airoha_match[] = {
 	{ .compatible = "airoha,en7581-eth" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_airoha_match);
 
 static struct platform_driver airoha_driver = {
 	.probe = airoha_probe,
-- 
2.34.1


