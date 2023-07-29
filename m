Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF5DC001DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 03:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=igoiCjJKQT1M3exb7NUJhcghlRjy5CrQZYQZIjk5STM=; b=SWedYCtNv8zIDL+Swm9Emz+8tG
	Qqfgw7s+iloX0ZCsPdEDh1e1FxYwW4FFqwya0Xl/sXu0/3eoonTFInHqedkxnwtk0hHHFJL6FR8X4
	Jqfyr54pRIdOH/J1xoaSWlsOIBqm1gle5DGpBquKr//MNtdo1My47ep16Lw8jbrQD9uYhK2JdSwt9
	7IViK1qwfyWhjpTF+Vz+C95KlIhN22b3ZG5XS647TjJMk3/D7/2nKo3Aw///NXfMw2CdiluZxMh4e
	3EAkCuCDB16vEnODETI1eY2i+duloBKbBjV1KmOagSgc3YwWsdtbP6Ox8WIPaDZ9Oz75iSIc2DWE0
	9z/86sOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPapY-0066ps-2z;
	Sat, 29 Jul 2023 03:41:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPapW-0066p5-0I;
	Sat, 29 Jul 2023 03:41:23 +0000
X-UUID: c5b1d0062dc111ee83ed1395ce914268-20230728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=igoiCjJKQT1M3exb7NUJhcghlRjy5CrQZYQZIjk5STM=;
	b=CIYhQxaGFuuq62q3dvf5l0SmPGutcNa5k/WSkYxfo8efqSbEw1LcVGMIExAXYJ3VTCeSzGWPPbZkZFC5G87doeFgCcUJg+NuKckBrRL/H62Xl5vRWHIwi/DwYn4TlQUxkeB4m+84tjKRrZ9XuskLKvOcmONFycroDba4dFejEkM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:42706678-6507-4b69-af68-79e80446c881,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.30,REQID:42706678-6507-4b69-af68-79e80446c881,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:1fcc6f8,CLOUDID:a94473d2-cd77-4e67-bbfd-aa4eaace762f,B
	ulkID:230729114118MM2NJGX5,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: c5b1d0062dc111ee83ed1395ce914268-20230728
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 778035242; Fri, 28 Jul 2023 20:41:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 29 Jul 2023 11:41:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 29 Jul 2023 11:41:12 +0800
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
Subject: [PATCH v3,0/3] media: mediatek: vcodec: Add driver to support 10bit
Date: Sat, 29 Jul 2023 11:41:09 +0800
Message-ID: <20230729034112.16993-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_204122_161282_3130577A 
X-CRM114-Status: GOOD (  12.93  )
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

From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Define two capture formats V4L2_PIX_FMT_MT2110R and
V4L2_PIX_FMT_MT2110T to support 10bit in mt8195, mt8199 and more.
Getting the size of each plane again when user space set 10bit
syntax to driver.

V4L2_PIX_FMT_MT2110R is used for H264, and V4L2_PIX_FMT_MT2110T
is used for AV1/VP9/HEVC.

patch 1 Add driver to support 10bit
patch 2 Add capture format V4L2_PIX_FMT_MT2110T to support 10bit tile mode
patch 3 Add capture format V4L2_PIX_FMT_MT2110R to support 10bit raster mode
---
- compared with v2:
- add the compliance test result: Total for mtk-vcodec-dec device /dev/video-dec0: 46, Succeeded: 46, Failed: 0, Warnings: 0
- this patch is based on separate encoder and decoder patch series.
- compared with v1:
- Fix set non sps return -EINVAL issue.
- Driver test pass in mt8195/mt8188 with tast and Youtube.
- Run v4l2 compliance in mt8195/mt8188 pass.
- fluster test as below:
- h264: (JVT-FR-EXT: 29/69  JVT-AVC_V1: 95/135)
- h265: (JCT-VC-HEVC_V1: 142/147)
- vp9 : (VP9-TEST-VECTORS: 1/6  VP9-TEST-VECTORS: 276/305)
- av1 : (CHROMIUM-10bit-AV1-TEST-VECTORS: 22/23   CHROMIUM-8bit-AV1-TEST-VECTORS: 11/13
-        AV1-TEST-VECTORS: Ran 237/239)

- send the first version v1:
- Run 10bit VP9/AV1 fluster test pass.
- Will return error when the 10bit parameter no correctly in function mtk_vdec_s_ctrl.
---

Reference series:
[1]: this series depends on v6 which is send by Yunfei Dong.
     20230729025515.16029-1-yunfei.dong@mediatek.com

Mingjia Zhang (3):
  media: mediatek: vcodec: Add capture format to support 10bit tile mode
  media: mediatek: vcodec: Add capture format to support 10bit raster
    mode
  media: mediatek: vcodec: Add driver to support 10bit

 .../media/v4l/pixfmt-reserved.rst             |  13 ++
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |  22 ++-
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   5 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 144 +++++++++++++++++-
 drivers/media/v4l2-core/v4l2-common.c         |   4 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/uapi/linux/videodev2.h                |   2 +
 7 files changed, 188 insertions(+), 4 deletions(-)

-- 
2.18.0


