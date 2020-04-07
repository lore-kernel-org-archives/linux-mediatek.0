Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62503C2D0EC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:40:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28A3B20771
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WLChu4/h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q1O8U7T4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28A3B20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SH+infWgwFIoPydpZud0vmQvSAxfJSl7Gv7sODmY39w=; b=WLChu4/hyL7LV9UA+jQOJDyIct
	ayNI4Nik++4GwLz9RX6wVbkMVRezBFG9DEOQ70pQBSqc5pmxQOSYhCzWylXs7fHr4YxhikgP1XDpu
	ruHthRvpPf9Phgqs8yvNAzVpSFavZvH0V69XVlNeUqxLkM2kGwtFkxTo793EjsIR3w4qyUE92cshq
	pqRgvA4hEpAHEXnf5cRa9awz+SGg8UvJXIgWr+PiZ/W/raBB2Mo6quaQ9Lqq3EMWAvgHyiJs7LbF/
	2hg4GD6GPQ2mkNFNrBql89QuHPaPZwpYECndzsjMeH0A4Ux4PSLBRSc5lwI1gskfdoYljaqPMdf2v
	R09yDV5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLt9N-00040Q-Ea; Tue, 07 Apr 2020 18:40:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt7L-0007IV-Lq; Tue, 07 Apr 2020 18:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3Opj20+5HPpld2ndbb8aFFbwgRbbaS/xoYgURzJujyE=; b=q1O8U7T4uOW4yknHAEXRnPS4M8
 9ZuxZn4bJ9Cv5D/yf9APId7mn45f5yNuIa8j7Gd2Ac/oMNmAi2XpBTzYPKp7OQG0hFvxynhil59F4
 nFFptVQoq1oOpuY/75dpJxcqd9ETert1KI2B8U2St64VhaUOPCvWxqcRnnUbIwvWlVu8lA+16S9jo
 gjqGJDSsv4UjFnJA/W33moojPa9y8NSusw41DvLfZ6AyL1yiCKrO75Z7YdMCr06l999Xre0gXaFC9
 HJ9UOyjHJUb/Q96dsBPX/d8mirWVWcCFXHlF2un/ItFK1nCp3s/oQTHXRAPTdveC8nZnLiTC+G6LV
 /P/2nDOQ==;
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt78-0004pl-24; Tue, 07 Apr 2020 18:38:32 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6667D642; Tue,  7 Apr 2020 20:37:53 +0200 (CEST)
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
Subject: [RFC PATCH 27/34] iommu/tegra: Convert to probe/release_device()
 call-backs
Date: Tue,  7 Apr 2020 20:37:35 +0200
Message-Id: <20200407183742.4344-28-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_193823_123627_999160EB 
X-CRM114-Status: GOOD (  18.67  )
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

Convert the Tegra IOMMU drivers to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/tegra-gart.c | 24 ++++++------------------
 drivers/iommu/tegra-smmu.c | 31 ++++++++-----------------------
 2 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index db6559e8336f..5fbdff6ff41a 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -243,28 +243,16 @@ static bool gart_iommu_capable(enum iommu_cap cap)
 	return false;
 }
 
-static int gart_iommu_add_device(struct device *dev)
+static struct iommu_device *gart_iommu_probe_device(struct device *dev)
 {
-	struct iommu_group *group;
-
 	if (!dev_iommu_fwspec_get(dev))
-		return -ENODEV;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
+		return ERR_PTR(-ENODEV);
 
-	iommu_device_link(&gart_handle->iommu, dev);
-
-	return 0;
+	return &gart_handle->iommu;
 }
 
-static void gart_iommu_remove_device(struct device *dev)
+static void gart_iommu_release_device(struct device *dev)
 {
-	iommu_group_remove_device(dev);
-	iommu_device_unlink(&gart_handle->iommu, dev);
 }
 
 static int gart_iommu_of_xlate(struct device *dev,
@@ -290,8 +278,8 @@ static const struct iommu_ops gart_iommu_ops = {
 	.domain_free	= gart_iommu_domain_free,
 	.attach_dev	= gart_iommu_attach_dev,
 	.detach_dev	= gart_iommu_detach_dev,
-	.add_device	= gart_iommu_add_device,
-	.remove_device	= gart_iommu_remove_device,
+	.probe_device	= gart_iommu_probe_device,
+	.release_device	= gart_iommu_release_device,
 	.device_group	= generic_device_group,
 	.map		= gart_iommu_map,
 	.unmap		= gart_iommu_unmap,
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 63a147b623e6..7426b7666e2b 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -757,11 +757,10 @@ static int tegra_smmu_configure(struct tegra_smmu *smmu, struct device *dev,
 	return 0;
 }
 
-static int tegra_smmu_add_device(struct device *dev)
+static struct iommu_device *tegra_smmu_probe_device(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct tegra_smmu *smmu = NULL;
-	struct iommu_group *group;
 	struct of_phandle_args args;
 	unsigned int index = 0;
 	int err;
@@ -774,7 +773,7 @@ static int tegra_smmu_add_device(struct device *dev)
 			of_node_put(args.np);
 
 			if (err < 0)
-				return err;
+				return ERR_PTR(err);
 
 			/*
 			 * Only a single IOMMU master interface is currently
@@ -783,8 +782,6 @@ static int tegra_smmu_add_device(struct device *dev)
 			 */
 			dev->archdata.iommu = smmu;
 
-			iommu_device_link(&smmu->iommu, dev);
-
 			break;
 		}
 
@@ -793,26 +790,14 @@ static int tegra_smmu_add_device(struct device *dev)
 	}
 
 	if (!smmu)
-		return -ENODEV;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
+		return ERR_PTR(-ENODEV);
 
-	return 0;
+	return &smmu->iommu;
 }
 
-static void tegra_smmu_remove_device(struct device *dev)
+static void tegra_smmu_release_device(struct device *dev)
 {
-	struct tegra_smmu *smmu = dev->archdata.iommu;
-
-	if (smmu)
-		iommu_device_unlink(&smmu->iommu, dev);
-
 	dev->archdata.iommu = NULL;
-	iommu_group_remove_device(dev);
 }
 
 static const struct tegra_smmu_group_soc *
@@ -895,8 +880,8 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.domain_free = tegra_smmu_domain_free,
 	.attach_dev = tegra_smmu_attach_dev,
 	.detach_dev = tegra_smmu_detach_dev,
-	.add_device = tegra_smmu_add_device,
-	.remove_device = tegra_smmu_remove_device,
+	.probe_device = tegra_smmu_probe_device,
+	.release_device = tegra_smmu_release_device,
 	.device_group = tegra_smmu_device_group,
 	.map = tegra_smmu_map,
 	.unmap = tegra_smmu_unmap,
@@ -1015,7 +1000,7 @@ struct tegra_smmu *tegra_smmu_probe(struct device *dev,
 	 * value. However the IOMMU registration process will attempt to add
 	 * all devices to the IOMMU when bus_set_iommu() is called. In order
 	 * not to rely on global variables to track the IOMMU instance, we
-	 * set it here so that it can be looked up from the .add_device()
+	 * set it here so that it can be looked up from the .probe_device()
 	 * callback via the IOMMU device's .drvdata field.
 	 */
 	mc->smmu = smmu;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
