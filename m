Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6336DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 03:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uAdH9133n5onAJHi6y6SCPy7t1aBjAK7SsaTMSsbD4o=; b=jRdEcdfFMu3qPZ
	3vEjZIsUu/CKKlP8B0Z8H+15/fDZH9LbV+Ty6K7e9y5moXjIpgOflDR8fLLlzHAxqVjvJJFFEOV5F
	K+1m0ljJbVSGfuWQdYH62UZare7Hzs5gKfwfuj360NjFDxuSUpaCq9mRTJBSDChy2oiC7OMKCE9bS
	PYRxJCaT9MPQYyLmTHPybxjMOBIHqp1g0TPaMCJ+1IxsTfjw6XLiXwb9vN0aJKIVNJXlydM/RyVzh
	AeYz8uDkQQ8HxZc6yFT9XLP3VjcQTTlKNlm2Ty0f1qMO71hJsZ1sEJZdcuFH5wlePtI5/Nrmul+zc
	Mij7TGUdcBXBnv5n5F/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZl7W-000TV6-2t; Thu, 31 Mar 2022 03:05:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZkxi-000Ozr-BF; Thu, 31 Mar 2022 02:55:08 +0000
X-UUID: 873f01bf6611459d8af24c1c0db88a14-20220330
X-UUID: 873f01bf6611459d8af24c1c0db88a14-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1071355931; Wed, 30 Mar 2022 19:54:55 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 19:48:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 10:48:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 31 Mar 2022 10:48:20 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
Date: Thu, 31 Mar 2022 10:47:44 +0800
Message-ID: <20220331024801.29229-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_195502_491417_41A9AB52 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for mt8192 h264/vp8/vp9 decoder drivers. Firstly, refactor
power/clock/interrupt interfaces for mt8192 is lat and core architecture.

Secondly, add new functions to get frame buffer size and resolution according
to decoder capability from scp side. Then add callback function to get/put
capture buffer in order to enable lat and core decoder in parallel, need to
adjust GStreamer at the same time. 

Then add to support MT21C compressed mode and fix v4l2-compliance fail.

Next, extract H264 request api driver to let mt8183 and mt8192 use the same
code, and adds mt8192 frame based h264 driver for stateless decoder.

Lastly, add vp8 and vp9 stateless decoder drivers.

Patches 1 refactor power/clock/interrupt interface.
Patches 2~4 get frame buffer size and resolution according to decoder capability.
Patches 5 set capture queue bytesused.
Patches 6 adjust GStreamer.
Patch 7~11 add to support MT21C compressed mode and fix v4l2-compliance fail.
patch 12 record capture queue format type.
Patch 13~14 extract h264 driver and add mt8192 frame based driver for h264 decoder.
Patch 15~16 add vp8 and vp9 stateless decoder drivers.
Patch 17 prevent kernel crash when rmmod mtk-vcodec-dec.ko
---
changes compared with v6:
- adjust GStreamer, separate src buffer done with v4l2_ctrl_request_complete for patch 6.
- remove v4l2_m2m_set_dst_buffered.
- add new patch to set each plane bytesused in buf prepare for patch 5.
- using upstream interface to update vp9 prob tables for patch 16.
- fix maintainer comments.
- test the driver with chrome VD and GStreamer(H264/VP9/VP8/AV1).
changes compared with v6:
- rebase to the latest media stage and fix conficts
- fix memcpy to memcpy_fromio or memcpy_toio
- fix h264 crash when test field bitstream
changes compared with v5:
- fix vp9 comments for patch 15
- fix vp8 comments for patch 14.
- fix comments for patch 12.
- fix build errors.
changes compared with v4:
- fix checkpatch.pl fail.
- fix kernel-doc fail.
- rebase to the latest media codec driver.
changes compared with v3:
- remove enum mtk_chip for patch 2.
- add vp8 stateless decoder drivers for patch 14.
- add vp9 stateless decoder drivers for patch 15.
changes compared with v2:
- add new patch 11 to record capture queue format type.
- separate patch 4 according to tzung-bi's suggestion.
- re-write commit message for patch 5 according to tzung-bi's suggestion.
changes compared with v1:
- rewrite commit message for patch 12.
- rewrite cover-letter message.
---
Yunfei Dong (17):
  media: mediatek: vcodec: Add vdec enable/disable hardware helpers
  media: mediatek: vcodec: Using firmware type to separate different
    firmware architecture
  media: mediatek: vcodec: get capture queue buffer size from scp
  media: mediatek: vcodec: Read max resolution from dec_capability
  media: mediatek: vcodec: set each plane bytesused in buf prepare
  media: mediatek: vcodec: Refactor get and put capture buffer flow
  media: mediatek: vcodec: Refactor supported vdec formats and
    framesizes
  media: mediatek: vcodec: Getting supported decoder format types
  media: mediatek: vcodec: Add format to support MT21C
  media: mediatek: vcodec: disable vp8 4K capability
  media: mediatek: vcodec: Fix v4l2-compliance fail
  media: mediatek: vcodec: record capture queue format type
  media: mediatek: vcodec: Extract H264 common code
  media: mediatek: vcodec: support stateless H.264 decoding for mt8192
  media: mediatek: vcodec: support stateless VP8 decoding
  media: mediatek: vcodec: support stateless VP9 decoding
  media: mediatek: vcodec: prevent kernel crash when rmmod
    mtk-vcodec-dec.ko

 .../media/platform/mediatek/vcodec/Makefile   |    4 +
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c |   62 +-
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |    8 +-
 .../mediatek/vcodec/mtk_vcodec_dec_pm.c       |  166 +-
 .../mediatek/vcodec/mtk_vcodec_dec_pm.h       |    6 +-
 .../mediatek/vcodec/mtk_vcodec_dec_stateful.c |   19 +-
 .../vcodec/mtk_vcodec_dec_stateless.c         |  257 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |   41 +-
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |    5 -
 .../platform/mediatek/vcodec/mtk_vcodec_fw.c  |    6 +
 .../platform/mediatek/vcodec/mtk_vcodec_fw.h  |    1 +
 .../vcodec/vdec/vdec_h264_req_common.c        |  310 +++
 .../vcodec/vdec/vdec_h264_req_common.h        |  272 +++
 .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  438 +---
 .../vcodec/vdec/vdec_h264_req_multi_if.c      |  619 +++++
 .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  437 ++++
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2072 +++++++++++++++++
 .../platform/mediatek/vcodec/vdec_drv_if.c    |   37 +-
 .../platform/mediatek/vcodec/vdec_drv_if.h    |    3 +
 .../platform/mediatek/vcodec/vdec_ipi_msg.h   |   36 +
 .../platform/mediatek/vcodec/vdec_msg_queue.c |    2 +
 .../platform/mediatek/vcodec/vdec_msg_queue.h |    2 +
 .../platform/mediatek/vcodec/vdec_vpu_if.c    |   53 +-
 .../platform/mediatek/vcodec/vdec_vpu_if.h    |   15 +
 .../platform/mediatek/vcodec/venc_vpu_if.c    |    2 +-
 include/linux/remoteproc/mtk_scp.h            |    2 +
 26 files changed, 4274 insertions(+), 601 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_common.h
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
