Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE55C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:10:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF35C63214
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 11:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF35C63214
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QVaWdJbaYfGXtpXkIHsf4zma8/ZaWW5WhnRRgGjan8=; b=mM1fdiIrxNDnjr
	scVigxUvyFU6WoTPDSJTFf+7WhQzcW0HqDAATD4BVOdkaste+OHvCIF9Fbn/8S1VJ49t8fqh1DXX7
	1ItBXrr1Pl4d/f4UvaDzJGYQFsXA4n7gVI2PrL85SkDHLWjDHKwNaQIOCNODlv9busn2EDxzRDYTt
	HcN74arFCgsGWEAvnT2s7VcUSaUl/gOl2ux52jehbzjSKeU17Uos0aUNmKfnWAjz+scQXuUqW7pOg
	SEosSdPsIsGayT9ArgTf5TDYDN2ZIKwCZ0uitHOHa40kqHOTWQR7pOtbZwdj6GPk4XORi1uPch36x
	giJNcejSqHQ3OgVGjqZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFaVY-00Gq6V-A7; Mon, 16 Aug 2021 11:10:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFaVT-00Gq5a-5x; Mon, 16 Aug 2021 11:10:19 +0000
X-UUID: d952163c56af486a936f77936515ebc5-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6pBKEjLSBGVThQlXptxf6GKmTejpgK+JULVeknIi52Y=; 
 b=JmSd9cEZ/1XjHo/KuRDeYku6LoiCb40ud/D0WQDbYW29lmuqyuAASiN1OzpdIq8CM6YBIjPqMK96DZPOnKppHWd5ykKh92fGbk3vcBAm707lMHBI7SALCAcBJsAYVBPXGZ7+en7Ne3TVrG9rQhZFx290qMOKIFsKdq67dlNTjGI=;
X-UUID: d952163c56af486a936f77936515ebc5-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1866898201; Mon, 16 Aug 2021 04:10:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 04:00:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:07 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/9] Enable two H264 encoder cores on MT8195
Date: Mon, 16 Aug 2021 18:59:25 +0800
Message-ID: <20210816105934.28265-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_041015_275284_0159069D 
X-CRM114-Status: GOOD (  17.29  )
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
together to achieve higher performance.

This series of patches is to use enable two h264 encoder cores.
path[1..2]: use linux component framework to manage encoder hardware,
user call "mt8195-vcodec-enc" driver can get the encoder master device,
the encoding work is done by the two encoder core device. The hw_mode
variable is added to distinguish from old platform, two encoder cores
called "FRAME_RACING_MODE".

The hardware mode of two encoder cores work together(overlap, another
word called) on MT8195 called "frame_racing_mode", the two encoder
power-domains should be power on together while encoding, the encoding
process look like this:

    VENC Core0 frm#0....frm#2....frm#4
    VENC Core1  .frm#1....frm#3....frm#5

patch[3..5]: due to the component device, the master device has no
power-domains/clocks properties in dtsi, so the power/clock init function
can't use for "frame_racing_mode" device in master device probe process,
it should be called in component device probe process. Power on the
hardware power and clock on demand.

patch[6]: "frame_racing_mode" encoding need a new set of memory buffer
for two encoder cores. For compatibility, we should new a encoder driver
interface.

patch[7..9]: add "frame_racing_mode" encoding process:
As-Is: Synchronous
VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder IRQ -->
encode done with result --> job_finish

VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder IRQ -->
encode done with result --> job_finish
...

To-Be: Asynchronous
VIDIOC_QBUF#0 --> device_run(triger encoder core0) --> job_finish
..VIDIOC_QBUF#1 --> device_run(triger encoder core1) --> job_finish
(core0 may encode done here, return encode result to client)
VIDIOC_QBUF#2 --> device_run(triger encoder core0) --> job_finish

Thers is no "wait encoder IRQ" synchronous call during "frame_racing_mode"
encoding process, which can full use the two encoder cores to achieve
higher performance.

Irui Wang (9):
  dt-bindings: media: mtk-vcodec: Add binding for MT8195 two venc cores
  media: mtk-vcodec: Use component framework to manage encoder hardware
  media: mtk-vcodec: Rewrite venc power manage interface
  media: mtk-vcodec: Add venc power on/off interface
  media: mtk-vcodec: Rewrite venc clock interface
  media: mtk-vcodec: Add new venc drv interface for frame_racing mode
  media: mtk-vcodec: Add frame racing mode encode process
  media: mtk-vcodec: Return encode result to client
  media: mtk-vcodec: Add delayed worker for encode timeout

 .../bindings/media/mediatek-vcodec.txt        |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  34 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 120 +++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.h      |  10 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 204 +++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.c   | 253 +++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_hw.h   |  38 +
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 213 ++++--
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  13 +-
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |  19 +
 .../platform/mtk-vcodec/mtk_vcodec_util.h     |   5 +
 .../platform/mtk-vcodec/venc/venc_common_if.c | 675 ++++++++++++++++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |   6 +-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |  96 ++-
 .../media/platform/mtk-vcodec/venc_drv_if.h   |   7 +
 .../media/platform/mtk-vcodec/venc_vpu_if.c   |  11 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   3 +-
 19 files changed, 1564 insertions(+), 149 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/venc/venc_common_if.c

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
