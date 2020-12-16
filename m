Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226DAC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:47:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7D0E23356
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7D0E23356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bjYyXt2wOjbpBPAExf7etOQRUt/69dcf6JOQm8Hk0gk=; b=ZcvLF3paOBN2TC/o3s2IWXlFo
	VYkXe9VJA5otbjVHn2tEpaWj10TH50pM9o9sRWC7GyAq57qE/rWKgHeIZaHMs+VtdZwIPPILqn4EC
	uEGjlBnoKjR3X1WfzWFZNV8iJBj/zoSOs8G2s8Iqu1087QZMC42j0cEb1aNjdQ7H7+NaEI9GeZ4xR
	lxd0fFg+b2ztxpz+i6aaGJNNttfuyI848N5AzsIQ0sU6jpigNE5rn1IaJc6cgW3dR3jRTRjJ3VQfT
	UN0XI3xq1x6XB5ckawS2dJ3aG2FXyYT3vtwvuqcka8BeQy4X9TuUgkygHKQnGiLr6zPgl9ywZXgB4
	ArZerBIqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpUKr-00022P-K3; Wed, 16 Dec 2020 10:47:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpUKR-0001qc-MS; Wed, 16 Dec 2020 10:46:48 +0000
X-UUID: e8f5d15ff0f34cdba0f5056ecdcb0138-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YzTZWxI4URSSbSWgg1b1vCdHxzpoAfBnx8NH6TWzHQw=; 
 b=VConOJxFrdgXLAeH9lxxtcOM/U3OuhDdOxvtxqij6Wzk0nqCPZL9iMQH+avmGG4BbZlVPSWaTaCLlcLxuJOKho6r6EIMV1hcB4ceZXbA2JYro/6p6q4iH/Coavul+oriaZcWkG2UAUH8Ojoga8kiaoo2WeyWkVSnmZg3Og0HZws=;
X-UUID: e8f5d15ff0f34cdba0f5056ecdcb0138-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 345982474; Wed, 16 Dec 2020 02:46:38 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 02:36:51 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 18:36:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 18:36:48 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: [PATCH v3 4/7] iommu: Switch gather->end to unsigned long long
Date: Wed, 16 Dec 2020 18:36:04 +0800
Message-ID: <20201216103607.23050-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216103607.23050-1-yong.wu@mediatek.com>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_054643_992967_654F5251 
X-CRM114-Status: GOOD (  14.13  )
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

Currently gather->end is "unsigned long" which may be overflow in
arch32 in the corner case: 0xfff00000 + 0x100000(iova + size).
Although it doesn't affect the size(end - start), it affects the checking
"gather->end < end"

Fixes: a7d20dc19d9e ("iommu: Introduce struct iommu_iotlb_gather for batching TLB flushes")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 include/linux/iommu.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 794d4085edd3..6e907a95d981 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -178,7 +178,7 @@ enum iommu_dev_features {
  */
 struct iommu_iotlb_gather {
 	unsigned long		start;
-	unsigned long		end;
+	unsigned long long	end;
 	size_t			pgsize;
 };
 
@@ -537,7 +537,8 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 					       struct iommu_iotlb_gather *gather,
 					       unsigned long iova, size_t size)
 {
-	unsigned long start = iova, end = start + size;
+	unsigned long start = iova;
+	unsigned long long end = start + size;
 
 	/*
 	 * If the new page is disjoint from the current range or is mapped at
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
