Return-Path: <SRS0=aCep=CO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01912C43461
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 08:12:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A92C120760
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 08:12:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qe3A/a2Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZNzfRk+w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A92C120760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ztavlP50KVJynQieC/7I1u4PpzRuy0wE93+Ca3mRi6c=; b=qe3A/a2QeZwqkCe9Z3jJryvHZ
	s8laWlcVlMjqNg8bDTSYzagkQB8f29iJEqlAphYhKX0ba3/YP2me/JkoWYE/qkBzD2e17tcvaW8RY
	eHwKQAcmnPpKB933Kh3oGH9nKQPXlAhkgFhqcoJ3XrDHr1LIShVh8GjbOsoWVvRnzOPJ/Nn/Xyw7E
	8pjKQ9lwBB7CU2A6jqd0+7QsHu6vWpvJOAP0JBJvbjAdx1GGw19b82WTtTZcpdHQNZB6WuzdT0ycF
	XyYh3HF22JZoc6I4PmRWOCybaRrF/yw8Qj5GYV9xVC4wOZaVOjhWWKfyW/kzV5tn226fpGg/uykVg
	QY1LUWB1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kETJO-00009w-Bz; Sat, 05 Sep 2020 08:12:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kETJI-00006d-Dj; Sat, 05 Sep 2020 08:12:34 +0000
X-UUID: 40970107cf1844af941052cf89e520a4-20200905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RXxpydUhOiDH5psuccLuJjNdd894eEQ6qDkPc6eppHU=; 
 b=ZNzfRk+w8naAem82iH0q1tgcPlPtOOT5q5UkX/KSKEyrc0YhO1hI+DvB5pVx66aEGMs86tlR2K3kteNCflQ6zlDtwNp3nWakLVV6bdUZSavXIEwONGJcsQcqSk6O4wkoOokUCqjlx2u8G6M3wIKsmWEYr8ffs3HyuMqqIHjb9Ew=;
X-UUID: 40970107cf1844af941052cf89e520a4-20200905
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1026089488; Sat, 05 Sep 2020 00:12:30 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 01:12:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 16:12:25 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Sep 2020 16:12:25 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 07/23] iommu/mediatek: Use the common mtk-smi-larb-port.h
Date: Sat, 5 Sep 2020 16:09:04 +0800
Message-ID: <20200905080920.13396-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200905080920.13396-1-yong.wu@mediatek.com>
References: <20200905080920.13396-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_041232_635847_68F765C4 
X-CRM114-Status: GOOD (  15.08  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the common larb-port header in the source code.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c  | 7 -------
 drivers/iommu/mtk_iommu.h  | 1 +
 drivers/memory/mtk-smi.c   | 1 +
 include/soc/mediatek/smi.h | 2 --
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 785b228d39a6..fd8322ee4980 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -101,13 +101,6 @@
 
 #define MTK_PROTECT_PA_ALIGN			256
 
-/*
- * Get the local arbiter ID and the portid within the larb arbiter
- * from mtk_m4u_id which is defined by MTK_M4U_ID.
- */
-#define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
-#define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
-
 #define HAS_4GB_MODE			BIT(0)
 /* HW will use the EMI clock if there isn't the "bclk". */
 #define HAS_BCLK			BIT(1)
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 122925dbe547..a2e2c844b96e 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -17,6 +17,7 @@
 #include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
 #include <soc/mediatek/smi.h>
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 
 #define MTK_LARB_COM_MAX	8
 #define MTK_LARB_SUBCOM_MAX	4
diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index c21262502581..ec83f1ac48b1 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <soc/mediatek/smi.h>
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 #include <dt-bindings/memory/mt2701-larb-port.h>
 
 /* mt8173 */
diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
index 5a34b87d89e3..9371bf572ab8 100644
--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -11,8 +11,6 @@
 
 #ifdef CONFIG_MTK_SMI
 
-#define MTK_LARB_NR_MAX		16
-
 #define MTK_SMI_MMU_EN(port)	BIT(port)
 
 struct mtk_smi_larb_iommu {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
