Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20406C388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:29:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B7C246A5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 06:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ED7zUxhU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e36LEVev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B7C246A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n2QOSv2L+gkLl1r42y3tlBx8q22Xq6sqxzgtbsJMgF4=; b=ED7zUxhUZh8e9g0JHv8pPFzIh
	csxzyFXVtAp3rmhLoa0iwpJnbHEszgfpalepYn5iFoJuuOpQo5sWW0F7/imdnKJD5kU9b+k7rdVWJ
	WnwUw9QQJ9Hmc995iDW962IuxmEmHiAs2zM04pYDpJsMAAk/rrytMSkgIpLmYoPLmUwvcBvGPvZeB
	EtyBbJn4AWaiu/N2l4E5fKaDOcJQbX2N4jKjzizIYoFP65sTBt59cXy2g4MJaUqfLzVSvOhaA+kDW
	T0hxIfSn1poDTWKSiAW5cZY/+SItSwLnJAiSfwwxpWW3TGY26OHrd3a4IoAIg6+vBsaZ8x34eNo7F
	vJoCTKDSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfdRc-0002Da-Q6; Thu, 19 Nov 2020 06:29:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfdRL-00028A-SI; Thu, 19 Nov 2020 06:29:09 +0000
X-UUID: 4a2776f2501b4a70b3d9c0260145eb40-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jd3dnfh7DPTjjQKZvPCJQzsQg0XAiu1xFSOiyrgXeFw=; 
 b=e36LEVevQtET1OY31M3Jg93WRlSPXIHZqk5YRjPfXucG4Z2QQDEDywE9IEeM3YcL2oJOTS/qaNN6789iQHzYLzMF7XPuem/nlrGowtQVOrTLLIi1qIe4v1ObX7gvBfk3oS68e5Cx/Lxrm3Y2d6unJ2/J952DqTEAxqX1YeRxOpw=;
X-UUID: 4a2776f2501b4a70b3d9c0260145eb40-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1961355076; Wed, 18 Nov 2020 22:28:58 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 22:19:14 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 14:19:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 14:19:11 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v2 4/6] iommu: Add granule_ignore when tlb gather
Date: Thu, 19 Nov 2020 14:18:34 +0800
Message-ID: <20201119061836.15238-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201119061836.15238-1-yong.wu@mediatek.com>
References: <20201119061836.15238-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_012908_332697_32654455 
X-CRM114-Status: GOOD (  16.00  )
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
 Krzysztof Kozlowski <krzk@kernel.org>, jun.wen@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a granule_ignore option when tlb gather for some HW which don't care
about granule when it flush tlb.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 include/linux/iommu.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 794d4085edd3..1aad32238510 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -171,6 +171,7 @@ enum iommu_dev_features {
  * @start: IOVA representing the start of the range to be flushed
  * @end: IOVA representing the end of the range to be flushed (exclusive)
  * @pgsize: The interval at which to perform the flush
+ * @granule_ignore: For tlb flushing that could be regardless of granule.
  *
  * This structure is intended to be updated by multiple calls to the
  * ->unmap() function in struct iommu_ops before eventually being passed
@@ -180,6 +181,7 @@ struct iommu_iotlb_gather {
 	unsigned long		start;
 	unsigned long		end;
 	size_t			pgsize;
+	bool			granule_ignore;
 };
 
 /**
@@ -544,7 +546,7 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 	 * a different granularity, then sync the TLB so that the gather
 	 * structure can be rewritten.
 	 */
-	if (gather->pgsize != size ||
+	if ((!gather->granule_ignore && gather->pgsize != size) ||
 	    end < gather->start || start > gather->end) {
 		if (gather->pgsize)
 			iommu_iotlb_sync(domain, gather);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
