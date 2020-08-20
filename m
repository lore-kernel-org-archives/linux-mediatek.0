Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAD4C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 15:12:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4451B208C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 15:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m29RyTIU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4451B208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VZSQiBs7a57WvXMWhYqNlkSRb1ILVz54meLRErPkuHU=; b=m29RyTIUMG0pWd21RuEJci9Ge
	fDP/cNhstd2Ol12u2ydCWAtyPGkONdctpCCUdZoatSqh9vdMrQDPpAjlGiX6NVSqKfXxXs1OIJZ7e
	RuEC4wwHL7kWt2KpK7uxXzouSyOZ/s5ABKsGADxz/IqiS6QeK3B1h/R8YPc4tKe9Wr+vljEWArXcS
	4FEnXScY1BrNQrYLKBdfwaNzB1NPhWN/j7N/+aDulxyU7SXj8X//8O8SCyRrQGVfgkP4Nv5U46Eaw
	OWm7xNzbutxi8eXlY8h2ZPhQXdTe4/pZ5ig4lWbBOF0KfoTQBwzu7Iy2mY28qT7lR1n9JP+/T/4dy
	9ZEUEl0jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8mEM-0003ui-OZ; Thu, 20 Aug 2020 15:11:54 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8mC4-0002LH-Qk; Thu, 20 Aug 2020 15:09:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB83F1476;
 Thu, 20 Aug 2020 08:09:31 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 539A53F6CF;
 Thu, 20 Aug 2020 08:09:28 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
Date: Thu, 20 Aug 2020 16:08:29 +0100
Message-Id: <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_110933_054711_411864C8 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Now that arch/arm is wired up for default domains and iommu-dma,
implement the corresponding driver-side support for DMA domains.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/msm_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 3615cd6241c4..f34efcbb0b2b 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
+#include <linux/dma-iommu.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/io-pgtable.h>
@@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
 
+	if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
+		goto fail_nomem;
+
 	INIT_LIST_HEAD(&priv->list_attached);
 
 	priv->domain.geometry.aperture_start = 0;
@@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
 	struct msm_priv *priv;
 	unsigned long flags;
 
+	iommu_put_dma_cookie(domain);
 	spin_lock_irqsave(&msm_iommu_lock, flags);
 	priv = to_msm_priv(domain);
 	kfree(priv);
-- 
2.28.0.dirty


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
