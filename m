Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3C8C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f5WdYJwPS4BY55DiDiUxeeobbZ5h+qmBWr41ol48bTk=; b=a5GZJB3FjcjaP+
	7Gy/ZagRpOBHnWi9OeXUpw6vX5jWp8U9qahWUCpLzNRGTvJ3T0ZtVg6lOVgumzxFz3ITgeEB+ZCvs
	3vBEqlmsbp60T0COhaFnnufN6m7lZLb3RItVZpmd2ElcnfowVz69KsOX1LzZ8w8RA8eq+1VsorEtp
	58ziKx0QxtbSa29crE1g/qa/12jEBP9X7ilenyhuyih23V7rwkALNNDf3EDXLuwz3jssukJcr1stC
	0fXre0stWBe80WL90edud2yq0JrNIwSl0z/D7ZCKk5FifkfRJavey9Qy0GDVuUf8YXIrYkOYFCT5z
	XXlw/25i7vrWuoe8p96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9QmO-00Elzy-GH; Mon, 17 Jan 2022 12:06:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9QmJ-00ElvZ-0a; Mon, 17 Jan 2022 12:06:30 +0000
X-UUID: 786b29150e4b4112a966cea814014193-20220117
X-UUID: 786b29150e4b4112a966cea814014193-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2008430025; Mon, 17 Jan 2022 05:06:24 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 04:06:22 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 20:06:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 20:06:19 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 00/10] Enable two H264 encoder cores on MT8195
Date: Mon, 17 Jan 2022 20:06:05 +0800
Message-ID: <20220117120615.21687-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_040627_114386_3123E021 
X-CRM114-Status: GOOD (  14.70  )
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

MT8195 has two H264 encoder cores, they have their own power-domains,
clocks, interrupts, register base. The two H264 encoder cores can work
together to achieve higher performance, it's a core mode called
frame-racing, one core has 4K@30fps performance, two cores can achieve
4K@60fps.
The two encoder core encoding process looks like this:

    VENC Core0: frm#0....frm#2....frm#4....
    VENC Core1: ..frm#1....frm#3....frm#5....

This series of patches are used to enable the two H264 encoder cores,
encoding process will be changed:
As-Is: Synchronous
V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder IRQ -->
encoding done with result --> job_finish
V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder IRQ -->
encoding done with result --> job_finish
...

To-Be: Asynchronous
V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> job_finish
..V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> job_finish
(venc core0 may encode done here, done the encoding result to client)
V4L2_VIDIOC_QBUF#2 --> device_run(triger encoder) --> job_finish.

There is no "wait encoder IRQ" synchronous call during frame-racing mode
encoding process, it can full use the two encoder cores to achieve higher
performance.

---
This series patches dependent on:
[1]: the latest linux stage tree: https://git.linuxtv.org/media_stage.git

mtk decoder patches
[2]: https://patchwork.linuxtv.org/project/linux-media/list/?series=7105
[3]: https://patchwork.linuxtv.org/project/linux-media/list/?series=7131

new yaml included files
[4]:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=551641
[5]:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579

---
---
changes compared with v1:
- of_platform_populate was used in place of the component framework.
- new yaml file for venc cores.
- some modifications for patch v1's review comments.
---

Irui Wang (10):
  media: mtk-vcodec: Use core type to indicate h264 and vp8 enc
  media: mtk-vcodec: export encoder functions
  dt-bindings: media: mtk-vcodec: Adds encoder cores dt-bindings for
    mt8195
  media: mtk-vcodec: Enable venc dual core usage
  media: mtk-vcodec: mtk-vcodec: Rewrite venc power manage interface
  media: mtk-vcodec: Add venc power on/off interface
  media: mtk-vcodec: Rewrite venc clock interface
  media: mtk-vcodec: Add more extra processing for dual-core mode
  media: mtk-vcodec: Add dual core mode encode process
  media: mtk-vcodec: Done encode result to client

 .../media/mediatek,vcodec-encoder-core.yaml   | 214 +++++++++++++++++
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  44 +++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 109 ++++++---
 .../platform/mtk-vcodec/mtk_vcodec_enc.h      |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_core.c | 187 +++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_core.h |  36 +++
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 118 ++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 187 +++++++++++++--
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  11 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  19 ++
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   5 +
 .../platform/mtk-vcodec/venc/venc_h264_if.c   | 216 +++++++++++++++---
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   3 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |  79 +++++--
 .../media/platform/mtk-vcodec/venc_drv_if.h   |   7 +
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |  10 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   3 +-
 18 files changed, 1097 insertions(+), 162 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_core.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
