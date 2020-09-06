Return-Path: <SRS0=UOtS=CP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACE1C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 15:19:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0EE20714
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 15:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="apIr2FtC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OyUETwoI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC0EE20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PDinzVmVl/8Xo1qwqaBhyrMIZbCnu2KfFqs1A6ygC0E=; b=apIr2FtC+AKr2Z1WWnb2bFrSf
	cck+sQ2KpDFbIq1DwyzCDZmSWsr74Kkj9GHlDvs03Hqhja9HXlNgKe1raOSjUud4dQlFgVu4UhmJ5
	dEADbBBdA51sxwpyrraMxoWEHyzsC4CqmQsFu8UCwWI6sZFs+7aPmCahyaA48u4x1q0KJrP6Yg52k
	MLILWWK6+/+6lchJrcHWKGtl3mK8jKZVUWuYzDvRog9BtabFDBX1bmjou1gnhCxzJogXOb81+0Fz1
	lLjSAPYP9/JDaHMZz7FWd/8JW1CpGNglH8Sly6oJj83BULVqfeayKQwJJkomyTQA1ZGfb9oo8ElIA
	5TWqRyaQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEwSJ-0004Po-AH; Sun, 06 Sep 2020 15:19:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEwSB-0004Mg-AA
 for linux-mediatek@lists.infradead.org; Sun, 06 Sep 2020 15:19:40 +0000
Received: by mail-wm1-x343.google.com with SMTP id e11so10678331wme.0
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2020 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0U6+N87TtQqeJvtsYL++VRaHV5Y/ETKSefP9o6FFabM=;
 b=OyUETwoInfdSh4ScoNMRqAZdPJ8qgNTcs/PCZtrGedtu8dWgAmrBhfDVsXTa4UBvGI
 5M7Rl2ssXCVXKyL3S4lLa6uvMTPO7jGhZ1IPKbyzklrYMbOvENWb+OkSQ53y6qd2ZO4s
 P+B/MmJVjjCPhP5lFS1uKSUrKRV+lNEzkU0hAzXdDcG+L0i7Sj587sFJIqDIHfyW/gJR
 p8r0R+32AHVnG37XpelpYr+7bSLaSbsY+I8FqQ8Pl3OFewkFzCWFHeTau+MI7nGQhfH5
 3uLvhvYONA8hQE5Tr9VqO6w/kiialSKWmUHD3PpghDZs/JbTzaYtNtj5VeGt7ZUdCW+E
 ZyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0U6+N87TtQqeJvtsYL++VRaHV5Y/ETKSefP9o6FFabM=;
 b=iL4hjnm/V5SAyJqwWU/ljKCzeXYoMvdrGrC+MzVU78B+5PjIJmPsfDU9qQNHxrKUUP
 6f3sr6ubadBS8+2L1LWuPNqRcFieql4/hL3NnY+x23gJ5Hu/TwAGJT5Nre7lX88psSUM
 OSk7K1S8/ApJxOWICL2ZLoDmCQQHwKx2bhwDLZBZ+GuglyeYCYmbqHnUP30yBRKWdo09
 0+yOGFcuBsvf3pAYg1uGNw7hkcfQ0XShCLhKlAsItoM1zgpZH9hgUonTVBxJEQCNbeKz
 FdV4H4wmnpJJ5rglxAyXNhPRzZuyqLmdRf4V7m5Tnl5on7FD5/XkUcIqK6SFNlxJpld5
 bwNA==
X-Gm-Message-State: AOAM532UtIeeL0haFSecxW2jX+pGWqz67SvrOgVRT0r7w7X3aAmdgX+4
 6wenUW6VScSUGwgiNJNRF0E21Q==
X-Google-Smtp-Source: ABdhPJyMy7k7z0Nq7lpLRDSASUYBRp7c5+96CRwDq7/6ApQXt4q76MVmMJxwJ56xh/mGeO95pXcGpA==
X-Received: by 2002:a1c:a5c8:: with SMTP id
 o191mr17179286wme.127.1599405577152; 
 Sun, 06 Sep 2020 08:19:37 -0700 (PDT)
Received: from localhost.localdomain (208.19.23.93.rev.sfr.net. [93.23.19.208])
 by smtp.gmail.com with ESMTPSA id a15sm26420646wrn.3.2020.09.06.08.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 08:19:36 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/3] iommu/mediatek: add support for MT8167
Date: Sun,  6 Sep 2020 17:19:28 +0200
Message-Id: <20200906151928.881209-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200906151928.881209-1-fparent@baylibre.com>
References: <20200906151928.881209-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_111939_376606_2C1CA086 
X-CRM114-Status: GOOD (  14.42  )
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 joro@8bytes.org, robh+dt@kernel.org, yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the IOMMU on MT8167

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V3:
	* use LEGACY_IVRP_PADDR flag instead of using a platform data member
V2:
	* removed if based on m4u_plat, and using instead the new
	  has_legacy_ivrp_paddr member that was introduced in patch 2.

---
 drivers/iommu/mtk_iommu.c | 8 ++++++++
 drivers/iommu/mtk_iommu.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b1f85a7e9346..6079f6a23c74 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -817,6 +817,13 @@ static const struct mtk_iommu_plat_data mt6779_data = {
 	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
 };
 
+static const struct mtk_iommu_plat_data mt8167_data = {
+	.m4u_plat     = M4U_MT8167,
+	.flags        = HAS_4GB_MODE | RESET_AXI | HAS_LEGACY_IVRP_PADDR,
+	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
+	.larbid_remap = {{0}, {1}, {2}}, /* Linear mapping. */
+};
+
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
 	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
@@ -835,6 +842,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
+	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{}
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 122925dbe547..df32b3e3408b 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -39,6 +39,7 @@ enum mtk_iommu_plat {
 	M4U_MT2701,
 	M4U_MT2712,
 	M4U_MT6779,
+	M4U_MT8167,
 	M4U_MT8173,
 	M4U_MT8183,
 };
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
