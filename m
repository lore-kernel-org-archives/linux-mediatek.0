Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DE8C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:17:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2955820C09
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="StAXLRns";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KltwrjUz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2955820C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l7a01NQ1WMn+FGL4fxpUGUOLx6nBJXYxh2yQmaQ6Ddc=; b=StAXLRnsuulvDc1dm8wQ5TCA4
	djXieozYr7nrlBdPxcVUnrV3p4kyutmgIj0ofUrXrtH25jj02QcHsiFODGkbC3KBT7syzfFRGyJVc
	r1vyF3YGqo68gLpxNqg1Ea/+8eK0S9iOkk32wXwcmVPtHStXaL2eovjOBZCETm57uywIpA7QzbJsa
	GnFbsHGBX2rQBPZ1njbTzIUWwVRoZi3GgW184+IGLSs+ew9RJ5oVaWoeAv2OONiZQVR7xxjoAAsRB
	oefjHam8x0wB+r7UlxBYeSnBF+GpHNisVMozQdJCG+EGrBS6mkLWB+WeXnn5MN6tWJkidtwRtUMwd
	Q3Wqw/5qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFECz-0002Aa-L9; Mon, 07 Sep 2020 10:17:09 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFECr-000275-Kx
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 10:17:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id y15so1026625wmi.0
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2AcZ+ht5heIUGMeBtkrSAl5QfbjkEelxxHKDjkGuZF4=;
 b=KltwrjUzSC3k4btOVShbI2P9fHUWGgNbRAPmHJTtAi6/JEb36d5AntVkI4lzadidvf
 4rvV0jYBTTbsZi3pZ8fjZbxeP1tjOVlfsPFwAt1bjeCZs7rJDVJbJyN5Lwa+du4rZ+Hk
 XQEB78tFEop+SHR7b1KscY+z5cBD/vIIRFTh2g5XOrIm2acQOAB9XnMI70w/a5fRXN0U
 HBto/oEqQAfPKHF2FssPCM57qNk6wqR87VhAw2GXUw13Ft1umShjzltUa0eIU3eZ6lC2
 s7noChxVg5u+RbAsNvEWuhOMzXxcYL2eNpw54g3rBv4m0dwYbD2JozVlzVA8w3H6jycl
 8oGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AcZ+ht5heIUGMeBtkrSAl5QfbjkEelxxHKDjkGuZF4=;
 b=IqBJenZersO79YuVkfw0PR4nYV0L0ZZMaZdyV1sqDevuA8FUhbUCXFOcp+IYG9KaRT
 PoKHqaH6sXZRIuuaB0HZSXHY4Znh/5XybJrQOw0cZ/cw+qi4oY5f3iE3xCJRWPdGNDFf
 C67ALf7dh6RJox+jiVzMLuH/29juC1B+ef/Uk2KrXk5BmToFCe50XIGQAguXpTyCFyWl
 x/SwlysL68YjeRqFi7ImbH5gp/Log5Qfau35XFuV2zPaaWdPmUd8j1NKMf2rc1AcPJTO
 lqbXPnvDz/bbjUmCYug8RdynVqdGnL0zNEKdd06B1w+6Td8MxMZeMc2i3Z9uWfXetCTR
 RV8w==
X-Gm-Message-State: AOAM5319Kl+XFI9PHF4+fNG/wOei/1jjGP4E3OWN4SUFIRHGO5Yf84Cb
 4iEkbcQi6cmyDWSS02mRxzDZ8Q==
X-Google-Smtp-Source: ABdhPJyud3Q1FarNaloME4DE60XHhksKDdkBuTqKpEI/obuHP2Cli5CKDBJKYcqqf9+p8T2C8RQClA==
X-Received: by 2002:a1c:dd87:: with SMTP id
 u129mr19928577wmg.172.1599473820650; 
 Mon, 07 Sep 2020 03:17:00 -0700 (PDT)
Received: from localhost.localdomain (122.105.23.93.rev.sfr.net.
 [93.23.105.122])
 by smtp.gmail.com with ESMTPSA id j7sm28728689wrw.35.2020.09.07.03.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 03:17:00 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v4 3/3] iommu/mediatek: add support for MT8167
Date: Mon,  7 Sep 2020 12:16:49 +0200
Message-Id: <20200907101649.1573134-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907101649.1573134-1-fparent@baylibre.com>
References: <20200907101649.1573134-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_061701_747426_51E297F5 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: joro@8bytes.org, Fabien Parent <fparent@baylibre.com>,
 miles.chen@mediatek.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
 yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the IOMMU on MT8167

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V4;
	* Removed HAS_4GB_MODE flag since this SoC does not seem to support it
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
index b1f85a7e9346..4ff071eb5279 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -817,6 +817,13 @@ static const struct mtk_iommu_plat_data mt6779_data = {
 	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
 };
 
+static const struct mtk_iommu_plat_data mt8167_data = {
+	.m4u_plat     = M4U_MT8167,
+	.flags        = RESET_AXI | HAS_LEGACY_IVRP_PADDR,
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
