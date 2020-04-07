Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C018AC2BBC7
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:39:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A8D2076E
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:39:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z0Srsv/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A8D2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D7iNHgCCsjFnV61DJ5QhyNcjLhJRxb0jruELb6hp7Cw=; b=Z0Srsv/HuNl0XN3gEXPOU/TH6M
	JWKftxrprFSY7r9buZqsLzlFwKS66xk7kAgliV7eiPirTsC+mwirG2lCnc190i0AxvbDMYESvJDjy
	JfM6Ax44av6opv5gK9ttt9UyIVDLor+GGhEEMo1BOdSmDRwx1vVlfZ/48z52Np1hKd5MDmPEbpBa4
	mw6hInSwpWxR5hWjOKnOf7surWC+98L1d9snnTKFbTUBRzsPzZtv72wdJgWHf4hF9IE1Ip+2aaT2r
	pJxkEFgxCw+SC3nN4VHD3XrJUoRCrDP2JOINogKcXTUzy9GImvoG0vd19MipHwtFmR9fNpOkDIXer
	gcCqxlzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLt89-0008P6-Tw; Tue, 07 Apr 2020 18:39:25 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt6x-0006rv-1B; Tue, 07 Apr 2020 18:38:15 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D53E25D8; Tue,  7 Apr 2020 20:37:52 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 24/34] iommu/mediatek-v1 Convert to probe/release_device()
 call-backs
Date: Tue,  7 Apr 2020 20:37:32 +0200
Message-Id: <20200407183742.4344-25-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_113811_261303_77EEC166 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

Convert the Mediatek-v1 IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/mtk_iommu_v1.c | 50 +++++++++++++++---------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index a31be05601c9..7bdd74c7cb9f 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -416,14 +416,12 @@ static int mtk_iommu_create_mapping(struct device *dev,
 	return 0;
 }
 
-static int mtk_iommu_add_device(struct device *dev)
+static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct dma_iommu_mapping *mtk_mapping;
 	struct of_phandle_args iommu_spec;
 	struct of_phandle_iterator it;
 	struct mtk_iommu_data *data;
-	struct iommu_group *group;
 	int err;
 
 	of_for_each_phandle(&it, err, dev->of_node, "iommus",
@@ -442,35 +440,28 @@ static int mtk_iommu_add_device(struct device *dev)
 	}
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
-		return -ENODEV; /* Not a iommu client device */
+		return ERR_PTR(-ENODEV); /* Not a iommu client device */
 
-	/*
-	 * This is a short-term bodge because the ARM DMA code doesn't
-	 * understand multi-device groups, but we have to call into it
-	 * successfully (and not just rely on a normal IOMMU API attach
-	 * here) in order to set the correct DMA API ops on @dev.
-	 */
-	group = iommu_group_alloc();
-	if (IS_ERR(group))
-		return PTR_ERR(group);
+	data = dev_iommu_priv_get(dev);
 
-	err = iommu_group_add_device(group, dev);
-	iommu_group_put(group);
-	if (err)
-		return err;
+	return &data->iommu;
+}
 
-	data = dev_iommu_priv_get(dev);
+static void mtk_iommu_probe_finalize(struct device *dev)
+{
+	struct dma_iommu_mapping *mtk_mapping;
+	struct mtk_iommu_data *data;
+	int err;
+
+	data        = dev_iommu_priv_get(dev);
 	mtk_mapping = data->dev->archdata.iommu;
-	err = arm_iommu_attach_device(dev, mtk_mapping);
-	if (err) {
-		iommu_group_remove_device(dev);
-		return err;
-	}
 
-	return iommu_device_link(&data->iommu, dev);
+	err = arm_iommu_attach_device(dev, mtk_mapping);
+	if (err)
+		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }
 
-static void mtk_iommu_remove_device(struct device *dev)
+static void mtk_iommu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct mtk_iommu_data *data;
@@ -479,9 +470,6 @@ static void mtk_iommu_remove_device(struct device *dev)
 		return;
 
 	data = dev_iommu_priv_get(dev);
-	iommu_device_unlink(&data->iommu, dev);
-
-	iommu_group_remove_device(dev);
 	iommu_fwspec_free(dev);
 }
 
@@ -534,8 +522,10 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.map		= mtk_iommu_map,
 	.unmap		= mtk_iommu_unmap,
 	.iova_to_phys	= mtk_iommu_iova_to_phys,
-	.add_device	= mtk_iommu_add_device,
-	.remove_device	= mtk_iommu_remove_device,
+	.probe_device	= mtk_iommu_probe_device,
+	.probe_finalize = mtk_iommu_probe_finalize,
+	.release_device	= mtk_iommu_release_device,
+	.device_group	= generic_device_group,
 	.pgsize_bitmap	= ~0UL << MT2701_IOMMU_PAGE_SHIFT,
 };
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
