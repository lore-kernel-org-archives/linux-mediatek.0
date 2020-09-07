Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A42C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:17:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2519E207C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 10:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L10rE/Qk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VxIbSxKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2519E207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=32uTDcE7aDk1hlGLhcahEODqgoELqsqkAtPRMulZnIk=; b=L10rE/QkuvZzZU2CLgv2nCUaB
	ZkgF/HDkFSm5fUidceCIfwGIK7bJ5+X2fkN+6t12y9tMyzpjuCn6F7TTsmuop24p1IjdHMkr0cbIR
	XHzHg0E3cdYwe3c4WE0WGKUUD2kqIaGcayxxScD31/erIZXJsroFs/ptUxmiF+V0409YeDK6qcaQp
	rNceA5eZ1UDdnSywr7plYIi5jt8u8UyuY/3drAmrRR0GjYZZ9du8HmsT7zQnMRAbYnbEy8V62Y4iN
	9JMoDpwStWypKNUIGgG1aqpZyYeruTe9VbkXVydrIWJ4PYkFBfm/vhnT/1pZUlNXmtdx5VEszKxnw
	oteT23eKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFECu-00028R-Fz; Mon, 07 Sep 2020 10:17:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFECp-000266-EP
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 10:17:00 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so15238453wrn.0
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 03:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a6r4qRpyiPjYoazUXrGcYGUllitYhB0RC4eGKhazF9E=;
 b=VxIbSxKhSrWc+F+oc18qEnTOaZd41KDrz5frjSOA/RXEGtv8Rkpmq3MmHG5a3Ke2/6
 qxO6UBZoWo74fLIBwgG12aBOvgWUFfo+dNHTaPST+7WpVEmKjhtqw/e7onJ5yiYoZR+Y
 oLzYytplhw+JUDu4TMDVxz59bsx5yUvNQUFh+wCbrAJs8wNSMSP0ADg5yqkMd/JHk4NW
 BT3MePh7FTSUT6DSBOvFRKhkY+G2S7YrM03g0hceBVZoyA8kGvIzPEyGKygq9Rx3jfEG
 tIZjBwOwQonMxWYr9Y5d4Lb5cNx7LfNmZVGq7BWtx05JuotJ7L7ctpDHxGMa789PGlXA
 TV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a6r4qRpyiPjYoazUXrGcYGUllitYhB0RC4eGKhazF9E=;
 b=MA07QyqzIyd85LSAJX09reLOFhr5LQ+lXdxHxPbZD90GMqXkY8E/UbatFbcCwIhQjk
 d++MvQDfGvO4yblQwfPAvHX6oYB39wGqTz6gAvvK9iYxsOyrMEzgHjb72jsyv6SEVqOx
 JxZtEzvvE0q9J5LABRRz/vDpzyC0ukUUhaIMeVtLUtw6OFBdWS9Z923ESUyzAa62D45j
 vmj5Hn3H6UKLsBCaO6chuf/63s8HAS0BeBtjfN6pYxtBKmINTu90SnHTxFtTDf+gmYh6
 Hm5+UGpIMN26sUF+nqFyHPIJCdu+UMOXnYJwDTMNz11GgS9pu0X5I3J4cAV9wO4YT36e
 SDOA==
X-Gm-Message-State: AOAM5317SZxFdjENMBPlqf5YnpaxDeVkUVQ4LGkDHfcImsRaCCQP4dXR
 x6zFmf8N3JEiI9exe+nhLaaOwA==
X-Google-Smtp-Source: ABdhPJx2mHI+LxUYgnUtc5wgXC9XjqJnZvPO9JK3D0PlntFtIsdK2B0n8vwCwkckPL2XhfzljaycXw==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr22515101wrm.229.1599473818648; 
 Mon, 07 Sep 2020 03:16:58 -0700 (PDT)
Received: from localhost.localdomain (122.105.23.93.rev.sfr.net.
 [93.23.105.122])
 by smtp.gmail.com with ESMTPSA id j7sm28728689wrw.35.2020.09.07.03.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 03:16:58 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/3] iommu/mediatek: add flag for legacy ivrp paddr
Date: Mon,  7 Sep 2020 12:16:48 +0200
Message-Id: <20200907101649.1573134-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907101649.1573134-1-fparent@baylibre.com>
References: <20200907101649.1573134-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_061659_517465_81AF0B04 
X-CRM114-Status: GOOD (  13.44  )
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

Add a new flag in order to select which IVRP_PADDR format is used
by an SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---

v4: no change
v3: set LEGACY_IVRP_PADDR as a flag instead of platform data
v2: new patch

---
 drivers/iommu/mtk_iommu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 785b228d39a6..b1f85a7e9346 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -116,6 +116,7 @@
 #define OUT_ORDER_WR_EN			BIT(4)
 #define HAS_SUB_COMM			BIT(5)
 #define WR_THROT_EN			BIT(6)
+#define HAS_LEGACY_IVRP_PADDR		BIT(7)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
 		((((pdata)->flags) & (_x)) == (_x))
@@ -582,7 +583,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
 	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
 
-	if (data->plat_data->m4u_plat == M4U_MT8173)
+	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_LEGACY_IVRP_PADDR))
 		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
 	else
 		regval = lower_32_bits(data->protect_base) |
@@ -818,7 +819,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
 
 static const struct mtk_iommu_plat_data mt8173_data = {
 	.m4u_plat     = M4U_MT8173,
-	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI,
+	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
+			HAS_LEGACY_IVRP_PADDR,
 	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
 	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
 };
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
