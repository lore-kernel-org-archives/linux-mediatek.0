Return-Path: <SRS0=UOtS=CP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7816DC43461
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 15:19:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0AF20714
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 15:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qhabzVUc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SX4GDYqT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA0AF20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NosoArPnhL3ON0JiwGAtaxFRan6kCxvyBDk4WRLHXEU=; b=qhabzVUc2bZSpdWpeSxnxJ4io
	qDrOZ7TsWuIhhNB4Dqi83ZI5LXnYu91jQs6sawi95ThCj5ivn8IgjxgvkOd3wcXxMMQdixjS8zs4d
	8vb3Z0Izg9aom8J/7tIiquaQjXvuA/WFg637Bl08dPorM5nY7Uulk+RFEyXhfCSpV6XQqjWz600YD
	+omuO+apcLHmntYFRSaTEckMBSYHRV2QZbTibmv/o3oViKll4TJWQNkTCw6g8iUIYEovpLJ0moWQ1
	KOMECIwds1nkVkhfN7dntx74OIQSfSYekHRY6Za9jES4tPLxvuy1Cq9uDojactlSiIK/cSCupTMrM
	1j8+kGeRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEwSF-0004Od-Iz; Sun, 06 Sep 2020 15:19:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEwS8-0004Lk-Is
 for linux-mediatek@lists.infradead.org; Sun, 06 Sep 2020 15:19:38 +0000
Received: by mail-wm1-x341.google.com with SMTP id o21so11045953wmc.0
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2020 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uHlPaejxaoEdhUtjcAkbEk5MwemH61sGbulo7nTGaVI=;
 b=SX4GDYqTPOGWjEBwAPJ+63c5XJ+ugOUtKfk2l97qxzdS2k0Gs3m/RL1RxgLIqb9BGI
 GJzExp+fn4OA+P/b5Kx45NWqujGTB+EFHnJLjWDAsCu5e9IAyZe5RTNQSeCuXK1iGUBg
 ViS+LLN/xduUf/moO8/9B9eaCe2k/rBPGM05InBZDCSiKeQiJJgeD5+Wd7nRJfvpJl3D
 rseB2sAArVCsO6cAhTtEUqykbhjl/MSC3j2sngJ0x8bc5ATvxhvVw41dNoxye+lbXAZg
 zDoeVjmXF3eC9s4u20sPCwq2i26V0JPWhbcBJaBEQi1yTJcqExo3/h/EsPvOUeklCzVx
 +XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHlPaejxaoEdhUtjcAkbEk5MwemH61sGbulo7nTGaVI=;
 b=nRhYc7I4Yh7feClJJA1XMj4SUuFIZxq1vJgqgdGOEmANkGPhM3qrwIj1QJ2f+4c9Rv
 SS2p4dLgHDYwFWZXu+9dB8BmgmxV+GAUDXB7uH9H22rXt3VIZRP+/3IEZW4ZYPlj3KkJ
 JXVJMhKJy8ClmX6HubGNMgoql/O22GDxPE632wVGO5JPKqUuKNELsxHKBLiu2fMOIAfJ
 M3E0VcC70ESBX8vjad15Y3yaAG6uESKkmG8SXNuUq78fqeH5/n4sXpXJqliOEZNW8ddY
 bjAiq7d2v28B0f6vqfckjlCvFZcTX2r7rpkORrlOLUnnmI9OwZQs373MA5ngTxEJ0b5n
 KL2Q==
X-Gm-Message-State: AOAM530eDp7OwWeHQpfaSnm2im8HdjS5RwhGN4vvYvTS2BHE2+1Hxv3G
 RMi12p0UdXeVfOi+H/pgNGhRww==
X-Google-Smtp-Source: ABdhPJxTiP5W3hXf0jIMlYDRBifFpSbd8PfKRCSzquyfrJqE89SWeJ2IDFhFHf02RC+vrWN02y3xIw==
X-Received: by 2002:a1c:c90d:: with SMTP id f13mr16979046wmb.25.1599405575412; 
 Sun, 06 Sep 2020 08:19:35 -0700 (PDT)
Received: from localhost.localdomain (208.19.23.93.rev.sfr.net. [93.23.19.208])
 by smtp.gmail.com with ESMTPSA id a15sm26420646wrn.3.2020.09.06.08.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 08:19:34 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/3] iommu/mediatek: add flag for legacy ivrp paddr
Date: Sun,  6 Sep 2020 17:19:27 +0200
Message-Id: <20200906151928.881209-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200906151928.881209-1-fparent@baylibre.com>
References: <20200906151928.881209-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_111936_650506_76E298F0 
X-CRM114-Status: GOOD (  13.41  )
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

Add a new flag in order to select which IVRP_PADDR format is used
by an SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

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
