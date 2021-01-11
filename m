Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01906C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:36:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8657E224BD
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8657E224BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gD2bedgvJSkY0lqDZic+lK6NhZSSV0fpfpH9IX/utWs=; b=V3eWlT7XrnV50xawaD4b4nQry
	GTxveD7Tmfpg9XZhIAIJynkCCr1rru8ClyYQa/HJQ89nw+/tz61IzwKlIfM0aQcIShjU8DVdvdX5U
	O4/yazUy//bLQjXuP5lEVotm4IeienyZVLfsELOQjECPF2uDwba5edueA8Hzf7mK6aLQWMSqjz+8w
	Jzf1EimF9DCpD9amLe2Hl58zESdr3ANCoKG6p40ZAsRxj/xiM6N3TPBDZI7RiNAa8FihsyIuvE3WE
	CALUov2uiA/Djz3kIQVqZs8ouCm3W+MwFNVbfgRpLqCMeyy0/2Fve4wgqZrRM1lELbpt3wcG0y/Vv
	6M0jZ2/nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvUw-0000W6-Ib; Mon, 11 Jan 2021 11:36:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvPX-0005FM-Hf; Mon, 11 Jan 2021 11:31:03 +0000
X-UUID: 7e89c92482134456a9f52d2b616b79b7-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0uVEvb4ujtJreDWlvPktY0Z98SmDdoVcAgxVsUBF7E0=; 
 b=lrl3bZH0opX4gGE/ol/7Q0HyR4TAhHVKIS+1GJx49V/xYvpW/NbkW3kMSsCPaQaoUmEhPrPql7x/Wgnztjd61wI7mbK/Jx0dNethBCAHbcvFHJY/OTT6kILpBncX/e/YN+kxl79tPbWUYXHLEtLXO/LVLuE1GcnFZHUoBw2xJp4=;
X-UUID: 7e89c92482134456a9f52d2b616b79b7-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 620674255; Mon, 11 Jan 2021 03:30:34 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:23:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:23:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:23:09 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 24/33] iommu/mediatek: Move domain_finalise into
 attach_device
Date: Mon, 11 Jan 2021 19:19:05 +0800
Message-ID: <20210111111914.22211-25-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_063059_830607_B7FEEA19 
X-CRM114-Status: GOOD (  18.40  )
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
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently domain_alloc only has a parameter(type), We have no chance to
input some special data. This patch moves the domain_finalise into
attach_device which has the device information, then could update
the domain's geometry.aperture ranges for each a device.

Strictly, I should use the data from mtk_iommu_get_m4u_data as the
parameter of mtk_iommu_domain_finalise in this patch. but dom->data
only is used in tlb ops in which the data is get from the m4u_list, thus
it is ok here.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index f1941608ccb7..d321d09ac4c2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -328,10 +328,9 @@ static void mtk_iommu_config(struct mtk_iommu_data *data,
 	}
 }
 
-static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
+static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
+				     struct mtk_iommu_data *data)
 {
-	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
-
 	dom->cfg = (struct io_pgtable_cfg) {
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
 			IO_PGTABLE_QUIRK_NO_PERMS |
@@ -352,7 +351,6 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 		return -EINVAL;
 	}
 
-	dom->data = data;
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = dom->cfg.pgsize_bitmap;
 	return 0;
@@ -369,30 +367,19 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (!dom)
 		return NULL;
 
-	if (iommu_get_dma_cookie(&dom->domain))
-		goto  free_dom;
-
-	if (mtk_iommu_domain_finalise(dom))
-		goto  put_dma_cookie;
+	if (iommu_get_dma_cookie(&dom->domain)) {
+		kfree(dom);
+		return NULL;
+	}
 
 	dom->domain.geometry.aperture_start = 0;
 	dom->domain.geometry.aperture_end = DMA_BIT_MASK(32);
 	dom->domain.geometry.force_aperture = true;
-
 	return &dom->domain;
-
-put_dma_cookie:
-	iommu_put_dma_cookie(&dom->domain);
-free_dom:
-	kfree(dom);
-	return NULL;
 }
 
 static void mtk_iommu_domain_free(struct iommu_domain *domain)
 {
-	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
-
-	free_io_pgtable_ops(dom->iop);
 	iommu_put_dma_cookie(domain);
 	kfree(to_mtk_domain(domain));
 }
@@ -408,6 +395,12 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	if (!data)
 		return -ENODEV;
 
+	if (!dom->data) {
+		if (mtk_iommu_domain_finalise(dom, data))
+			return -ENODEV;
+		dom->data = data;
+	}
+
 	if (!data->m4u_dom) { /* Initialize the M4U HW */
 		ret = pm_runtime_resume_and_get(m4udev);
 		if (ret < 0)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
