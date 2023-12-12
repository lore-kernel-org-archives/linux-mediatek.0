Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EECC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LOeISYIMwrahEh+sFl08FEXIH6/vlOrNqyOUcSSrrh4=; b=nMC
	L1/yEviAGXx3HraTMP7nFOgw40Ic6DqqrVhU6h+bMYoXwtuzqV5a/YPz90PgFB2Ed5po65ZTmZpD6
	ajP5Niv3Uf+WSJX7IzMRE1o9yt+jRmmxc2w3vM87fFdu0zmgxnpaYZSEoIFueXudcNhQx8I/Tudbn
	l7r054YZDORfMVBr7ymjZeToofnkWpWXWiXwgyRk3Z+efN+fVFI9WtpzjyvLBhOxgJOeucxKjHF0E
	ZKoalkODaG800HAkOroWyudMXtGeXicAdpie/6ddNiBCe0QurKJnXmBiDdN+HWT838syzcKqiLwEd
	z9bhi2F2MQ93EtjiZWZZmBO/sBsDcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1tu-00BfQT-1e;
	Tue, 12 Dec 2023 12:30:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1tq-00BfP9-2i;
	Tue, 12 Dec 2023 12:30:12 +0000
X-UUID: 2ca6d37298ea11ee9b09ad09c76753c8-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LOeISYIMwrahEh+sFl08FEXIH6/vlOrNqyOUcSSrrh4=;
	b=rMcCgjXZqFjrYZ95hoyu8d3/5Ej4rriqxH7jIwJt9UsBkXSpFgg8OXoJmen2ooWR9lZ9JRq1M2hTXrNVdhMAqWuP+UbNBea5U0TQNcTSh0NYJJ4BXcuuuG2tyMG4TVlQOACB6NN843Bzr4BFfi/qSis/MrF5YlbP1ZJ/KLrsF94=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:edac88db-76d1-420c-bb08-614084f6a2d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:46b8b373-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2ca6d37298ea11ee9b09ad09c76753c8-20231212
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2130341334; Tue, 12 Dec 2023 05:30:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 20:20:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 20:20:00 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v4 00/17] Support IGT in display driver
Date: Tue, 12 Dec 2023 20:19:40 +0800
Message-ID: <20231212121957.19231-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_043010_889776_1A8BF5A7 
X-CRM114-Status: GOOD (  15.61  )
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Hsiao Chien Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on mediatek-drm-next.

This series adds support for running IGT (Intel GPU Tool) tests
with MediaTek display driver. The following changes will be
applied:

1. Add a new API for creating GCE thread loop to retrieve CRCs
   from the hardware component
2. Support hardware CRC calculation in both VDOSYS0 and VDOSYS1
3. Support alpha blending in both VDOSYS0 and VDOSYS1

Changes in v4:
- Seperate the patch into smaller ones
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

Hsiao Chien Sung (17):
  soc: mediatek: Add register definitions for GCE
  soc: mediatek: Disable 9-bit alpha in ETHDR
  dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188
  drm/mediatek: Add OVL compatible name for MT8195
  drm/mediatek: Set DRM mode configs accordingly
  drm/mediatek: Support alpha blending in OVL
  drm/mediatek: Support alpha blending in Mixer
  drm/mediatek: Support alpha blending in display driver
  drm/mediatek: Support CSC in OVL
  drm/mediatek: Support more color formats in OVL
  drm/mediatek: Turn off the layers with zero width or height
  drm/mediatek: Support CRC in display driver
  drm/mediatek: Support CRC in OVL
  drm/mediatek: Support CRC in OVL adaptor
  drm/mediatek: Add missing plane settings when async update
  drm/mediatek: Fix errors when reporting rotation capability
  drm/mediatek: Add comments for the structures

 .../display/mediatek/mediatek,ovl.yaml        |  12 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   7 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 326 +++++++++++++++---
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  32 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 261 +++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  39 +++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   7 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  35 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  30 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  16 +
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  15 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          | 106 +++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   5 +
 drivers/soc/mediatek/mtk-mmsys.c              |   1 +
 include/linux/soc/mediatek/mtk-cmdq.h         |  10 +
 15 files changed, 834 insertions(+), 68 deletions(-)

--
2.18.0


