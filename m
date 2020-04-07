Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80494C2BA80
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:40:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4705F20730
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UCTymC3+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iOoRchJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4705F20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MO/w+e9w7nA7zOEo3es39ZE4hglyZ3ZehH2bvAcGAM4=; b=UCTymC3+sU0s4sSk6F4PjRl0Yx
	iG3NcjZW/aWW3nQIbffG9f+C1O4gKHP2fXbjO5gSC6XicHJuyJnORcPqCx0HiUFEhOouPc9N8kXnP
	zChXJ8BH+wfcAgEAfSNPylwPOGplCsWtRMLW63mWLHBXjFF4rBUbBo7BAGUCSgM5RaqiX2uunLOuG
	U1xQA946ZLfANjlAz9YwEaVKmYMIgGYOLrQ8r7upAgXLbWMA79a8JczPeH43ZgDowosrKXPCLCam7
	Whc/VwEIx/e7e92iWQ80YC4zaG/KhGdODQ82ZlI3Wm4dfOoW5SWzr76nNBrOv2ryNTrrzw4m8+ID7
	/V6nPgsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLt9L-0003xb-GK; Tue, 07 Apr 2020 18:40:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt7M-0007JC-Mo; Tue, 07 Apr 2020 18:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=G3ouBcVxGm0cXMOB5g0I5uMTw8BFLiPMZLpR/oT5y8s=; b=iOoRchJwCHWwCLEItYviZhpPKg
 npbxMe/v3Lc1/N/twRfPLRwcwvsDlxmxYM/iCmNKrO3rQtVjiGTnaRq93/4QZcNYu8ozsOEi6PLQs
 7OiBpKojLW0fGQCgyoyukR6O57kebWc0SNeVSsNRKmhs5u8hQ4gSNBYJJ28pnsNSyOBe3RtdVITdW
 5GcHEyzPtbaR2evFzhDF/IZSJmnXrBikpE+eCwKhYZf3g2FGwQRK/sCVlAuyoyCUGK24+BhQaw0P7
 FlmJJP1eSvxug9JYEbiOYEiV0KKUS7IH9O00wEcmqhMmE5aKDdjlJlYwAX08G5p9JgAjdhbXpPvFM
 VX/Sd9Hg==;
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt78-0004pb-22; Tue, 07 Apr 2020 18:38:35 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1BABB50C; Tue,  7 Apr 2020 20:37:51 +0200 (CEST)
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
Subject: [RFC PATCH 20/34] iommu/s390: Convert to probe/release_device()
 call-backs
Date: Tue,  7 Apr 2020 20:37:28 +0200
Message-Id: <20200407183742.4344-21-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_193823_421020_2CAD6772 
X-CRM114-Status: GOOD (  15.30  )
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

Convert the S390 IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/s390-iommu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index 1137f3ddcb85..610f0828f22d 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -166,21 +166,14 @@ static void s390_iommu_detach_device(struct iommu_domain *domain,
 	}
 }
 
-static int s390_iommu_add_device(struct device *dev)
+static struct iommu_device *s390_iommu_probe_device(struct device *dev)
 {
-	struct iommu_group *group = iommu_group_get_for_dev(dev);
 	struct zpci_dev *zdev = to_pci_dev(dev)->sysdata;
 
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	iommu_group_put(group);
-	iommu_device_link(&zdev->iommu_dev, dev);
-
-	return 0;
+	return &zdev->iommu_dev;
 }
 
-static void s390_iommu_remove_device(struct device *dev)
+static void s390_iommu_release_device(struct device *dev)
 {
 	struct zpci_dev *zdev = to_pci_dev(dev)->sysdata;
 	struct iommu_domain *domain;
@@ -191,7 +184,7 @@ static void s390_iommu_remove_device(struct device *dev)
 	 * to vfio-pci and completing the VFIO_SET_IOMMU ioctl (which triggers
 	 * the attach_dev), removing the device via
 	 * "echo 1 > /sys/bus/pci/devices/.../remove" won't trigger detach_dev,
-	 * only remove_device will be called via the BUS_NOTIFY_REMOVED_DEVICE
+	 * only release_device will be called via the BUS_NOTIFY_REMOVED_DEVICE
 	 * notifier.
 	 *
 	 * So let's call detach_dev from here if it hasn't been called before.
@@ -201,9 +194,6 @@ static void s390_iommu_remove_device(struct device *dev)
 		if (domain)
 			s390_iommu_detach_device(domain, dev);
 	}
-
-	iommu_device_unlink(&zdev->iommu_dev, dev);
-	iommu_group_remove_device(dev);
 }
 
 static int s390_iommu_update_trans(struct s390_domain *s390_domain,
@@ -373,8 +363,8 @@ static const struct iommu_ops s390_iommu_ops = {
 	.map = s390_iommu_map,
 	.unmap = s390_iommu_unmap,
 	.iova_to_phys = s390_iommu_iova_to_phys,
-	.add_device = s390_iommu_add_device,
-	.remove_device = s390_iommu_remove_device,
+	.probe_device = s390_iommu_probe_device,
+	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = S390_IOMMU_PGSIZES,
 };
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
