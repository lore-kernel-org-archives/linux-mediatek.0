Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E91C11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:44:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD9E61D8C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AD9E61D8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeLYuRTkKkLZNV7hW7dXQI/l6QxEae2ywdpiibLHKxk=; b=YFQ7ajQ0zyOUc1
	4uMUAe+kmwV7mBaVOTWtqd5+4nu1dcnYLWnC19EisgH585qaLzEpZCi8J+keQE/7jpIh460TO2Eb/
	n3G3qnwpNTQQCX0iwgWktxve3rhibZsYz53zZLkNxtMUkGoDG2PpRz4oEC+OFWIax3CBZU/jkfQwa
	wbPFkNwaHtrNs64tOAILRtBb2N9iGpYLZP7jfoAikNmH1XhL9qhGrCtmVMCqJUqnyVdx09yHnIFQT
	m1FmII1o7WRO6Q2HdFxYSXlLcWI28VUWWyzgNSOrz9na7jZlzBjqHA10mV475IzI3HBRqgcvirMtE
	VfGGMLiIxGJPQ0pE1XMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyQCw-00CVoO-CU; Wed, 30 Jun 2021 02:44:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyQBS-00CVGx-Mx; Wed, 30 Jun 2021 02:42:40 +0000
X-UUID: 16335a0440cf4a3aa036d4505e32943e-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/X6cDxjd6hd38iMANsmZm/XzP0hy5LewdSy8lKuk99I=; 
 b=ifMDDw7r+HiFsaP5sp8/IUacPqioHg4ny3WtbnrUdSIJZJ/D9SviQTaFLwG+2Ptzh5NW0cbdRazr47nQULlRAPJC7+cKfivhWKQ65bHpA/guTuBy+jLaS4/aNM2OpH0xeSnfvidbG4t3wfTZeFJZm5Tm1KcRBn4n6u14X7oXKY4=;
X-UUID: 16335a0440cf4a3aa036d4505e32943e-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1104124053; Tue, 29 Jun 2021 19:42:33 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 19:35:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:35:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:35:41 +0800
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
Subject: [PATCH 03/24] iommu/mediatek: Fix 2 HW sharing pgtable issue
Date: Wed, 30 Jun 2021 10:34:43 +0800
Message-ID: <20210630023504.18177-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630023504.18177-1-yong.wu@mediatek.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_194238_782041_66B63892 
X-CRM114-Status: GOOD (  17.10  )
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

In the this commit 4f956c97d26b ("iommu/mediatek: Move domain_finalise
into attach_device"), I overlooked the sharing pgtable case.
After that commit, the "data" in the mtk_iommu_domain_finalise always is
the data of the current IOMMU HW, If it's sharing pgtable case, here is
not right. This patch fix this. In sharing pgable case, we will loop the
list to find if there already is the exist domain.

this only affect mt2712 which is the only SoC that sharing pgtable.

Fixes: 4f956c97d26b ("iommu/mediatek: Move domain_finalise into attach_device")
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e06b8a0e2b56..013dbcc87d49 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -390,12 +390,19 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 				     unsigned int domid)
 {
 	const struct mtk_iommu_iova_region *region;
+	struct mtk_iommu_data *tmpdata;
 
-	/* Use the exist domain as there is only one pgtable here. */
-	if (data->m4u_dom) {
-		dom->iop = data->m4u_dom->iop;
-		dom->cfg = data->m4u_dom->cfg;
-		dom->domain.pgsize_bitmap = data->m4u_dom->cfg.pgsize_bitmap;
+	/*
+	 * Loop to find if there is already the exist domain.
+	 * Use it when 2 iommu HWs share the pgtable.
+	 */
+	for_each_m4u(tmpdata) {
+		if (!tmpdata->m4u_dom)
+			continue;
+
+		dom->iop = tmpdata->m4u_dom->iop;
+		dom->cfg = tmpdata->m4u_dom->cfg;
+		dom->domain.pgsize_bitmap = tmpdata->m4u_dom->cfg.pgsize_bitmap;
 		goto update_iova_region;
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
