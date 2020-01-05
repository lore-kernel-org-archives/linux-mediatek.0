Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79A3C33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD6421582
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uLzIVyKZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YlkRYlye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CD6421582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/C32h5tU7C39zvz9vWN7imnWY7KZ/nMEUVm+v+yW1E=; b=uLzIVyKZVD7hE1
	btmf6gfT9aigxk8bsXbXg2g8XZNuFh0qs3L2FzM629QWBIVEUGE0DOv0syLjkt5eGP0Xsy4WK5SWI
	StfRYCZmcI408RCEJhafppsdaz4TfnxodxErD4cxx/US+qbirBC2k1paj6mDgV41bpRYPXkit1C14
	7IDBW8lyxmeWEyOlH8eFwUeepvZkXixmq18hVXx/cLHkp/CFVAwylFMqXNSkmKaakKEtlgGmsuUBw
	Xc3ORCyJW+4nzFPs8Cx5FKheXxQr2e4zGom+lsJXnZkGToJi+2Eu4tBA7Kc3cO4Q5d5LPruvP698l
	QwWM1r1Z6RLASZu5juMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3eJ-0000RE-LC; Sun, 05 Jan 2020 11:00:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3aK-0003wY-Fm; Sun, 05 Jan 2020 10:56:42 +0000
X-UUID: 5c2d4de6f08d4275a89db8007045b9fb-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RY4rn8CmqW4ONHcTdtNSN9a7ZN574snyp8h6PCSTtUE=; 
 b=YlkRYlyegs1C8Qp4YMq74fB39w8U9/CVVxf2CcESaJGqEWICqFPXfIuu8nB6hvVp/K7LZudwZT7XrY0KKNdV2UVfHY34m+i/DEmORy6yh7SNQBOJv1CCuynzCtDFYFjUGCJmybjmlbiIhnuOR1nPZL4Yo70C3ibQ8lTeqk/twes=;
X-UUID: 5c2d4de6f08d4275a89db8007045b9fb-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 380921300; Sun, 05 Jan 2020 02:56:33 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:47:25 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:32 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:27 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 09/19] iommu/mediatek: Add mtk_iommu_pgtable structure
Date: Sun, 5 Jan 2020 18:45:13 +0800
Message-ID: <20200105104523.31006-10-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_025640_651289_086C2944 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Cui Zhang <zhang.cui@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Start with this patch, we will change the SW architecture
to support multiple domains. SW architecture will has a big change,
so we need to modify a little bit by more than one patch.
The new SW overall architecture is as below:

				iommu0   iommu1
				  |	    |
				  -----------
					|
				mtk_iommu_pgtable
					|
			------------------------------------------
			|		     |			 |
		mtk_iommu_domain1   mtk_iommu_domain2  mtk_iommu_domain3
			|                    |                   |
		iommu_group1         iommu_group2           iommu_group3
			|                    |                   |
		iommu_domain1       iommu_domain2	    iommu_domain3
			|                    |                   |
		iova region1(normal)  iova region2(CCU)    iova region3(VPU)

For current structure, no matter how many iommus there are,
they use the same page table to simplify the usage of module.
In order to make the software architecture more explicit, this
patch will create a global mtk_iommu_pgtable structure to describe
page table and all the iommus use it.
The diagram is as below:

	mtk_iommu_data1(MM)       mtk_iommu_data2(APU)
		|			   |
		|			   |
		------mtk_iommu_pgtable-----

We need to create global mtk_iommu_pgtable to include all the iova
regions firstly and special iova regions by divided based on it,
so the information of pgtable needs to be created in device_group.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 84 +++++++++++++++++++++++++++++++++++++++
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 7829d1fd08dd..50c6a01eb517 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -117,6 +117,12 @@ struct mtk_iommu_domain {
 	struct iommu_domain		domain;
 };
 
+struct mtk_iommu_pgtable {
+	struct io_pgtable_cfg	cfg;
+	struct io_pgtable_ops	*iop;
+};
+
+static struct mtk_iommu_pgtable *share_pgtable;
 static const struct iommu_ops mtk_iommu_ops;
 
 /*
@@ -164,6 +170,11 @@ static struct mtk_iommu_data *mtk_iommu_get_m4u_data(void)
 	return NULL;
 }
 
+static struct mtk_iommu_pgtable *mtk_iommu_get_pgtable(void)
+{
+	return share_pgtable;
+}
+
 static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 {
 	return container_of(dom, struct mtk_iommu_domain, domain);
@@ -316,6 +327,13 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 {
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 
+	if (data->pgtable) {
+		dom->cfg = data->pgtable->cfg;
+		dom->iop = data->pgtable->iop;
+		dom->domain.pgsize_bitmap = data->pgtable->cfg.pgsize_bitmap;
+		return 0;
+	}
+
 	dom->cfg = (struct io_pgtable_cfg) {
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
 			IO_PGTABLE_QUIRK_NO_PERMS |
@@ -339,6 +357,61 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 	return 0;
 }
 
+static struct mtk_iommu_pgtable *create_pgtable(struct mtk_iommu_data *data)
+{
+	struct mtk_iommu_pgtable *pgtable;
+
+	pgtable = kzalloc(sizeof(*pgtable), GFP_KERNEL);
+	if (!pgtable)
+		return ERR_PTR(-ENOMEM);
+
+	pgtable->cfg = (struct io_pgtable_cfg) {
+		.quirks = IO_PGTABLE_QUIRK_ARM_NS |
+			IO_PGTABLE_QUIRK_NO_PERMS |
+			IO_PGTABLE_QUIRK_TLBI_ON_MAP |
+			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
+		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
+		.ias = 32,
+		.oas = 34,
+		.tlb = &mtk_iommu_flush_ops,
+		.iommu_dev = data->dev,
+	};
+
+	pgtable->iop = alloc_io_pgtable_ops(ARM_V7S, &pgtable->cfg, data);
+	if (!pgtable->iop) {
+		dev_err(data->dev, "Failed to alloc io pgtable\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	dev_info(data->dev, "%s create pgtable done\n", __func__);
+
+	return pgtable;
+}
+
+static int mtk_iommu_attach_pgtable(struct mtk_iommu_data *data,
+				    struct device *dev)
+{
+	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
+
+	/* create share pgtable */
+	if (!pgtable) {
+		pgtable = create_pgtable(data);
+		if (IS_ERR(pgtable)) {
+			dev_err(data->dev, "Failed to create pgtable\n");
+			return -ENOMEM;
+		}
+
+		share_pgtable = pgtable;
+	}
+
+	/* binding to pgtable */
+	data->pgtable = pgtable;
+
+	dev_info(data->dev, "m4u%d attach_pgtable done!\n", data->m4u_id);
+
+	return 0;
+}
+
 static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 {
 	struct mtk_iommu_domain *dom;
@@ -502,10 +575,21 @@ static void mtk_iommu_remove_device(struct device *dev)
 static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 {
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	struct mtk_iommu_pgtable *pgtable;
+	int ret = 0;
 
 	if (!data)
 		return ERR_PTR(-ENODEV);
 
+	pgtable = data->pgtable;
+	if (!pgtable) {
+		ret = mtk_iommu_attach_pgtable(data, dev);
+		if (ret) {
+			dev_err(data->dev, "Failed to device_group\n");
+			return NULL;
+		}
+	}
+
 	/* All the client devices are in the same m4u iommu-group */
 	if (!data->m4u_group) {
 		data->m4u_group = iommu_group_alloc();
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 2b207dcadd06..a3c598f99ed5 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -61,6 +61,7 @@ struct mtk_iommu_data {
 	struct clk			*bclk;
 	phys_addr_t			protect_base; /* protect memory base */
 	struct mtk_iommu_suspend_reg	reg;
+	struct mtk_iommu_pgtable	*pgtable;
 	struct mtk_iommu_domain		*m4u_dom;
 	struct iommu_group		*m4u_group;
 	bool                            enable_4GB;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
