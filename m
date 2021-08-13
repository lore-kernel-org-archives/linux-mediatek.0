Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3271FC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:20:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB936104F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEB936104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EW8ZDhVQem2ZfQavH4UCVsmi2giEiB3ZZlSctrBMvig=; b=cidGo/2+IHwHu/
	k3RkGQgK5+DnIQwtnoTsFvu7RzR+rfrz3qAzmtLyG4wF2vGvOYp5Zb0vGpMkQ3IB2vcyJpU3UYBf0
	MjXOFA9u7X498X/NHa50pmJdEn1GXPQaFZ7/cxGFgndvJYTdhgy3Rj8FNVlMNzYi9B91Fw7xEPJDV
	zXOtjrdjbYkwP2Yl11tvJqNU9DWFaTqG5ESNp9NDxev7cRGe/h8v9n5vKwQo/yJbO+TZtg/xKeLKQ
	l1yatA5NZbfeU5nWX20fikxK0/w9744G5MfB67MJFBJKyJ52Lg2c0d0QK50viTwR8qS1HpMrmmb1K
	10kOTzDMH4f755y0ATXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERTz-00C5xW-Gx; Fri, 13 Aug 2021 07:19:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mERF2-00Bzdj-Sh; Fri, 13 Aug 2021 07:04:36 +0000
X-UUID: 2f31484b026841fea5c594223fcdd386-20210813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5cdsTP3Pf5Zzwbo8fKFch8LP9CkUEczBm9daCI/d6ms=; 
 b=sPBCKEsUwQGaW7SCM3C/3A/FbnR4j5yn1n4opyLXMaaSrpC3nvZHaJOHYivE2g/gtbSOPrtBIsyRERyQ7TijUaDCFEWEn3gHo8BhPpv5jyZTIL//YS26GYuWBfNuKbXLOT/G2IvPtz6XnFJi1Skc38I62mDS/Rdq79ia6QB+w7o=;
X-UUID: 2f31484b026841fea5c594223fcdd386-20210813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1252039677; Fri, 13 Aug 2021 00:04:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:55:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:55:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:55:47 +0800
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
Subject: [PATCH v2 17/29] iommu/mediatek: Add infra iommu support
Date: Fri, 13 Aug 2021 14:53:12 +0800
Message-ID: <20210813065324.29220-18-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_000433_070411_ACDDA1B2 
X-CRM114-Status: GOOD (  21.55  )
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

The infra iommu enable bits in mt8195 is in the pericfg register segment,
use regmap to update it.

If infra iommu master translation fault, It don't have the larbid/portid,
thus print out the whole register value.

Since regmap_update_bits may fail, add return value for mtk_iommu_config.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 36 +++++++++++++++++++++++++++++-------
 drivers/iommu/mtk_iommu.h |  3 +++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index a72241724adb..45b34f4e99fb 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -113,6 +113,8 @@
 
 #define MTK_PROTECT_PA_ALIGN			256
 
+#define PERICFG_IOMMU_1				0x714
+
 #define HAS_4GB_MODE			BIT(0)
 /* HW will use the EMI clock if there isn't the "bclk". */
 #define HAS_BCLK			BIT(1)
@@ -332,8 +334,8 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			data->dev,
-			"fault type=0x%x iova=0x%llx pa=0x%llx larb=%d port=%d layer=%d %s\n",
-			int_state, fault_iova, fault_pa, fault_larb, fault_port,
+			"fault type=0x%x iova=0x%llx pa=0x%llx master=0x%x(larb=%d port=%d) layer=%d %s\n",
+			int_state, fault_iova, fault_pa, regval, fault_larb, fault_port,
 			layer, write ? "write" : "read");
 	}
 
@@ -377,14 +379,15 @@ static int mtk_iommu_get_domain_id(struct device *dev,
 	return -EINVAL;
 }
 
-static void mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
-			     bool enable, unsigned int domid)
+static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
+			    bool enable, unsigned int domid)
 {
 	struct mtk_smi_larb_iommu    *larb_mmu;
 	unsigned int                 larbid, portid;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	const struct mtk_iommu_iova_region *region;
-	int i;
+	u32 peri_mmuen, peri_mmuen_msk;
+	int i, ret = 0;
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
 		larbid = MTK_M4U_TO_LARB(fwspec->ids[i]);
@@ -404,8 +407,19 @@ static void mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
 			else
 				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
+		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
+			peri_mmuen_msk = BIT(portid);
+			peri_mmuen = enable ? peri_mmuen_msk : 0;
+
+			ret = regmap_update_bits(data->pericfg, PERICFG_IOMMU_1,
+						 peri_mmuen_msk, peri_mmuen);
+			if (ret)
+				dev_err(dev, "%s iommu(%s) inframaster 0x%x fail(%d).\n",
+					enable ? "enable" : "disable",
+					dev_name(data->dev), peri_mmuen_msk, ret);
 		}
 	}
+	return ret;
 }
 
 static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
@@ -518,8 +532,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 		pm_runtime_put(m4udev);
 	}
 
-	mtk_iommu_config(data, dev, true, domid);
-	return 0;
+	return mtk_iommu_config(data, dev, true, domid);
 }
 
 static void mtk_iommu_detach_device(struct iommu_domain *domain,
@@ -940,6 +953,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		ret = mtk_iommu_mm_dts_parse(dev, &match, data);
 		if (ret)
 			goto out_runtime_disable;
+	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
+		   data->plat_data->pericfg_comp_str) {
+		infracfg = syscon_regmap_lookup_by_compatible(data->plat_data->pericfg_comp_str);
+		if (IS_ERR(infracfg)) {
+			ret = PTR_ERR(infracfg);
+			goto out_runtime_disable;
+		}
+
+		data->pericfg = infracfg;
 	}
 
 	platform_set_drvdata(pdev, data);
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 5b32277fee99..676d306af046 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -55,6 +55,7 @@ struct mtk_iommu_plat_data {
 	u32                 flags;
 	u32                 inv_sel_reg;
 
+	char					*pericfg_comp_str;
 	struct list_head			*hw_list;
 	unsigned int				iova_region_nr;
 	const struct mtk_iommu_iova_region	*iova_region;
@@ -80,6 +81,8 @@ struct mtk_iommu_data {
 	struct device			*smicomm_dev;
 
 	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
+	struct regmap			*pericfg;
+
 
 	/*
 	 * In the sharing pgtable case, list data->list to the global list like m4ulist.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
