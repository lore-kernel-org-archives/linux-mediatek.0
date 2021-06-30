Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647ACC11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B2E61D8C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B2E61D8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Abh7brFRHAL658ld1K0g4DQv3gljgU4nBxZmhIHbHg=; b=yxr0pG9qZovdVM
	L29ExwY0rFp6VEhEKdcxYM9RN448a5x0B553Rsp7yEhHbNRYiS9Do6zpE41+W3d2nqnEoFCOZWhdw
	VfZUBrvhT18F4lk8WqGK5KbCObbv0mfSf/Knq5S+v8cqU8giF1en2qQX5IYGv9UF3ENhoYiBm9gJJ
	Dp2abVz+9MNeA6uMfWa44f2QZJv2qE/uOw9FmeEBeVONzG2a9oXN3a4wO6GMZrEAYF8rce6kxUVyv
	ZpCHy5+WI8RPs7NZ6g2z9QlVe1GjTE1uuYv1V807XLEMrBqnhoPEPZzoRuURio2Gvx1UVW7NZK9E1
	U7tVfLB2RB71pqHvH68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyQBf-00CVM8-94; Wed, 30 Jun 2021 02:42:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyQBQ-00CVGd-Dr; Wed, 30 Jun 2021 02:42:37 +0000
X-UUID: 92f9a740c2c04e1e8b14f7dda8b57b30-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7j/SUPHqdiH80VfIT04vqOQ52aVxnup14fwRgsIqP/M=; 
 b=HUFWvfAvVaaBwRuEUGlcded/moeXt1kbphOnJXcM54u3VPIdW7zt/5DyWptJj3EfO44gnL2hGYPnOzpF8zLJxkYItm7r1K7lcAV6sobwt+s9es/MMyUsik7as6rnUbn50cmdNFNttAJH1jufRDtbN33u6FK8/hh9p1M1kBlKFTI=;
X-UUID: 92f9a740c2c04e1e8b14f7dda8b57b30-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 240848738; Tue, 29 Jun 2021 19:42:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 19:36:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:36:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:36:31 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH 09/24] iommu/mediatek: Always pm_runtime_get while tlb flush
Date: Wed, 30 Jun 2021 10:34:49 +0800
Message-ID: <20210630023504.18177-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630023504.18177-1-yong.wu@mediatek.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_194236_539304_1880F422 
X-CRM114-Status: GOOD (  15.80  )
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

In previous soc, some SoC don't have PM. Only mt8192 has power-domain,
and it's display's power-domain which nearly always is enabled.

When there are 2 M4U HW, it may has problem.
In this function, we get the pm_status via the m4u dev, but it don't
reflect the real power-domain status of the HW since there may be other
HW also use that power-domain.

Currently We can not get the real power-domain status, thus I always
pm_runtime_get here.

This pach is only a preparing patch for 2 HW sharing pgtable in different
power-domains, like mt8195 case. thus, no need fix tags here.

this patch may drop the performance, we expect the user could
pm_runtime_get_sync before dma_alloc_attrs.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index ed3455b5cef0..fcf70787d3d1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -231,7 +231,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 
 	for_each_m4u(data, head) {
 		if (has_pm) {
-			if (pm_runtime_get_if_in_use(data->dev) <= 0)
+			if (pm_runtime_resume_and_get(data->dev) < 0)
 				continue;
 		}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
