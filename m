Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB5CC2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 13:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDD392063A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 13:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="idiMkrRU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDD392063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=o6mn9bOj/k/qts3CLKitWwmLiZZelK0BZPZ5A7wgtdw=; b=idi
	MkrRUQYB0/O2duagP/y2WYc9dgnTe9a1opuLR7sM8ybWAGG75qUv7JrugDtEtHfSbHWtwmDMvhesc
	ad7H42OoPc21vYMwp5k/g6+D8rep/nQDhKbJSHR+dFE2mqZ6elcfejt21jtBjvMs0QSP/YhnpTZwv
	oIFl9A4hWjsuCqBNJNoZPCz4ZSt+sKbHKVHx5zEw36tghIDJ/oizxkfJniZcbnwPX0FlUXf/SIBfx
	vKosFlG921HXVYqVu8vsIujyzEB/3K/4NybbsN+Efh3+lJfeh2TYNXZ5lXZ4GKX4UW3+YC8OLvq5f
	Xvqk/1Stx2E01NAu6+EK9VEqmfAeCXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOLXB-0003oN-Fw; Tue, 14 Apr 2020 13:23:25 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLPy-0002Cr-Ua; Tue, 14 Apr 2020 13:16:03 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6821A2B0; Tue, 14 Apr 2020 15:15:51 +0200 (CEST)
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
Subject: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Date: Tue, 14 Apr 2020 15:15:09 +0200
Message-Id: <20200414131542.25608-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_061559_296226_0A0E8607 
X-CRM114-Status: GOOD (  10.28  )
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

here is the second version of this patch-set. The first version with
some more introductory text can be found here:

	https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/

Changes v1->v2:

	* Rebased to v5.7-rc1

	* Re-wrote the arm-smmu changes as suggested by Robin Murphy

	* Re-worked the Exynos patches to hopefully not break the
	  driver anymore

	* Fixed a missing mutex_unlock() reported by Marek Szyprowski,
	  thanks for that.

There is also a git-branch available with these patches applied:

	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device-v2

Please review.

Thanks,

	Joerg

Joerg Roedel (32):
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
  iommu: Unexport iommu_group_get_for_dev()

Sai Praneeth Prakhya (1):
  iommu: Add def_domain_type() callback in iommu_ops

 drivers/iommu/amd_iommu.c       |  97 ++++----
 drivers/iommu/amd_iommu_types.h |   1 -
 drivers/iommu/arm-smmu-v3.c     |  38 +--
 drivers/iommu/arm-smmu.c        |  39 ++--
 drivers/iommu/exynos-iommu.c    |  24 +-
 drivers/iommu/fsl_pamu_domain.c |  22 +-
 drivers/iommu/intel-iommu.c     |  68 +-----
 drivers/iommu/iommu.c           | 393 +++++++++++++++++++++++++-------
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
 20 files changed, 533 insertions(+), 605 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
