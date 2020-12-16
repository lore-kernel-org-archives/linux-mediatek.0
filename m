Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208EDC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:37:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCFB23104
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCFB23104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZqR0SM5iWor3Mv6lnczYTN9b+Zr4u7dv/omJNlTHKJ4=; b=VFLO1JFf01qbhAa06cFyaDXHa
	mfo6PV0XR46BEh09Fe/LdMm3uIe4aaS8WNkStsXNv77hTCw8WYHu+xnlCwDmPDJoP8kx4m2+fTphT
	5hZncdrfHQw8Pjk3Nqt09Q76SuEyM5oFYBq/8XCg80h6eZksxGcyckDsGW05Wy+P2Bo9VK27pDVaL
	gfUNBqBvTtEf/uYPMlEgd4kNUiWKaaAJobPchwfkpr+nG/Q6V2zz6gw/PTM4EikxZw2O5bBBpxjz/
	x10ALOQWhhrJQAe+7eXf73KCCXq8KhrfuZ9ZWzB1MXrgQ5BueCDUrYxgZFVrgKai0jxEo5MaT55aP
	nxW2x5tfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpUBN-0000Aw-HU; Wed, 16 Dec 2020 10:37:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpUB8-0008VK-EZ; Wed, 16 Dec 2020 10:37:07 +0000
X-UUID: fd0d1f5e1c604b1aaa18e01d5a570147-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dl2dxMS/I/H49YPGjjYBX3Vo7jnV0XYBPSBdn/Nb5P0=; 
 b=Ys/sPd1Ktck1TlydqhNrG0MEhU/fdFHxl+c6RJETj4pOT0jmRMyG46K6ullyaH9rcPV4xT5ouJ5m6WGe3xYzLHLljJPylvjZumqmYyvc8HUY//z+EYEJ4pIXqKqZ/76CESezwYWMWrL3ImGNgr4Hsb3IuqqEAE00DSO2XURSsow=;
X-UUID: fd0d1f5e1c604b1aaa18e01d5a570147-20201216
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 797521362; Wed, 16 Dec 2020 02:37:00 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 02:36:59 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 18:36:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 18:36:54 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v3 5/7] iommu: Allow io_pgtable_tlb ops optional
Date: Wed, 16 Dec 2020 18:36:05 +0800
Message-ID: <20201216103607.23050-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216103607.23050-1-yong.wu@mediatek.com>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_053706_656897_BD5EE871 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch allows io_pgtable_tlb ops could be null since the IOMMU drivers
may use the tlb ops from iommu framework.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 include/linux/io-pgtable.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index adde9e49be08..c81796814afa 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -206,14 +206,16 @@ struct io_pgtable {
 
 static inline void io_pgtable_tlb_flush_all(struct io_pgtable *iop)
 {
-	iop->cfg.tlb->tlb_flush_all(iop->cookie);
+	if (iop->cfg.tlb && iop->cfg.tlb->tlb_flush_all)
+		iop->cfg.tlb->tlb_flush_all(iop->cookie);
 }
 
 static inline void
 io_pgtable_tlb_flush_walk(struct io_pgtable *iop, unsigned long iova,
 			  size_t size, size_t granule)
 {
-	iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
+	if (iop->cfg.tlb && iop->cfg.tlb->tlb_flush_walk)
+		iop->cfg.tlb->tlb_flush_walk(iova, size, granule, iop->cookie);
 }
 
 static inline void
@@ -221,7 +223,7 @@ io_pgtable_tlb_add_page(struct io_pgtable *iop,
 			struct iommu_iotlb_gather * gather, unsigned long iova,
 			size_t granule)
 {
-	if (iop->cfg.tlb->tlb_add_page)
+	if (iop->cfg.tlb && iop->cfg.tlb->tlb_add_page)
 		iop->cfg.tlb->tlb_add_page(gather, iova, granule, iop->cookie);
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
