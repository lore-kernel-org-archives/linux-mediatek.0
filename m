Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD48C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Oct 2022 03:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s7J4FGv4lww/S8u+a9WC27kyL5Mbg9UEfb7Zl/LRrXc=; b=XO66GyvQUnKOqdAEgBQKJ3gCzf
	29jQCXo2fXC+Nd4gQjGl003oj9MZUMD9HHDs299J82vpQR51yoXJ4gXPfZWUUOxwrTG4Aq4tJ7Ylm
	3u08YWEhCgUCpf0S9NvDZWmwZtl2aPI99Vko/Dx8VGoe4LtBPGuubu/6P5Ix7hfAAYEk5bsrLuQvP
	yqsJtSq90skW/WgEzcp2oEDsMozJtUwuk4jatjLQL9SpnTjQfLONdrYvhg9TbbFMrgCvA6sl73Tji
	S5d1d239HSpdAN807K5prmh+8WUI2meu/kZXXTJZeNpExf23aZbtZg6vP0yMsQ7QG5aQFA+xruqTa
	6UHdxD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeTUE-00CyFS-4z; Sat, 01 Oct 2022 03:48:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeTUA-00CyDw-SC; Sat, 01 Oct 2022 03:48:20 +0000
X-UUID: c254d6b85ee348e49ac33d343c51f69c-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=s7J4FGv4lww/S8u+a9WC27kyL5Mbg9UEfb7Zl/LRrXc=;
	b=kJ1W7yVpMBfnvc38mVWsiyQ0DDqCbuhWO9479f8dbZIBZlBudmnpBhZ0IS/7ZnfFOZyfweadtLPdr+uEVA2Mub9WIjsr5h4UqQaN8/lwM1dajxWPknBiEMD/Y9eXNM0nznjTnyIsknTkxvYX3ZFm4gfQXDNYsQF1ZcUJv7N2EyI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:6dd7eb40-2660-455a-a4ac-0592f6b50368,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:8f14a207-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c254d6b85ee348e49ac33d343c51f69c-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 55236831; Fri, 30 Sep 2022 20:48:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 1 Oct 2022 11:17:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 1 Oct 2022 11:17:40 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tzung-Bi
 Shih <tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v6, 0/8] Support H264 multi-core encoder on MT8195
Date: Sat, 1 Oct 2022 11:17:29 +0800
Message-ID: <20221001031737.18266-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_204818_936577_7AB4CB71 
X-CRM114-Status: GOOD (  16.77  )
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

There is a tast test on chromeOS can measure the encoder fps summary:
command line:
tast run $DUT_IP video.PlatformEncoding.v4l2_h264*
 +-------------+------+----------+------+----------+------+----------+
 | fps summary | 180p | 180_meet | 360p | 360_meet | 720p | 720_meet |
 +-------------+------+----------+------+----------+------+----------+
 |  w/o patch  | 1913 |   1935   | 554  |    571   | 159  |    189   |
 +-------------+------+----------+------+----------+------+----------+
 | apply patch | 2236 |   2337   | 820  |    830   | 324  |    390   |
 +-------------+------+----------+------+----------+------+----------+

changes compared with v5:
- rebase to the newer linux media_stage tree.

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

 .../media/mediatek,vcodec-encoder-core.yaml   | 217 ++++++++++++++++++
 .../media/mediatek,vcodec-encoder.yaml        |   1 -
 .../media/platform/mediatek/vcodec/Makefile   |   4 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  27 ++-
 .../platform/mediatek/vcodec/mtk_vcodec_enc.c | 113 ++++++---
 .../platform/mediatek/vcodec/mtk_vcodec_enc.h |  11 +-
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |  44 +++-
 .../mediatek/vcodec/mtk_vcodec_enc_hw.c       | 156 +++++++++++++
 .../mediatek/vcodec/mtk_vcodec_enc_hw.h       |  34 +++
 .../mediatek/vcodec/mtk_vcodec_enc_pm.c       | 178 ++++++++++++--
 .../mediatek/vcodec/mtk_vcodec_enc_pm.h       |  11 +-
 .../mediatek/vcodec/mtk_vcodec_util.c         |  19 ++
 .../mediatek/vcodec/mtk_vcodec_util.h         |   3 +
 .../mediatek/vcodec/venc/venc_h264_if.c       | 143 +++++++++---
 .../mediatek/vcodec/venc/venc_vp8_if.c        |   3 +-
 .../platform/mediatek/vcodec/venc_drv_if.c    |  75 ++++--
 .../platform/mediatek/vcodec/venc_drv_if.h    |   6 +
 .../platform/mediatek/vcodec/venc_vpu_if.c    |  25 +-
 .../platform/mediatek/vcodec/venc_vpu_if.h    |   3 +-
 19 files changed, 958 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-core.yaml
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.h

-- 
2.18.0


