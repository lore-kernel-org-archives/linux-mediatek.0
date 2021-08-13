Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A154C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:14:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E95360241
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E95360241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiJRyOfJeG++lkdF/d12gCfrfzPZInx8GOfNNAC9Gq4=; b=DExX+gh0esqJzh
	5S2vDQ3Jsss2c5HzriyUufMzWC8KXsBYE2hiG1b0jAPFYpYfwDUKOhs/ogh7QZkadVKS3VB6pqF5Y
	8A6yzH2X1mJOJSSlciXFNn/sOCiGxsS7rwQ5VyqG1PtdR/tl8q3osFVstjx7VDGFfVhSLY+0GRlB9
	ahiA1e2I7CZLc/WPjR9Y/sGCg0sCNpgvR0OolyUMAziKUDxDjaFvLw4ag8omBI6ThxHKoqZpKcfDi
	DHFxyPuwg/5hvr1dekXo/7c8SJ0kTs5j5j5AxSo6KI0KSi211TSL6rRd+gth4JflfZY+mM/ujpUC5
	/Vsg4pXaElH7+wINRgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERO5-00C3Pn-NS; Fri, 13 Aug 2021 07:13:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEREr-00Bzdj-BM; Fri, 13 Aug 2021 07:04:25 +0000
X-UUID: 6a828546c0c84ba6a24af5ffc3d0fde2-20210813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pgZsPtXfHvJ+Mkc6wToiirETSx1kKkB/LAdAk5dhPnE=; 
 b=ZesFGe+h17dq6Jykjsivuqk05veiZT6ny4PFB3YSRUO/seXjRTvdQcP3JjTqfNHDqJASHzGJwp2ez2lMLmo2jQnZW3p+ZTZs5iq3X1ewLFcMvAGeSyTZak05izwMYW/BtO2+GlrEfThbATzbd3HrwTPAHlSCROCeBJ5iDh/EaGY=;
X-UUID: 6a828546c0c84ba6a24af5ffc3d0fde2-20210813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 356258262; Fri, 13 Aug 2021 00:04:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:57:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:57:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:57:18 +0800
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
Subject: [PATCH v2 26/29] iommu/mediatek: Get the proper bankid for multi banks
Date: Fri, 13 Aug 2021 14:53:21 +0800
Message-ID: <20210813065324.29220-27-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_000421_452611_B1B31D4C 
X-CRM114-Status: GOOD (  23.79  )
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

We preassign some ports in a special bank via the new defined
bank_portmsk. Put it in the plat_data means it is not expected to be
adjusted dynamically.

If the iommu id in the iommu consumer's dtsi node is inside this
bank_portmsk, then we switch it to this special iommu bank, and initialise
the IOMMU bank HW.

Each a bank has the independent pgtable(4GB iova range). Each a bank
is a independent iommu domain/group. Currently we don't separate different
iova ranges inside a bank.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 38 +++++++++++++++++++++++++++++++++++---
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 29b9ab528774..ce83569eec21 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -358,6 +358,30 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static unsigned int mtk_iommu_get_bank_id(struct device *dev,
+					  const struct mtk_iommu_plat_data *plat_data)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	unsigned int i, portmsk = 0, bankid = 0; /* bank default is 0 */
+
+	if (plat_data->bank_nr == 1)
+		return bankid;
+
+	for (i = 0; i < fwspec->num_ids; i++)
+		portmsk |= BIT(MTK_M4U_TO_PORT(fwspec->ids[i]));
+
+	for (i = 0; i < plat_data->bank_nr; i++) {
+		if (!plat_data->bank_enable[i])
+			continue;
+
+		if (portmsk & plat_data->bank_portmsk[i]) {
+			bankid = i;
+			break;
+		}
+	}
+	return bankid;
+}
+
 static int mtk_iommu_get_iova_region_id(struct device *dev,
 					const struct mtk_iommu_plat_data *plat_data)
 {
@@ -516,13 +540,14 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	struct list_head *hw_list = data->hw_list;
 	struct mtk_iommu_bank_data *bank;
 	struct device *m4udev = data->dev;
-	unsigned int bankid = 0;
+	unsigned int bankid;
 	int ret, region_id;
 
 	region_id = mtk_iommu_get_iova_region_id(dev, data->plat_data);
 	if (region_id < 0)
 		return region_id;
 
+	bankid = mtk_iommu_get_bank_id(dev, data->plat_data);
 	bank = &data->bank[bankid];
 	if (!dom->bank) {
 		/* Data is in the frstdata in sharing pgtable case. */
@@ -653,6 +678,7 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	struct mtk_iommu_data *c_data = dev_iommu_priv_get(dev), *data;
 	struct list_head *hw_list = c_data->hw_list;
 	struct iommu_group *group;
+	unsigned int bankid, groupid;
 	int regionid;
 
 	data = mtk_iommu_get_frst_data(hw_list);
@@ -662,12 +688,18 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 	regionid = mtk_iommu_get_iova_region_id(dev, data->plat_data);
 	if (regionid < 0)
 		return ERR_PTR(regionid);
+	bankid = mtk_iommu_get_bank_id(dev, data->plat_data);
 
-	group = data->m4u_group[regionid];
+	/*
+	 * If the bank function is enabled, each a bank is a iommu group/domain.
+	 * otherwise, each a iova region is a iommu group/domain.
+	 */
+	groupid = bankid ? bankid : regionid;
+	group = data->m4u_group[groupid];
 	if (!group) {
 		group = iommu_group_alloc();
 		if (!IS_ERR(group))
-			data->m4u_group[regionid] = group;
+			data->m4u_group[groupid] = group;
 	} else {
 		iommu_group_ref_get(group);
 	}
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 7a8d6a233d14..905d8740dbcf 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -65,6 +65,7 @@ struct mtk_iommu_plat_data {
 
 	unsigned int        bank_nr;
 	bool                bank_enable[MTK_IOMMU_BANK_MAX];
+	unsigned int        bank_portmsk[MTK_IOMMU_BANK_MAX];
 	unsigned char       larbid_remap[MTK_LARB_COM_MAX][MTK_LARB_SUBCOM_MAX];
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
