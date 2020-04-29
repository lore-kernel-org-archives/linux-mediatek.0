Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D41C83003
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:38:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1155206D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tX0W1qQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1155206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VU574OgUrpsIA39sRGE89Jp6rgw63WY/y5kYSkwA28o=; b=tX0W1qQnGIXOnua8CfqcGJMgSz
	+LTWrKMkfcBnvcJMMh1VKaOX4ZCQH/gBrtqCctVKxVB1W2i00Eed16oxLm8Z4c4Y8dfsmkTE8qGJ1
	BBdem2gx+nEJ+fP0mVA5Jm9c2bpGqPGcTvL+KLTnjTrn3BXFDBEVqRMTuWJjHdB9OFAIau4Uth480
	T7JesOraLknZ4qE7OdmqBj2RRqQGogLhZl+as4nJAjYsBmzjOWwxZB1TsxBwcjPHc21jNH6iZCaO5
	IupcKB46TdGOR1syFmfR+0VQO3kqX0qa5M2b4mUP2VKlSKEzMKLToMRKNTFdzsh+0v5BXn8LzOk2m
	MPqusfGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmvK-0007mz-Iu; Wed, 29 Apr 2020 13:38:50 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuP-0006Ne-9r; Wed, 29 Apr 2020 13:37:56 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DAA2CF02; Wed, 29 Apr 2020 15:37:39 +0200 (CEST)
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
Subject: [PATCH v3 24/34] iommu/qcom: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:37:02 +0200
Message-Id: <20200429133712.31431-25-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063753_581294_FD064D91 
X-CRM114-Status: GOOD (  14.25  )
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
 Daniel Drake <drake@endlessm.com>, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

Convert the QCOM IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/qcom_iommu.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 0e2a96467767..054e476ebd49 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -524,14 +524,13 @@ static bool qcom_iommu_capable(enum iommu_cap cap)
 	}
 }
 
-static int qcom_iommu_add_device(struct device *dev)
+static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
-	struct iommu_group *group;
 	struct device_link *link;
 
 	if (!qcom_iommu)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	/*
 	 * Establish the link between iommu and master, so that the
@@ -542,28 +541,19 @@ static int qcom_iommu_add_device(struct device *dev)
 	if (!link) {
 		dev_err(qcom_iommu->dev, "Unable to create device link between %s and %s\n",
 			dev_name(qcom_iommu->dev), dev_name(dev));
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 	}
 
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
-	iommu_device_link(&qcom_iommu->iommu, dev);
-
-	return 0;
+	return &qcom_iommu->iommu;
 }
 
-static void qcom_iommu_remove_device(struct device *dev)
+static void qcom_iommu_release_device(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 
 	if (!qcom_iommu)
 		return;
 
-	iommu_device_unlink(&qcom_iommu->iommu, dev);
-	iommu_group_remove_device(dev);
 	iommu_fwspec_free(dev);
 }
 
@@ -619,8 +609,8 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.flush_iotlb_all = qcom_iommu_flush_iotlb_all,
 	.iotlb_sync	= qcom_iommu_iotlb_sync,
 	.iova_to_phys	= qcom_iommu_iova_to_phys,
-	.add_device	= qcom_iommu_add_device,
-	.remove_device	= qcom_iommu_remove_device,
+	.probe_device	= qcom_iommu_probe_device,
+	.release_device	= qcom_iommu_release_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
