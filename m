Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E898DC4332E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 09:14:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B28A920752
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 09:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n8djcYup"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B28A920752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/GTFn7t4r9RTk5RzLcaIi7NTC7zQpXu57lJvBmfD394=; b=n8d
	jcYupDQFps/1byB0wEm9qmhSg90dQrz8p2UG8A2A8B+wFHAsFv4jQY9IRu/+HhA0Zf/zhCbcZ7xHa
	qYeQv4ny7xpVeyi1PaJEs19IyX5tN4SuBDZjLZcYIOc2erzCeep8yb5/+J2KNfH02FG1+7hTYCVM0
	anh9mKMaG+GyqauiM7HYwqEfan1u7C7ETxt5esTB6RWZvlCSfP/f+fBJubXvHtBhW/Dc3VSgAlws+
	xSyqkJTDv3Qq/fRK4hxtlA1dlLNDUk7kApzSGgojOV7fMGSjPofP3P+sw0kNWs1ASXrSZzVkp9mIW
	lpXseAWdyzlcJHkJ1Mnb6oYB7VhmnjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFDjf-0000FQ-BM; Fri, 20 Mar 2020 09:14:35 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFDja-00009G-8x
 for linux-mediatek@lists.infradead.org; Fri, 20 Mar 2020 09:14:31 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6E822B0; Fri, 20 Mar 2020 10:14:19 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v3 00/15] iommu: Move iommu_fwspec out of 'struct device'
Date: Fri, 20 Mar 2020 10:13:59 +0100
Message-Id: <20200320091414.3941-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_021430_489967_8FB23102 
X-CRM114-Status: UNSURE (   7.19  )
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
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, guohanjun@huawei.com,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

here is the third version of the changes to move iommu_fwspec out of
'struct device'. Previous versions of this patch-set can be found here:

	v2: https://lore.kernel.org/lkml/20200310091229.29830-1-joro@8bytes.org/

	v1: https://lore.kernel.org/lkml/20200228150820.15340-1-joro@8bytes.org/

Changes to v2:

	- Fix the issues found by Jean-Philippe

	- Fix a compile issue in the Mediatek driver

Please review.

Thanks,

	Joerg

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
 drivers/iommu/arm-smmu.c                 | 59 ++++++++++++-----------
 drivers/iommu/iommu.c                    | 31 ++++++------
 drivers/iommu/ipmmu-vmsa.c               |  7 +--
 drivers/iommu/mtk_iommu.c                | 13 +++--
 drivers/iommu/mtk_iommu_v1.c             | 14 +++---
 drivers/iommu/qcom_iommu.c               | 61 ++++++++++++++----------
 drivers/iommu/tegra-gart.c               |  2 +-
 drivers/iommu/virtio-iommu.c             | 11 ++---
 include/linux/device.h                   |  9 ++--
 include/linux/iommu.h                    | 33 ++++++++++---
 13 files changed, 144 insertions(+), 114 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
