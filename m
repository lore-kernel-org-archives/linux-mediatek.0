Return-Path: <SRS0=uE9q=7M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C83C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 08:23:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF0320776
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 08:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owG4WMsL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M2kAZT6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF0320776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNGz6Kc9+NWRrDoiNkH4QNIsjuC69WO0K10HEMbkXNA=; b=owG4WMsL9zIfyd
	OrKYcyTov0/Ss2OaXRu3ayDVjCXs/rxUjfngawmz0ZwBw6VOzgrvxxplEP2en4ysfcp82O3UxTs3j
	DC4nVfo3w+/vrOxIFNewDHRXe1z1G1ATfq8NUTKoS/VM00ZfWLT+aOZ8ifGiZJCgZV3FjoQOos1Af
	A58kGTMKrjsigFP0OUCZ2uiGMI/yE9r7Nf7tFFdjxeSCmsiQ2pXJwflG5mb2uoN5rVCWqb4B3Qqvl
	nhVuEMnJLCyMQO176IYHzwa4n7P/wBB8+qoo6YocDx3GuzqdL+k8j/JwBLX1vOYR/Jk3dlR45vGp0
	SHIahdC1m9K2CoOPiv5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jewmG-0005Lf-HZ; Sat, 30 May 2020 08:23:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jewlJ-0004Y0-34; Sat, 30 May 2020 08:22:38 +0000
X-UUID: f52b6f6490d34b328493125ff942c975-20200530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=3n8qQs/+XQtriV9uBcTrs++ZoOREAIe6PJ1LIF68gR4=; 
 b=M2kAZT6ZrYkSk5AmgCpfM8peyFM2WHXUFizcc4Fd2f7i6Wd9SQppW0qScWN4LZUV0CQzQY/ALzGh46aEs4U5UULlcoOxRjp1+PzbeqE4lB0gbBlDlObHY/X0jUisfbLadi7I3IXPUmktqybifmTIvjbzbiD+Oz5/Bk+VorUvXXk=;
X-UUID: f52b6f6490d34b328493125ff942c975-20200530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 989418461; Sat, 30 May 2020 00:22:27 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 May 2020 01:14:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 May 2020 16:14:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 30 May 2020 16:14:22 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 13/17] iommu/mediatek: Use module_platform_driver
Date: Sat, 30 May 2020 16:10:14 +0800
Message-ID: <1590826218-23653-14-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_012237_134862_D613D701 
X-CRM114-Status: GOOD (  11.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 eizan@chromium.org, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, acourbot@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek IOMMU should wait for smi larb which need wait for the
power domain(mtk-scpsys.c) and the multimedia ccf, both are module
init. Thus, subsys_initcall for MediaTek IOMMU is not helpful.
Switch to module_platform_driver.

Correspondingly, add the module license information.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
for iommu v1: honghui's mail address is not valid now. I will be
responsible for that file too, So I add myself in it.
---
 drivers/iommu/mtk_iommu.c    | 18 ++++++------------
 drivers/iommu/mtk_iommu_v1.c | 12 +++++++-----
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5c3a6ba..0740ca9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -15,6 +15,7 @@
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/list.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_iommu.h>
 #include <linux/of_irq.h>
@@ -823,16 +824,9 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
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
+MODULE_AUTHOR("Yong Wu <yong.wu@mediatek.com>");
+MODULE_ALIAS("platform:MediaTek-M4U");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 26b6c79..0852cb3 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -20,6 +20,7 @@
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/list.h>
+#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_iommu.h>
 #include <linux/of_irq.h>
@@ -711,9 +712,10 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
 		.pm = &mtk_iommu_pm_ops,
 	}
 };
+module_platform_driver(mtk_iommu_driver);
 
-static int __init m4u_init(void)
-{
-	return platform_driver_register(&mtk_iommu_driver);
-}
-subsys_initcall(m4u_init);
+MODULE_DESCRIPTION("IOMMU API for MediaTek M4U v1 implementations");
+MODULE_AUTHOR("Yong Wu <yong.wu@mediatek.com>");
+MODULE_AUTHOR("Honghui Zhang <honghui.zhang@mediatek.com>");
+MODULE_ALIAS("platform:MediaTek-M4U-v1");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
