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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D05C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 08:22:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D7B2074D
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 08:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TyQ+BRJV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gQL3Wg8W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16D7B2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pkjVkKxmbUsOdvmUjdWdthuT/7VfkCyC5rtQRscsWWs=; b=TyQ+BRJVP9d0z26FdHY2YigfR
	bCiHsrVFmJScZzEPUGqMiLiC+ohzp/fp0Q5a0Jlgwo5Cj4u8wVGoVgk4lfNBeRNaghn/QTPvb4HFd
	KEUCjJzp8xoECedD6bJe4yiiwnavvWo7AhSXvAAxnYgGIGfPJbA/5VlKuMIxrK8LfxatDwGwAqsPa
	cbN6gucukcolnc5cgN2k/4N2CI3ILBppulLs/Eh15bfIAKYXjZrPDM+9wQlnKiVK99EdtugF52HNa
	PgualHJs3WJp0qJDBGiVPaumMxlOhnPDxmsjWnBoYsSBgZQ2Nh+EU4yaX6xRBDrma/H40TpSn22HC
	+BpUrMZIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kETSY-0001tS-Vh; Sat, 05 Sep 2020 08:22:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kETSO-0001pI-16; Sat, 05 Sep 2020 08:21:57 +0000
X-UUID: 4911924f64d444628885534526d55069-20200905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=l8Aq+TVie3k2Aq8o0+LpX7YhzFPWXC7lxDHgVz1jlN4=; 
 b=gQL3Wg8WbG8/jggoXdOrLPoPN3xTLxt21G61uRrcHmHnWhpMDb35njxg4vGtyzxLEX25vON0g83dbYKl49shAS3UTpdejfVzBQZdzKa7FxRU65L87bthOJ++5ekqblxjjQxx0Lr1VbECd33/3k2paRy/4HJMU33LLQg3dLpLa4Q=;
X-UUID: 4911924f64d444628885534526d55069-20200905
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 129166209; Sat, 05 Sep 2020 00:21:52 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 01:13:34 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 16:13:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Sep 2020 16:13:31 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 15/23] iommu/mediatek: Add iova reserved function
Date: Sat, 5 Sep 2020 16:09:12 +0800
Message-ID: <20200905080920.13396-16-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200905080920.13396-1-yong.wu@mediatek.com>
References: <20200905080920.13396-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 72F648CDE297A7F1184FD55C1EE483861396E92899FD3A72EB0D9BDF248D4C5D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_042156_693275_85157ACC 
X-CRM114-Status: GOOD (  16.73  )
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

For multiple iommu_domains, we need to reserve some iova regions. Take a
example, If the default iova region is 0 ~ 4G, but the 0x4000_0000 ~
0x43ff_ffff is only for the special CCU0 domain. Thus we should exclude
this region for the default iova region.

This patch adds iova reserved flow. It's a preparing patch for supporting
multi-domain.

Signed-off-by: Anan sun <anan.sun@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 28 ++++++++++++++++++++++++++++
 drivers/iommu/mtk_iommu.h |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d22772ec64c8..5b63732044de 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -153,6 +153,11 @@ static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 
 #define for_each_m4u(data)	list_for_each_entry(data, &m4ulist, list)
 
+struct mtk_iommu_iova_region {
+	dma_addr_t		iova_base;
+	unsigned long long	size;
+};
+
 /*
  * There may be 1 or 2 M4U HWs, But we always expect they are in the same domain
  * for the performance.
@@ -539,6 +544,27 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	return iommu_fwspec_add_ids(dev, args->args, 1);
 }
 
+static void mtk_iommu_get_resv_regions(struct device *dev,
+				       struct list_head *head)
+{
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+	const struct mtk_iommu_iova_region *resv;
+	struct iommu_resv_region *region;
+	int prot = IOMMU_WRITE | IOMMU_READ;
+	unsigned int i;
+
+	for (i = 0; i < data->plat_data->iova_region_nr; i++) {
+		resv = data->plat_data->iova_region + i;
+
+		region = iommu_alloc_resv_region(resv->iova_base, resv->size,
+						 prot, IOMMU_RESV_RESERVED);
+		if (!region)
+			return;
+
+		list_add_tail(&region->list, head);
+	}
+}
+
 static const struct iommu_ops mtk_iommu_ops = {
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.domain_free	= mtk_iommu_domain_free,
@@ -553,6 +579,8 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.release_device	= mtk_iommu_release_device,
 	.device_group	= mtk_iommu_device_group,
 	.of_xlate	= mtk_iommu_of_xlate,
+	.get_resv_regions = mtk_iommu_get_resv_regions,
+	.put_resv_regions = generic_iommu_put_resv_regions,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ae7909815cdb..d45c13c9d324 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -44,10 +44,15 @@ enum mtk_iommu_plat {
 	M4U_MT8183,
 };
 
+struct mtk_iommu_iova_region;
+
 struct mtk_iommu_plat_data {
 	enum mtk_iommu_plat m4u_plat;
 	u32                 flags;
 	u32                 inv_sel_reg;
+
+	unsigned int        iova_region_nr;
+	const struct mtk_iommu_iova_region   *iova_region;
 	unsigned char       larbid_remap[MTK_LARB_COM_MAX][MTK_LARB_SUBCOM_MAX];
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
