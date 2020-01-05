Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9320CC33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 10:57:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 664E421582
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 10:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eU8Xa5kX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iyBV+01A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 664E421582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5KSIyjCaUTArq3rVkLU4d3DWGzbHrqGQ7VRu1J9/Ig=; b=eU8Xa5kX/vGzF9
	7E3TxW0LixxXmhLSmxmFD/OxD5i7IptGwIY5oqpA4xMWfm3Pm0oFL04OarL1YARRnrPcVn3yBA8j1
	Hhin64qCoILVsIaCHWz9JcdeMYWE5t06L//Sna7+FaqkJZBUh+XGtisQbLLjLHPwjP19MGQnKqI+X
	8PPM9EkIyCcJnKY9yopU9fTrY+gpRKK/CqMA2L6ocPbrKSS3jSsw/RXtXH2RXLAA+3psIIEzr4zi2
	EwcK+loX5jYUPcknfun4ZMLK8JnnD3u2m/Fe018/cmiSF+Rtbv9dsQ6+52CD93d3JgJeoBSZCGlbU
	IGB5fXGisrzFZk9qwdCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3b9-0004mM-Rw; Sun, 05 Jan 2020 10:57:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3aE-0003wY-Kv; Sun, 05 Jan 2020 10:56:36 +0000
X-UUID: 9eabf2949a5a493dbef7e7f700ff3345-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+LE4yOG5xJHtVPDk//airp4h3IFBZwCKdcOdUxeS8Ps=; 
 b=iyBV+01ANEfDe4/dQ6C9srt4DnNo+6AvjLgc0V2BPB8AtOyEwJUMdUJ6jhF1RLz2dbMs/hMBpI8D9nihX+DqKG7bB/8qhn+M6ruu2mLzAGKjy0mzLjXNSS2311vAcb8wNQknLaQ8wfbqBb+1dkRt9kwJgJE8sgaq2ZrJ+u+4JBo=;
X-UUID: 9eabf2949a5a493dbef7e7f700ff3345-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1830667580; Sun, 05 Jan 2020 02:56:31 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:47:37 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:40 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:37 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 13/19] iommu/mediatek: Add smi_larb info about device
Date: Sun, 5 Jan 2020 18:45:17 +0800
Message-ID: <20200105104523.31006-14-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_025634_690341_884AD8DC 
X-CRM114-Status: GOOD (  14.92  )
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

All the devices which used iommu are connected to SMI_larb port,
so when different devices driver execute initialization, iommu
can check larb_id and port_id to distinguish them and then make
them match to iommu_group accordingly. We also add dom_cnt variable
to describe the number of mtk_iommu_domain.

Larb_id and port_id define can refer to "mtxxxx-larb-port.h(ex:
mt6779-larb-port.h)" file

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 50 ++++++++++++++++++++++++++++++++-------
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bf781f4d7364..f2137033ec59 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -120,6 +120,7 @@ struct mtk_iommu_domain {
 struct mtk_iommu_pgtable {
 	struct io_pgtable_cfg	cfg;
 	struct io_pgtable_ops	*iop;
+	struct device		*init_dev;
 	struct list_head	m4u_dom_v2;
 };
 
@@ -171,22 +172,35 @@ static struct mtk_iommu_data *mtk_iommu_get_m4u_data(void)
 	return NULL;
 }
 
-static u32 get_domain_id(void)
+static u32 get_domain_id(struct mtk_iommu_data *data, u32 portid)
 {
-	/* only support one mtk_iommu_domain currently */
-	return 0;
+	u32 dom_id = 0;
+	int i;
+
+	/* only support one mtk_iommu_domain currently(dom_cnt = 1) */
+	for (i = 0; i < data->plat_data->dom_cnt; i++)
+		return i;
+
+	return dom_id;
 }
 
-static u32 mtk_iommu_get_domain_id(void)
+static u32 mtk_iommu_get_domain_id(struct device *dev)
 {
-	return get_domain_id();
+	struct iommu_fwspec *fwspec = dev->iommu_fwspec;
+	struct mtk_iommu_data *data = dev->iommu_fwspec->iommu_priv;
+	u32 portid = fwspec->ids[0];
+
+	return get_domain_id(data, portid);
 }
 
 static struct mtk_iommu_domain *get_mtk_domain(struct device *dev)
 {
 	struct mtk_iommu_data *data = dev->iommu_fwspec->iommu_priv;
 	struct mtk_iommu_domain *dom;
-	u32 domain_id = mtk_iommu_get_domain_id();
+	u32 domain_id = mtk_iommu_get_domain_id(dev);
+
+	if (domain_id >= data->plat_data->dom_cnt)
+		return NULL;
 
 	list_for_each_entry(dom, &data->pgtable->m4u_dom_v2, list) {
 		if (dom->id == domain_id)
@@ -425,11 +439,18 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
 	struct mtk_iommu_domain *dom;
+	struct device *dev;
 
 	if (type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
-	if (!pgtable) {
+	if (pgtable) {
+		dev = pgtable->init_dev;
+		if (!data->m4u_group) {
+			pr_err("%s, find m4u_group failed\n", __func__);
+			return NULL;
+		}
+	} else {
 		pr_err("%s, pgtable is not ready\n", __func__);
 		return NULL;
 	}
@@ -441,8 +462,11 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (iommu_get_dma_cookie(&dom->domain))
 		goto  free_dom;
 
+	dom->id = mtk_iommu_get_domain_id(dev);
+	if (dom->id >= data->plat_data->dom_cnt)
+		goto  put_dma_cookie;
+
 	dom->group = data->m4u_group;
-	dom->id = mtk_iommu_get_domain_id();
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = pgtable->cfg.pgsize_bitmap;
 
@@ -453,6 +477,8 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 
 	return &dom->domain;
 
+put_dma_cookie:
+	iommu_put_dma_cookie(&dom->domain);
 free_dom:
 	kfree(dom);
 	return NULL;
@@ -613,6 +639,10 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	} else {
 		iommu_group_ref_get(data->m4u_group);
 	}
+
+	/* save the latest init device */
+	pgtable->init_dev = dev;
+
 	return data->m4u_group;
 }
 
@@ -922,12 +952,14 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.has_vld_pa_rng   = true,
+	.dom_cnt = 1,
 	.larbid_remap[0] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
 
 static const struct mtk_iommu_plat_data mt6779_data = {
 	.m4u_plat = M4U_MT6779,
+	.dom_cnt = 1,
 	.larbid_remap[0] = {0, 1, 2, 3, 5, 7, 10, 9},
 	/* vp6a, vp6b, mdla/core2, mdla/edmc*/
 	.larbid_remap[1] = {2, 0, 3, 1},
@@ -943,6 +975,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 	.has_4gb_mode = true,
 	.has_bclk     = true,
 	.reset_axi    = true,
+	.dom_cnt = 1,
 	.larbid_remap[0] = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
@@ -950,6 +983,7 @@ static const struct mtk_iommu_plat_data mt8173_data = {
 static const struct mtk_iommu_plat_data mt8183_data = {
 	.m4u_plat     = M4U_MT8183,
 	.reset_axi    = true,
+	.dom_cnt = 1,
 	.larbid_remap[0] = {0, 4, 5, 6, 7, 2, 3, 1},
 	.inv_sel_reg = REG_MMU_INV_SEL,
 };
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index a3c598f99ed5..3a1c79222d09 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -47,6 +47,7 @@ struct mtk_iommu_plat_data {
 	bool                reset_axi;
 	bool                has_wr_len;
 	bool                has_misc_ctrl[2];
+	u32					dom_cnt;
 	u32                 m4u1_mask;
 	u32                 inv_sel_reg;
 	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
