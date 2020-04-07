Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78F0C2BBFD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:38:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F07D2076E
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:38:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OV9SxxX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F07D2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=grfnarYn5+ou4Akpo6ZHQOpN53SItiI/xKo4FXdAiKY=; b=OV9
	SxxX8aFXqy8a9/808Z4zDU6DlmdXYsRNOux7Qdob9ggx7Ak5kS2j6yIZvl9yS2L/c1yjqEyh+cCoS
	M6gBLHGSYh2stGv+rN/7Bw/klOErG9IRLiYIrc9epjfyOJrB+NjAdH7M9s/nvC+HlTJkR0c/63Nt7
	vx2lMA8t0hoKeal/MR27N0maFcP42qqmmNMErcSaeQyfXguv23Fi+iE2lGqFvRrt/soIxqcw0dMI7
	9XdqbQ+xZ6wCTOYnBke6Xjmp2euCT4wtmmbGIn81F+TTZQ3w4DMyKartdrWNkL8zGtH7y47lDhc+p
	i9x4NyyRNLDzndu7/KZq2I99Xmsk1Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLt7M-0007JN-Rr; Tue, 07 Apr 2020 18:38:36 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt6l-0006aJ-9l; Tue, 07 Apr 2020 18:38:03 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 49F26A5; Tue,  7 Apr 2020 20:37:48 +0200 (CEST)
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
Subject: [RFC PATCH 00/34] iommu: Move iommu_group setup to IOMMU core code
Date: Tue,  7 Apr 2020 20:37:08 +0200
Message-Id: <20200407183742.4344-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_113759_705164_09E7EDA7 
X-CRM114-Status: GOOD (  18.16  )
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
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

here is a patch-set to remove all calls of iommu_group_get_for_dev() from
the IOMMU drivers and move the per-device group setup and default domain
allocation into the IOMMU core code.

This eliminates some ugly back and forth between IOMMU core code and the
IOMMU drivers, where the driver called iommu_group_get_for_dev() which itself
called back into the driver.

The patch-set started as a "quick" Friday afternoon project to split the
IOMMU group creation and the allocation of the default domain, so that the
default domain is not allocated before all devices are added to the group.
In the end it took 1.5 weeks to get this in a reasonable shape, but now the
code (during bus probing) first adds all devices to their respective IOMMU
group before it determines the default domain type and then allocates it for
the group.

It turned out that this required to remove the calls of
iommu_group_get_for_dev() from the IOMMU drivers. While at it, the calls to
iommu_device_link()/unlink() where also moved out of the drivers, which
required a different interface than add_device()/remove_device(). The result
is the new probe_device()/release_device() interface, where the driver just
does its own setup and then returns the iommu_device which belongs to the
device being probed.

There is certainly more room for cleanups, but I think this is a good start
to simplify the code flow during IOMMU device probing.  It is also a more
robust base for the pending patch-sets which implement per-group default
domain types and the removal of the private domains from the Intel VT-d
driver.

With regards to testing, I verified this code works on three IOMMUs:

	- AMD-Vi
	- Intel VT-d (but there might be breakages on some hardware, the
	  patches to remove the private domain handling from the VT-d driver
	  should be rebased to these patches)
	- ARM-SMMU-v3 (as emulated by QEMU)

Most driver conversions to the probe_device()/release_device() interface
were trivial, but there were also some hard nuts, which I am not sure still
work. The more difficult drivers were:

	- ARM-SMMU-v2
	- OMAP
	- Renesas
	- Mediatek IOMMU v1
	- Exynos

It would be great if the changes could be tested (and possibly fixed) on
those IOMMUs, as I can't do testing on them.

The patches are based on the current iommu/next branch, I will rebase them
to v5.7-rc1 when it comes out. A branch with these patches applied can be
found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device

Please review and test these changes and let me know what breaks.

Thanks,

	Joerg

Joerg Roedel (33):
  iommu: Move default domain allocation to separate function
  iommu/amd: Implement iommu_ops->def_domain_type call-back
  iommu/vt-d: Wire up iommu_ops->def_domain_type
  iommu/amd: Remove dma_mask check from check_device()
  iommu/amd: Return -ENODEV in add_device when device is not handled by
    IOMMU
  iommu: Add probe_device() and remove_device() call-backs
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
  iommu/arm-smmu: Store device instead of group in arm_smmu_s2cr
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
  iommu/exynos: Create iommu_device in struct exynos_iommu_owner
  iommu/exynos: Convert to probe/release_device() call-backs
  iommu: Remove add_device()/remove_device() code-paths
  iommu: Unexport iommu_group_get_for_dev()

Sai Praneeth Prakhya (1):
  iommu: Add def_domain_type() callback in iommu_ops

 drivers/iommu/amd_iommu.c       |  97 ++++----
 drivers/iommu/amd_iommu_types.h |   1 -
 drivers/iommu/arm-smmu-v3.c     |  42 +---
 drivers/iommu/arm-smmu.c        |  44 ++--
 drivers/iommu/exynos-iommu.c    | 113 ++++++---
 drivers/iommu/fsl_pamu_domain.c |  22 +-
 drivers/iommu/intel-iommu.c     |  68 +-----
 drivers/iommu/iommu.c           | 391 +++++++++++++++++++++++++-------
 drivers/iommu/ipmmu-vmsa.c      |  60 ++---
 drivers/iommu/msm_iommu.c       |  34 +--
 drivers/iommu/mtk_iommu.c       |  24 +-
 drivers/iommu/mtk_iommu_v1.c    |  50 ++--
 drivers/iommu/omap-iommu.c      |  99 ++------
 drivers/iommu/qcom_iommu.c      |  24 +-
 drivers/iommu/rockchip-iommu.c  |  26 +--
 drivers/iommu/s390-iommu.c      |  22 +-
 drivers/iommu/tegra-gart.c      |  24 +-
 drivers/iommu/tegra-smmu.c      |  31 +--
 drivers/iommu/virtio-iommu.c    |  41 +---
 include/linux/iommu.h           |  21 +-
 20 files changed, 600 insertions(+), 634 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
