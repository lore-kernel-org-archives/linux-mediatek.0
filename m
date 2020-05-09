Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BBCC28CBC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 08:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6545924965
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 08:41:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uv4O+NKW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B5joWZzi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6545924965
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jay0lvqs4zQwZJ5dFdOUkwwQSKsttCsdDEBiZVuSJxQ=; b=Uv4O+NKWCrgpZD
	flkjm1RNrLILSw4V79EvAaqeNMCPdrUt1faZT5iquuDU4hwTRSeIHohr1nvRtr3qE8tUQ5lZAy3Qb
	fuWB61335pNUu9R16kvKt7NooDWpLSPTNNbZ3KJ/33PY62JgKIwERpSZzN0eYYUz0ItMMu1Kk5/Ug
	PKAhgPQcKzFULBgk5CNF9Qz8yBlra416qn/4ao7iQTRnKXpcWH5iATzV2aC3YzQcvR/rkxaHfj9Uo
	EtqvOyXySNYnasAcTUq4aohx+rF8aSgG1RGEu/BA1sFgbbtg/Q3rtVpv1i5uCMoaInVKV5TmaX8i0
	dI2/kagHo/wpcmlC8MBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXL2c-0004j8-Jx; Sat, 09 May 2020 08:41:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXL1r-0003ti-60; Sat, 09 May 2020 08:40:18 +0000
X-UUID: 34f74359b61f494b936abb15e2a351cb-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ezxnpacb1Qfl7kqFt1JuWZJN2mz/b27zc594wQ0UDDo=; 
 b=B5joWZzi+jCyBPRGDiMUbY2cXai/WWlCdMs2FoIvLfi8idRCIOwqWY67ztVDCb/f0QnrXy2jvC5D/214LKppjEfhWwK9C2dcO7Ic5JtdOmDOLr9+8eTFWdvMcMnO98hPYhfycQmBwIVd5hVdHtvlHznb5tnE9T5/RLV2qUOEI0w=;
X-UUID: 34f74359b61f494b936abb15e2a351cb-20200509
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1965377033; Sat, 09 May 2020 00:40:04 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 01:40:07 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 16:40:07 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 16:40:06 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v3 3/7] iommu/mediatek: Disable STANDARD_AXI_MODE in MISC_CTRL
Date: Sat, 9 May 2020 16:36:50 +0800
Message-ID: <20200509083654.5178-4-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200509083654.5178-1-chao.hao@mediatek.com>
References: <20200509083654.5178-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3B61293D89B03B88DD10C331106402621E780E90FEB2590354515292684FA6732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_014015_331528_E04145AD 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 Jun Yan <jun.yan@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order to improve performance, we always disable STANDARD_AXI_MODE in
MISC_CTRL.

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 8 +++++++-
 drivers/iommu/mtk_iommu.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e7e7c7695ed1..9ede327a418d 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -42,6 +42,8 @@
 #define F_INVLD_EN1				BIT(1)
 
 #define REG_MMU_MISC_CTRL			0x048
+#define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
+
 #define REG_MMU_DCM_DIS				0x050
 
 #define REG_MMU_CTRL_REG			0x110
@@ -585,7 +587,11 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
 
-	if (data->plat_data->reset_axi) {
+	if (data->plat_data->has_misc_ctrl) {
+		regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
+		regval &= ~F_MMU_STANDARD_AXI_MODE_BIT;
+		writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
+	} else if (data->plat_data->reset_axi) {
 		/* The register is called STANDARD_AXI_MODE in this case */
 		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
 	}
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 1b6ea839b92c..d711ac630037 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -40,6 +40,7 @@ struct mtk_iommu_plat_data {
 
 	/* HW will use the EMI clock if there isn't the "bclk". */
 	bool                has_bclk;
+	bool		    has_misc_ctrl;
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
 	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
