Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D51C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 04:53:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54B820772
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 04:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zhccM5LN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i+WotpsI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54B820772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lEVDhzob+FyHmpEJFuSpbw6baC74VZ7M556Jo70YqzA=; b=zhccM5LNQGnGNefHqsXMtsV2/
	mZIswEvnHxw6xlWU+OAei5YhC0GzVXagURinDj6wwqEFeI8bVCLeEIzdC9pmEgv2WdigTnNPGmJsK
	ryyVg4oIUA7bhkAi8jQNzlR5xGmbLob6m/BCcuRkqw/egJrsyMJLmq/2QOTnjbeG0/ovx1wSQfNUE
	D8+de3/zWQNjsSZf7wqhDLzSOyc9ZlAdRcI5bVTIWwThAnjQvdjqCvzzVthCTjlvHWYNgx4sgZDVi
	A4OzmZbLdXy4shhc6t+0ojXoyde/eDSqub97mSh6vf0SYRjJs3qllc5atn/CMF9yvrVCBYpQgsVPS
	tdfQWghdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrDhM-00052N-Qm; Fri, 03 Jul 2020 04:53:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrDh5-0004rc-0B; Fri, 03 Jul 2020 04:53:00 +0000
X-UUID: 31d1f5286b9c4e20ba6f320cb30c4e8d-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=63JZsqC6w//8CgJm6fa1lmJ7QHbUUzma+Qf01H5Anv8=; 
 b=i+WotpsI7HdK4isZaSxpRtPh1zoNZNcC+/eE/SOlSaBAZLagSCkYmI/71MnpdKnDZPlS/NWNiqd4GuPUIm679uVuxi7lCxmj0rJ9NpqTHLzN/MJgpiknXRM8PUijDmagOTuo/qdMcOemv/YCl5D5r3iTuLswVwyh/dipW9Ae9xc=;
X-UUID: 31d1f5286b9c4e20ba6f320cb30c4e8d-20200702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2132163733; Thu, 02 Jul 2020 20:52:51 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 21:42:54 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 12:42:53 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 12:42:49 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v6 09/10] iommu/mediatek: Modify MMU_CTRL register setting
Date: Fri, 3 Jul 2020 12:41:26 +0800
Message-ID: <20200703044127.27438-10-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200703044127.27438-1-chao.hao@mediatek.com>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_005259_354193_DE64A5F3 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 TH Yang <th.yang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MMU_CTRL register of MT8173 is different from other SoCs.
The in_order_wr_en is bit[9] which is zero by default.
Other SoCs have the vitcim_tlb_en feature mapped to bit[12].
This bit is set to one by default. We need to preserve the bit
when setting F_MMU_TF_PROT_TO_PROGRAM_ADDR as otherwise the
bit will be cleared and IOMMU performance will drop.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e71003037ffa..a816030d00f1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -555,11 +555,13 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		return ret;
 	}
 
-	if (data->plat_data->m4u_plat == M4U_MT8173)
+	if (data->plat_data->m4u_plat == M4U_MT8173) {
 		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
 			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
-	else
-		regval = F_MMU_TF_PROT_TO_PROGRAM_ADDR;
+	} else {
+		regval = readl_relaxed(data->base + REG_MMU_CTRL_REG);
+		regval |= F_MMU_TF_PROT_TO_PROGRAM_ADDR;
+	}
 	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
 
 	regval = F_L2_MULIT_HIT_EN |
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
