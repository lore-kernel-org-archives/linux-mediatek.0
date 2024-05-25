Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17545C25B78
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 May 2024 23:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uQHu44BESfP+PIJxk0X0ddbrSVmMGCqnkLddfWrwYn0=; b=c9ourqTzxkcclXTqDjKF+NmkDE
	ldNeCMAFIXMVBbqdKzSeWQdNBheq2DYExhB2wy/iDwB15jDNaO5fW6Gn54KsEiqQIMKBN55Q1VZf7
	vvgCl3w4HuHvw1QnQcqm+K2zcD4GfllsfS53LnojGSGPZ2FLRi3aGOXLFPWrYUwMgaRu8wfHARLxA
	bbzr1iDcvyilDqKP0JZx6xoA5VqxU3MiKkz+koW7KpJ1z63/VfPLf7skdnHlNnjdN8JMEGpa5tiij
	Htjqg/0i/P33pfz34powKcaFyy+vhC9LRjOzlQC3fCtihkKLQypLkvPEBrba+PH4VjCpwtqdz+ddO
	E52PnDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0q0-0000000Bsco-0s0e;
	Sat, 25 May 2024 23:30:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0pY-0000000BsHI-0zRC;
	Sat, 25 May 2024 23:29:42 +0000
X-UUID: a3e723841aee11ef82c84f6416ccf2f3-20240525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uQHu44BESfP+PIJxk0X0ddbrSVmMGCqnkLddfWrwYn0=;
	b=gt1O0MSgKbNrMrlWOlxAzHrZk2uUL6D3iuHFgtdeJfM0F1FdTZjVjKKWatpc0uV+n8vGUjbM0c9rcK/TMBaYuFA0Nvo2u7ojv7zZ4XBWUPyEWF0aPNHEQXeddZlDtUgbU2UOoxWFWXvejjSLS2swxeSsI5NULZTckXzWdP317r4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:8fee6a9b-9a9e-484c-8dca-3c1cf392ca27,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:e260cd43-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a3e723841aee11ef82c84f6416ccf2f3-20240525
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1668213847; Sat, 25 May 2024 16:29:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:29:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:29:29 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Maxime Ripard <mripard@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, Jason-ch
 Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Date: Sun, 26 May 2024 07:29:21 +0800
Message-ID: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_162940_387133_F6309B5A 
X-CRM114-Status: GOOD (  20.04  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Memory Definitions:
secure memory - Memory allocated in the TEE (Trusted Execution
Environment) which is inaccessible in the REE (Rich Execution
Environment, i.e. linux kernel/userspace).
secure handle - Integer value which acts as reference to 'secure
memory'. Used in communication between TEE and REE to reference
'secure memory'.
secure buffer - 'secure memory' that is used to store decrypted,
compressed video or for other general purposes in the TEE.
secure surface - 'secure memory' that is used to store graphic buffers.

Memory Usage in SVP:
The overall flow of SVP starts with encrypted video coming in from an
outside source into the REE. The REE will then allocate a 'secure
buffer' and send the corresponding 'secure handle' along with the
encrypted, compressed video data to the TEE. The TEE will then decrypt
the video and store the result in the 'secure buffer'. The REE will
then allocate a 'secure surface'. The REE will pass the 'secure
handles' for both the 'secure buffer' and 'secure surface' into the
TEE for video decoding. The video decoder HW will then decode the
contents of the 'secure buffer' and place the result in the 'secure
surface'. The REE will then attach the 'secure surface' to the overlay
plane for rendering of the video.

Everything relating to ensuring security of the actual contents of the
'secure buffer' and 'secure surface' is out of scope for the REE and
is the responsibility of the TEE.

DRM driver handles allocation of gem objects that are backed by a 'secure
surface' and for displaying a 'secure surface' on the overlay plane.
This introduces a new flag for object creation called
DRM_MTK_GEM_CREATE_RESTRICTED which indicates it should be a 'secure
surface'. All changes here are in MediaTek specific code.
---
TODO:
1) Drop MTK_DRM_IOCTL_GEM_CREATE and use DMA_HEAP_IOCTL_ALLOC in userspace
2) DRM driver use secure mailbox channel to handle normal and secure flow
3) Implement setting mmsys routing table in the secure world series
---
Based on 3 series:
[1] v3 dma-buf: heaps: Add MediaTek secure heap
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=809023
[2] v6 media: mediatek: add driver to support secure video decoder
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=853689
[3] v6 Add CMDQ secure driver for SVP
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=855884
---
Change in v6:
1. Rebase to linux-next then rebased on 3 series [1][2][3]
2. Remove some parameter and security settings in normal world
3. Drop secure port related patches
4. Fix some build error and warning

Changes in v5:
1. Sync the local changes

Changes in v4:
1. Rebase on mediatek-drm-next(278640d4d74cd) and fix the conflicts
2. This series is based on 20240129063025.29251-1-yunfei.dong@mediatek.com
3. This series is based on 20240322052829.9893-1-shawn.sung@mediatek.com
4. This series is based on 20240403065603.21920-1-shawn.sung@mediatek.com

Changes in v3:
1. fix kerneldoc problems
2. fix typo in title and commit message
3. adjust naming for secure variable
4. add the missing part for is_suecure plane implementation
5. use BIT_ULL macro to replace bit shifting
6. move modification of ovl_adaptor part to the correct patch
7. add TODO list in commit message
8. add commit message for using share memory to store execute count

Changes in v2:

1. remove the DRIVER_RDNDER flag for mtk_drm_ioctl
2. move cmdq_insert_backup_cookie into client driver
3. move secure gce node define from mt8195-cherry.dtsi to mt8195.dtsi
---

CK Hu (1):
  drm/mediatek: Add interface to allocate MediaTek GEM buffer

Jason-JH.Lin (6):
  drm/mediatek/uapi: Add DRM_MTK_GEM_CREATE_RESTRICTED flag
  drm/mediatek: Add secure buffer control flow to mtk_drm_gem
  drm/mediatek: Add secure identify flag and funcution to mtk_drm_plane
  drm/mediatek: Add mtk_ddp_sec_write() to config secure buffer info
  drm/mediatek: Add secure flow support to mediatek-drm
  drm/mediatek: Add cmdq_insert_backup_cookie before secure pkt finalize

 drivers/gpu/drm/mediatek/mtk_crtc.c           | 263 +++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_crtc.h           |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  14 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |   5 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   9 +-
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  13 +-
 drivers/gpu/drm/mediatek/mtk_gem.c            | 114 ++++++++
 drivers/gpu/drm/mediatek/mtk_gem.h            |  12 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |   8 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.h       |   1 +
 drivers/gpu/drm/mediatek/mtk_plane.c          |  25 ++
 drivers/gpu/drm/mediatek/mtk_plane.h          |   2 +
 include/uapi/drm/mediatek_drm.h               |  47 ++++
 14 files changed, 500 insertions(+), 15 deletions(-)
 create mode 100644 include/uapi/drm/mediatek_drm.h

-- 
2.18.0


