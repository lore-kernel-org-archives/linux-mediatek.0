Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB724C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CFB022263
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 11:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o2wYH9Ye";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cSbnUDvc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CFB022263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vTByWHAJXr8Ajc7fKW9E56+3me+ONn5UU0IzwmMLkF0=; b=o2wYH9YeQZHAL8czIPkjKVV4n
	Vn7c9lCo3lylTG5EzzajH+UpyeYSWZ0ZZ/ulwDen/i3BxRqdkaJG48IUvivRAk7ClGKTCSdDgx5RO
	f3Qtxx5YUQH+vl2ppPtWfbnldnZZ+RsyAHJxMHcaH3YR6TBjx2xYpGWhHsIDdjD+CTYhzvywgpj+t
	RFgLgGjqFcIl3lNqvS5oqFLCTN8YkWWIRXhHoD3cxMjT4Dqm5UagKm77gFABRGgTn02oKO+JtNqHo
	hSLioQsGPgYxG8xwf9h78YgWttE7iVi+P5GCc9AY9nzjm4Luy69nAZUCBoARtcgb0qcCC+k9ZsxKu
	RmKnNXUzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUTUg-00057I-KX; Mon, 19 Oct 2020 11:38:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUTUC-0004uz-DM; Mon, 19 Oct 2020 11:37:59 +0000
X-UUID: 4321fc6e59464671a677646faacb3e0b-20201019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=m4LDAjGaY8ZCZimbpy7YBlmQc5CdSDMgpYOZp0zaqTc=; 
 b=cSbnUDvcoLIIqhDkrICSDc8v54KNFL66XfhvlGZNctQUuuwgCqHAaVXfM7T9H1BKoCh2e5Cq8vcWPBvaSfbDPbuS5iUZ/Nm4RrAvIsIAs8c/oQ/jcWTaZ+JD999vPfbmOZjP8rXReuz1Zu4n2axQLu4DAIeWu53APFnH5PO4YJ4=;
X-UUID: 4321fc6e59464671a677646faacb3e0b-20201019
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1312622205; Mon, 19 Oct 2020 03:37:45 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 04:37:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Oct 2020 19:37:37 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Oct 2020 19:37:36 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 4/4] iommu/mediatek: Adjust iotlb_sync_range
Date: Mon, 19 Oct 2020 19:31:00 +0800
Message-ID: <20201019113100.23661-5-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201019113100.23661-1-chao.hao@mediatek.com>
References: <20201019113100.23661-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 45005679F3403F0A13FD86D253488C445AA63407230CD27F27E3DC72213A2D4D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_073756_639822_5EB6C171 
X-CRM114-Status: GOOD (  11.55  )
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

As is title, the patch only adjusts the architecture of
iotlb_sync_range().

No functional change.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index bca1f53c0ab9..66e5b9d3c575 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -191,10 +191,9 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
 	}
 }
 
-static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
-					   size_t granule, void *cookie)
+static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size)
 {
-	struct mtk_iommu_data *data = cookie;
+	struct mtk_iommu_data *data;
 	unsigned long flags;
 	int ret;
 	u32 tmp;
@@ -216,7 +215,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		if (ret) {
 			dev_warn(data->dev,
 				 "Partial TLB flush timed out, falling back to full flush\n");
-			mtk_iommu_tlb_flush_all(cookie);
+			mtk_iommu_tlb_flush_all(data);
 		}
 		/* Clear the CPE status */
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
@@ -224,11 +223,6 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	}
 }
 
-static void __mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size)
-{
-	mtk_iommu_tlb_flush_range_sync(iova, size, 0, NULL)
-}
-
 static void mtk_iommu_tlb_flush_skip(unsigned long iova, size_t size,
 				     size_t granule, void *cookie)
 {
@@ -522,7 +516,7 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.map		= mtk_iommu_map,
 	.unmap		= mtk_iommu_unmap,
 	.flush_iotlb_all = mtk_iommu_flush_iotlb_all,
-	.iotlb_sync_range = __mtk_iommu_tlb_flush_range_sync,
+	.iotlb_sync_range = mtk_iommu_tlb_flush_range_sync,
 	.iova_to_phys	= mtk_iommu_iova_to_phys,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
