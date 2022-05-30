Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994FCC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vhW5BQe8o9QxaeQCX8I+M16wnxMK3HZqiWh080Vlyc=; b=O+bUKS7rYjhDX3
	AjpyLTsKqLjgv8bPZBI2q/fgroWDjmyYE9m4sO8zYnoiG4s+iQHRiJR6eq2DcWLEMuwPFIWOo4Dz3
	YwGv8gu/wKf/A8XA36BJUD00ev6F1cljHM9im4giO0OOizZECMwH9W8u024i79FWNgrVPn6MPYJP2
	NrCjblyo38a8RN5xU7jMz+koDRcMFKiK06QYlczDN/Ek9WhboVJRsh77LQQ8V0j8AUR2fyMaCpcRk
	+hYeBOcmBPjSny/veIRKLryLciep1b/USvEjJ833nXQuRWyDM4hvES/nc6CubL/EHPKfrZgJPmHnC
	qeNpMqOz3GRGH5+2VgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvjke-007mU9-Ky; Mon, 30 May 2022 18:04:24 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvjkI-007mIV-VC
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 18:04:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id x17so6607090wrg.6
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmIAgX4stP7tbN1utudJdCwbmHGl9Wqirrw9D2YXhxA=;
        b=sj37xc3nASZ+YCXla39Pf94LuVNA1E3wbnpESKap4+mtZJkHFXPsMp7U6qzSqZUvSP
         Zkbt24QW2ES5ClbIchtBy19300ZLdqUNMSmmUTpB6UYympcjd01q1M0KrPM9xHbQ1Qxw
         GHrOPXCT+kGQ4dB/KttIVWVEUjPvL6qWZSfqcDa2MSh2XvY34u/O4j3wXJ/4xhzDGdS4
         KDD0P2RkI/tv81gLON3wHXZdLn5dCEoFpv7k5Jf/+ktP9RymmXCa2CHYVACXJiwm6ZVm
         HPCp8Ul/ru2dIS28/dji4srbNBakB6xMGNuUeH94i8RGl8OD1U0q+N7faTgqNzcaWwdG
         6aHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmIAgX4stP7tbN1utudJdCwbmHGl9Wqirrw9D2YXhxA=;
        b=bL0UD6907A78US74DP2pbMsKqWtCCBd8rhxs5BJU2dI7BeOUWAU2sKN+MaomME9lvt
         lw1QuwoA+mfrP9XK6tTv2Ot4LUw5Tq30zQKqmo78nOFxm/6od3VN3smitNf394MnCWX1
         LFU+hza+swOQ9ZXsLoeXQv1w06jvLRytUz2qhPE/lDCDdnS+1gW+fkhygfheCspkVtRX
         zvfKKbKmDPd3BKSYdhD2GA7Lnh+97nufsNN/VY5BkCF5j6oYF+lBYZQLMTLlbE7RGl4Y
         ey55fhXslHjwzNOkd5aMAZj48pjMJ2FYD1w1yJ0upcgZ29bA0g2D0RoDHJSIBDiK8iKI
         g8nw==
X-Gm-Message-State: AOAM530xUZeu7rGAsHf4oSR3sE+E2I1Z6F8M12lNiVasvhQ91xOEj/8f
	JANGlEC5LbzdxEbh+HDpnQZDsQ==
X-Google-Smtp-Source: ABdhPJzbbLY65ueNfiMy634xwWX8GhshgQaMx9qx3BJ/rdkq+iVkOzEljqVwWPwdzKhOxGv1GHmSOg==
X-Received: by 2002:a05:6000:1247:b0:210:1f6c:b1cb with SMTP id j7-20020a056000124700b002101f6cb1cbmr12912728wrx.709.1653933839926;
        Mon, 30 May 2022 11:03:59 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id 9-20020a1c0209000000b00397550b387bsm1647wmc.23.2022.05.30.11.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:03:59 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] iommu: mtk_iommu: add support for MT8365 SoC
Date: Mon, 30 May 2022 20:03:28 +0200
Message-Id: <20220530180328.845692-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530180328.845692-1-fparent@baylibre.com>
References: <20220530180328.845692-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_110403_070261_997A35B8 
X-CRM114-Status: GOOD (  10.90  )
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

Add IOMMU support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/iommu/mtk_iommu.c | 11 +++++++++++
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index b692347d8d56..039b8f9d5022 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1093,6 +1093,16 @@ static const struct mtk_iommu_plat_data mt8192_data = {
 	.port_width     = 5,
 };
 
+static const struct mtk_iommu_plat_data mt8365_data = {
+	.m4u_plat     = M4U_MT8365,
+	.flags	      = RESET_AXI,
+	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
+	.iova_region  = single_domain,
+	.iova_region_nr = ARRAY_SIZE(single_domain),
+	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
+	.port_width   = 6,
+};
+
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
@@ -1100,6 +1110,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
 	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
 	{ .compatible = "mediatek,mt8192-m4u", .data = &mt8192_data},
+	{ .compatible = "mediatek,mt8365-m4u", .data = &mt8365_data},
 	{}
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 84cecaf6d61c..cb174fa6f2ab 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -46,6 +46,7 @@ enum mtk_iommu_plat {
 	M4U_MT8173,
 	M4U_MT8183,
 	M4U_MT8192,
+	M4U_MT8365,
 };
 
 struct mtk_iommu_iova_region;
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
