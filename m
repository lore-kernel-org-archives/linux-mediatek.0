Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E9EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC016115A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CC016115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ph7qdxM0stDDHcunI/UwBnYYqbVZtGYC+uE1mkWBm/A=; b=lY/+eEyCq7w7iP
	lavJzKZXSUvCM9OEQaYBsVYBs0e8Nn/Zx/iPJQ7XAXDWWbLvEbnPAUgfyZ+kSuf8Jncv1UXS1j19O
	EZ/ou7QLXUBR4iCFaCfXKO5xnvhJ7rUv14wFewcGV+Ag+x2x4JjkkdzcGe4WSHHsb2a+gxhiybwvF
	S7KD7U/FfBt6V1jmkvzvXBJPX8loTcx+fZwFLQ+zSmHYlwykXoDrX2fdiujYQcaJ++6xzOQ6RiDE0
	OVtjYkmvrbGf+bsQykkzEJuiHf8OOAOdP3GpCnTttg6KAIpSAWzc8bt5o9DdsDjyTjUUwbHlQWsLk
	DfOyQ0d5TmlDsMToppJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNar-00BGGt-UG; Thu, 23 Sep 2021 12:12:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNXO-00BEQd-C7; Thu, 23 Sep 2021 12:09:16 +0000
X-UUID: 9ed04e6896a84fb0846353bf8c0b2e3c-20210923
X-UUID: 9ed04e6896a84fb0846353bf8c0b2e3c-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 389973663; Thu, 23 Sep 2021 05:09:05 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 05:01:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:01:10 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 20:01:09 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>, <yen-chang.chen@mediatek.com>
Subject: [PATCH v3 13/33] iommu/mediatek: Remove the power status checking in
 tlb flush all
Date: Thu, 23 Sep 2021 19:58:20 +0800
Message-ID: <20210923115840.17813-14-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210923115840.17813-1-yong.wu@mediatek.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_050914_475968_FE727C5B 
X-CRM114-Status: GOOD (  16.46  )
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

To simplify the code, Remove the power status checking in the
tlb_flush_all, remove this:
   if (pm_runtime_get_if_in_use(data->dev) <= 0)
	    continue;

After this patch, the mtk_iommu_tlb_flush_all will be called from
a) isr
b) pm runtime resume callback
c) tlb flush range fail case
d) iommu_create_device_direct_mappings
   -> iommu_flush_iotlb_all
In first three cases, the power and clock always are enabled; d) is direct
mapping, the tlb flush is unnecessay since we already have tlb_flush_all
in the pm_runtime_resume callback. When the iommu's power status is
changed to active, the tlb always is clean.

In addition, there still are 2 reasons that don't add PM status checking
in the tlb flush all:
a) Write tlb flush all register also is ok even though the HW has no
power and clocks. Write ignore.
b) pm_runtime_get_if_in_use(m4udev) is 0 when the tlb_flush_all
is called frm pm_runtime_resume cb. From this point, we can not add
this code above in this tlb_flush_all.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e9e94944ed91..4a33b6c6b1db 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -204,10 +204,14 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 	return container_of(dom, struct mtk_iommu_domain, domain);
 }
 
-static void mtk_iommu_tlb_do_flush_all(struct mtk_iommu_data *data)
+static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
 	unsigned long flags;
 
+	/*
+	 * No need get power status since the HW PM status nearly is active
+	 * when entering here.
+	 */
 	spin_lock_irqsave(&data->tlb_lock, flags);
 	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 		       data->base + data->plat_data->inv_sel_reg);
@@ -216,16 +220,6 @@ static void mtk_iommu_tlb_do_flush_all(struct mtk_iommu_data *data)
 	spin_unlock_irqrestore(&data->tlb_lock, flags);
 }
 
-static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
-{
-	if (pm_runtime_get_if_in_use(data->dev) <= 0)
-		return;
-
-	mtk_iommu_tlb_do_flush_all(data);
-
-	pm_runtime_put(data->dev);
-}
-
 static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 					   struct mtk_iommu_data *data)
 {
@@ -263,7 +257,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		if (ret) {
 			dev_warn(data->dev,
 				 "Partial TLB flush timed out, falling back to full flush\n");
-			mtk_iommu_tlb_do_flush_all(data);
+			mtk_iommu_tlb_flush_all(data);
 		}
 
 		if (has_pm)
@@ -993,7 +987,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	 *
 	 * Thus, Make sure the tlb always is clean after each PM resume.
 	 */
-	mtk_iommu_tlb_do_flush_all(data);
+	mtk_iommu_tlb_flush_all(data);
 
 	/*
 	 * Uppon first resume, only enable the clk and return, since the values of the
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
