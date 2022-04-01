Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189C4C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyDVjQwf0iIlkCOp75F46cEugGl9nIAFLbdsxcOJWFI=; b=X0zO+f8W1nK5tw
	Cd0AmrKD6TlsBNZF6EE6npvVzm91eCywTZqjE8kYMwgCve75F9alFsoDYzPbMrY89gTLdYlvIBEJi
	wXGt9kTUH8Pc5PRo2ebaJitaDcl/GcyhxZIB+G5iCF+Z3O9tkCVtj8I77+VLRKmB/sgV+PTgXkgiM
	bt4gkoqhLGrI6JF7nbBWcgzUvMiRmdtWpxCe8rgi/b+FM+p3ZMVIr1OBzi4SSkiP9HD+7xV3qb+CU
	J5Lgz7cDM7bFAap6wV+NFhMegnKe9afcTKWTCNp5usAHE9g/LjBGcJ1mqn227w/Y2cDOdy2/C6EVa
	bHJ1AtmQP2xgd9BADxfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naIKQ-0063xy-DG; Fri, 01 Apr 2022 14:32:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naIJG-0063Cy-Jo; Fri, 01 Apr 2022 14:31:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2344761CC9;
 Fri,  1 Apr 2022 14:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B48BC34111;
 Fri,  1 Apr 2022 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823489;
 bh=PSKtXffPdblQe2sA3vMdKboC89dWoafIyhV1Hhr+UrA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bHs2MJq/fYJ48XF3Zz/x4DNG+NpsUMgVEh4jTy/Qwf78CGuAlUrjdVaFqnKf9zRV9
 vGQhhWc25OZ8Py0o1lihd+LZfLoo/FkXaihUvPBV/WGQyJChSmlaFKrXcY6Ivb/my+
 rhcUPE+0BSbbuMwQN9QigPMtFZuG3xC2zdI1aJJb8YVLdOK2CT70VwVXnDN+c20i2F
 DSn3iKbtaM39nL1gjoCEEidVo+Y7ZxZbplydLDMSbL/cOtd/1V6KRgX3+UG1tYO6PX
 vck1n0nyFmkYdGPE9itTYKsjYtDIJ4DJ0C2pd3hfZQJSwgFd5wGA68Mq3RW29/Mtb+
 irPzJFbEXbmrQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Yunfei Wang <yf.wang@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Joerg Roedel <jroedel@suse.de>,
 Sasha Levin <sashal@kernel.org>, joro@8bytes.org, will@kernel.org,
 matthias.bgg@gmail.com, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.17 115/149] iommu/iova: Improve 32-bit free space
 estimate
Date: Fri,  1 Apr 2022 10:25:02 -0400
Message-Id: <20220401142536.1948161-115-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_073130_739043_6BA81EB0 
X-CRM114-Status: GOOD (  16.29  )
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

From: Robin Murphy <robin.murphy@arm.com>

[ Upstream commit 5b61343b50590fb04a3f6be2cdc4868091757262 ]

For various reasons based on the allocator behaviour and typical
use-cases at the time, when the max32_alloc_size optimisation was
introduced it seemed reasonable to couple the reset of the tracked
size to the update of cached32_node upon freeing a relevant IOVA.
However, since subsequent optimisations focused on helping genuine
32-bit devices make best use of even more limited address spaces, it
is now a lot more likely for cached32_node to be anywhere in a "full"
32-bit address space, and as such more likely for space to become
available from IOVAs below that node being freed.

At this point, the short-cut in __cached_rbnode_delete_update() really
doesn't hold up any more, and we need to fix the logic to reliably
provide the expected behaviour. We still want cached32_node to only move
upwards, but we should reset the allocation size if *any* 32-bit space
has become available.

Reported-by: Yunfei Wang <yf.wang@mediatek.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Link: https://lore.kernel.org/r/033815732d83ca73b13c11485ac39336f15c3b40.1646318408.git.robin.murphy@arm.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/iova.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index b28c9435b898..170e0f33040e 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -95,10 +95,11 @@ __cached_rbnode_delete_update(struct iova_domain *iovad, struct iova *free)
 	cached_iova = to_iova(iovad->cached32_node);
 	if (free == cached_iova ||
 	    (free->pfn_hi < iovad->dma_32bit_pfn &&
-	     free->pfn_lo >= cached_iova->pfn_lo)) {
+	     free->pfn_lo >= cached_iova->pfn_lo))
 		iovad->cached32_node = rb_next(&free->node);
+
+	if (free->pfn_lo < iovad->dma_32bit_pfn)
 		iovad->max32_alloc_size = iovad->dma_32bit_pfn;
-	}
 
 	cached_iova = to_iova(iovad->cached_node);
 	if (free->pfn_lo >= cached_iova->pfn_lo)
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
