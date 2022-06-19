Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E650C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Jun 2022 11:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5jVrL6ywP4I4XuQ5FuynYGcnCxfFWEcUhaRQVYk0R1I=; b=MrJ31pOslzRxteC5P/LrLJn6Gh
	0flEQExL7i8Sz3IfppUbG7Kg63bKp+TXp+qTGESi+N2Ckew3LcjcULTDluZ9x2sP1JE4l8tQq12m4
	mM09eBqQDppcuhFIZQmcx5ojJlNMCmLBXJUOtZrz1Hi3m4qywH4sl1JhHY2nwBSqout9LAGQ+imp9
	D1/+zfOjCRGfDQixZ0UICY4Z9TxolxQr3JiGVt5xXN0pqQfYkXYhm4tlb8hpeXcXcIpqGnb4thZT/
	61ttQA9SYA0eNzR3xJ8u8EQu3fSOc+2SgvgzLmIgkF/IH7/uhHt4ERKzxtil1NagmTBfq/aGSLGyi
	A3Ju0Vjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tXg-00E7Qh-3Z; Sun, 19 Jun 2022 11:56:36 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2tXS-00E7KJ-6U; Sun, 19 Jun 2022 11:56:24 +0000
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LQrm05PZ0zhYQZ;
	Sun, 19 Jun 2022 19:54:08 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 19 Jun 2022 19:56:12 +0800
Received: from huawei.com (10.67.175.34) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sun, 19 Jun
 2022 19:56:12 +0800
From: Ren Zhijie <renzhijie2@huawei.com>
To: <stanley.chu@mediatek.com>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <matthias.bgg@gmail.com>,
	<powen.kao@mediatek.com>
CC: <linux-scsi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Ren
 Zhijie" <renzhijie2@huawei.com>
Subject: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error and type unmatch
Date: Sun, 19 Jun 2022 19:54:32 +0800
Message-ID: <20220619115432.205504-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_045622_615222_742D7B01 
X-CRM114-Status: GOOD (  12.00  )
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

If CONFIG_PM_SLEEP is not set.

make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-, will be failed, like this:

drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_vreg_fix_vcc’:
drivers/ufs/host/ufs-mediatek.c:688:46: warning: format ‘%u’ expects argument of type ‘unsigned int’, but argument 4 has type ‘long unsigned int’ [-Wformat=]
    snprintf(vcc_name, MAX_VCC_NAME, "vcc-opt%u", res.a1);
                                             ~^   ~~~~~~
                                             %lu
drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_system_suspend’:
drivers/ufs/host/ufs-mediatek.c:1371:8: error: implicit declaration of function ‘ufshcd_system_suspend’; did you mean ‘ufs_mtk_system_suspend’? [-Werror=implicit-function-declaration]
  ret = ufshcd_system_suspend(dev);
        ^~~~~~~~~~~~~~~~~~~~~
        ufs_mtk_system_suspend
drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_system_resume’:
drivers/ufs/host/ufs-mediatek.c:1386:9: error: implicit declaration of function ‘ufshcd_system_resume’; did you mean ‘ufs_mtk_system_resume’? [-Werror=implicit-function-declaration]
  return ufshcd_system_resume(dev);
         ^~~~~~~~~~~~~~~~~~~~
         ufs_mtk_system_resume
cc1: some warnings being treated as errors

The declaration of func "ufshcd_system_suspend()" is depended on CONFIG_PM_SLEEP, so the function wrapper "ufs_mtk_system_suspend()" should warpped by CONFIG_PM_SLEEP too.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 3fd23b8dfb54("scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators")
Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index bfe04a4d1dce..4f1b30bf0c27 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -685,7 +685,7 @@ static int ufs_mtk_vreg_fix_vcc(struct ufs_hba *hba)
 	if (of_property_read_bool(np, "mediatek,ufs-vcc-by-num")) {
 		ufs_mtk_get_vcc_num(res);
 		if (res.a1 > UFS_VCC_NONE && res.a1 < UFS_VCC_MAX)
-			snprintf(vcc_name, MAX_VCC_NAME, "vcc-opt%u", res.a1);
+			snprintf(vcc_name, MAX_VCC_NAME, "vcc-opt%lu", res.a1);
 		else
 			return -ENODEV;
 	} else if (of_property_read_bool(np, "mediatek,ufs-vcc-by-ver")) {
@@ -1363,6 +1363,7 @@ static int ufs_mtk_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
 int ufs_mtk_system_suspend(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
@@ -1385,6 +1386,7 @@ int ufs_mtk_system_resume(struct device *dev)
 
 	return ufshcd_system_resume(dev);
 }
+#endif
 
 int ufs_mtk_runtime_suspend(struct device *dev)
 {
-- 
2.17.1


