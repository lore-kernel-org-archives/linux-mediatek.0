Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8494AC52D6F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Aug 2024 03:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lT8Q7lVbYLqAyc8sacwXTnlCDNIWPRROT3qiMFaqTZk=; b=aTMfWpysYrImni31Y8qPR85hXS
	5TVhLu17K9c3z0hDY8H0c9NSBd4LJKu+TY7muSZ06spyCvhQJBhhDg/WFQuZvZkLSi2Dhn1mEPwL0
	fhqRSIF0dFVFa/rXz6hBpXOHVCs5mKEE4hb33rA1JQYjeYWwxaEWuDdo1sVPtTamPi7kc5ZSItZOg
	+rS7wbh0KYiXoIFgcP5FdAoji3v8g3mpfMw9oJuZ37Vqi/CMLDt/ymtT3/iX9KK6HtdDWcNUwQk3t
	eTpR1MyZ17l7N2SFojqpAMNL6MAPtImJmUqcjSIgfhY9CN9vDbX334J7WDSnMRJDghqi1fc7weDHU
	jk7Nmozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhn7-00000001NBs-2p7o;
	Sat, 24 Aug 2024 03:50:17 +0000
Received: from 2a02-8389-2341-5b80-7457-864c-9b77-b751.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7457:864c:9b77:b751] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shhmJ-00000001Mzu-3l73;
	Sat, 24 Aug 2024 03:49:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org
Subject: remove the dma_set_{max_seg_size,seg_boundary,min_align_mask} return value v2
Date: Sat, 24 Aug 2024 05:49:11 +0200
Message-ID: <20240824034925.1163244-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

the above three functions can only return errors if the bus code failed
to allocate the dma_parms structure, which is a grave error that won't
get us far.  Thus remove the pointless return values, that so far have
fortunately been mostly ignored, but which the cleanup brigade now wants
to check for for no good reason.

Changes since v1:
 - fix SCSI to not call dma_set_max_seg_size and dma_set_seg_boundary
   unconditionally

Diffstat:
 drivers/accel/qaic/qaic_drv.c                         |    4 --
 drivers/dma/idma64.c                                  |    4 --
 drivers/dma/pl330.c                                   |    5 ---
 drivers/dma/qcom/bam_dma.c                            |    6 ----
 drivers/dma/sh/rcar-dmac.c                            |    4 --
 drivers/dma/ste_dma40.c                               |    6 ----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                |    6 ----
 drivers/media/common/videobuf2/videobuf2-dma-contig.c |    3 --
 drivers/media/pci/intel/ipu6/ipu6.c                   |    4 --
 drivers/mmc/host/mmci_stm32_sdmmc.c                   |    3 +-
 drivers/net/ethernet/microsoft/mana/gdma_main.c       |    6 ----
 drivers/scsi/lpfc/lpfc_init.c                         |    7 -----
 drivers/scsi/scsi_lib.c                               |   11 ++++++-
 include/linux/dma-mapping.h                           |   25 +++++++-----------
 14 files changed, 32 insertions(+), 62 deletions(-)

