Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DCAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:35:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78313238EE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78313238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lozA2GfphzYk7fWBPnc36OQK89hpVybX5A6sbvp6oTA=; b=kd0dkJoboS1NbwFpqccadQ/60
	z2H8TAq8/jd006Y7cQBCiy5qXz8V42l9petn3fyOK+7r5213B0wYxBmvf+daKBKQXH6FAwdQajCBw
	CSZ9cgs9WuqIpuDavPxtuXV4tjQNCzEUgVg1fEtpUezy7PChVRhf4Cyph4p+66SG3SDFvY33/4NKe
	E76cLknDByBpMz5Oaqu5qQBAZgTsrdBUKEBiy1o+RQs7ct5Zkpku69Cmk9/3pLXXZgOwxPIH3AWcj
	f/jKB++rULgrj2PHgIHQ8ZeOGiVayHkWAujhVwes3duSLuw40OQeHzbkam8+m/PnpSyAyHu3omhW3
	u1Ms6/J3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2TYj-0003qo-OG; Thu, 21 Jan 2021 06:35:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TYe-0003nx-HG; Thu, 21 Jan 2021 06:35:05 +0000
X-UUID: 0b8e6f76bdc04955b6f3bc97e5551cd7-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PHxeX2kIyIgfx1H8asHkYdsyBC/XtlxANKaYFjVy2Xw=; 
 b=OUGN8h9QYBGQcYjxDSv+KUCF2+bnAG/v2LaVIAlerWJHx6OittDUOKz4X7B39TECWZJ4SRU+mT+rdEjL5boP7nuck7u3RGm04Xmkp9Ir2oM4kJwsWZ2kTOJ7ygBHNGi9inhqRKwwDx+2sh8tVFJW+o/83scOCKJK1jR7kuDtXk0=;
X-UUID: 0b8e6f76bdc04955b6f3bc97e5551cd7-20210120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 468179361; Wed, 20 Jan 2021 22:35:01 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 22:25:12 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 14:25:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 14:25:09 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH 1/3] memory: mtk-smi: Use platform_register_drivers
Date: Thu, 21 Jan 2021 14:24:27 +0800
Message-ID: <20210121062429.26504-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210121062429.26504-1-yong.wu@mediatek.com>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_013504_711914_047E839C 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In this file, we have 2 drivers, smi-common and smi-larb.
Use platform_register_drivers.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index ac350f8d1e20..e2aebd2bfa8e 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -587,26 +587,13 @@ static struct platform_driver mtk_smi_common_driver = {
 	}
 };
 
+static struct platform_driver * const smidrivers[] = {
+	&mtk_smi_common_driver,
+	&mtk_smi_larb_driver,
+};
+
 static int __init mtk_smi_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&mtk_smi_common_driver);
-	if (ret != 0) {
-		pr_err("Failed to register SMI driver\n");
-		return ret;
-	}
-
-	ret = platform_driver_register(&mtk_smi_larb_driver);
-	if (ret != 0) {
-		pr_err("Failed to register SMI-LARB driver\n");
-		goto err_unreg_smi;
-	}
-	return ret;
-
-err_unreg_smi:
-	platform_driver_unregister(&mtk_smi_common_driver);
-	return ret;
+	return platform_register_drivers(smidrivers, ARRAY_SIZE(smidrivers));
 }
-
 module_init(mtk_smi_init);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
