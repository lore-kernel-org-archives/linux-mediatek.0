Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA17C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uCEcvtGfDAHikDxX4XmNs+vICamnsVnseFFH5dY/r2k=; b=R0mzRVHMH91QH0uE368AIidWA0
	XjHpgqVW/f6d7E2kX7aKvl0vE6YkdK28MSnrpw5ojkRrjCD5jMnGxKbhhVMRAdOvdrx7U/nQOxEC3
	stP8OJhnNzZ+CUshLJyf2hIeVmy4PMngqbTGPI9hMueQELze+xn0EbwoCaLJZFeiI1yZT+KQJ9chC
	/mYYNufazX/tu6Wk1yPHookoeGVK1mvIKYjryFile2xcSXzoj1LMLoVUB3Iw1F++phgrAs7KfuN72
	3Defv/TxR6dAZmRM2Us1MOoz9Lb1gbLwsDaiJ1/8LbV85GrAxVIYL1UTx8qOVRfQW1FPhemB8VAyi
	Fr0fV7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob1YX-00Bkxu-0J; Wed, 21 Sep 2022 15:22:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob1YU-00Bkv9-8B
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 15:22:32 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MXhqN6ytpzMn81;
	Wed, 21 Sep 2022 23:17:36 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 23:22:18 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 23:22:18 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-pm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC: <sre@kernel.org>, <chiaen_wu@richtek.com>
Subject: [PATCH -next] power: supply: mt6370: Fix return value check in mt6370_chg_probe()
Date: Wed, 21 Sep 2022 23:29:15 +0800
Message-ID: <20220921152915.1506767-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_082230_511222_9EE1412F 
X-CRM114-Status: UNSURE (   9.43  )
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

If create_singlethread_workqueue() fails, it returns a null pointer,
replace IS_ERR() check with NULL pointer check.

Fixes: 233cb8a47d65 ("power: supply: mt6370: Add MediaTek MT6370 charger driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/power/supply/mt6370-charger.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index 716cba259a7a..f27dae5043f5 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -911,8 +911,8 @@ static int mt6370_chg_probe(struct platform_device *pdev)
 	priv->attach = MT6370_ATTACH_STAT_DETACH;
 
 	priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
-	if (IS_ERR(priv->wq))
-		return dev_err_probe(dev, PTR_ERR(priv->wq),
+	if (!priv->wq)
+		return dev_err_probe(dev, -ENOMEM,
 				     "Failed to create workqueue\n");
 
 	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_wq, priv->wq);
-- 
2.25.1


