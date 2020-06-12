Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A125C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 03:40:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D7F620835
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 03:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5dTw5JJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D7F620835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HrYyT7HHhRy8TEfWzdsLGYv8UuRKcOI5cX/M5Dhn2FE=; b=H5d
	Tw5JJRrV0pHwnmAjfEMDUSJi/fwIPQZBFQP3nGp57BpkUDh2fI65kAJs54gTMkxqHy9bA+isS/Am/
	+sG7iuFBrOwAZs/x5mnyJmquF1lvJqzK2ImYb3OwkWPiM54iyyCiM2sJw93cNWndkjJMUm6NkclhP
	8li8ThVrOSpQxDyq3HJaD4gG/s4nxyL5LcBXRvLBeb1qJwe/ELbyWPri1PTSyPkq5ZfqKdPRmgIo6
	vwIMOSFIIVFpBVJ7M4ochhAdxf3OvamdLPShVA2z8Q3rhXLHF7kGGAmBZow5GaBWKfxkikcV4HV84
	MCMJIjBl7RwdzQaVXtaO+fyqt7A8ncA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjaYV-00021Z-3f; Fri, 12 Jun 2020 03:40:35 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjaYJ-0001rp-9Z; Fri, 12 Jun 2020 03:40:27 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01358;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=21; SR=0;
 TI=SMTPD_---0U.JoNaf_1591933214; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0U.JoNaf_1591933214) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jun 2020 11:40:14 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, agross@kernel.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, robdclark@gmail.com,
 robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 0/2] Some improvements for iommu
Date: Fri, 12 Jun 2020 11:39:53 +0800
Message-Id: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_204023_517030_31B945BE 
X-CRM114-Status: UNSURE (   5.41  )
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, baolin.wang@linux.alibaba.com,
 baolin.wang7@gmail.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

The first patch masks some functions as static, and the second patch
changes to use the gfp parameter from iommu_ops->map() to allocate
ARM page pages. Any comments are welcome. Thanks.

Changes from v1:
 - Fix the building errors when enabling CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST

Baolin Wang (2):
  iommu: Mark __iommu_map/__iommu_map_sg as static
  iommu: Add gfp parameter to io_pgtable_ops->map()

 drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
 drivers/iommu/arm-smmu-v3.c             |  2 +-
 drivers/iommu/arm-smmu.c                |  2 +-
 drivers/iommu/io-pgtable-arm-v7s.c      | 18 +++++++++---------
 drivers/iommu/io-pgtable-arm.c          | 18 +++++++++---------
 drivers/iommu/iommu.c                   | 10 +++++-----
 drivers/iommu/ipmmu-vmsa.c              |  2 +-
 drivers/iommu/msm_iommu.c               |  2 +-
 drivers/iommu/mtk_iommu.c               |  2 +-
 drivers/iommu/qcom_iommu.c              |  2 +-
 include/linux/io-pgtable.h              |  2 +-
 11 files changed, 31 insertions(+), 31 deletions(-)

-- 
1.8.3.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
