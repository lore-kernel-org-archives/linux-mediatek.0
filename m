Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5BAC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 06:00:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 387A4619B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 06:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 387A4619B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZSMqN8AXxz6UL2yMSko/GrnqUx+YnqNeuWi69qguIM4=; b=gr9Vj0M3qzo/GOquLM+tjpG+u
	0oKKzotDKKtFjWilegOh5iB0CV4GXiwCBk9keuNL8CcoAZkVJxOkcWPjHY/W6ny2xXYG7KpbZ/KN1
	OaEesUoJiwy4GPxMkZPj7ilZ41Qfbfa3NydIGaAXUC4xvq3iKqZABJLl7G4qllH/SsqGXCtEz8e2w
	0VGDSeeWR1I/vICv+xFb0fs9GJ9W/tKYHz7y7PkWSIltt6o9hTmFegtkf+KSIQEyDdIJdDLU8UFcx
	4wJkuAttkh+nzsVBJeYX0BJBuwTbKkfcyuNkcQJuIuvS9tCkpshpXV4NB89hukyOZ6nRrQ2RKho5y
	K83QUQnZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOa5c-00DuT4-Q7; Tue, 23 Mar 2021 06:00:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOa4c-00DuIu-WB; Tue, 23 Mar 2021 05:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ZfKAOPGaCOYi9AvkLYJFp5g9ZQCXQT5lfMWoqFILS8s=; b=S2r1jg/dnThhULDPsk4mbXMM0L
 dQzimUNR+J4PFqEqwnWYpf6BBXxhM9EAHNhxxVhgpfU9pXBqrKTOuHY4VprcZ7/V4DZT2Nja+9tas
 s8sTMrGmvc1/jc0DGL8rMk8EPbP+HixsO0lQQ1zZ+jL/vLLqJ2Sx/4f9Y3EsJ0VNlNoUV98tJkQ/x
 J8zmn47SCzsAd3boy+vQCaxH9kH4v8AXMvFZQPGl5oG2vGsue75vK11+mCoPk/ciff1e/3Ekh8+1H
 0Wjf5mjWJLGgPZTtQCv5Os/Asig1BxW0vUzilce/g8yrK6KKTOnQwnecErlGYhhuAxZVqMMdnRcwF
 lxe9A7lA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOa3z-009ciu-0C; Tue, 23 Mar 2021 05:59:10 +0000
X-UUID: 3905382f1a9e447aab10c78ad306846a-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZfKAOPGaCOYi9AvkLYJFp5g9ZQCXQT5lfMWoqFILS8s=; 
 b=LPiKYf9Xo2TOVIlsuUsvXTdmFgFHkve788NFG9wCTmu7VQ7/A8ozGdNW/u56tc6m+5QalMY2GRM+cd6b2h7PSNCMQAaea3K5686eqDCd4gUMWE3xQ7Jz8g6rZi7VkHTsXxZoVU1rLL/V6JoeHW7OwlltRofmNGwvDT3A0iCMxQM=;
X-UUID: 3905382f1a9e447aab10c78ad306846a-20210322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1212129082; Mon, 22 Mar 2021 21:58:22 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 22:58:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 13:58:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 13:58:18 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH 2/2] iommu/mediatek: Alloc building as module
Date: Tue, 23 Mar 2021 13:58:01 +0800
Message-ID: <20210323055801.16885-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210323055801.16885-1-yong.wu@mediatek.com>
References: <20210323055801.16885-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_055853_511821_83700A76 
X-CRM114-Status: GOOD (  14.64  )
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
This patch switches it to module_platform_driver which allow the
driver built as module.

Correspondingly switch the config to tristate.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/Kconfig     |  2 +-
 drivers/iommu/mtk_iommu.c | 16 ++++------------
 2 files changed, 5 insertions(+), 13 deletions(-)

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
index 6ecc007f07cd..a73ff3e20480 100644
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
@@ -1079,16 +1080,7 @@ static struct platform_driver mtk_iommu_driver = {
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
