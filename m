Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D7FC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=akEC/GZ73xx89vSNdUnfCjR2mWzHXFKUONd0W+l4ZME=; b=iLQqzUM2mt+m9G4nIouyfbv4AI
	OClSEtxsYTztQQEd8pNKGyFx4HRlcI/CsBq2MNZIzFMwf0E6Si2zfu1HDn2BB8r1G9obfcRyPxH+4
	wiwSMNGoM5zOe2hZ1RoS5WunJ7+yNx60Fq2GMVoWKinjY9pmT+eZUYinnNUurvvR+k5Tcs5OKH0jV
	0AMWw0uEN3SaxydMNslsdFJaq39FLht6eRn5LP83e3MX0QCjNXeWiEoh1cwvHrD0T9FlpNfGAkqcN
	jdi/uXvgh/YNpMpToiHdzPBIVAES5zgh3T6si+DB+wzvkBinoxFU6OQrla/o2yhNaCBADUEXcWH/H
	1TO+ftAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev48-00FVbq-0T;
	Wed, 22 Mar 2023 09:47:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pev3i-00FVKq-0h;
	Wed, 22 Mar 2023 09:47:09 +0000
X-UUID: 7be4c50ec89611edb7d8d11f642b8e78-20230322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=akEC/GZ73xx89vSNdUnfCjR2mWzHXFKUONd0W+l4ZME=;
	b=gXmfC4jZSk2qNK666eY1qIeMKtOT5U66kzsPwVTTB1uaBcVbARyayb2tjP6jtxxBVmxKIkCp8Z8D6QCZU8pJJXm2fdRqIQIdOM4+Qccdw0N43ghtJC1Ue4gcynQdjEfjRCIdGuTtMmjaWXD/q7q+rnD9RUFLorYpcrSyV7h3drw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:c78fe796-5adb-4f23-8614-636a9566e161,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:728305b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 7be4c50ec89611edb7d8d11f642b8e78-20230322
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 421800727; Wed, 22 Mar 2023 02:46:56 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 22 Mar 2023 17:46:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 17:46:19 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,0/7] media: mediatek: vcodec: Add debugfs file for decode and encode
Date: Wed, 22 Mar 2023 17:46:10 +0800
Message-ID: <20230322094617.19410-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_024706_298533_00DC92BE 
X-CRM114-Status: GOOD (  12.22  )
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

Need to change kernel driver to open decode and encode debug log at current period,
it's very unreasonable. Adding debugfs common interface to support decode and encode,
using echo command to control debug log level and getting useful information for each
instance.

patch 1 add dbgfs common interface.
patch 2~5 support decode.
patch 6~7 support encode
---
changed with v1:
- add new patch 4 and 5.
- using cmd 'cat vdec' to show debug information instead of pr_info directly.
---
Yunfei Dong (7):
  media: mediatek: vcodec: Add debugfs interface to get debug
    information
  media: mediatek: vcodec: Add debug params to control different log
    level
  media: mediatek: vcodec: Add a debugfs file to get different useful
    information
  media: mediatek: vcodec: Get each context resolution information
  media: mediatek: vcodec: Get get each instance format type
  media: mediatek: vcodec: Change dbgfs interface to support encode
  media: mediatek: vcodec: Add encode to support dbgfs

 .../media/platform/mediatek/vcodec/Makefile   |   6 +
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 196 ++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.h        |  73 +++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   4 +
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   4 +
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |   2 +
 .../mediatek/vcodec/mtk_vcodec_util.c         |   8 +
 .../mediatek/vcodec/mtk_vcodec_util.h         |  25 ++-
 8 files changed, 315 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h

-- 
2.18.0


