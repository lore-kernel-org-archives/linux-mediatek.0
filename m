Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD70C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b30i/cCYsoojxPkvBRmMW9PHiTvkmpeeSfWFFyZLBbM=; b=m4UAtkf6F4grZA
	wWBI8NeIvbTwTPHs31GQFyNJpZHUv0PV3Q6yUmbJwHs2fHYIMYupsn6isRp+Ax1VOQscqu7PQLDIn
	eZLdK2X4shBB6LmHt6P/8JTJ8jRATvqwJRuwaB9prTY81duC2Do7ZXi+MX3wUXb7Zj1QDsAtgUr3J
	6pO2RRvkaH0/OIeQtvTQkKQDtWPOlp1zbWCgc76660AHtcEr4D+CndiksiuPpkf8S+gQyadU+Um+5
	MdajAP2xOlsKlwGMJ/UN1bxPONEVzs3/bK3nE7e7dLbDrg6nPHs1PxhO3gqRXqgDXyror0zZgPmvx
	tCstP8UVMOp8NFtXnVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp7nF-00G8uU-MZ; Mon, 22 Nov 2021 11:47:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp6oC-00Ftvl-JK; Mon, 22 Nov 2021 10:44:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 9ACCA1F44822
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637577862; bh=BZwKyzVx4ruuAqlnDN1dIueQvzsa4RZzFJANK5WOaYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eZEc8ECeOmsw4ezw2hpNmvicqyp8cDuBNRLXFHOI2d19wIHaibjoEtA5Yv2PqKAjV
 YKZ/CbZsVsqJ6w/5VeW06fsPymIpCst9vxkAARiQpPKdjiabtO4oR9PYSM6HoCKvJB
 GjYyAoKdv3XDQ+B9SvA4/4JCVZfRRLgMGoJBpGB8sp0PQ1/TPM22EFIz8Qd6Cl2Icx
 S0LxEdhn4hV2jBYPlXnYC4/Ues5/XExzqaCx8liG7pUQIvC//aonPhpuhlLwC21iaM
 8lZjy+3kwbNn45qUk+Rk1NJmNSWkJB5WjZjlPjNNycq/4lpHA24O65A6UBKmj5padv
 Q9CDSLcHfaLZg==
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: iommu@lists.linux-foundation.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 dafna.hirschfeld@collabora.com, kernel@collabora.com,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org (moderated list:MEDIATEK IOMMU DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-kernel@vger.kernel.org (open list), linux-media@vger.kernel.org
Subject: [PATCH 2/2] iommu/mediatek: always check runtime PM status in tlb
 flush range callback
Date: Mon, 22 Nov 2021 12:44:00 +0200
Message-Id: <20211122104400.4160-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
References: <20211122104400.4160-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_024424_813926_878BA2C2 
X-CRM114-Status: GOOD (  12.33  )
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

In case of v4l2_reqbufs() it is possible, that a TLB flush is done
without runtime PM being enabled. In that case the "Partial TLB flush
timed out, falling back to full flush" warning is printed.

Commit c0b57581b73b ("iommu/mediatek: Add power-domain operation")
introduced has_pm as optimization to avoid checking runtime PM
when there is no power domain attached. But without the PM domain
there is still the device driver's runtime PM suspend handler, which
disables the clock. Thus flushing should also be avoided when there
is no PM domain involved.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 28dc4b95b6d9..b0535fcfd1d7 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -227,16 +227,13 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 					   size_t granule,
 					   struct mtk_iommu_data *data)
 {
-	bool has_pm = !!data->dev->pm_domain;
 	unsigned long flags;
 	int ret;
 	u32 tmp;
 
 	for_each_m4u(data) {
-		if (has_pm) {
-			if (pm_runtime_get_if_in_use(data->dev) <= 0)
-				continue;
-		}
+		if (pm_runtime_get_if_in_use(data->dev) <= 0)
+			continue;
 
 		spin_lock_irqsave(&data->tlb_lock, flags);
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
@@ -261,8 +258,7 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		writel_relaxed(0, data->base + REG_MMU_CPE_DONE);
 		spin_unlock_irqrestore(&data->tlb_lock, flags);
 
-		if (has_pm)
-			pm_runtime_put(data->dev);
+		pm_runtime_put(data->dev);
 	}
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
