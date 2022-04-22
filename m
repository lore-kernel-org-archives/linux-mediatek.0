Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVMbTzpJWUaXPEFO4R+o/tHuHxLN9IHlTmrGVOZSa2E=; b=O4JcZFKUT9P6GY
	jK7NCSsQmHpq1C50pg/DefbELpjZyRIwLndHrcBf9BT0jc4dZEjOLdVbwOut66UA+EfSJLZbbuydC
	wTgWML72Ku/LowzAfZ/gP48fVDB/dARwivOmT3Cc1hZSyVqVZxlgj7RY6bDYf7ntkNWCTDEqgT+Lj
	gsjj9zRsjhp7wkO2DaA6lbqmF1Sj0DMjKPKoV8z5x/gHvp01S64Po+csE6FFmJaAf5fWgd1XVKUSO
	3map46/BSTY57eFVdQIaYdv0Odp4KtjKD8iz2BPNgZL0UNBmVnF96Y+Qg62ctDU3BnM2eISZC32I/
	mPP/Pu1iGylIsrb6OQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmp5-00GYuh-Ny; Fri, 22 Apr 2022 06:31:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmip-00GW3H-FR; Fri, 22 Apr 2022 06:24:52 +0000
X-UUID: 99b3590d2abc4c1c90d5281fb9884240-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:afc9c3fb-e8c5-4784-a396-ba95a138f390, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:e52f94f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 99b3590d2abc4c1c90d5281fb9884240-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1698134864; Thu, 21 Apr 2022 23:24:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 23:24:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 14:24:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 14:24:40 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <bjorn.andersson@linaro.org>, <mathieu.poirier@linaro.org>,
 <robin.murphy@arm.com>
CC: <hch@lst.de>, <m.szyprowski@samsung.com>, <matthias.bgg@gmail.com>,
 <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <iommu@lists.linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH 1/2] dma-mapping: Add dma_release_coherent_memory to DMA API
Date: Fri, 22 Apr 2022 14:24:35 +0800
Message-ID: <20220422062436.14384-2-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
References: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_232451_565148_36C27EB2 
X-CRM114-Status: GOOD (  12.98  )
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

Add dma_release_coherent_memory to DMA API to allow dma
user call it to release dev->dma_mem when the device is
removed.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 include/linux/dma-map-ops.h |  3 +++
 kernel/dma/coherent.c       | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 0d5b06b3a4a6..53db9655efe9 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -166,6 +166,7 @@ static inline void dma_pernuma_cma_reserve(void) { }
 #ifdef CONFIG_DMA_DECLARE_COHERENT
 int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 		dma_addr_t device_addr, size_t size);
+void dma_release_coherent_memory(struct device *dev);
 int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
 		dma_addr_t *dma_handle, void **ret);
 int dma_release_from_dev_coherent(struct device *dev, int order, void *vaddr);
@@ -177,6 +178,8 @@ static inline int dma_declare_coherent_memory(struct device *dev,
 {
 	return -ENOSYS;
 }
+
+#define dma_release_coherent_memory(dev) (0)
 #define dma_alloc_from_dev_coherent(dev, size, handle, ret) (0)
 #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
 #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 375fb3c9538d..c21abc77c53e 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -74,7 +74,7 @@ static struct dma_coherent_mem *dma_init_coherent_memory(phys_addr_t phys_addr,
 	return ERR_PTR(-ENOMEM);
 }
 
-static void dma_release_coherent_memory(struct dma_coherent_mem *mem)
+static void _dma_release_coherent_memory(struct dma_coherent_mem *mem)
 {
 	if (!mem)
 		return;
@@ -126,10 +126,16 @@ int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 
 	ret = dma_assign_coherent_memory(dev, mem);
 	if (ret)
-		dma_release_coherent_memory(mem);
+		_dma_release_coherent_memory(mem);
 	return ret;
 }
 
+void dma_release_coherent_memory(struct device *dev)
+{
+	if (dev)
+		_dma_release_coherent_memory(dev->dma_mem);
+}
+
 static void *__dma_alloc_from_coherent(struct device *dev,
 				       struct dma_coherent_mem *mem,
 				       ssize_t size, dma_addr_t *dma_handle)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
