Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5215C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LGPHBJr/245jyOvr5Q7Re/1tNg3oIoog+D3MNzJCYfM=; b=SM283Gk4WEJXRb
	G8xwIaq+fBz+DR/bRjpE9/GsAUiOXMkd90KnZaqD+H//ZKt3ErkrTtohBTWW9A06/fTgabusz3XHe
	4+YckfiPTLp+fWmM7cI+wfBvz7YO1PE7iVnmDCB5CmiksXdSaftNZ5PWVrHnvX5T6fQy1vEHfeGJM
	LEnu85bVh6w3B9OHkJgwx5wtttuF52WqYVg4agCW5/98xBnpEWcm4wjfSdVBQ+xET+VxJkuVcUXrI
	5lAizlRseJ+cS59YICDRyZLEYcHqiZAhS9pofP493Ia6CPxhc3EJrJwy7aQm1kRHJw/QboWOCR+gN
	EiO+MQeI15C9JlJOWknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaUy-005r5L-2v; Mon, 30 May 2022 08:11:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvaUo-005r3M-0w; Mon, 30 May 2022 08:11:27 +0000
X-UUID: 21387eaa9638454c918433ee6b7220be-20220530
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:194c601b-827d-4cf0-ab35-368b4c564e51,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:6349fd47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 21387eaa9638454c918433ee6b7220be-20220530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1168845449; Mon, 30 May 2022 01:11:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 May 2022 01:11:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 30 May 2022 16:11:14 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 30 May 2022 16:11:13 +0800
From: <yf.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek
 SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
	<Yong.Wu@mediatek.com>
Subject: [PATCH v7 0/2] iommu/mediatek: TTBR up to 35bit support
Date: Mon, 30 May 2022 16:04:27 +0800
Message-ID: <20220530080432.29123-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_011126_105314_0246800D 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset adds MediaTek TTBR up to 35bit support for single normal zone.

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

 drivers/iommu/io-pgtable-arm-v7s.c | 48 +++++++++++++++++++++---------
 drivers/iommu/mtk_iommu.c          | 29 +++++++++++++++---
 include/linux/io-pgtable.h         | 17 +++++++----
 3 files changed, 70 insertions(+), 24 deletions(-)



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
