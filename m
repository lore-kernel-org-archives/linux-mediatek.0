Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED11C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 03:34:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25F2161A2A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 03:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25F2161A2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iGPFZ9Ngb+pyIlzmAbayk2824geFsZkn364jLBw8yKQ=; b=fjdUDoayP6ycbqQHZ+w3nzpvJ
	II/vFHpaibO3wL2he/3NxQC/2+bPRQz8pC43HpyqcYlYaFqcjdBOr/k41VKwtZY2p9GsQtoBJb+O5
	eV5PZA5psZbKOUiTZfmKvOBVd+b4vh5Za149naKpgzYxq9BIw8BIySjQcgWDhVdUpsGsV/RV4wwi2
	mdb4eC05aOiYDXW1Xswglmzkqi8WDOFZ7Pa1tjGWtEPtufdPgpfUV58XPflevGtrA0TZNWPSn+MMc
	II1hS93YweoJj5sE4oLUByEVZl+g/z7N2eZC7bfB9MYTQk9zMAP8vQLU6N0fiYpxnYJSKQ3UmTCOt
	U+URZjAaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPdEy-002hcZ-Rq; Fri, 26 Mar 2021 03:34:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPdEa-002ha0-On; Fri, 26 Mar 2021 03:34:09 +0000
X-UUID: 4fd9f74556b14168b452966f2c6e5f4e-20210325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZdKM2PQmbL7mrwde6jxc8AHlKHYjpO4KMIa5NZwd7ho=; 
 b=j6SejDUm8kwuAvvU6zprAWvr09+g5oDtbbN3OJ9hXetB1Y8nWoKdhuvjZJotabcWJef5s/UQU2bnadDOKHwpjGjtVDjDWmQ67/o8DZ7CIEY9bhppcGxCYqyBlbL3jQ/TnQGuP/EQDICElwriwTkfdN8hPO1o/dWuRfzR8dtJDBk=;
X-UUID: 4fd9f74556b14168b452966f2c6e5f4e-20210325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1018808993; Thu, 25 Mar 2021 19:33:59 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 20:23:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Mar 2021 11:23:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Mar 2021 11:23:54 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH v2 2/2] iommu/mediatek: Allow building as module
Date: Fri, 26 Mar 2021 11:23:37 +0800
Message-ID: <20210326032337.24578-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210326032337.24578-1-yong.wu@mediatek.com>
References: <20210326032337.24578-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_033405_968052_D8669115 
X-CRM114-Status: GOOD (  15.68  )
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

The IOMMU in many SoC depends on the MM clocks and power-domain which
are device_initcall normally, thus the subsys_init here is not helpful.
This patch switches it to module_platform_driver which also allow the
driver built as module.

Correspondingly switch the config to tristate, and update the
iommu_ops's owner.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/Kconfig     |  2 +-
 drivers/iommu/mtk_iommu.c | 17 +++++------------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index bc93da48bed0..74f3e15edc14 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -349,7 +349,7 @@ config S390_AP_IOMMU
 	  is not implemented as it is not necessary for VFIO.
 
 config MTK_IOMMU
-	bool "MTK IOMMU Support"
+	tristate "MediaTek IOMMU Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6ecc007f07cd..75375935f301 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -17,6 +17,7 @@
 #include <linux/iopoll.h>
 #include <linux/list.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_iommu.h>
 #include <linux/of_irq.h>
@@ -683,6 +684,7 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.get_resv_regions = mtk_iommu_get_resv_regions,
 	.put_resv_regions = generic_iommu_put_resv_regions,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
+	.owner		= THIS_MODULE,
 };
 
 static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
@@ -1079,16 +1081,7 @@ static struct platform_driver mtk_iommu_driver = {
 		.pm = &mtk_iommu_pm_ops,
 	}
 };
+module_platform_driver(mtk_iommu_driver);
 
-static int __init mtk_iommu_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&mtk_iommu_driver);
-	if (ret != 0)
-		pr_err("Failed to register MTK IOMMU driver\n");
-
-	return ret;
-}
-
-subsys_initcall(mtk_iommu_init)
+MODULE_DESCRIPTION("IOMMU API for MediaTek M4U implementations");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
