Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2D3C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:47:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8568523356
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8568523356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fMCiCHz7DEmGEZvq3fWDmBIE8cr0FpLKJp6EsHqLxN4=; b=bW7AH8SgTkGMXS2VqAmspJQcf
	8Iy0S4kZbo3XBVeAKKfRgA/MzdkGhjvW50FNE9C0ihUL7YWXGkTCHfHhhyzHW9/p/aCyO/+X+0Fxg
	Op6Ypf5VEJB5ftGIx2bj+poC1LmHc7Cz43AzLnoT65kzKsvIQ5+UrcnhUk/nzRmnHvL1SsM0jIGtK
	Dd6+gTy1UMuaAn4gz3auNnZh3DVn+8n7J/nBlM5b5zJ/0zV2kUolKME7c2ix+hUr+yCopyJtrJiw2
	I98AlOZO1nZt0RvcIpQcQNf7NJ2tfei8HNxnRck7jsI2WJDceaFMpbHLR2dsqnUK+aYYvMJtTQcYE
	VZ5hJvfbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpUKf-0001xH-Im; Wed, 16 Dec 2020 10:46:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpUKR-0001r8-MG; Wed, 16 Dec 2020 10:46:46 +0000
X-UUID: 68674ae7c36143849ea3742de5ac527b-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=e9oXGwAx39ohOTDXj/uMO5CaF4S8lsHjnF4ppLVeRAg=; 
 b=fy5LuHUkSmKDv9sXYCcWlxKNwNscPZaE7vtlpFuCtEqtcKw8/63dkl435onHwywe7O0mqiMjXS3TxB+Pp389t2j0W7vyDT3dqGBS3zsLgis/sbi4KaXT+qHGqBVxxemtaz7vd8NRYaIWM7oybt4/yPjzlXXO2iBBEb20t6lHvrA=;
X-UUID: 68674ae7c36143849ea3742de5ac527b-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1776300772; Wed, 16 Dec 2020 02:46:38 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 02:37:11 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 18:37:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 18:37:07 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v3 7/7] iommu/mediatek: Remove the tlb-ops for v7s
Date: Wed, 16 Dec 2020 18:36:07 +0800
Message-ID: <20201216103607.23050-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216103607.23050-1-yong.wu@mediatek.com>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_054643_975824_B5F18731 
X-CRM114-Status: GOOD (  14.24  )
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
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Until now, we have already used the tlb operations from iommu framework,
then the tlb operations for v7s can be removed.

Correspondingly, Switch the paramenter "cookie" to internal structure.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 89cec51405cd..5656819cd4a1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -206,10 +206,8 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 	return container_of(dom, struct mtk_iommu_domain, domain);
 }
 
-static void mtk_iommu_tlb_flush_all(void *cookie)
+static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
-	struct mtk_iommu_data *data = cookie;
-
 	for_each_m4u(data) {
 		if (!pm_runtime_active(data->dev))
 			continue;
@@ -221,9 +219,9 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
 }
 
 static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
-					   size_t granule, void *cookie)
+					   size_t granule,
+					   struct mtk_iommu_data *data)
 {
-	struct mtk_iommu_data *data = cookie;
 	unsigned long flags;
 	int ret;
 	u32 tmp;
@@ -250,7 +248,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		if (ret) {
 			dev_warn(data->dev,
 				 "Partial TLB flush timed out, falling back to full flush\n");
-			mtk_iommu_tlb_flush_all(cookie);
+			mtk_iommu_tlb_flush_all(data);
 		}
 		/* Clear the CPE status */
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
@@ -258,22 +256,6 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	}
 }
 
-static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
-					    unsigned long iova, size_t granule,
-					    void *cookie)
-{
-	struct mtk_iommu_data *data = cookie;
-	struct iommu_domain *domain = &data->m4u_dom->domain;
-
-	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
-}
-
-static const struct iommu_flush_ops mtk_iommu_flush_ops = {
-	.tlb_flush_all = mtk_iommu_tlb_flush_all,
-	.tlb_flush_walk = mtk_iommu_tlb_flush_range_sync,
-	.tlb_add_page = mtk_iommu_tlb_flush_page_nosync,
-};
-
 static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 {
 	struct mtk_iommu_data *data = dev_id;
@@ -380,7 +362,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
 		.ias = MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN) ? 34 : 32,
 		.oas = 35,
-		.tlb = &mtk_iommu_flush_ops,
 		.iommu_dev = data->dev,
 	};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
