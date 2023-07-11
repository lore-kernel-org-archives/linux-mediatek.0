Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A372C001DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MaO4Pp49q26ZvXTVzU2ZtIU90FsXfRWQRbJkJwwgleA=; b=WyOH2YKv8beD4DmIDqCLUAyK4H
	jzua/q2eVn8ykxiWOrnXaxla62sS6KPODvAQi5mh5gBCtZRxRNhOkIYtPzsrlI4EJK8Q56FXDetCs
	do4xMAYTb7YEGc8wq9YJCZK+7JecnWwrDULt4oOmu6owIdRcdGOYxMlDNKOHOPL0wSw0itjPnIzSY
	3JXa/I4aUUjAyGUKAC7awgiJjVNkcEs99kr0sCVB15Xl6/li3Blp1EaizNHzSGlJWKLb4BBQOKjGT
	FImUNh/5iX6DMbd8sOCsyfEq2V/HCKsNc6h7FfhS4fvpSi1VZX6lvN/8WYzrAY9MuiZ7puTMZkAde
	OngePzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCwu-00Evyl-2F;
	Tue, 11 Jul 2023 12:58:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCws-00EvxE-31;
	Tue, 11 Jul 2023 12:58:36 +0000
X-UUID: a1644d8a1fea11ee912e1518a6540028-20230711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MaO4Pp49q26ZvXTVzU2ZtIU90FsXfRWQRbJkJwwgleA=;
	b=H1YchBBdxt90zTliS+PHEBDBSB/ydxtkqMgk40f2U5ulZ/EDwJAeviSxWCFh2zOR6UPPVnLu27ihusXLgS0joNngMNPgbzP1q2wNEr7SzXlkI4FXVAnMJfIznwN+idLvoSRriTjFbjfBICxIpoECNZmTWKYaxFinbnIcKuwcLdc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:e54e9a65-334b-47f0-ad80-686b8900995f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:176cd25,CLOUDID:beb71b68-314d-4083-81b6-6a74159151eb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a1644d8a1fea11ee912e1518a6540028-20230711
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 360208205; Tue, 11 Jul 2023 05:58:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Jul 2023 20:57:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 11 Jul 2023 20:57:50 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Mingjia
 Zhang <mingjia.zhang@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/3] media: mediatek: vcodec: Add driver to support 10bit
Date: Tue, 11 Jul 2023 20:57:46 +0800
Message-ID: <20230711125749.15555-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_055835_001779_F0602519 
X-CRM114-Status: GOOD (  11.36  )
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

Define two capture formats V4L2_PIX_FMT_MT2110R and
V4L2_PIX_FMT_MT2110T to support 10bit in mt8195, mt8199 and more.
Getting the size of each plane again when userspace set 10bit
syntax to driver.

V4L2_PIX_FMT_MT2110R is used for H264, and V4L2_PIX_FMT_MT2110T
is used for AV1/VP9/HEVC.

patch 1 Add driver to support 10bit
patch 2 Add capture format V4L2_PIX_FMT_MT2110T to support 10bit tile mode
patch 3 Add capture format V4L2_PIX_FMT_MT2110R to support 10bit raster mode
---
- send the first version v1:
- Run 10bit VP9/AV1 fluster test pass.
- Will return error when the 10bit parameter no correctly in function mtk_vdec_s_ctrl.
---

Reference series:
[1]: this series depends on v6 which is send by Yunfei Dong.
     message-id: 20230704131349.8354-1-yunfei.dong@mediatek.com

Mingjia Zhang (3):
  media: mediatek: vcodec: Add capture format to support 10bit tile mode
  media: mediatek: vcodec: Add capture format to support 10bit raster
    mode
  media: mediatek: vcodec: Add driver to support 10bit

 .../media/v4l/pixfmt-reserved.rst             |  15 ++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  22 ++-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   5 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 140 +++++++++++++++++-
 drivers/media/v4l2-core/v4l2-common.c         |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/uapi/linux/videodev2.h                |   2 +
 7 files changed, 186 insertions(+), 4 deletions(-)

-- 
2.18.0


