Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24CDC04FFE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 10:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WxqlW/JXc/FtCf7oP19QJ6/dtFVmUXbor8CFzpptsik=; b=AX7
	ovmtAAbxwrEi97K2zB33fYoTdMZo8IVEoUKwxbkiNAOFGKj/Tm9N+kIkayMrpC+X087QPSMT8DLFC
	Hxb6jF1NtjA126QpMiAEMgy4V2JAhU67/M6FrT7jITL3rRxWMu7QcZ6bSoyam5AuF6QBrxOxII1gi
	GIDvmM3bK6IbZ+sIqjxszXT/kBHkNOPZ1mouqiPKVPWMh9S2OqTrZJ4DOreizoygUZx0kc1NxZdmu
	xKdRCGsYi4P9IDACfMzWeQw+3Pynuja41JabIa/0IhyHZAP6GAaRBj4YUVh9vpiX8l476vQVE7Lqb
	RIosMHzIprADkl3MI8pFbyCon4l2wdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Tqf-0000000CMJu-34jr;
	Thu, 02 May 2024 10:39:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TqD-0000000CLpO-1rEo;
	Thu, 02 May 2024 10:39:09 +0000
X-UUID: 2f3d6bdc087011ef9a78ddf43a9225dc-20240502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WxqlW/JXc/FtCf7oP19QJ6/dtFVmUXbor8CFzpptsik=;
	b=OloDPNA1HXeE0+qOWm1oxVWZNN3rzoZVzVj3qTtjqXmnyBzvL3caIcozc/3znNmMObl9GA19DenCLEwe19HD8bD8xHF88HNrQoieuYXyu6jt44YmFA/WMhQUtt4KjVL5uF7i5jWZhn9ZsZKgZtHUJRN2rGlk0eBvNM0oeJ7R/nE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:fc60bdfb-c727-4178-a4ee-1e28fe1038b4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:f6315e83-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2f3d6bdc087011ef9a78ddf43a9225dc-20240502
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1960251681; Thu, 02 May 2024 03:38:59 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 May 2024 18:38:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 May 2024 18:38:55 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v7 00/18] Support IGT in display driver
Date: Thu, 2 May 2024 18:38:30 +0800
Message-ID: <20240502103848.5845-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.903800-8.000000
X-TMASE-MatchedRID: HjquttRW1zv8rQJMqxBG8EOLK43kW8U2iEoqWVVgjSt13iQV6+wg1McR
	JRrz9JX4X3E2fHKxS5IAQc5GYpu9o4ztOe3zr3YkxQvMEFMAcCWMjqpeR/YVDfgnJH5vm2+giut
	UOt0XpgTQH7pNnZ67DfPH7C/OYQhzfLc22CMUE+twUSK4/EeOxSEdaywSZvzOgrAXgr/AjP2OVL
	fxhVIGTdnDgiFnMC7vt4ajh1kLGsVrsJ0gSgzm0oxVBvj1jbcj2+EpBnZEzfVehNZiiLW1fWb6P
	phVtfZg4wnhOb+JR+SAMuqetGVetnyef22ep6XYymsk/wUE4hogKsF0sUqGMwu1V7SsQKFF9tQx
	dJ7VV5r87lBDBWilNHRkdoUOOENC
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.903800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DDB7698C318721114BF06767EA83901678B404483425E4423E367D8DBE353DFC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_033905_585548_BFC9129F 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, CK Hu <ck.hu@mediatek.com>, "Nancy .
 Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

This series is based on 20240307013458.23550-1-jason-jh.lin@mediatek.com

This series adds support for running IGT (Intel GPU Tool) tests
with MediaTek display driver. The following changes will be
applied:

1. Add a new API for creating GCE thread loop to retrieve CRCs
   from the hardware component
2. Support hardware CRC calculation in both VDOSYS0 and VDOSYS1
3. Support alpha blending in both VDOSYS0 and VDOSYS1

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

Hsiao Chien Sung (18):
  soc: mediatek: Disable 9-bit alpha in ETHDR
  drm/mediatek: Add OVL compatible name for MT8195
  drm/mediatek: Add missing plane settings when async update
  drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
  drm/mediatek: Set DRM mode configs accordingly
  drm/mediatek: Turn off the layers with zero width or height
  drm/mediatek: Support more 10bit formats in OVL
  drm/mediatek: Support RGBA8888 and RGBX8888 in OVL
  drm/mediatek: Support constant blending in OVL
  drm/mediatek: Support constant blending in Mixer
  drm/mediatek: Support "Pre-multiplied" blending in OVL
  drm/mediatek: Support "Pre-multiplied" blending in Mixer
  drm/mediatek: Support "None" blending in OVL
  drm/mediatek: Support "None" blending in Mixer
  drm/mediatek: Support alpha blending in display driver
  drm/mediatek: Support CRC in display driver
  drm/mediatek: Support CRC in OVL
  drm/mediatek: Support CRC in OVL adaptor

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 260 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.h           |  38 +++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   6 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   9 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 300 ++++++++++++++++--
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  23 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  24 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |  96 +++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   5 +
 drivers/gpu/drm/mediatek/mtk_plane.c          |  15 +-
 drivers/soc/mediatek/mtk-mmsys.c              |   1 +
 13 files changed, 743 insertions(+), 44 deletions(-)

--
2.18.0


