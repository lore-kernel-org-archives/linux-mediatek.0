Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08768C47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 05:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Usnff8Er3rIMdWxKiqlOE5MgDyhxdLX0Yc3cR7W3AJY=; b=x06
	T1SDfe0ikJMQyf6SDniMDbkPFUTLeztcfVBPuPMEfq0gnTxTI71Pd4CVnh5WCb9NmdZxu7dJthgKa
	boQdrz0ioF1Ktss8jna6nksEXZ8ZLWl6OXyDtT4cxhmlj26O6EsC832UGme6dM1Pbp2XDar1MIGMN
	2diozoNcqUDhU8YBdb6CIU4wXvak3jQgr+FrmGoO6cBj8gLpI/9NZrXnJiL2oMo2wbxFn5u66IBTs
	ENRqzLF7ZWLx4oadeZmGB60S4uNFh1CLG1h8uHBo7w3APMphsb6/S2z+SZXOvw4zAKoCa1tqBroZY
	2uYHtuGXX2ltt+jkwPO3MJNoEa6tagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSU-00000005qUc-2QEG;
	Fri, 22 Mar 2024 05:28:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnXSJ-00000005qN8-1u15;
	Fri, 22 Mar 2024 05:28:42 +0000
X-UUID: 066e7de6e80d11ee9aa9374d6d45775a-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Usnff8Er3rIMdWxKiqlOE5MgDyhxdLX0Yc3cR7W3AJY=;
	b=PJ1uqZMNHUpsvTcLIKNJddosdl5BSdPzGZFfTGU7hxL56oExRdxtfS+BpcVNNhOiMxdyf9rx2mmWp+6hH81bmchPqFKfHMWAHJMXzcMZz3J5X3zDz+dbTv9aRPPGhf25gM20+FvdGqlEl29Rjx4R0PL4oG1uyQL54Sisvut5SHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:9f92ead1-e72a-4e56-aa17-742ac05b8e1f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:ee83b390-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 066e7de6e80d11ee9aa9374d6d45775a-20240321
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1184735615; Thu, 21 Mar 2024 22:28:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 13:28:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 13:28:30 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 00/14] Support IGT in display driver
Date: Fri, 22 Mar 2024 13:28:15 +0800
Message-ID: <20240322052829.9893-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.182000-8.000000
X-TMASE-MatchedRID: Wqf52A9rT4YlLXaRonFeEbttJwl7IC+W0ZujfvihvDD7efdnqtsaE5as
	fA8Y/RCFuYLbYE0iLKKrIfOiZKnM2PZ+/QtM9+8zsyNb+yeIRAoZKp0SZ4P+dadrpTvh7T6o1Cn
	XdZXfWcq7VVZF0bPoryO67GkBYlEQhdUss4Ved7OjFYHTfcPkwiseSAhqf1rRTy+DUVdqPWjv0n
	IDaa/NCCsPhfgJ1E3VJyXNTsR1fWk08UV4fwLv343NgkEqAN0RTJDl9FKHbrmdohxAwFG9tKPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrafYvrbPp2Htp4R90NpPmwV6x7wokKKR3oSH7qaGHa2mzDex
	lL339Ys=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.182000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3B999CA0D36F1EE2A31A5B281889FA089D80BC4D465A175147ACF276B186E4F62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_222839_717605_DA3E8245 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, "Nancy .
 Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Hsiao Chien Sung <shawn.sung@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

This series is based on 20240322012808.26234-1-shawn.sung@mediatek.com.

This series adds support for running IGT (Intel GPU Tool) tests
with MediaTek display driver. The following changes will be
applied:

1. Add a new API for creating GCE thread loop to retrieve CRCs
   from the hardware component
2. Support hardware CRC calculation in both VDOSYS0 and VDOSYS1
3. Support alpha blending in both VDOSYS0 and VDOSYS1

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

Hsiao Chien Sung (14):
  soc: mediatek: Disable 9-bit alpha in ETHDR
  drm/mediatek: Add OVL compatible name for MT8195
  drm/mediatek: Add missing plane settings when async update
  drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
  drm/mediatek: Set DRM mode configs accordingly
  drm/mediatek: Turn off the layers with zero width or height
  drm/mediatek: Support alpha blending in display driver
  drm/mediatek: Support "Pre-multiplied" alpha blending in OVL
  drm/mediatek: Support "Pre-multiplied" alpha blending in Mixer
  drm/mediatek: Support "None" alpha blending in OVL
  drm/mediatek: Support "None" alpha blending in Mixer
  drm/mediatek: Support CRC in display driver
  drm/mediatek: Support CRC in OVL
  drm/mediatek: Support CRC in OVL adaptor

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 260 +++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.h           |  38 +++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   6 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   9 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   6 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 304 ++++++++++++++++--
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  23 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  24 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   3 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |  94 +++++-
 drivers/gpu/drm/mediatek/mtk_ethdr.h          |   5 +
 drivers/gpu/drm/mediatek/mtk_plane.c          |  15 +-
 drivers/soc/mediatek/mtk-mmsys.c              |   1 +
 13 files changed, 744 insertions(+), 44 deletions(-)

--
2.18.0


