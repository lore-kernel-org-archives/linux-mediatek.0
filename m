Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C37C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 02:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=FBOTipKdhwPMUM/fdFD0D1fdazLJkTD6AhWAkm3itOg=; b=rXI
	TCCPyK523A9N518krZTxzaYeJJqLcTLfiUFv/8kzghJ3tyRt42fxDe4tKwDV2Z9kN51OYgXXx2+o7
	73VK45iI1j/tDFkB8hRGAACq/DL82m8FOIye2fRZZ1iETHHpT43jhEBlyiakMzhp1M7uomLQ04KTc
	hB2+4sNWsAAL+HQd3v7IiQ2miN4BUhiAomzYHvLYMW4F7i7eDvB4xG9fKTxYDuE0F0FFp24Pow4NF
	5iFVZZCOrpq9jd88dNg942fo7MERwYDc6v0YmjNzqQRAz41R923Yumw1P0HWaRxOMaPkT+Ony1V3g
	UAqMgu2Fi5POymwVCUQbLUlrjQeqZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwxo-00000001ACQ-3Qtt;
	Fri, 14 Jun 2024 02:46:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHwxS-000000019tG-1MId;
	Fri, 14 Jun 2024 02:46:32 +0000
X-UUID: 4a1e472429f811efba8bfb22b0451c12-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FBOTipKdhwPMUM/fdFD0D1fdazLJkTD6AhWAkm3itOg=;
	b=D08jlQ2tDnRUdqrPtjpl9gnTl+U/4Jl6pofBxfsaIaoW5QFwvYmQYJMvGuqFDxP1EsnpEQhahE1E9p27/+x5B/D9o7hgLHnTSRrbsHxmrOO8TLSeFXiGZKjSIf67CI6H2kfKcs2qWoQ0HbXR+YU+E5gVXo0qo9wzuhamdS4tPxc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:967f6e67-7639-4ea7-a24e-b11a3ff7c00c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:e2fe1185-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4a1e472429f811efba8bfb22b0451c12-20240613
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1443118997; Thu, 13 Jun 2024 19:46:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 10:46:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 10:46:21 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v9 00/21] Support IGT in display driver
Date: Fri, 14 Jun 2024 10:45:59 +0800
Message-ID: <20240614024620.19011-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_194630_392237_F3B44F40 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

This series adds support for running IGT (Intel GPU Tool) tests with
MediaTek display driver. The following changes will be applied:

1. Add a new API for creating GCE thread loop to retrieve CRCs
   from the hardware component
2. Support hardware CRC calculation in both VDOSYS0 and VDOSYS1
3. Support alpha blending in both VDOSYS0 and VDOSYS1

Changes in v9:
- Separate the patch into smaller ones

Changes in v8:
- Start/Stop CRC CMDQ thread on when needed
- Squash and rearrange the commits
- Add more information to the commit message and comments

Changes in v7:
- Separate the patch into smaller ones

Changes in v6:
- Use drm_vblank_work to deffer the CRC work into bottom halves
- Separate the patches for "Premultiplied" and "None" alpha blending

Changes in v5:
- Add more descriptions to the codes
- Add DRM mode configs to the driver data
- Squash and rearrange the commits

Changes in v4:
- Separate the patch into smaller ones
- Change the title of some patches
- Revert the changes that are not related to the series

Changes in v3:
- Modify the dt-binding document of Mediatek OVL
- Set DRM mode configs accroding to the hardware capabilities
- Replace cmdq_pkt_jump_absolute() with cmdq_pkt_jump()

Changes in v2:
- Simplify CMDQ by adding commands that are currently used only
- Integrate CRC related codes into new APIs for Mixer and OVL to reuse
- Add CPU version CRC retrieval when CMDQ is disabled

Hsiao Chien Sung (21):
  soc: mediatek: Disable 9-bit alpha in ETHDR
  drm/mediatek: Add OVL compatible name for MT8195
  drm/mediatek: Add missing plane settings when async update
  drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
  drm/mediatek: Set DRM mode configs accordingly
  drm/mediatek: Turn off the layers with zero width or height
  drm/mediatek: Support more 10bit formats in OVL
  drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
  drm/mediatek: Fix XRGB setting error in OVL
  drm/mediatek: Fix XRGB setting error in Mixer
  drm/mediatek: Add new color format MACROs in OVL
  drm/mediatek: Support DRM plane alpha in OVL
  drm/mediatek: Support DRM plane alpha in Mixer
  drm/mediatek: Support "None" blending in OVL
  drm/mediatek: Support "None" blending in Mixer
  drm/mediatek: Support "Pre-multiplied" blending in OVL
  drm/mediatek: Support "Pre-multiplied" blending in Mixer
  drm/mediatek: Support alpha blending in display driver
  drm/mediatek: Support CRC in display driver
  drm/mediatek: Support CRC in OVL
  drm/mediatek: Support CRC in OVL adaptor

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 279 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.h           |  38 ++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  10 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  11 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  10 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 330 +++++++++++++++---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  37 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  24 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 110 +++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   7 +
 drivers/gpu/drm/mediatek/mtk_plane.c          |  15 +-
 drivers/soc/mediatek/mtk-mmsys.c              |   1 +
 13 files changed, 826 insertions(+), 50 deletions(-)

--
2.18.0


