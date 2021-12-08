Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BE/ApRRsLhfr9JIEGFZlT/8e4wp9doj6f4ZCdjVSD4=; b=4ndKY9VckKVr4m
	0H6eODLfz17J0OYleVgkfgADOddyi9UrRv9oBT83N2DcXn1QPiIM3XFNUhJXHYqDyF5ueAvA8tRuF
	USuEYLtNEpB2pVsrmc681zfhFYXeA5uXt8O43rKauEGcXwNvba3eg9s5VhFyGy7YBQmXrh/I419ga
	tsRiwl7oHCPpmCJDAOTcKUsJtDAJ67pYpN/ioaDLZCXGF/IVTax8N+XsAK48mYI6oBeN48zXHZNkK
	K4lhrLjHagnbj3xvfbeTOlQDtLJK0FBhLJSu7SRfxHD94JiyrZFFjtbXHKLY5a+TsCe+uOyTIzPwt
	DPIaHzml1xoODZwGZrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muvmH-00CP33-S2; Wed, 08 Dec 2021 12:10:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muvk7-00CNol-Vn; Wed, 08 Dec 2021 12:08:18 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a00:c281:1230:3700:51d0:7039:5913:64d3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 32EAE1F45CD8;
 Wed,  8 Dec 2021 12:08:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638965294; bh=G9wyjm+JcpBuGTU5PaSnqlWsQq2znoMjrDZdkywQlnY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kb9C2fVQI5+8rtQymm3l8HLiyN1QCH1KfHOfc2PhFGn8d4y6GjxkbBlNqwN+BWm8r
 tch0oDrm0FD0HQdryvlsVIfJJ0dusjcsu2ADofkLLCSrNiFxzl5Ay5tGUcX/vRNjtu
 XG9fcXd7SfGgSRwLqI5j9+emeLaPrb5hXG4cR/ltLxktw69haPyl5fE2wG9ubSqsZS
 /utSX3pQofgpXnRw3rJz+I1lKY5tZXhenJxqYb+3VgBZMuCiiphKm9mU2BXHI6f4dO
 JvyNF2dk2EPtspUhBswvj2ItrSCam2agdjtme10+dlxlepmxpFM6GtmItR2U+vr7Nt
 LeT/rOo5k21/w==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list), dafna.hirschfeld@collabora.com,
 kernel@collabora.com, linux-media@vger.kernel.org,
 sebastian.reichel@collabora.com
Subject: [PATCH v2 5/5] iommu/mediatek: Always tlb_flush_all when each PM
 resume
Date: Wed,  8 Dec 2021 14:07:44 +0200
Message-Id: <20211208120744.2415-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_040816_210550_0FAC0C8C 
X-CRM114-Status: GOOD (  14.45  )
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

DAM allocation is often done while the allocating device is runtime
suspended. In such a case the iommu will also be suspended and partial
flushing of the tlb will not be executed.
Therefore, we add a tlb_flush_all in the pm_runtime_resume to make
sure the tlb is always clean.

In other case, the iommu's power should be active via device
link with smi.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[move the call to mtk_iommu_tlb_flush_all to the bottom of resume cb, improve doc/log]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 195a411e3087..4799cd06511b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -997,6 +997,13 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
 	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
 	writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK, base + REG_MMU_PT_BASE_ADDR);
+
+	/*
+	 * Users may allocate dma buffer before they call pm_runtime_get,
+	 * in which case it will lack the necessary tlb flush.
+	 * Thus, make sure to update the tlb after each PM resume.
+	 */
+	mtk_iommu_tlb_flush_all(data);
 	return 0;
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
