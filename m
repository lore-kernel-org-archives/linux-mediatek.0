Return-Path: <SRS0=woo5=5L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90289C2D0EC
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 15:09:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E64B2076A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 15:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bHdh/h4z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E64B2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GeP2fptaSNcsZxWk5yxS+r50PjrgQOeJjNX2iLE7iuo=; b=bHd
	h/h4z1kyik+paZDmIiZ3A5xUTEJOgTOOZGgqwVcT4DiHney0KZOqDOi4aOimZPuq8hoW4PHREg/HO
	7FZ9DYySZoACTVKegv/bThPOm+f9XOf4syIU7j21oGwKULgF0YMv0vyQI6bAZb9DY+LNWNx/yes9t
	CCfFh3GeoOCODVe9L+j35e+HudTGBBXS8KwRJVSUDgaJ4BgGcQIKAW2rZNpqC7VQJ69HnHJiTqzhN
	rZ3NdndFQeZgy1jq4a4qYGIsoC/luPgBxLe9Sss91IQZcaAjWxgFHC7lfzJT8zenjz8acK0f4xfzl
	YaMZD2GGTHy0GKk8lDyEQUixZ8xER1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHU7q-00043K-5j; Thu, 26 Mar 2020 15:08:54 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHU7l-0003zf-Qp
 for linux-mediatek@lists.infradead.org; Thu, 26 Mar 2020 15:08:51 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 978072AA; Thu, 26 Mar 2020 16:08:45 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v4 00/16] iommu: Move iommu_fwspec out of 'struct device'
Date: Thu, 26 Mar 2020 16:08:25 +0100
Message-Id: <20200326150841.10083-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_080850_013583_2CDCF29E 
X-CRM114-Status: UNSURE (   6.83  )
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
 Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 guohanjun@huawei.com, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

here is the updated version of the changes to move iommu_fwspec out of
'struct device'. Previous versions of this patch-set can be found here:

	v3: https://lore.kernel.org/lkml/20200320091414.3941-1-joro@8bytes.org/

	v2: https://lore.kernel.org/lkml/20200310091229.29830-1-joro@8bytes.org/

	v1: https://lore.kernel.org/lkml/20200228150820.15340-1-joro@8bytes.org/

Changes to v2:

	- Addressed Robins review comments

	- Added Robins patch to optimize arm-smmu changes

	- Rebased to v5.6-rc7

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

Robin Murphy (1):
  iommu/arm-smmu: Refactor master_cfg/fwspec usage

 drivers/acpi/arm64/iort.c                |  6 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/iommu/arm-smmu-v3.c              | 10 ++--
 drivers/iommu/arm-smmu.c                 | 55 +++++++++++----------
 drivers/iommu/iommu.c                    | 31 ++++++------
 drivers/iommu/ipmmu-vmsa.c               |  7 +--
 drivers/iommu/mtk_iommu.c                | 13 +++--
 drivers/iommu/mtk_iommu_v1.c             | 14 +++---
 drivers/iommu/qcom_iommu.c               | 61 ++++++++++++++----------
 drivers/iommu/tegra-gart.c               |  2 +-
 drivers/iommu/virtio-iommu.c             | 11 ++---
 include/linux/device.h                   |  9 ++--
 include/linux/iommu.h                    | 33 ++++++++++---
 13 files changed, 142 insertions(+), 112 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
