Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC0C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 03:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TdnVjNbg4a+QztXahJM/I8xlsnEPA7a397BFbXdNYvo=; b=SL/jdPpgwnMS9AapwZjvdxUW2h
	OFxK2cjv1fhVKHQfJzGTYyjD8OCidVKgH2OKhAkoarACxyRVQb+zKc9aCTHwyXSNv389mVq1QagRi
	mwkyIzu0pT47xcD9UskKBZ+ZDKkycJRnZn4+KjCf329gwA2XL3u+nwJA7lV6l1XH1LO14ipkANTtT
	MY4AnyFDqxSzYZmpxkGdj8SxtVpaVgggeJ//a2Cxec9BcgG4LIUJC9CX21dYrmglvt4OyyoaYhIB/
	iDc/WWH/w1x0Wdnw/ZmHzVosqYSNsxmfewbNCyhv6lTh8MT7XlBdyuRmdXcp7SeZhK2qMe4zpAa/x
	SyEwWzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHH3d-000Jo4-Id; Fri, 29 Jul 2022 03:53:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHH3Z-000Jkw-QD; Fri, 29 Jul 2022 03:52:59 +0000
X-UUID: f2eb8333f43645a6a59cdeeb21cb06fd-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5126f5a2-db55-49a7-8307-1ec757f92d5f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8937b5cf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f2eb8333f43645a6a59cdeeb21cb06fd-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2113000001; Thu, 28 Jul 2022 20:52:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 11:51:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Jul 2022 11:51:30 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Alexandre Courbot <acourbot@chromium.org>, Tiffany
 Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@chromium.org>, Tomasz Figa <tfiga@google.com>,
	<nicolas.dufresne@collabora.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5, 0/8] Support H264 multi-core encoder on MT8195
Date: Fri, 29 Jul 2022 11:51:21 +0800
Message-ID: <20220729035129.3634-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_205257_893409_A7AA2D55 
X-CRM114-Status: GOOD (  15.15  )
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

MT8195 has two H264 encoder hardware, named core0 and core1, this two
cores can encode two input frames separately at the same time to achieve
higher performance.

This series of patches are used to enable the two H264 encoder cores,
the difference between encoding process before and after enable two
cores is just like as below:
As-Is: Synchronous
V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder IRQ
-->
encoding done with result --> job_finish
V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder IRQ
-->
encoding done with result --> job_finish
...
To-Be: Asynchronous
V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> job_finish
..V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> job_finish
(venc core0 may encode done here, done the encoding result to client)
V4L2_VIDIOC_QBUF#2 --> device_run(triger encoder) --> job_finish.

---
changes compared with v4:
- reabse to the newer linux media stage tree.
- remove "mediatek,venc-multi-core" property since sub-device can
  be probed by of_platform_populate api directly.
- some modifications for patch v4's review comments.

changes compared with v3:
- rebase to the newer linux media stage.
- add a capability to indicate scp firmware support multi-core.
- probe core0 as main device, core1 as sub-device.

changes compared with v2:
- update venc core dt-bindings, add two new properties for current
  usage.
- parse venc multi_core mode from device tree.
- rebase to the newer linux media stage.

changes compared with v1:
- of_platform_populate was used in place of the component framework.
- new yaml file for venc cores.
- some modifications for patch v1's review comments.
---

Irui Wang (8):
  dt-bindings: media: mediatek: vcodec: Adds encoder cores dt-bindings
    for mt8195
  media: mediatek: vcodec: Enable venc dual core usage
  media: mediatek: vcodec: Refactor venc power manage function
  media: mediatek: vcodec: Add more extra processing for multi-core
    encoding
  media: mediatek: vcodec: Add venc power on/off function
  media: mediatek: vcodec: Refactor encoder clock on/off function
  media: mediatek: vcodec: Add multi-core encoding process
  media: mediatek: vcodec: Return encoding result in asynchronous mode

 .../media/mediatek,vcodec-encoder-core.yaml   | 218 ++++++++++++++++
 .../media/mediatek,vcodec-encoder.yaml        |   1 -
 .../media/platform/mediatek/vcodec/Makefile   |   4 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  28 +-
 .../platform/mediatek/vcodec/mtk_vcodec_enc.c | 113 ++++++--
 .../platform/mediatek/vcodec/mtk_vcodec_enc.h |  11 +-
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |  44 +++-
 .../mediatek/vcodec/mtk_vcodec_enc_hw.c       | 156 +++++++++++
 .../mediatek/vcodec/mtk_vcodec_enc_hw.h       |  34 +++
 .../mediatek/vcodec/mtk_vcodec_enc_pm.c       | 178 +++++++++++--
 .../mediatek/vcodec/mtk_vcodec_enc_pm.h       |  11 +-
 .../mediatek/vcodec/mtk_vcodec_util.c         |  19 ++
 .../mediatek/vcodec/mtk_vcodec_util.h         |   3 +
 .../mediatek/vcodec/venc/venc_h264_if.c       | 243 ++++++++++++++----
 .../mediatek/vcodec/venc/venc_vp8_if.c        |   3 +-
 .../platform/mediatek/vcodec/venc_drv_if.c    |  75 ++++--
 .../platform/mediatek/vcodec/venc_drv_if.h    |   6 +
 .../platform/mediatek/vcodec/venc_vpu_if.c    |   9 +-
 .../platform/mediatek/vcodec/venc_vpu_if.h    |   3 +-
 19 files changed, 1028 insertions(+), 131 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.h

-- 
2.18.0


