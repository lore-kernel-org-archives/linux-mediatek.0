Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FF9C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:06:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7902560FC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7902560FC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erMnWORDERcZj2ARK0fS+5M83Bfb+oUUAASV6YflJAw=; b=Vys0A9rPgFLARM
	Ub63oWuRj1TVXOeeInRLvmCbNCyf/viqSVE0r4C7GThk30Fn95OVBWPdBOQpcLV92wl/FEYGc6aGh
	yHHFmxIU5CKCoxf0E+WviZmxqcqz+hREQBtpWk5QE1WNoQGhwtPpBMVCPkc4lyLjSDDEZ6i6NNJAd
	T/w5ibxdoskZ3LV7blXOZRyOjPt8WF6pFXLbiioeXynvM+2SDzlMMVUAa95rupG/KKm1+n5CzgvLX
	TK4NY1heM8efzN2jsuVysw/grgTrtM8cxMzMIROJYx5udiT4iq+AaqSc3IIeOPcbj0rYt5A7IVT8U
	zY60IS/V2tIOgDfMtX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERGO-00C0G0-BP; Fri, 13 Aug 2021 07:05:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mER8g-00BwGF-3g; Fri, 13 Aug 2021 06:58:01 +0000
X-UUID: 7d2f9fb2fd114986b5fe0d12e28a024c-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qsXhSIRyL891J2jA6IwEGw0SeOJ+T5m5p9xGAY2Z8hk=; 
 b=H/Z7K+6ofWYVNZS9OxyLuJSLOmhwesjKpXkzCxnUNueJZOI2SEKADasWwyH9xCAQjzxVGEGIVZUJIyHRng32lS5oRsZPDy3MukFSCuClN+Rv5mOWnEaqbjyr00cBUwGWfcCXB7HKztx0I231/jWmnDXxo93wuMRzmNpbRxaHPSI=;
X-UUID: 7d2f9fb2fd114986b5fe0d12e28a024c-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 793551225; Thu, 12 Aug 2021 23:57:47 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:55:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:55:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:55:18 +0800
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
Subject: [PATCH v2 12/29] iommu/mediatek: Always enable output PA over 32bits
 in isr
Date: Fri, 13 Aug 2021 14:53:07 +0800
Message-ID: <20210813065324.29220-13-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_235758_208973_AB96F45D 
X-CRM114-Status: GOOD (  13.95  )
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

Currently the output PA[32:33] is contained by the flag IOVA_34.
This is not right. the iova_34 has no relation with pa[32:33], the 32bits
iova still could map to pa[32:33]. Move it out from the flag.

No need fix tag since currently only mt8192 use the calulation and it
always has this IOVA_34 flag.

Prepare for the IOMMU that still use IOVA 32bits but its dram size may be
over 4GB.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index abc721a1da21..a831e56a90eb 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -297,11 +297,11 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	write = fault_iova & F_MMU_FAULT_VA_WRITE_BIT;
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, IOVA_34_EN)) {
 		va34_32 = FIELD_GET(F_MMU_INVAL_VA_34_32_MASK, fault_iova);
-		pa34_32 = FIELD_GET(F_MMU_INVAL_PA_34_32_MASK, fault_iova);
 		fault_iova = fault_iova & F_MMU_INVAL_VA_31_12_MASK;
 		fault_iova |= (u64)va34_32 << 32;
-		fault_pa |= (u64)pa34_32 << 32;
 	}
+	pa34_32 = FIELD_GET(F_MMU_INVAL_PA_34_32_MASK, fault_iova);
+	fault_pa |= (u64)pa34_32 << 32;
 
 	fault_port = F_MMU_INT_ID_PORT_ID(regval);
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM)) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
