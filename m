Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D311C83006
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:38:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E7120B80
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="anH5xt/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33E7120B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=FIxLAGYfnI3XfcJM8haSjYsQI9s7im2F1ZUR++dfwLI=; b=anH
	5xt/fpkTV83rD24tms0FqEopQpMwtofLkM6H6m8vswW1BlFtKR4MOLC/SCF3xu7qc7DYsvrzhGoim
	k6uURzk7oD8uHcCwY8sOgP35KYe4snXJd8M1Eg3NXu4e/QTyhFV/EsKWu47dq7kxvcRHTKl6zhNVm
	tZcVwmikukUHszbmmTET62I28QGitqiiDA6AttO8pm9UQWfFFRBKDAiBe2C5MAj/1melrb0jEQ9ta
	+X8p22I5QtWMThLdQEoZzgpasoDzxJW5j0F/lL7AxtXHXUXcJFTIv2b6WjLkTPvJWikWNrmG5/2BA
	LStQxuhR3jFueiBizvlOYweFcEcuVdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmun-0006t1-EL; Wed, 29 Apr 2020 13:38:17 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuF-0006CM-1o; Wed, 29 Apr 2020 13:37:46 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 49DD72E2; Wed, 29 Apr 2020 15:37:35 +0200 (CEST)
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
Subject: [PATCH v3 00/34] iommu: Move iommu_group setup to IOMMU core code
Date: Wed, 29 Apr 2020 15:36:38 +0200
Message-Id: <20200429133712.31431-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063743_398744_C8401725 
X-CRM114-Status: GOOD (  11.00  )
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
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux-foundation.org,
 jonathan.derrick@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

here is the third version of this patch-set. Older versions can be found
here:

	v1: https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/
	    (Has some more introductory text)

	v2: https://lore.kernel.org/lkml/20200414131542.25608-1-joro@8bytes.org/

Changes v2 -> v3:

	* Rebased v5.7-rc3

	* Added a missing iommu_group_put() as reported by Lu Baolu.

	* Added a patch to consolidate more initialization work in
	  __iommu_probe_device(), fixing a bug where no 'struct
	  device_iommu' was allocated in the hotplug path.

There is also a git-branch available with these patches applied:

	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v3

Please review. If there are no objections I plan to put these patches
into the IOMMU tree early next week.

Thanks,

	Joerg

Joerg Roedel (33):
  iommu: Move default domain allocation to separate function
  iommu/amd: Implement iommu_ops->def_domain_type call-back
  iommu/vt-d: Wire up iommu_ops->def_domain_type
  iommu/amd: Remove dma_mask check from check_device()
  iommu/amd: Return -ENODEV in add_device when device is not handled by
    IOMMU
  iommu: Add probe_device() and release_device() call-backs
  iommu: Move default domain allocation to iommu_probe_device()
  iommu: Keep a list of allocated groups in __iommu_probe_device()
  iommu: Move new probe_device path to separate function
  iommu: Split off default domain allocation from group assignment
  iommu: Move iommu_group_create_direct_mappings() out of
    iommu_group_add_device()
  iommu: Export bus_iommu_probe() and make is safe for re-probing
  iommu/amd: Remove dev_data->passthrough
  iommu/amd: Convert to probe/release_device() call-backs
  iommu/vt-d: Convert to probe/release_device() call-backs
  iommu/arm-smmu: Convert to probe/release_device() call-backs
  iommu/pamu: Convert to probe/release_device() call-backs
  iommu/s390: Convert to probe/release_device() call-backs
  iommu/virtio: Convert to probe/release_device() call-backs
  iommu/msm: Convert to probe/release_device() call-backs
  iommu/mediatek: Convert to probe/release_device() call-backs
  iommu/mediatek-v1 Convert to probe/release_device() call-backs
  iommu/qcom: Convert to probe/release_device() call-backs
  iommu/rockchip: Convert to probe/release_device() call-backs
  iommu/tegra: Convert to probe/release_device() call-backs
  iommu/renesas: Convert to probe/release_device() call-backs
  iommu/omap: Remove orphan_dev tracking
  iommu/omap: Convert to probe/release_device() call-backs
  iommu/exynos: Use first SYSMMU in controllers list for IOMMU core
  iommu/exynos: Convert to probe/release_device() call-backs
  iommu: Remove add_device()/remove_device() code-paths
  iommu: Move more initialization to __iommu_probe_device()
  iommu: Unexport iommu_group_get_for_dev()

Sai Praneeth Prakhya (1):
  iommu: Add def_domain_type() callback in iommu_ops

 drivers/iommu/amd_iommu.c       |  97 ++++----
 drivers/iommu/amd_iommu_types.h |   1 -
 drivers/iommu/arm-smmu-v3.c     |  38 +---
 drivers/iommu/arm-smmu.c        |  39 ++--
 drivers/iommu/exynos-iommu.c    |  24 +-
 drivers/iommu/fsl_pamu_domain.c |  22 +-
 drivers/iommu/intel-iommu.c     |  68 +-----
 drivers/iommu/iommu.c           | 387 +++++++++++++++++++++++++-------
 drivers/iommu/ipmmu-vmsa.c      |  60 ++---
 drivers/iommu/msm_iommu.c       |  34 +--
 drivers/iommu/mtk_iommu.c       |  24 +-
 drivers/iommu/mtk_iommu_v1.c    |  50 ++---
 drivers/iommu/omap-iommu.c      |  99 ++------
 drivers/iommu/qcom_iommu.c      |  24 +-
 drivers/iommu/rockchip-iommu.c  |  26 +--
 drivers/iommu/s390-iommu.c      |  22 +-
 drivers/iommu/tegra-gart.c      |  24 +-
 drivers/iommu/tegra-smmu.c      |  31 +--
 drivers/iommu/virtio-iommu.c    |  41 +---
 include/linux/iommu.h           |  21 +-
 20 files changed, 531 insertions(+), 601 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
