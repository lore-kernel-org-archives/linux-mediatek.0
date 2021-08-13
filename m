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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179C6C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2BD6056B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB2BD6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+tMLa3+dKidfoLvgmCx5CAvOe7ovkSldP1ofnoVV+o=; b=uJFmQkI93N39Mg
	ShQBBz58LLt93T6ez7X6aScIvSRm3I7MqjcqM73zQ8WPcoutRiebW3gN9KuLDvD+UaonUpdInbYiD
	fdMkul9x1TVwlytCtvD82YKa7iihe3+e2BasOFHNeZG+7Yge5HCJupy8mjEg9Iy6LkE4TjwpAOZjC
	uT7Q0oQRQ1ena3ekXGDcpDvxYWC1vXC0+Whasft87oD2XwbCbHQBJ7oCI/55b+mYJUoVNRIN+8PhG
	iSVchDIt9KqMb/sx6qtgdy2PxZLNQInB9Tgw4skaQaLLxIc6268EGykJjyPz0c/nEobgFTi2zbpJk
	98dO/PxmSTFLxH/q9UQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEREy-00BzhV-JL; Fri, 13 Aug 2021 07:04:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mER8d-00BwFV-84; Fri, 13 Aug 2021 06:57:59 +0000
X-UUID: a68329b4e24e41edae44e851c018fa6c-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9JjwAkGwXJvnAR2ga2V8V8DDNpyvXrMGAIKrj0xnGPA=; 
 b=MdpbzdasaPh/yaDqPFaGF0R1cUf38D0hwj3dbFy3MKJpHg3i/tJ5ELcJgDobtFCViprhbeX/cF7DhpWOWSBkg5cqJGdk/h/nGoAg5GIFYREHfLbSCegdHiWP00odawNuiEftHfT3iNnxCC+L3iM86/dHBW6s0CXCBavm/DCCva8=;
X-UUID: a68329b4e24e41edae44e851c018fa6c-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 965606597; Thu, 12 Aug 2021 23:57:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:56:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:56:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:56:07 +0800
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
Subject: [PATCH v2 19/29] iommu/mediatek: Add mt8195 support
Date: Fri, 13 Aug 2021 14:53:14 +0800
Message-ID: <20210813065324.29220-20-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_235755_361202_C41BC209 
X-CRM114-Status: GOOD (  13.06  )
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

mt8195 has 3 IOMMU, containing 2 MM IOMMUs, one is for vdo, the other
is for vpp. and 1 INFRA IOMMU.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 42 +++++++++++++++++++++++++++++++++++++++
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 43 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b7a31f3a1bcf..d7eec20f0476 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1168,6 +1168,45 @@ static const struct mtk_iommu_plat_data mt8192_data = {
 			   {0, 14, 16}, {0, 13, 18, 17}},
 };
 
+static const struct mtk_iommu_plat_data mt8195_data_infra = {
+	.m4u_plat	  = M4U_MT8195,
+	.flags            = WR_THROT_EN | DCM_DISABLE |
+			    MTK_IOMMU_TYPE_INFRA | IFA_IOMMU_PCIe_SUPPORT,
+	.pericfg_comp_str = "mediatek,mt8195-pericfg_ao",
+	.inv_sel_reg      = REG_MMU_INV_SEL_GEN2,
+	.iova_region      = single_domain,
+	.iova_region_nr   = ARRAY_SIZE(single_domain),
+};
+
+static const struct mtk_iommu_plat_data mt8195_data_vdo = {
+	.m4u_plat	= M4U_MT8195,
+	.flags          = HAS_BCLK | HAS_SUB_COMM_2BITS | OUT_ORDER_WR_EN |
+			  WR_THROT_EN | NOT_STD_AXI_MODE | IOVA_34_EN |
+			  SHARE_PGTABLE | MTK_IOMMU_TYPE_MM,
+	.hw_list        = &m4ulist,
+	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
+	.iova_region	= mt8192_multi_dom,
+	.iova_region_nr	= ARRAY_SIZE(mt8192_multi_dom),
+	.larbid_remap   = {{2, 0}, {21}, {24}, {7}, {19}, {9, 10, 11},
+			   {13, 17, 15/* 17b */, 25}, {5}},
+};
+
+static const struct mtk_iommu_plat_data mt8195_data_vpp = {
+	.m4u_plat	= M4U_MT8195,
+	.flags          = HAS_BCLK | HAS_SUB_COMM_3BITS | OUT_ORDER_WR_EN |
+			  WR_THROT_EN | NOT_STD_AXI_MODE | IOVA_34_EN |
+			  SHARE_PGTABLE | MTK_IOMMU_TYPE_MM,
+	.hw_list        = &m4ulist,
+	.inv_sel_reg    = REG_MMU_INV_SEL_GEN2,
+	.iova_region	= mt8192_multi_dom,
+	.iova_region_nr	= ARRAY_SIZE(mt8192_multi_dom),
+	.larbid_remap   = {{1}, {3}, {22, 0, 0, 0, 23}, {8},
+			   {20}, {12},
+			   /* 16: 16a; 29: 16b; 30: CCUtop0; 31: CCUtop1 */
+			   {14, 16, 29, 26, 30, 31, 18},
+			   {4, 0, 0, 0, 6}},
+};
+
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
@@ -1175,6 +1214,9 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
+	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
+	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
+	{ .compatible = "mediatek,mt8195-iommu-vpp",   .data = &mt8195_data_vpp},
 	{}
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 676d306af046..e7ede1123624 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -46,6 +46,7 @@ enum mtk_iommu_plat {
 	M4U_MT8173,
 	M4U_MT8183,
 	M4U_MT8192,
+	M4U_MT8195,
 };
 
 struct mtk_iommu_iova_region;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
