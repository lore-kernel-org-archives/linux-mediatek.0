Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CAAC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6AkP4Ytunh2OFA/XBepG4FihOHCLVwjaRBOpP8/A7RI=; b=DcfsdgXMeQ3PIc
	d0Zn6YC1ESGDElh7X4eE4JEnLPBXJift1w3OhjT54FOtt63Svng3AOIeIwA/49iYrEYQ3l3fWNtyH
	QaXyuIt9MqOV+YBRIDp77ivyBvpLaFRegDGPr3tE5GaGGDFOcHN2Fbv0A2Bl7dLDX6BetMXR1fZAo
	svr2aV9B97e9HvWo9hAXmpnVzVj0/cSs9chMUosioeIkPjBqKRcuiNTudmr0SooM+t6cAn0n2z9Mv
	XSsrxaflbGT+02zJGPvqrlK0y1joWYL1EuTazn0TKOqz6HR0c7hatlNBXbdNLdhSb0GDVnXihNpta
	R1oCfKtRLnxDf8GXuyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxOSe-00H6nz-Ax; Wed, 15 Dec 2021 07:12:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxOPw-00H5xW-MY; Wed, 15 Dec 2021 07:09:38 +0000
X-UUID: 396be3a78ae74581ab3426ac119ac0f5-20211215
X-UUID: 396be3a78ae74581ab3426ac119ac0f5-20211215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2138584000; Wed, 15 Dec 2021 00:09:32 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Dec 2021 22:59:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 15 Dec 2021 14:59:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 15 Dec 2021 14:59:26 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 00/12] media: mtk-vcodec: support for MT8192 h264 decoder
Date: Wed, 15 Dec 2021 14:59:14 +0800
Message-ID: <20211215065926.8761-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_230936_816616_79DF479F 
X-CRM114-Status: GOOD (  14.41  )
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

This series adds support for mt8192 h264 decoder. Firstly, need to refactor
power/clk/irq interface for mt8192 is lat and core architecture. Secondly,
add new functions to get frame buffer size and resolution according to decoder
capability from scp side. Then add callback function to get/put capture buffer
in order to enable lat and core decoder in parallel. Then add to support MT21C
compressed mode and fix v4l2-compliance fail. Next, extract H264 request
api driver to let mt8183 and mt8192 use the common code, at last, add mt8192 h264
slice api driver.

Patches 1 refactor power/clk/irq interface.
Patches 2~4 get frame buffer size and resolution according to decoder capability.
Patches 5~6 enable lat and core decode in parallel.
Patch 7~10 Add to support MT21C compressed mode and fix v4l2-compliance fail.
Patch 11~12 extract h264 driver and add mt8192 h264 slice api driver
----
Dependents on "Support multi hardware decode using of_platform_populate"[1].

This patches are the second part used to add mt8192 h264 decoder. And the base part is [1].

[1]https://patchwork.linuxtv.org/project/linux-media/cover/20211215061552.8523-1-yunfei.dong@mediatek.com/
----
Yunfei Dong (12):
  media: mtk-vcodec: Add vdec enable/disable hardware helpers
  media: mtk-vcodec: Using firmware type to separate different firmware
    architecture
  media: mtk-vcodec: get frame buffer size from scp
  media: mtk-vcodec: Read max resolution from dec_capability
  media: mtk-vcodec: Call v4l2_m2m_set_dst_buffered() set capture buffer
    buffered
  media: mtk-vcodec: Refactor get and put capture buffer flow
  media: mtk-vcodec: Refactor supported vdec formats and framesizes
  media: mtk-vcodec: Add format to support MT21C
  media: mtk-vcodec: disable vp8 4K capability
  media: mtk-vcodec: Fix v4l2-compliance fail
  media: mtk-vcodec: Extract H264 common code
  media: mtk-vcodec: Add h264 slice api driver for mt8192

 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  49 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   5 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 162 +++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |   6 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  14 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 245 +++++--
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  27 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c |   6 +
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   1 +
 .../mtk-vcodec/vdec/vdec_h264_req_common.c    | 303 +++++++++
 .../mtk-vcodec/vdec/vdec_h264_req_common.h    | 247 +++++++
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 402 +-----------
 .../mtk-vcodec/vdec/vdec_h264_req_lat_if.c    | 620 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |  28 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  36 +
 .../platform/mtk-vcodec/vdec_msg_queue.c      |   2 +
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  55 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  15 +
 include/linux/remoteproc/mtk_scp.h            |   2 +
 21 files changed, 1672 insertions(+), 556 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_common.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_lat_if.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
