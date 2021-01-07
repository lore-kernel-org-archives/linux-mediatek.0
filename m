Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89F3C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:54:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B4AB2336D
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B4AB2336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2XFMBJrCj6xbsa9npzMJnrGMYCORq73UvUdfoVI5fVY=; b=eFrARxHiGeeJsc5eWEUt8xE9u
	Q10WErg9vCQuuVjFFS8gjpTkswhr5i4q9j3YQkQ/ywdU9OD7ZgJKtfCcwQB6aj8gUPXYqvlpjsnXM
	twrTAWlkdyloENb1HC30wJqaLXpEEYgoe9gH1OFOtCKYzaZKFA/TXwVLu22wynILSxNCbsBsbC5LY
	eWrkjrGtaT1KDv7OUamDJms1z6se2TwHItrQVvNfn4RJjWb57j0AS3hWflRPP8EV0rZLK5hQDGUkn
	7789B3pbn7dZ3dBCr5QrpHT+W6GR24hAP/PYJ/HGPxojyNy8opi4udA+vvKScG/iJHnbqWMuW2wkv
	EZQH1hX9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUnW-0005Rj-Sk; Thu, 07 Jan 2021 12:53:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUdX-0008TL-0v; Thu, 07 Jan 2021 12:43:36 +0000
X-UUID: 26593d9565654272b90980ca9ef88926-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uKkqOXcbqafDnI/vYLzGEfa2oFagAi3CWmpYl+TvnxA=; 
 b=MWK/tIJ/Cd5qYIvBOLmSmWVthsgdoa+BTUivnc2rsCry4QGa8RFM5SaVnd8D6WJbr0RDCSXb0Mo4BNeKPaFyN0iKIQ0y9ujuABLn5FbkxDVi6ZVIKwfaERqIaoq59GsPWOyeyDgmAyBKpBbde3ZjnvFswuIE4Zaix+4+m+3eUPg=;
X-UUID: 26593d9565654272b90980ca9ef88926-20210107
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1414468833; Thu, 07 Jan 2021 04:29:48 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 04:29:46 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 20:29:44 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 20:29:44 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v4 2/7] iommu: Add iova and size as parameters in
 iotlb_sync_map
Date: Thu, 7 Jan 2021 20:29:04 +0800
Message-ID: <20210107122909.16317-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210107122909.16317-1-yong.wu@mediatek.com>
References: <20210107122909.16317-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_074331_779896_CA07DBE4 
X-CRM114-Status: GOOD (  15.70  )
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
 Krzysztof Kozlowski <krzk@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 David Laight <David.Laight@ACULAB.COM>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

iotlb_sync_map allow IOMMU drivers tlb sync after completing the whole
mapping. This patch adds iova and size as the parameters in it. then the
IOMMU driver could flush tlb with the whole range once after iova mapping
to improve performance.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/iommu.c      | 4 ++--
 drivers/iommu/tegra-gart.c | 7 +++++--
 include/linux/iommu.h      | 3 ++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c304a6a30d42..3d099a31ddca 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2443,7 +2443,7 @@ static int _iommu_map(struct iommu_domain *domain, unsigned long iova,
 
 	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
 	if (ret == 0 && ops->iotlb_sync_map)
-		ops->iotlb_sync_map(domain);
+		ops->iotlb_sync_map(domain, iova, size);
 
 	return ret;
 }
@@ -2575,7 +2575,7 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 	}
 
 	if (ops->iotlb_sync_map)
-		ops->iotlb_sync_map(domain);
+		ops->iotlb_sync_map(domain, iova, mapped);
 	return mapped;
 
 out_err:
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index fac720273889..05e8e19b8269 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -261,7 +261,8 @@ static int gart_iommu_of_xlate(struct device *dev,
 	return 0;
 }
 
-static void gart_iommu_sync_map(struct iommu_domain *domain)
+static void gart_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
+				size_t size)
 {
 	FLUSH_GART_REGS(gart_handle);
 }
@@ -269,7 +270,9 @@ static void gart_iommu_sync_map(struct iommu_domain *domain)
 static void gart_iommu_sync(struct iommu_domain *domain,
 			    struct iommu_iotlb_gather *gather)
 {
-	gart_iommu_sync_map(domain);
+	size_t length = gather->end - gather->start;
+
+	gart_iommu_sync_map(domain, gather->start, length);
 }
 
 static const struct iommu_ops gart_iommu_ops = {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b3f0e2018c62..9ce0aa9e236b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -246,7 +246,8 @@ struct iommu_ops {
 	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
 		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
 	void (*flush_iotlb_all)(struct iommu_domain *domain);
-	void (*iotlb_sync_map)(struct iommu_domain *domain);
+	void (*iotlb_sync_map)(struct iommu_domain *domain, unsigned long iova,
+			       size_t size);
 	void (*iotlb_sync)(struct iommu_domain *domain,
 			   struct iommu_iotlb_gather *iotlb_gather);
 	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain, dma_addr_t iova);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
