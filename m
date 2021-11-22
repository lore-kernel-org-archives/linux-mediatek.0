Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cScXV+DHkdWaoWqwjRFWOGQNV1RQ86Hu5IMvuLfll+c=; b=sALerTHnh1VMkl
	6hX9o/NIqCp6QykOtRlM13omlHDuFmHj2ou0zb6oTcNV9gA4pexn2NTVUgjbskWvZ1YSPCXiTmSVz
	VnCRqL6UwsXRR7IhpmugaBmC8vKHXHHciRpFoQ1gSqtvzriZvTCyWzqWZqIunCwzJpQWk5VHRnzoJ
	/BPSljZXAj7TQO0H0jwToGn729yNsjL6+STo3URy/LVRF3q2XipBx+Og6bivW64CIF0/yj29aQu0F
	hxQf1WkqrNMtKpUNLzXYxf1JJKKs9SigdQ5SVucN4C+FI20jM8U71r9t8WDJ0Cid5g5hay35Z8DfV
	s5HgcPBOZoY9nenZtwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp7mA-00G8RV-IZ; Mon, 22 Nov 2021 11:46:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp6oA-00FtvF-ME; Mon, 22 Nov 2021 10:44:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 4AF961F4482B
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637577861; bh=2Xsz33sJUCBtrvsBkiwQnxCnwbbplwf03p+yM44j+xY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJA57MhNimPrOD/OHLVYM5/Xo8lNmRfBCpTzhBYY55RjyHWXovzrC3+kCz2GFFB7s
 k9JcqtSNaVUN7UPZ3qOP61314DvDmpIy1LKVtBSOMXUZnSRJZkpSHSuPs3qKn2ms6q
 wa+0qLHqFE2jQ+t6mSitG3fXQHKBvRr3Atjyc3Q/x5N8sOvxhTPiNjToDVljORECTG
 cxG4n3LSaLr5LLzahXyAL0ZziNpaXur8ahl6hQ3Udfvp5fPNyq4z2xlR2dOa2lOHEu
 39YOqjPFb7yTbYgfLb16Ji/dc0kTGw0NF3HGEp/OIMFknQUarhrMwwdDohWVZP3G/4
 3ieNTmbk8eNGA==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: iommu@lists.linux-foundation.org
Cc: Yong Wu <yong.wu@mediatek.com>, dafna.hirschfeld@collabora.com,
 kernel@collabora.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list), linux-media@vger.kernel.org,
 sebastian.reichel@collabora.com
Subject: [PATCH 1/2] iommu/mediatek: Always tlb_flush_all when each PM resume
Date: Mon, 22 Nov 2021 12:43:59 +0200
Message-Id: <20211122104400.4160-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
References: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_024422_905078_EBAC8A50 
X-CRM114-Status: GOOD (  16.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yong Wu <yong.wu@mediatek.com>

Prepare for 2 HWs that sharing pgtable in different power-domains.

When there are 2 M4U HWs, it may has problem in the flush_range in which
we get the pm_status via the m4u dev, BUT that function don't reflect the
real power-domain status of the HW since there may be other HW also use
that power-domain.

The function dma_alloc_attrs help allocate the iommu buffer which
need the corresponding power domain since tlb flush is needed when
preparing iova. BUT this function only is for allocating buffer,
we have no good reason to request the user always call pm_runtime_get
before calling dma_alloc_xxx. Therefore, we add a tlb_flush_all
in the pm_runtime_resume to make sure the tlb always is clean.

Another solution is always call pm_runtime_get in the tlb_flush_range.
This will trigger pm runtime resume/backup so often when the iommu
power is not active at some time(means user don't call pm_runtime_get
before calling dma_alloc_xxx), This may cause the performance drop.
thus we don't use this.

In other case, the iommu's power should always be active via device
link with smi.

The previous SoC don't have PM except mt8192. the mt8192 IOMMU is display's
power-domain which nearly always is enabled. thus no need fix tags here.
Prepare for mt8195.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[imporvie inline doc]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 25b834104790..28dc4b95b6d9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -964,6 +964,13 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	/*
+	 * Users may allocate dma buffer before they call pm_runtime_get,
+	 * in which case it will lack the necessary tlb flush.
+	 * Thus, make sure to update the tlb after each PM resume.
+	 */
+	mtk_iommu_tlb_flush_all(data);
+
 	/*
 	 * Uppon first resume, only enable the clk and return, since the values of the
 	 * registers are not yet set.
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
