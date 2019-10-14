From: Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v3 0/7] Improve tlb range flush
Date: Mon, 14 Oct 2019 14:38:14 +0800
Message-ID: <1571035101-4213-1-git-send-email-yong.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, yong.wu@mediatek.com, youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com, cui.zhang@mediatek.com, chao.hao@mediatek.com, edison.hsieh@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This patchset mainly fixes a tlb flush timeout issue and use the new
iommu_gather to re-implement the tlb flush flow. and several clean up
patches about the tlb_flush.

change note:
v3:
   1. Use the gather to implement the tlb_flush suggested from Tomasz.
   2. add some clean up patches.

v2:
https://lore.kernel.org/linux-iommu/1570627143-29441-1-git-send-email-yong.wu@mediatek.com/T/#t
   1. rebase on v5.4-rc1
   2. only split to several patches.

v1:
https://lore.kernel.org/linux-iommu/CAAFQd5C3U7pZo4SSUJ52Q7E+0FaUoORQFbQC5RhCHBhi=NFYTw@mail.gmail.com/T/#t

Yong Wu (7):
  iommu/mediatek: Correct the flush_iotlb_all callback
  iommu/mediatek: Add pgtlock in the iotlb_sync
  iommu/mediatek: Use gather to achieve the tlb range flush
  iommu/mediatek: Delete the leaf in the tlb flush
  iommu/mediatek: Move the tlb_sync into tlb_flush
  iommu/mediatek: Use writel for TLB range invalidation
  iommu/mediatek: Reduce the tlb flush timeout value

 drivers/iommu/mtk_iommu.c | 77 +++++++++++++++++++++++------------------------
 drivers/iommu/mtk_iommu.h |  2 +-
 2 files changed, 38 insertions(+), 41 deletions(-)

-- 
1.9.1
