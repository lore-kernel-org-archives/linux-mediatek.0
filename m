Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81368C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GRY4vrGEIdX5hYHD8AE0s7VW4f1rLJUqRnAOAoSWCPY=; b=xnKYtLsvs/A/m5lRCwd+zaG526
	KEGOjAvUKn23gpRdaBCcdPh/jt3Vd9sqVfdUK0HyX8pBYpn46Wp2sXr/mvpIApYvqR90ok01tDXmz
	8zV11tMrqS+yVLHPM93P+HRvC+By4TvkSeT0SKWr947sxwO5X/KL/+7GsaoyIWNqBYZTCo9u1pVkI
	awzrv1L7wajkjjHGkjEI1CjqDMbV26w8BY35Y84oemmmaXs7MnjIWgU6M0vEYHkUgH6BKFyRAmmyG
	TlRuo4tmnwpWKhZkGGyUmlCut7NrdpSP/tQYAIuiSTdXzgFLeyQGkQnSWCjrvvgegJA87PfPgfHTu
	RRapdgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9pk-00ErZS-0G;
	Mon, 18 Sep 2023 08:42:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9pg-00ErY7-2U;
	Mon, 18 Sep 2023 08:42:18 +0000
X-UUID: 435f593255ff11ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GRY4vrGEIdX5hYHD8AE0s7VW4f1rLJUqRnAOAoSWCPY=;
	b=icNdejLjmZ2MQp4D+gkvhLH1kMF90TC4WKAhV4GHfqFQ9LcUWywUU24rs4A0K2ad1ir38OenXF9lhScxNA8C8I3pF3N3duJmudVOmd2mXyVrgpflpyAioCBBWmd61Oz6Y+H/2pUaaEqblnzEV2XSFPy5JSbTbEkn5iKpY5Arl/U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:e286416a-aa2b-44cd-b51b-e6829dc20d4c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:cb5327c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 435f593255ff11ee86758d4a7c00f3a0-20230918
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2129515235; Mon, 18 Sep 2023 01:42:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 16:42:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 16:42:10 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wenst@chromium.org>, CK Hu
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>
Subject: [PATCH v2 00/11] Support IGT in display driver
Date: Mon, 18 Sep 2023 16:41:56 +0800
Message-ID: <20230918084207.23604-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_014216_822156_19A09C62 
X-CRM114-Status: GOOD (  12.60  )
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

Changes in v2:
- Simplify CMDQ by adding commands that are currently used only
- Integrate CRC related codes into new APIs for Mixer and OVL to reuse
- Add CPU version CRC retrieval when CMDQ is disabled

Hsiao Chien Sung (11):
  soc: mediatek: Add register definitions for GCE
  soc: mediatek: Support GCE jump to absolute
  soc: mediatek: Disable 9-bit alpha in ETHDR
  drm/mediatek: Add OVL compatible name for MT8195
  drm/mediatek: Adjust DRM mode configs for IGT
  drm/mediatek: Support alpha blending in display driver
  drm/mediatek: Support alpha blending in VDOSYS0
  drm/mediatek: Support alpha blending in VDOSYS1
  drm/mediatek: Support CRC in display driver
  drm/mediatek: Support CRC in VDOSYS0
  drm/mediatek: Support CRC in VDOSYS1

 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 309 ++++++++++++++++--
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  21 ++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 258 ++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  39 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   6 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  35 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  12 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  11 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 121 ++++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   5 +
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  16 +
 drivers/soc/mediatek/mtk-mmsys.c              |   1 +
 include/linux/soc/mediatek/mtk-cmdq.h         |  12 +
 14 files changed, 806 insertions(+), 46 deletions(-)

--
2.18.0


