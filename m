Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE03C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ad23ehEB3clTUOGhZRjSkq751fANaAg+AHGgnyZtmvA=; b=d3v1S9H4Znl/ppE0RzdL4zxWbW
	kU0ak5tAc+plGuQTDmyp0mD9MYCLVd9g2CSP9x062luBkaae8JrJi7wQHAMUNh5QtsR4bTp/dwBDh
	fLnSz8NhG5soBnj3akr0EerJSHucBy8guUex2f8XywLYAA6NwlONNkx7ubF+3EHWzKn5G/OF4d8Tj
	tE8YsmKePH/QQfHXq/FfNyYyYF4YhyxWqfRt6FkY+aIBT3ctyj2kpDVsbTEn+U0WXIEteaCbc/B9q
	yigffm60ppH53CcGxiUCLMXuzep4xDMzxLMMsERSxdz6xhHyVdzAwl8bKxuQzUK/ul+PSGfkj3l95
	BNSbzdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oojD4-005q7G-Tj; Sat, 29 Oct 2022 10:37:02 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oojD1-005q5P-RY
	for linux-mediatek@lists.infradead.org; Sat, 29 Oct 2022 10:37:02 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MzwnX6mxJzHvMP;
	Sat, 29 Oct 2022 18:36:32 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 18:36:48 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 18:36:47 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>
CC: <yong.wu@mediatek.com>, <joro@8bytes.org>, <will@kernel.org>,
	<robin.murphy@arm.com>, <matthias.bgg@gmail.com>, <yangyingliang@huawei.com>
Subject: [PATCH] iommu/mediatek: check return value after calling platform_get_resource()
Date: Sat, 29 Oct 2022 18:35:50 +0800
Message-ID: <20221029103550.3774365-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_033700_081473_590A6BFD 
X-CRM114-Status: UNSURE (   7.17  )
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

platform_get_resource() may return NULL pointer, we need check its
return value to avoid null-ptr-deref in resource_size().

Fixes: 42d57fc58aeb ("iommu/mediatek: Initialise/Remove for multi bank dev")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/iommu/mtk_iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2ab2ecfe01f8..2d14dc846b83 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1173,6 +1173,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 
 	banks_num = data->plat_data->banks_num;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 	if (resource_size(res) < banks_num * MTK_IOMMU_BANK_SZ) {
 		dev_err(dev, "banknr %d. res %pR is not enough.\n", banks_num, res);
 		return -EINVAL;
-- 
2.25.1


