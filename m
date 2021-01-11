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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D89C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:33:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF4FE224B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF4FE224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ea6AMLnW+hlndIut02QrIC2v/LM/VorPbg23fQwNCug=; b=tuVsCuQw7rCT8DqhSBmmxYwbh
	BLG81ICUAAhtPIZQZa9G+VV6R1o9UOr5KsuJ3b3+cqHtsOfwelKWWqtKeqRhIGJ1IIl74+aJTSiAf
	4jv4oyw8n/E4tMphoNXevIPXBri5a/nRvhpPAQdhtAg7Uq9y0i+/hbxR+HjS6CmY2XcXZBf4eLAbX
	mgo2fgfHHYPYIfzSbbn6KuYF9CLQYmmdIEd7MC216nX8EsSxAyKYKJj68jZhIokPL29TvFCj8IqaB
	eRg8443WNFutV/SiyD2lJwGF/JT4YgJ1XA9RCsW5YV4WpGfMD2ZdPT2jpTQ5cDxjxQZbllk24+4kt
	FgL2xSZ7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvRl-0006mP-EK; Mon, 11 Jan 2021 11:33:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvPD-000558-5L; Mon, 11 Jan 2021 11:30:42 +0000
X-UUID: 341904fc6a3740f79921262bd9598104-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7H2ak+CO7sJVjVoez/tOeSnzWVd3tqv4/qUfgfh69ek=; 
 b=X1hgAW8NOC8XFi+d+uhFhKMy3qF/bAv4QjgPnIKhUveBwWZnqaNf5mk8U+u+g1R6v2+Z8tTS5CdKq52BP1MjUFK9rED9dMVjBeLFRA4byRGN0d64AbdOspwdhO6fliwzGdwg/4aM5MKL+fflESo/kpxRm8DD9y78W4cQZkHHODs=;
X-UUID: 341904fc6a3740f79921262bd9598104-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1265778793; Mon, 11 Jan 2021 03:30:24 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:23:54 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:23:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:23:51 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 29/33] iommu/mediatek: Add iova reserved function
Date: Mon, 11 Jan 2021 19:19:10 +0800
Message-ID: <20210111111914.22211-30-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_063039_428337_CE64C1F5 
X-CRM114-Status: GOOD (  16.87  )
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

For multiple iommu_domains, we need to reserve some iova regions. Take a
example, If the default iova region is 0 ~ 4G, but the 0x4000_0000 ~
0x43ff_ffff is only for the special CCU0 domain. Thus we should exclude
this region for the default iova region.

Signed-off-by: Anan sun <anan.sun@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b42fd2535b77..764dc0b93477 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -626,6 +626,35 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	return iommu_fwspec_add_ids(dev, args->args, 1);
 }
 
+static void mtk_iommu_get_resv_regions(struct device *dev,
+				       struct list_head *head)
+{
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
+	const struct mtk_iommu_iova_region *resv, *curdom;
+	struct iommu_resv_region *region;
+	int prot = IOMMU_WRITE | IOMMU_READ;
+
+	if (domid < 0)
+		return;
+	curdom = data->plat_data->iova_region + domid;
+	for (i = 0; i < data->plat_data->iova_region_nr; i++) {
+		resv = data->plat_data->iova_region + i;
+
+		/* Only reserve when the region is inside the current domain */
+		if (resv->iova_base <= curdom->iova_base ||
+		    resv->iova_base + resv->size >= curdom->iova_base + curdom->size)
+			continue;
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
@@ -641,6 +670,8 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.release_device	= mtk_iommu_release_device,
 	.device_group	= mtk_iommu_device_group,
 	.of_xlate	= mtk_iommu_of_xlate,
+	.get_resv_regions = mtk_iommu_get_resv_regions,
+	.put_resv_regions = generic_iommu_put_resv_regions,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
