Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A81C10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 10:15:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7374820637
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 10:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NSQ4qEBn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7374820637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yqY0BOJMURVVHpePiZi1cdnbep229BgqKgy4CWfV4k8=; b=NSQ
	4qEBnUZtyCTYPA6sHsgWX5fcJoh7lUb7XPfs5FiDfucjPOHRBVmTg1GHJgrOtfrBVWL8P7iY/qLq8
	nIKnxFsrQVSmruUIb+pxvN/GOy4gl3LgMnVBkmCZGUETTmtSEw/CcetiGK0JYmJXeYZ/leQyUdTFW
	zdHGffkhHzO7HS65aXbOx7rf6ra0Pxl7Liwvq7WFe81CcDt1noy8YIyKvauWy8SvHvEysKmtzqLEg
	0PqYEMVqoXM49Pa1KoztdOfvtJLhPAfNLB5ayLp10kiQfv0RxWLWW2b8gmcc0X5Nz+jiHOXPl/wxM
	blZ7H/ImHRlr07bbowWkOtPdAn3UcZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBbv2-0005qJ-V8; Tue, 10 Mar 2020 10:15:24 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBawN-0006Ez-89
 for linux-mediatek@lists.infradead.org; Tue, 10 Mar 2020 09:12:44 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DF24A364; Tue, 10 Mar 2020 10:12:31 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 00/15 v2] iommu: Move iommu_fwspec out of 'struct device'
Date: Tue, 10 Mar 2020 10:12:14 +0100
Message-Id: <20200310091229.29830-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_021243_469667_E8A00BC0 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

here is a patch-set to rename iommu_param to dev_iommu and
establish it as a struct for generic per-device iommu-data.
Also move the iommu_fwspec pointer from struct device into
dev_iommu to have less iommu-related pointers in struct
device.

The bigger part of this patch-set moves the iommu_priv
pointer from struct iommu_fwspec to dev_iommu, making is
usable for iommu-drivers which do not use fwspecs.

The changes for that were mostly straightforward, except for
the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
Unfortunatly I don't have the hardware for those, so any
testing of these drivers is greatly appreciated.

Please review.

Regards,

	Joerg

Changes to v1:

	- Rebased to v5.6-rc5
	- Fixed compile error with CONFIG_IOMMU_API=n
	- Added Jean-Philippes fix to the ACPI/IORT patch

Joerg Roedel (15):
  iommu: Define dev_iommu_fwspec_get() for !CONFIG_IOMMU_API
  ACPI/IORT: Remove direct access of dev->iommu_fwspec
  drm/msm/mdp5: Remove direct access of dev->iommu_fwspec
  iommu/tegra-gart: Remove direct access of dev->iommu_fwspec
  iommu: Rename struct iommu_param to dev_iommu
  iommu: Move iommu_fwspec to struct dev_iommu
  iommu/arm-smmu: Fix uninitilized variable warning
  iommu: Introduce accessors for iommu private data
  iommu/arm-smmu-v3: Use accessor functions for iommu private data
  iommu/arm-smmu: Use accessor functions for iommu private data
  iommu/renesas: Use accessor functions for iommu private data
  iommu/mediatek: Use accessor functions for iommu private data
  iommu/qcom: Use accessor functions for iommu private data
  iommu/virtio: Use accessor functions for iommu private data
  iommu: Move fwspec->iommu_priv to struct dev_iommu

 drivers/acpi/arm64/iort.c                |  6 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/iommu/arm-smmu-v3.c              | 10 ++--
 drivers/iommu/arm-smmu.c                 | 58 +++++++++++-----------
 drivers/iommu/iommu.c                    | 31 ++++++------
 drivers/iommu/ipmmu-vmsa.c               |  7 +--
 drivers/iommu/mtk_iommu.c                | 13 +++--
 drivers/iommu/mtk_iommu_v1.c             | 14 +++---
 drivers/iommu/qcom_iommu.c               | 61 ++++++++++++++----------
 drivers/iommu/tegra-gart.c               |  2 +-
 drivers/iommu/virtio-iommu.c             | 11 ++---
 include/linux/device.h                   |  7 ++-
 include/linux/iommu.h                    | 33 ++++++++++---
 13 files changed, 143 insertions(+), 112 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
