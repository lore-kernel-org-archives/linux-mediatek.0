Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37168CCA47F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 12:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kj5ALIYQe+XRZU1hDCKPqiFyvQENoJtM313+MEMwVpQ=; b=CmwFkC11ycwAsLnhVzZyB5xKcB
	9RRmv9LjB0VXOXQmsvghXv+X0GGvG0F+CKsN3Iy6K9aHud56eogKWWE04HBDBF87fkrHQ7ZjvhIBK
	0FiDAnHVIbdZYJSz+j9NxZTL4RfptR5c/lVpVJy4VPOmFYJ7cngClcEXkYuKZ/NKFQaVvIPVjXMim
	9zBePGMrafzSYDIQiqCv9dXvREvt/F4Kcwwr7b3jsrxxFowGbMpZGEfUMw0ubfkssliMX9So6x0uf
	f4hC7R9oO7rEJXPdcP7H0hPLD9dCuOLmnzHsi+cEyttRYu72suvPC1E8/kB0gHXKN1CXzfHSXufMX
	nYTHOpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oOh-002GVf-Gg; Thu, 16 Jun 2022 12:14:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oOT-002GSo-JS; Thu, 16 Jun 2022 12:14:40 +0000
X-UUID: 584946f1aae14090ab3196508a30db79-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:329fd049-9769-4a9c-a3aa-e6b525d9cdfa,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:41fdc148-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 584946f1aae14090ab3196508a30db79-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1240406619; Thu, 16 Jun 2022 05:14:32 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 05:14:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 16 Jun 2022 20:14:29 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 20:14:28 +0800
From: <yf.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek
 SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
	<Yong.Wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v10 0/2] iommu/mediatek: TTBR up to 35bit support
Date: Thu, 16 Jun 2022 20:07:10 +0800
Message-ID: <20220616120713.12728-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_051437_687923_0F8446FC 
X-CRM114-Status: GOOD (  10.66  )
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

This patchset adds MediaTek TTBR up to 35bit support for single normal zone.


Changes in v10:
- According to Robin's suggestion in [PATCH v8] to update patch
  - Recovery ttbr to u32, encoded PA bits[34:32] to ttbr lower bits.
  - Remove PATCH: Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR.

Changes in v9:
- According to Will's suggestion in [PATCH v8 1/3] update [PATCH 1/3]
  - Rename function to_iopte_mtk to to_mtk_iopte.
  - Modify gfp_l1 and slab_flag and add comment explaining.
  - Add checking that the address is within 35 bits use cfg->oas.
  - PATCH 1/3 & PATCH 2/3 no change.

Changes in v8:
- Add and update patch
  - Add [2/3] patch update MTK_IOMMU_ADDR to calculate the special ttbr.
  - Save the special ttbr to mtk_iommu_domain avoid calculate it again.

Changes in v7:
- Update patch and commit message
  - Extend arm_v7s_cfg.ttbr to u64.
  - Move the special ttbr logical into mtk_iommu.c.
  - Update commit message for single normal zone.

Changes in v6:
- Update patch: gfp_l1 = GFP_KERNEL | __GFP_ZERO;
- Update commit message for single normal zone.

Changes in v5:
- Only update message-ID.

Changes in v4:
- Fix build test WARNING: use GENMASK_ULL replace GENMASK.

Changes in v3:
- Add version changes description, there is No new code change in V3.

Changes in v2:
- Update patch and commit message
  - Add Level 1 pgtable PA up to 35bit.
  - This is new feature, remove stable@vger.kernel.org
  - Update commit message.

Ning Li (2):
  iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to 35bit
  iommu/mediatek: Allow page table PA up to 35bit

 drivers/iommu/io-pgtable-arm-v7s.c | 67 +++++++++++++++++++++++-------
 drivers/iommu/mtk_iommu.c          | 22 ++++++++------
 include/linux/io-pgtable.h         | 15 ++++---
 3 files changed, 80 insertions(+), 24 deletions(-)



