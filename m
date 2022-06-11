Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5825ACCA47D
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 10:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n5aSHvd+ajBqgu0KpT03xDesuwQZMkx+ckjA/WB5GcE=; b=YHRMpnWJDq1CYw
	QrLsDwEHlEc2D/zp5ZC/NkZbOTFBc1YnVO6JHK+3hX2ZANWzLihDZotBZuHzB0GN4xMn5drN/JROR
	SMwFTMVZuaz3KLoufu7ins412lwlWdboCkYLt1NEm3FBhqJJWVbrGYCHTli6ZWwCTE783cIjexNAW
	90QE6u9wKkEZ4hRwdXRJP8D/YXkwZkyk5GVF15PXz4d7t3wQ0dpNhtjcJF01k5Qc/wuNcRcAzCS5w
	njAkSjwfjGw3r/0RB+8lSaoo7Yn+KsZ7jfHUAY74EP2qeqqZjVqI0axw5ldrwhEzSWrayeSEdMtF1
	MZ4w4g41ROb5v+v58rag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzyRS-00CUzX-1v; Sat, 11 Jun 2022 10:34:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzyRF-00CUv9-Qd; Sat, 11 Jun 2022 10:33:55 +0000
X-UUID: 1ffcf5236c8c440fac9343b9f2c6ea8d-20220611
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:f40b294b-38d0-4a4c-85e2-397d03e11ada,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:8f2385e7-1f03-4449-90ad-e6cb8f3d1399,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 1ffcf5236c8c440fac9343b9f2c6ea8d-20220611
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1296061329; Sat, 11 Jun 2022 03:33:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jun 2022 03:33:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Jun 2022 18:33:44 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jun 2022 18:33:44 +0800
From: <yf.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek
 SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Yong Wu
	<Yong.Wu@mediatek.com>, Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v8 0/3] iommu/mediatek: TTBR up to 35bit support
Date: Sat, 11 Jun 2022 18:26:52 +0800
Message-ID: <20220611102656.10954-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_033353_912684_47919729 
X-CRM114-Status: UNSURE (   9.39  )
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

 drivers/iommu/io-pgtable-arm-v7s.c | 48 ++++++++++++++++++++++--------
 drivers/iommu/mtk_iommu.c          | 22 ++++++++------
 include/linux/io-pgtable.h         | 17 +++++++----
 3 files changed, 59 insertions(+), 28 deletions(-)



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
