Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A74DC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3al3sqlznh2eyWipR2wqsyF2Wav4bnBn9BF8ukPD/Nk=; b=OCPNa/w3Ny3KdCzOSSz5u0IPDN
	N6jeLjsCw+U1sYNQ6FzNNNW0s9Q678PXn7GR5/r0K1G3/+1o/69rz7eDmCvQnCdQTeQZEfyUQa0RK
	aVPu6bYlvrKjM6TWxSDmlLxbHKyEO9Whj3NeBYGFqZ9QT5Y45fImm87CmI5JRwMyoTRsAjNkbDw1x
	LNScKaBHBawlmaXOvoD34aKmfXvlSDhJ6LhqXYkVWWr8JU+P3rB141KkGB9QBcZla4adc0XTrtpfD
	+AZvoT6+Ti6Q5TMf+ItftNBQ23erJ1EKPmu2ZptM4+W/Ky3ba8XkRJ26BXdvPJ8FhJBEFPA7VORrd
	+oUpl+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYVw-00GlBi-Fa; Wed, 28 Sep 2022 14:58:20 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYVk-00Gl8R-FA; Wed, 28 Sep 2022 14:58:10 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mczyp1zD9zQnQ0;
	Wed, 28 Sep 2022 22:53:54 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 22:58:00 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <liwei391@huawei.com>,
	<zengheng4@huawei.com>
Subject: [PATCH -next] soc: mediatek: mtk-svs: add missing MODULE_DEVICE_TABLE
Date: Wed, 28 Sep 2022 23:13:46 +0800
Message-ID: <20220928151346.1942977-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_075808_732762_DAB0AF06 
X-CRM114-Status: UNSURE (   8.11  )
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

This patch adds missing MODULE_DEVICE_TABLE definition
which generates correct modalias for automatic loading
of this driver when it is built as an external module.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/soc/mediatek/mtk-svs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0469c9dfeb04..b5c38816b553 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2326,6 +2326,7 @@ static const struct of_device_id svs_of_match[] = {
 		/* Sentinel */
 	},
 };
+MODULE_DEVICE_TABLE(of, svs_of_match);
 
 static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 {
-- 
2.25.1


