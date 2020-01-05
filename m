Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF81C33C8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:00:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBBBC21582
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 11:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJunJqwQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BGXoRFP4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBBBC21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ebAq+mNW/8Or1ODVP3Er/qia7TDE3s6K/ljmOtbrhLU=; b=cJunJqwQX4HTZJ
	31rADDRueLw3gzd5MfnFl7EEByusELenJ+haxuEzJ0GkzLQbV0Ldrvplaq4fFG4CDH8mC9x9LoGfB
	AokfOZW27LvPd+Uft+35GHi0z2WWeJ8rLtMqtpz5PIJZ57+YW4k1ZRpKZbeR0frlNKjbndh/UDOBc
	CgNg0RoFOMEBYoNjuabB/8lZY8tZ8SMvnJNhyR4J3+pVvSIuwBtOufZ+REJv97fccwsBi7LVzQnhM
	CoYqgGCDRYCeOmLVFB/os53nYp3ADn10estqY0vjve1bXH6p6b7x9+gjLzs0yXgRIVVqPsA4724xz
	mIiX1qYHi3vbDv4m36qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1io3eG-0000Mv-PW; Sun, 05 Jan 2020 11:00:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1io3aM-0003wY-G7; Sun, 05 Jan 2020 10:56:44 +0000
X-UUID: d4aa83f2fb484c1c931b68072be03485-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=19qaQnoV6yRHuMfo5UJqrDyTeI5nPaBleiGqUf3+VGg=; 
 b=BGXoRFP4UuLfzvDZyTPJUNam8T/ysEt6P5xpjK4NAwInyvL10d7QjbMjKt7NvN/+WIHG1hUbWb1tFui1p+YcIvjw8mTWn3m91APxc02Hvr7JtvuOi1GiM9YltcIfy38qVspqQwxUVCpKR12C/z4PW71k4Lha7QiXjUnEESoHNg4=;
X-UUID: d4aa83f2fb484c1c931b68072be03485-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 449201745; Sun, 05 Jan 2020 02:56:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 02:47:45 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:49 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:47 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v2 17/19] iommu/mediatek: Add iova reserved function
Date: Sun, 5 Jan 2020 18:45:21 +0800
Message-ID: <20200105104523.31006-18-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_025642_575131_CA8A30AC 
X-CRM114-Status: GOOD (  11.79  )
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

For multiple iommu_domains, we need to reserve some iova
regions, so we will add mtk_iommu_resv_iova_region structure.
It includes the start address and size of iova and iommu_resv_type.
Based on the function, we will realize multiple mtk_iommu_domains

Signed-off-by: Anan Sun <anan.sun@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 47 +++++++++++++++++++++++++++++++++++++++
 drivers/iommu/mtk_iommu.h | 12 ++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 9a7f2a388e3e..ac658fa16136 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -691,6 +691,51 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	return iommu_fwspec_add_ids(dev, args->args, 1);
 }
 
+/* reserve/dir-map iova region */
+static void mtk_iommu_get_resv_regions(struct device *dev,
+				       struct list_head *head)
+{
+	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
+	unsigned int i, total_cnt = data->plat_data->resv_cnt;
+	const struct mtk_iommu_resv_iova_region *resv_data;
+	struct iommu_resv_region *region;
+	unsigned long base = 0;
+	size_t size = 0;
+	int prot = IOMMU_WRITE | IOMMU_READ;
+
+	resv_data = data->plat_data->resv_region;
+
+	for (i = 0; i < total_cnt; i++) {
+		size = 0;
+		if (resv_data[i].iova_size) {
+			base = (unsigned long)resv_data[i].iova_base;
+			size = resv_data[i].iova_size;
+		}
+		if (!size)
+			continue;
+
+		region = iommu_alloc_resv_region(base, size, prot,
+						 resv_data[i].type);
+		if (!region)
+			return;
+
+		list_add_tail(&region->list, head);
+
+		dev_dbg(data->dev, "%s iova 0x%x ~ 0x%x\n",
+			(resv_data[i].type == IOMMU_RESV_DIRECT) ? "dm" : "rsv",
+			(unsigned int)base, (unsigned int)(base + size - 1));
+	}
+}
+
+static void mtk_iommu_put_resv_regions(struct device *dev,
+				       struct list_head *head)
+{
+	struct iommu_resv_region *entry, *next;
+
+	list_for_each_entry_safe(entry, next, head, list)
+		kfree(entry);
+}
+
 static const struct iommu_ops mtk_iommu_ops = {
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.domain_free	= mtk_iommu_domain_free,
@@ -705,6 +750,8 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.remove_device	= mtk_iommu_remove_device,
 	.device_group	= mtk_iommu_device_group,
 	.of_xlate	= mtk_iommu_of_xlate,
+	.get_resv_regions = mtk_iommu_get_resv_regions,
+	.put_resv_regions = mtk_iommu_put_resv_regions,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index a38b26018abe..7f4d498ec5f6 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -36,6 +36,12 @@ enum mtk_iommu_plat {
 	M4U_MT8183,
 };
 
+struct mtk_iommu_resv_iova_region {
+	dma_addr_t		iova_base;
+	size_t			iova_size;
+	enum iommu_resv_type	type;
+};
+
 /*
  * reserved IOVA Domain for IOMMU users of HW limitation.
  */
@@ -68,6 +74,12 @@ struct mtk_iommu_plat_data {
 	u32                 inv_sel_reg;
 	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
 	const struct mtk_domain_data	*dom_data;
+	/*
+	 * reserve/dir-mapping iova region data
+	 * todo: for different reserve needs on multiple iommu domains
+	 */
+	const unsigned int  resv_cnt;
+	const struct mtk_iommu_resv_iova_region *resv_region;
 };
 
 struct mtk_iommu_domain;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
