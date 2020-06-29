Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A498CC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:24:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7324B23134
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B8LoTShM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L0cdVeY2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7324B23134
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kCM3yzZ2jiBUFs29etqx9fdHPT4x/+4vXeox7+stRGs=; b=B8LoTShMhCc9h66QDVDTB38xE
	EKF1V+euQublc2I7UruHrcPGcGlXZPz5fa7g35LDDelPsSdqHLMG2s5aXd+axeIFHR6oJJqblV4jF
	w0jSo7T4ZdLIc40+qRVQVK+gfSphjLIfku437kfY27U5gf38NSBhWxczLkP8R6+I6z/SXztqEN3WV
	oW7zCNr54ybIK9fSuALpFfaUm7MEiUCqrRIUvPi8te2soVxMQn+j24xBmYyLvZSmBck/g4O3/Lit/
	4rWXdYm0ZllwHpLukSHDH3NjcgnnirvjJHNfbf1oex/OzwOTHqQG4u68cBL/1vtP/Jwy5jTZf54x+
	b/mDU5xVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpo9o-00026J-UY; Mon, 29 Jun 2020 07:24:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpo9T-0001ym-S3; Mon, 29 Jun 2020 07:24:30 +0000
X-UUID: c42ec5b2488349f3a0a4b0ad31ea51f5-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Yk6s7ryuF3u1G1TNTIPXYyOnPM1lnS4V6x+TlPNGEsY=; 
 b=L0cdVeY2Jojxj3IfA7zE1cYODojNQF3WTtaAm1Dj7/5H757cdgu/nlDewodANloCs//O5SKj9pSvVZL3tw3ak5x+kbIq/q3+sy+DGi+NW251cxQC8Q9/GNTPFyc5JeDMVTiJoo9NMnoZjw4ssyWwy5xOhRwjY9UmpkMTRkpv8kU=;
X-UUID: c42ec5b2488349f3a0a4b0ad31ea51f5-20200628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 579859578; Sun, 28 Jun 2020 23:24:18 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 00:14:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 15:14:16 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 15:14:16 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v5 04/10] iommu/mediatek: Setting MISC_CTRL register
Date: Mon, 29 Jun 2020 15:13:04 +0800
Message-ID: <20200629071310.1557-5-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200629071310.1557-1-chao.hao@mediatek.com>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
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
 Evan Green <evgreen@chromium.org>, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add F_MMU_IN_ORDER_WR_EN and F_MMU_STANDARD_AXI_MODE_BIT definition
in MISC_CTRL register.
F_MMU_STANDARD_AXI_MODE_BIT:
  If we set F_MMU_STANDARD_AXI_MODE_BIT(bit[3][19] = 0, not follow
standard AXI protocol), iommu will send urgent read command firstly
compare with normal read command to improve performance.
F_MMU_IN_ORDER_WR_EN:
  If we set F_MMU_IN_ORDER_WR_EN(bit[1][17] = 0, out-of-order write), iommu
will re-order write command and send more higher priority write command
instead of sending write command in order. The feature be controlled
by OUT_ORDER_EN macro definition.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Suggested-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 12 +++++++++++-
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 8f81df6cbe51..67b46b5d83d9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -42,6 +42,9 @@
 #define F_INVLD_EN1				BIT(1)
 
 #define REG_MMU_MISC_CTRL			0x048
+#define F_MMU_IN_ORDER_WR_EN			(BIT(1) | BIT(17))
+#define F_MMU_STANDARD_AXI_MODE_BIT		(BIT(3) | BIT(19))
+
 #define REG_MMU_DCM_DIS				0x050
 
 #define REG_MMU_CTRL_REG			0x110
@@ -574,10 +577,17 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	}
 	writel_relaxed(0, data->base + REG_MMU_DCM_DIS);
 
+	regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, RESET_AXI)) {
 		/* The register is called STANDARD_AXI_MODE in this case */
-		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
+		regval = 0;
+	} else {
+		/* For mm_iommu, it can improve performance by the setting */
+		regval &= ~F_MMU_STANDARD_AXI_MODE_BIT;
+		if (MTK_IOMMU_HAS_FLAG(data->plat_data, OUT_ORDER_EN))
+			regval &= ~F_MMU_IN_ORDER_WR_EN;
 	}
+	writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
 
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 7cc39f729263..4b780b651ef4 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -22,6 +22,7 @@
 #define HAS_BCLK			BIT(1)
 #define HAS_VLD_PA_RNG			BIT(2)
 #define RESET_AXI			BIT(3)
+#define OUT_ORDER_EN			BIT(4)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
 		((((pdata)->flags) & (_x)) == (_x))
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
