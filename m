Return-Path: <SRS0=lxIO=2Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3B0C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 16:26:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DD721734
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2020 16:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V4yBrwZk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tfxrTNAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42DD721734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzbij+I1k32JvcpvaR/BT33TR6fJe9phqFMgiRxZlM0=; b=V4yBrwZkyECfd4
	QuRgB8Ycf8RSHuLOXlxyYqoRsajHwS2dcZa3Uk+7yTzEY44xUP5bl2i5j9WMcXNbnUheNQF5j3AEL
	QM12guFTaTiKZ/+Ra/aneTVYoeE/czdKRfIeR96AUCU6U4xM6WvziZF9AdUzja+Ov9fv0qkxCX+fj
	FqyjgiEj0e0m/2O6czCFzgLXAiyg+1EHUChzyfGQhzwoUB2ixd2kaOaVkzil/sBV9WlwPpD0nBj+f
	/GXlRwwHn068FHw8csbdGPVIar6F1hrR2RRgG/FEniAF3AD3yONzRXt/TYNnGhH7KFkCeuGSiCrkS
	6cxaVGc/FJUuyy0/CwdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inPmg-0006GR-IO; Fri, 03 Jan 2020 16:26:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inPmX-00065G-Gz
 for linux-mediatek@lists.infradead.org; Fri, 03 Jan 2020 16:26:39 +0000
Received: by mail-wr1-x442.google.com with SMTP id w15so30348284wru.4
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Jan 2020 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89mFA8e7Xc7aCGnee/vBVuK6j5IjAiZj3SvE/aRAZkU=;
 b=tfxrTNAlbO1a4huM8IDy6tBKcl5I9hIGs22EGye9w5UqqHWTreoNTQ8QYcvb7YXmnN
 35WIII5O06Ed79JL1L2aWb4w4vlKdqPa68lhyM/kYS76+BuF0TNXQ3JdF6VKtsRVcIxt
 namNuW/NRTfnECEKBlixtu8EePuaeEnnCl+L1sqFgUij9RjLaFDsjrGZMqb0/B5JH6p1
 AwiiURZ7VLU5sgapnHFWxQ1B2ucVV3FT9uJwtXplth4sy+9CkpmwaKmoyLNSHWcsxFij
 MIDfBHJ+jR49lz5qMC9uZDHOTy31/xy7TXDvyNMEwMvBHQrgYoKqOPdIi02WnBU2luMd
 KTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=89mFA8e7Xc7aCGnee/vBVuK6j5IjAiZj3SvE/aRAZkU=;
 b=VQzjh7q+elCdHzJQHjG2gozvohsr6LbO5GZ/cH9293VpSUlOTRLhn7z7nfg5xHP88O
 eFAwosey7e5/TWXIoEehEsipQDE6BlUCNPKQw0M8MF08oXv6FjmqUjt8iQM3qg+18nH0
 dBDEjTXfRf4B+5uSCRzzouZZ/L8PyL6CPr3Cao/bc53SXHC49/HIJdjhZtSZXjs2n+0N
 0HoAhbALEBvS0XWN33OIlca/W7uwXmco8djDAoMJ1ZYGZ6BOdDQ+XuT/93pXxxE0rBoU
 lCmSJU5Teu5HgTx3RULhTPbQbuVV+SFsB+3+OB8cNiTn3YrrHM7J9PGmwC9dQHRmrIjb
 GLOA==
X-Gm-Message-State: APjAAAV8rdwpSaxzyKuYoC4XHClIgKUEOw3aGKC+rkIG+gV6CwsMOImr
 wdrojhf+D2dfcwXI2L1sTn/xBA//3vtSgw==
X-Google-Smtp-Source: APXvYqwPg2MhuwqZ0oIndjKJulvZt5tg9dwauR6SSxBiZJ9j/GpPtJP4TrTegUABwWAZ4oYoiSU4Og==
X-Received: by 2002:adf:e591:: with SMTP id l17mr82260400wrm.139.1578068796095; 
 Fri, 03 Jan 2020 08:26:36 -0800 (PST)
Received: from radium.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x14sm12564234wmj.42.2020.01.03.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:26:35 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] iommu/mediatek: add support for MT8167
Date: Fri,  3 Jan 2020 17:26:32 +0100
Message-Id: <20200103162632.109553-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.25.0.rc0
In-Reply-To: <20200103162632.109553-1-fparent@baylibre.com>
References: <20200103162632.109553-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_082637_560178_51C5A9CD 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: mark.rutland@arm.com, matthias.bgg@gmail.com, joro@8bytes.org,
 robh+dt@kernel.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the IOMMU on MT8167

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/iommu/mtk_iommu.c | 11 ++++++++++-
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6fc1f5ecf91e..5fc6178a82dc 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -569,7 +569,8 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
 	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
 
-	if (data->plat_data->m4u_plat == M4U_MT8173)
+	if (data->plat_data->m4u_plat == M4U_MT8173 ||
+	    data->plat_data->m4u_plat == M4U_MT8167)
 		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
 	else
 		regval = lower_32_bits(data->protect_base) |
@@ -782,6 +783,13 @@ static const struct mtk_iommu_plat_data mt2712_data = {
 	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
 };
 
+static const struct mtk_iommu_plat_data mt8167_data = {
+	.m4u_plat     = M4U_MT8167,
+	.has_4gb_mode = true,
+	.reset_axi    = true,
+	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */
+};
+
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
 	.has_4gb_mode = true,
@@ -798,6 +806,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
 
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
+	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{}
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ea949a324e33..cb8fd5970cd4 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -30,6 +30,7 @@ struct mtk_iommu_suspend_reg {
 enum mtk_iommu_plat {
 	M4U_MT2701,
 	M4U_MT2712,
+	M4U_MT8167,
 	M4U_MT8173,
 	M4U_MT8183,
 };
-- 
2.25.0.rc0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
