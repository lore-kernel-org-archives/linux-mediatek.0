Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF346C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:25:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7203A2075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lpwSdu8/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k5z2wM2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7203A2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oKjG1hmc8E2B8uWICjRVGCodR8foBf9+x8jFVH2TtFU=; b=lpwSdu8/bkRYGsMrcSw+IsP4I
	yc0gtYJHKSYAMjkgW7S+bKR3C7aKAheofX144VLQy0+X+0CORRsxrX40h+HvyyI9FKcW0TCuFLIVk
	IMCvbeviC88iHDOC2hopQI4CLjgGSNgDDC6QfIdLu41eoQHvTWkvR3iB3GDsrmBg8LuELK5UjNA/F
	mZvGKy1bz8rHx8ud9kUC7D+jAQ+pAsL+Alp1iBBzO/3TxhT9Qh6C3vrhetRsX5i4/rxhzqGOLelIV
	4cql40sCFAH2JJcN4/FDJDH5MoMHyr3qKSan90iPgeTTEWPRiDAVM1COu7g27Q50q3O/5bLNshG54
	6S9JKy9UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWU3-0004wK-Mu; Wed, 30 Sep 2020 07:25:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWON-0002FY-Ed; Wed, 30 Sep 2020 07:19:33 +0000
X-UUID: 492dbe6a65aa48eba3d985e55a9daaed-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5cuaBwfVccDx8t6YaxBqxyKgg/cFncPpWk3C5+45/Dk=; 
 b=k5z2wM2/SYVmS3M7s5242mIgNZB8bjX4Gg05ixoHxaQYYD9TSKkk9kWFjn3a/Oe6V9sma98DXWDlTw1hDSSGpOR2S7tnR8rp8AKuZQ2QOIt4hjHMOjELIfuLheATOAJqftFKSpozAB3QlOylXUUMqyjVcbrfigM9rRtoXMJz3dY=;
X-UUID: 492dbe6a65aa48eba3d985e55a9daaed-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1867586062; Tue, 29 Sep 2020 23:18:34 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 00:10:08 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:10:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:10:01 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 15/24] iommu/mediatek: Add power-domain operation
Date: Wed, 30 Sep 2020 15:06:38 +0800
Message-ID: <20200930070647.10188-16-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C77212E66262157FC1E61846B81DE56A08D456D9678A5E9C684DD4C76542F2D42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031911_734640_D5096C8C 
X-CRM114-Status: GOOD (  20.71  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the previous SoC, the M4U HW is in the EMI power domain which is
always on. the latest M4U is in the display power domain which may be
turned on/off, thus we have to add pm_runtime interface for it.

When the engine work, the engine always enable the power and clocks for
smi-larb/smi-common, then the M4U's power will always be powered on
automatically via the device link with smi-common.

Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
If its power already is on, of course it is ok. if the power is off,
the main tlb will be reset while M4U power on, thus the tlb flush while
m4u power off is unnecessary, just skip it.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 052eb72acf69..1e6e6d3fa7f1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -196,6 +196,10 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 	u32 tmp;
 
 	for_each_m4u(data) {
+		/* skip tlb flush when pm is not active. */
+		if (!pm_runtime_active(data->dev))
+			continue;
+
 		spin_lock_irqsave(&data->tlb_lock, flags);
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 			       data->base + data->plat_data->inv_sel_reg);
@@ -380,6 +384,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	struct device *m4udev = data->dev;
 	int ret;
 
 	if (!data)
@@ -387,12 +392,18 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 
 	/* Update the pgtable base address register of the M4U HW */
 	if (!data->m4u_dom) {
+		ret = pm_runtime_get_sync(m4udev);
+		if (ret < 0)
+			return ret;
 		ret = mtk_iommu_hw_init(data);
-		if (ret)
+		if (ret) {
+			pm_runtime_put(m4udev);
 			return ret;
+		}
 		data->m4u_dom = dom;
 		writel(dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
 		       data->base + REG_MMU_PT_BASE_ADDR);
+		pm_runtime_put(m4udev);
 	}
 
 	mtk_iommu_config(data, dev, true);
@@ -742,10 +753,13 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (dev->pm_domain) {
 		struct device_link *link;
 
+		pm_runtime_enable(dev);
+
 		link = device_link_add(data->smicomm_dev, dev,
 				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 		if (!link) {
 			dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
+			pm_runtime_disable(dev);
 			return -EINVAL;
 		}
 	}
@@ -763,8 +777,10 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 		bus_set_iommu(&platform_bus_type, NULL);
 
 	clk_disable_unprepare(data->bclk);
-	if (pdev->dev.pm_domain)
+	if (pdev->dev.pm_domain) {
 		device_link_remove(data->smicomm_dev, &pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+	}
 	devm_free_irq(&pdev->dev, data->irq, data);
 	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
 	return 0;
@@ -796,6 +812,9 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	void __iomem *base = data->base;
 	int ret;
 
+	/* Avoid first resume to affect the default value of registers below. */
+	if (!m4u_dom)
+		return 0;
 	ret = clk_prepare_enable(data->bclk);
 	if (ret) {
 		dev_err(data->dev, "Failed to enable clk(%d) in resume\n", ret);
@@ -809,9 +828,7 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
 	writel_relaxed(reg->int_main_control, base + REG_MMU_INT_MAIN_CONTROL);
 	writel_relaxed(reg->ivrp_paddr, base + REG_MMU_IVRP_PADDR);
 	writel_relaxed(reg->vld_pa_rng, base + REG_MMU_VLD_PA_RNG);
-	if (m4u_dom)
-		writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK,
-		       base + REG_MMU_PT_BASE_ADDR);
+	writel(m4u_dom->cfg.arm_v7s_cfg.ttbr & MMU_PT_ADDR_MASK, base + REG_MMU_PT_BASE_ADDR);
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
