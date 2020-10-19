Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E61C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8661322263
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fBAmvl7r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Sxh+t9zh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8661322263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bzwn3/OrOEoDGIDIcASEeBTaJNSfy5W8mfYn7qUXo0Q=; b=fBAmvl7r7NZBB2iEh5Epe+x5N
	juWmCl0GFc1FhD7cDu8oGlnGSC854V8ZNu12ALom9xivmNt4MAwJDBXDcTYn5lepzBHgAFoEWuHQ8
	+xZ54twZXtNhn0CIs4iRTDh6onBFh2VRbOx5SmubeYZDkjONg+zhjr2YOe5K5yGS/T7M1l5A+eq4P
	XTGnehNWTmeJWHA0zUWdt/EJ/eP+1JhGCRUX0bjDXkU5lKoVlVN+Y8bZtLjFeHlxxzfr93YhtjNji
	Pati91b0QEg3zznzpcRL9O75ofRG/H4Vbr4iABscNBl1D9f5Fbxo9I8SVsM82nc96eZJC+/Ty4Gu7
	cazPpUADg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUTUM-0004z1-Tg; Mon, 19 Oct 2020 11:38:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUTUB-0004uw-Fs; Mon, 19 Oct 2020 11:37:57 +0000
X-UUID: c29fb4a0965f4b3ebd1a14df9a102545-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nq1q5ymd+yj5qa0zLYvxc1ugCnh17/vad98CZb1TrEs=; 
 b=Sxh+t9zhgrLe/2IeSnM1bdinFoHRY0gXh3q45pkD1EkuEwNfS7hO0BoCsdm43crnIY/AfmfiUBnFx2ekeaUC+QCfCgTBM+GYXWPJAL1eIP/tqzlQqzSU9tB43/BAOeT2HjNbHTpgsQWf7xhzCJj8+ypyfe9qk5UUZ6Er4E1ZrUc=;
X-UUID: c29fb4a0965f4b3ebd1a14df9a102545-20201019
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 301126893; Mon, 19 Oct 2020 03:37:45 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 04:37:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:37:32 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Oct 2020 19:37:32 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/4] iommu/mediatek: Add iotlb_sync_range() support
Date: Mon, 19 Oct 2020 19:30:58 +0800
Message-ID: <20201019113100.23661-3-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201019113100.23661-1-chao.hao@mediatek.com>
References: <20201019113100.23661-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 717F35B2F2DF99D09382480E4E971BD9E3C50ED567C833254E6EB0A43D02A93A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_073755_681833_CDAA849A 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Jun Wen <jun.wen@mediatek.com>, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mingyuan Ma <mingyuan.ma@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MTK_IOMMU driver writes one page entry and does tlb flush at a time
currently. More optimal would be to aggregate the writes and flush
BUS buffer in the end.
For 50MB buffer mapping, if mtk_iommu driver use iotlb_sync_range()
instead of tlb_add_range() and tlb_flush_walk/leaf(), it can increase
50% performance or more(depending on size of every page size) in
comparison to flushing after each page entry update. So we prefer to
use iotlb_sync_range() to replace iotlb_sync(), tlb_add_range() and
tlb_flush_walk/leaf() for MTK platforms.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 785b228d39a6..d3400c15ff7b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -224,6 +224,11 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	}
 }
 
+static void __mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size)
+{
+	mtk_iommu_tlb_flush_range_sync(iova, size, 0, NULL)
+}
+
 static void mtk_iommu_tlb_flush_page_nosync(struct iommu_iotlb_gather *gather,
 					    unsigned long iova, size_t granule,
 					    void *cookie)
@@ -536,6 +541,7 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.map		= mtk_iommu_map,
 	.unmap		= mtk_iommu_unmap,
 	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
+	.iotlb_sync_range = __mtk_iommu_tlb_flush_range_sync,
 	.iotlb_sync	= mtk_iommu_iotlb_sync,
 	.iova_to_phys	= mtk_iommu_iova_to_phys,
 	.probe_device	= mtk_iommu_probe_device,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
