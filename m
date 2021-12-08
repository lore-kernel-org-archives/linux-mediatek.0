Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35618C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJYLKGBNLCRf87+BWOXRA/ZtRS8f6etpqFIbgjg/mfw=; b=bTMdrKwzm1njRQ
	s+x12FgBRM8/c9nZyTGquE60eDXZhAbpv+zXxX2HrpPO7u6NfYeyVtn/uViJIXREnIRlTkq8YqUg5
	4K7iPjbfcT2bRdm2FSI7eW88NjU/qXTAI0pMh/WsPXVe8SXArbE9zv1fgbsj+1NlT8JbyeInRvjJC
	VmpfPnX+s7jPKgsyHNOT3/p7oxs9IjgVMvJBzMpXvbXPYQku4IREWxsm3/g3EWUKzV8jsD6VAbgYX
	r27Ydmp/OV0nMMIUpXg0AYjddCnI8+X0zRNFNL6rDZxcQP3IwyM+2g0e0KB+ICdmn4qK+ELgrxg8P
	UMIRqKFd/oQMHlZ67XwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muvlB-00COLT-H7; Wed, 08 Dec 2021 12:09:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muvk4-00CNmg-PA; Wed, 08 Dec 2021 12:08:14 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a00:c281:1230:3700:51d0:7039:5913:64d3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8C9EB1F45CA2;
 Wed,  8 Dec 2021 12:08:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638965291; bh=MaW1bAocTnYI0OuXYXK0SxPq8wDjTv9Gv1PqEfPZu2A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jjgMZjhwkPkAM1oPyq3VkeyrQe8sgIpKSmT5wUqN+/y1bxPSf/egn5QFQiyiWe3di
 SpmqbzqtecudsZh3h/bapXrjW01wlWQ8hUQFUcrrU6K0xE+ReV222RmQrkk1eLclgQ
 rJKR7i0ZA7k0op1HeiLw2gadna5xsAovm6d9m9P34M+1RcRp6fkiLnupQxCZyV030j
 SxKZP5tLAa0XtRwl8yOAKsnMlmkE2PcLh9wSrwYgvrclqSyhaUnNrtvDXhik5nBfP5
 B+8ekIt3CdetHeEa0xwvQ1uJbanswfW2w22fdYTl+1L1MpDKJB/joxM29gsqjCJbDh
 x+M8G8wITR4oA==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list), dafna.hirschfeld@collabora.com,
 kernel@collabora.com, linux-media@vger.kernel.org,
 sebastian.reichel@collabora.com
Subject: [PATCH v2 3/5] iommu/mediatek: Remove the power status checking in
 tlb flush all
Date: Wed,  8 Dec 2021 14:07:42 +0200
Message-Id: <20211208120744.2415-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_040813_024858_253F1880 
X-CRM114-Status: GOOD (  12.82  )
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

To simplify the code, Remove the power status checking in the
tlb_flush_all, remove this:
   if (pm_runtime_get_if_in_use(data->dev) <= 0)
	    continue;

The mtk_iommu_tlb_flush_all is called from
a) isr
b) tlb flush range fail case
c) iommu_create_device_direct_mappings

In first two cases, the power and clock are always enabled.
In the third case tlb flush is unnecessary because in a later patch
in the series a full flush from the pm_runtime_resume callback is added.

In addition, writing the tlb control register when the iommu is not resumed
is ok and the write is ignored.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[refactor commit log]
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index dd2c08c54df4..e30ac68fab48 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -210,15 +210,10 @@ static struct mtk_iommu_domain *to_mtk_domain(struct iommu_domain *dom)
 
 static void mtk_iommu_tlb_flush_all(struct mtk_iommu_data *data)
 {
-	if (pm_runtime_get_if_in_use(data->dev) <= 0)
-		return;
-
 	writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 		       data->base + data->plat_data->inv_sel_reg);
 	writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
 	wmb(); /* Make sure the tlb flush all done */
-
-	pm_runtime_put(data->dev);
 }
 
 static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
