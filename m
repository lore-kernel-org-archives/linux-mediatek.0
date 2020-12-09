Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2BFC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:15:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A3723B87
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40A3723B87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XEesunDv26/LjDCMfjl7S1Z/RUQ/Z5S8dgpcQY2PbYc=; b=fWEAF586ZN2qRUW3NSKqhjbb5
	uap1ybcHW3Sw5CerRZzjRj+unIEUVUjJkm6EK+siR0faepja3lsRsj0HGP3qEqHv5Aaj2MDZ3lBLO
	unmeqJ/Ap1v7qWgcChF//8CjiKlvgtMoli2fqwFkNxMnE4tKlMjuIsF9/JGuQx+Ha9fw+lBKPYDsi
	XlVgT6rWAiMH9QeyhlWInI7DV4OFQuKcFsJ4bFrZUP8kgvNn4cATZFFe0ZD0yMf6YZ28SJ80XuKCr
	AFaYW0T8vAw8K8Gx6i1P1rYWY2IvLMxM8zxhyeE5iSM6oU0314TAyhPeIArWsYLhiwZ/ff7IRHR5l
	MBOJDimvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmudS-0000Ir-CF; Wed, 09 Dec 2020 08:15:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmub0-00072X-EB; Wed, 09 Dec 2020 08:13:12 +0000
X-UUID: ced61be88cfc462482e475f951c4808d-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4d4uLILVbrwyusK3o+mf97swiCClzoil/1SLPy0dsdw=; 
 b=FYI7+rdIX+nPoFv/XEqtUIQtWyLMhBASAXmwDpBN2HdmYXgGLmiDAzeeEFeCXjZus23VFaSX8meOaD7rP3wCWyGW1DErfHd7+jXB/BJDFoz6N0VSEQ26YhCmM5fyX3JP9FuXPxTnJzKAgmFe+m5NpM6kmODDU0RrO97yB6S1liQ=;
X-UUID: ced61be88cfc462482e475f951c4808d-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1210267389; Wed, 09 Dec 2020 00:13:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:04:55 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:04:53 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:04:52 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 23/27] iommu/mediatek: Support report iova 34bit
 translation fault in ISR
Date: Wed, 9 Dec 2020 16:00:58 +0800
Message-ID: <20201209080102.26626-24-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_031310_781332_3EB7345E 
X-CRM114-Status: GOOD (  15.15  )
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

If the iova is over 32bit, the fault status register bit is a little
different.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 164479e1f5c5..ed771133643d 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015-2016 MediaTek Inc.
  * Author: Yong Wu <yong.wu@mediatek.com>
  */
+#include <linux/bitfield.h>
 #include <linux/bug.h>
 #include <linux/clk.h>
 #include <linux/component.h>
@@ -89,6 +90,9 @@
 #define F_REG_MMU1_FAULT_MASK			GENMASK(13, 7)
 
 #define REG_MMU0_FAULT_VA			0x13c
+#define F_MMU_INVAL_VA_31_12_MASK		GENMASK(31, 12)
+#define F_MMU_INVAL_VA_34_32_MASK		GENMASK(11, 9)
+#define F_MMU_INVAL_PA_34_32_MASK		GENMASK(8, 6)
 #define F_MMU_FAULT_VA_WRITE_BIT		BIT(1)
 #define F_MMU_FAULT_VA_LAYER_BIT		BIT(0)
 
@@ -264,8 +268,9 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 {
 	struct mtk_iommu_data *data = dev_id;
 	struct mtk_iommu_domain *dom = data->m4u_dom;
-	u32 int_state, regval, fault_iova, fault_pa;
 	unsigned int fault_larb, fault_port, sub_comm = 0;
+	u32 int_state, regval, va34_32, pa34_32;
+	u64 fault_iova, fault_pa;
 	bool layer, write;
 
 	/* Read error info from registers */
@@ -281,6 +286,14 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	}
 	layer = fault_iova & F_MMU_FAULT_VA_LAYER_BIT;
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN)) {
+		va34_32 = FIELD_GET(F_MMU_INVAL_VA_34_32_MASK, fault_iova);
+		pa34_32 = FIELD_GET(F_MMU_INVAL_PA_34_32_MASK, fault_iova);
+		fault_iova = fault_iova & F_MMU_INVAL_VA_31_12_MASK;
+		fault_iova |=  (u64)va34_32 << 32;
+		fault_pa |= (u64)pa34_32 << 32;
+	}
+
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM)) {
 		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
@@ -294,7 +307,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			data->dev,
-			"fault type=0x%x iova=0x%x pa=0x%x larb=%d port=%d layer=%d %s\n",
+			"fault type=0x%x iova=0x%llx pa=0x%llx larb=%d port=%d layer=%d %s\n",
 			int_state, fault_iova, fault_pa, fault_larb, fault_port,
 			layer, write ? "write" : "read");
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
