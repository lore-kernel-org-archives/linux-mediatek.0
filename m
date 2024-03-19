Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1833AC54E60
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 07:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EYOFrIPj763jT3PLRcGM0ZquAZ54oz4DX2bz2jRJwIg=; b=PSWSytUduRXI6r7k7WAISbOEuS
	dD+KjLLVc5+jHGl1o2sFoBDJp2/g8yhRSAv+AgeevIt7ZPFzLYLdUNO+98r6bqZy/83rbXSz1y+SG
	pAZjLNhE9cdDpZfUj08pQvF4VkQ1EtJ9mGNdAztANfj8f4ZJOrrn0ZgBwctVyNycO18rodd1/ElFZ
	KwHbMVasvNeRoekG8BJ/+3l6UNOBDd5Od5OPQkYUfPLjZuZobWXE1Nv1XfcSg39VWXf8zhmSHO37l
	eVL25rxN/Po33NGXNjDqSN/vONdTfHtlNS7BBAlJVqEMuqz+a98HNXlA9UOBz8OKvnBbn4iBKZWc5
	cI0w5RdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmTWA-0000000BcjN-0suP;
	Tue, 19 Mar 2024 07:04:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmTVa-0000000BcJR-0Cik;
	Tue, 19 Mar 2024 07:03:43 +0000
X-UUID: ccc2ce44e5be11eeacdb61a41848c7d2-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EYOFrIPj763jT3PLRcGM0ZquAZ54oz4DX2bz2jRJwIg=;
	b=NOzqJoaYD0glVemcO98kmk7rjBVtRt4i8gruD4EErhnteiPf8iqcOJZbDZiqSVRuvV1VmeSz7UU70R7uXHf9FBGr7RpDRMeFzUGQ9D2BudIOizZHgg4NEHZH0FMv9H0LV3oRmbsBGOLiht26xPwratN/RzlDo6d+so8RV+2YUxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:8987cd32-f5cf-47d3-8458-d9a7da4f6686,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:d296aa81-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ccc2ce44e5be11eeacdb61a41848c7d2-20240319
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1510652254; Tue, 19 Mar 2024 00:03:33 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Mar 2024 15:02:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Mar 2024 15:02:58 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v2 00/14] Rename mtk_drm_* to mtk_*
Date: Tue, 19 Mar 2024 15:02:43 +0800
Message-ID: <20240319070257.6443-1-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_000338_222592_970FE948 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename some unnecessary  "mtk_drm_*" to "mtk_*" because:
- Lower the matches when searching the native drm_* codes
- Reduce the code

Changes in v2:
- Sort header files alphabetically
- Seperate patches for renaming .c files to avoid conflicts

Hsiao Chien Sung (14):
  drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"
  drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
  drm/mediatek: Rename "mtk_drm_plane" to "mtk_plane"
  drm/mediatek: Rename "mtk_drm_gem" to "mtk_gem"
  drm/mediatek: Rename "mtk_drm_hdmi" to "mtk_hdmi"
  drm/mediatek: Rename files "mtk_drm_crtc.h" to "mtk_crtc.h"
  drm/mediatek: Rename files "mtk_drm_crtc.c" to "mtk_crtc.c"
  drm/mediatek: Rename files "mtk_drm_ddp_comp.h" to "mtk_ddp_comp.h"
  drm/mediatek: Rename files "mtk_drm_ddp_comp.c" to "mtk_ddp_comp.c"
  drm/mediatek: Rename files "mtk_drm_plane.h" to "mtk_plane.h"
  drm/mediatek: Rename files "mtk_drm_plane.c" to "mtk_plane.c"
  drm/mediatek: Rename files "mtk_drm_gem.h" to "mtk_gem.h"
  drm/mediatek: Rename files "mtk_drm_gem.c" to "mtk_gem.c"
  drm/mediatek: Rename mtk_ddp_comp functions

 drivers/gpu/drm/mediatek/Makefile             |  12 +-
 .../mediatek/{mtk_drm_crtc.c => mtk_crtc.c}   | 213 +++++++++---------
 drivers/gpu/drm/mediatek/mtk_crtc.h           |  28 +++
 .../{mtk_drm_ddp_comp.c => mtk_ddp_comp.c}    |  51 +++--
 .../{mtk_drm_ddp_comp.h => mtk_ddp_comp.h}    |   9 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   4 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   4 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  30 ---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   6 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |   4 +-
 .../drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} |  65 +++---
 .../drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} |  23 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  14 +-
 drivers/gpu/drm/mediatek/mtk_padding.c        |   4 +-
 .../mediatek/{mtk_drm_plane.c => mtk_plane.c} |  26 +--
 .../mediatek/{mtk_drm_plane.h => mtk_plane.h} |   4 +-
 26 files changed, 275 insertions(+), 286 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_crtc.c => mtk_crtc.c} (82%)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.c => mtk_ddp_comp.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} (98%)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_crtc.h
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.c => mtk_gem.c} (76%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_gem.h => mtk_gem.h} (62%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} (94%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} (95%)

--
2.18.0


