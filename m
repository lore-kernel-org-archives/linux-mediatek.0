Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C0FEE4993
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1pcjglTSpnV4ck5LHD+yc4GfBKzydE659VWXWlLUwgs=; b=1mIDPMHSgyc8D/Ch1veKHFrV4K
	c0NE0EwPjqz6NyM7o5QKkJGyWWH+TZcI/oSpmMNr2rtlCPjqGSyaZtNwBn2W7gACMuJPdDoEHgMbl
	7zqbyUc8140xkf0D+Qazo9MrfOR5LisPRN/5fs9QV8RTNAeFgxu3tX1hsfDGcjB0YDJNW1JIcI65X
	wAKxvyKXuo3CdZYhyKlOQVzLk9rDTC+L94Uu9/dqSYzGBMmWmk2rxuS8ixs+xs/oygGUaPk3CXtXi
	Tijzte4w/44X56ZpyEzj50PXut1tNC8/2jXh/AV8Doiz4Y0tMNTeaDMnFSm+s5c/YK1EfrUsepTqL
	56bf8Zsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpiF-000yNi-0E;
	Wed, 23 Aug 2023 15:24:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpiC-000yN5-1g;
	Wed, 23 Aug 2023 15:24:01 +0000
X-UUID: 1318712241c911ee83ed1395ce914268-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1pcjglTSpnV4ck5LHD+yc4GfBKzydE659VWXWlLUwgs=;
	b=kpmfZ+/Iz6yZs3fvsYB0Og+98n+ibaeYrbAATuhbKNUjS9ycbHb/DiM1xWATy0P1la99QbZ5r/0wMOOBkEKoql32z9I65hokESYsjUDSsunHX7hN3TyAPf27GmB0v2Wfsg4rlP7NzMBq7da/s49vgDUkrEIMaCqPxxakuMyCvw4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:93167c66-c59e-4ae7-ab36-c4d510ef565a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:7f7831c2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1318712241c911ee83ed1395ce914268-20230823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 431493473; Wed, 23 Aug 2023 08:23:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 23:13:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 23:13:52 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jassi
 Brar <jassisinghbrar@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH 00/15] Support IGT in display driver
Date: Wed, 23 Aug 2023 23:13:17 +0800
Message-ID: <20230823151332.28811-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_082400_568512_DD6CAE3E 
X-CRM114-Status: GOOD (  12.70  )
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

This series adds support for running IGT (Intel GPU Tool) tests
with MediaTek display driver. The following changes will be
applied:

1. Add a new API for creating GCE thread loop to retrieve CRCs
   from the hardware component
2. Support hardware CRC calculation in both VDOSYS0 and VDOSYS1
3. Support alpha blending in both VDOSYS0 and VDOSYS1
4. Fix minor bugs that are found during IGT test

Hsiao Chien Sung (15):
  soc: mediatek: Add register definitions for GCE
  soc: mediatek: Disable 9-bit alpha in ETHDR
  soc: mediatek: Support GCE thread loop
  mailbox: mtk-cmdq: Support GCE thread loop
  drm/mediatek: Support alpha blending in display driver
  drm/mediatek: Support alpha blending in VDOSYS0
  drm/mediatek: Support alpha blending in VDOSYS1
  drm/mediatek: Move struct mtk_drm_crtc to the header file
  drm/mediatek: Add OVL compatible name for MT8195
  drm/mediatek: Support CRC in display driver
  drm/mediatek: Support CRC in VDOSYS0
  drm/mediatek: Support CRC in VDOSYS1
  drm/mediatek: Add missing plane settings when async update
  drm/mediatek: Adjust DRM mode configs for IGT
  drm/mediatek: Fix errors when reporting rotation capability

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   3 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 304 ++++++++++++++++--
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  15 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  97 +++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  64 ++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   3 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   5 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  12 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  15 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 170 +++++++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   4 +
 drivers/mailbox/mtk-cmdq-mailbox.c            |   5 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  30 ++
 drivers/soc/mediatek/mtk-mmsys.c              |   1 +
 include/linux/mailbox/mtk-cmdq-mailbox.h      |   1 +
 include/linux/soc/mediatek/mtk-cmdq.h         |   9 +
 16 files changed, 646 insertions(+), 92 deletions(-)

--
2.18.0


