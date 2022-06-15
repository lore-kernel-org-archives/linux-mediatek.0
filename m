Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C5FC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ekvOwZlqpEHGrF/93MgQYapWzoQ5QHDXek64UI+J84Q=; b=XnwTBxaT7gq8QakmScAkB1P/QA
	sAJUdX8KHuuyIgA0OTlXy/Zpa6aMdPJHLVNd5QzGLqJ8QMMSnT0JrAsEW8Gjtot431czR8bjUz2S+
	Y9CK6HjYsl3ZBaTgEzaZ26P6uU51rmf8fA2zDY5xVV+fdxhskU0p22HACEyX/DZa1szOd32OZlPhI
	5rOgKc1bkmL+G6AJZduYi26NjWMjMT/n0n4QvIlFPin+B6NhIxNiqfC37ITl1EluHgHHy3PvOmMiV
	u1D6FfL3g6/6xXvhwW4Sq9OKHKpjOyUyhRt1WUgqeGzCd2AzofJFU+2OhLX1TeWtiRPoYv2LPrJy9
	wMiO4DHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Vug-00FQh4-W8; Wed, 15 Jun 2022 16:30:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1VtV-00FQAl-8Q; Wed, 15 Jun 2022 16:29:26 +0000
X-UUID: 10a1de7556034e7789f73cdc3e0351e1-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:b7c17108-4d0e-4606-a8b2-0100e7844961,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:fbe69e48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 10a1de7556034e7789f73cdc3e0351e1-20220615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2004226322; Wed, 15 Jun 2022 09:29:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 09:19:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 00:19:15 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 16 Jun 2022 00:19:14 +0800
From: <yf.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek
 SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
	<Yong.Wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v9 0/3] iommu/mediatek: TTBR up to 35bit support
Date: Thu, 16 Jun 2022 00:12:20 +0800
Message-ID: <20220615161224.6923-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_092925_353149_DEEC95C9 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Yunfei Wang (1):
  iommu/mediatek: Rename MTK_IOMMU_TLB_ADDR to MTK_IOMMU_ADDR

Ning Li (2):
  iommu/io-pgtable-arm-v7s: Add a quirk to allow pgtable PA up to 35bit
  iommu/mediatek: Allow page table PA up to 35bit

 drivers/iommu/io-pgtable-arm-v7s.c | 58 +++++++++++++++++++++++-------
 drivers/iommu/mtk_iommu.c          | 22 ++++++++------
 include/linux/io-pgtable.h         | 17 +++++----
 3 files changed, 69 insertions(+), 28 deletions(-)



