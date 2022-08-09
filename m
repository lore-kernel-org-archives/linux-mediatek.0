Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E1C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 02:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8g00+MVfQ7zjg+9qQtJsoC54ym+QwCyy5TT9zwswNA=; b=ThTBD6qB42CXW6/3m60McaEaiU
	RrFUQ6glRnNoKQsW5F2PMy3memBhdAovgoyD/Ld2KrMDdsMXAANJVEPukZI0pYreqyjm0ZbKZbQ1D
	tUce9XxsggsfeARcJjrsPE0BnQnS3zLzy6D/C8WphM0Hq4DqrOCW305DnEX7Q8ZBxmV2qorjFL2Oe
	2lqPimiqep5FMquV21TYH/47h0NeUcgLVLLYJfQkPvpnXK+e3JvGfGiOjSFEWftCIn3m5VtrP5Hrs
	RiN6rYHTLeJwTzeoqBIOC9/lKjGFM3EgjXfQMEqH7Mq1QcGkLLLYbrJ67nOpYEBpTGX3Yu6nK4wpX
	cTJjuKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLEvk-000PDn-DF; Tue, 09 Aug 2022 02:25:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLEvh-000P9h-U0; Tue, 09 Aug 2022 02:25:15 +0000
X-UUID: 200ed0f2359046f588efb35e9bd24bc4-20220808
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:b73d7379-4ae5-458c-8954-08b48338efa9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:3d8acc9,CLOUDID:34111f9c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 200ed0f2359046f588efb35e9bd24bc4-20220808
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 805553301; Mon, 08 Aug 2022 19:24:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 10:14:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Aug 2022 10:14:22 +0800
Message-ID: <ceed53ee78f1364771f781a5567dd186ec4694ad.camel@mediatek.com>
Subject: Re: [PATCH v5, 0/8] Support H264 multi-core encoder on MT8195
From: Irui Wang <irui.wang@mediatek.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Courbot
	<acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, "Andrew-CT
 Chen" <andrew-ct.chen@mediatek.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
	Tomasz Figa <tfiga@google.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 9 Aug 2022 10:14:22 +0800
In-Reply-To: <8ae4bf37a743755d046f9d0a9e8ad303c7a5041d.camel@collabora.com>
References: <20220729035129.3634-1-irui.wang@mediatek.com>
	 <8ae4bf37a743755d046f9d0a9e8ad303c7a5041d.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_192513_986599_09CC7D8E 
X-CRM114-Status: GOOD (  28.89  )
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

Dear Nicolas,

Sorry for late, we have tested this change by chrome tast test before:

tast run $IP video.PlatformEncoding.v4l2_h264*

here are the average fps results:
Before:
180p: 1913
180_meet: 1935

360p: 554
360_meet: 571

720p: 159
720_meet: 189

After:
180p: 2236
180_meet: 2337

360p: 820
360_meet: 830

720p: 324
720_meet: 390

Thanks
BRs
On Fri, 2022-07-29 at 11:08 -0400, Nicolas Dufresne wrote:
> Hi Irui,
> 
> Le vendredi 29 juillet 2022 à 11:51 +0800, Irui Wang a écrit :
> > MT8195 has two H264 encoder hardware, named core0 and core1, this
> > two
> > cores can encode two input frames separately at the same time to
> > achieve
> > higher performance.
> 
> I suspect you could provide some performance numbers on that specific
> HW before
> and after your change ? This could help integrator regarding what
> type of gain
> they can expect of back-porting this feature. This is not strictly
> mandatory
> though.
> 
> > 
> > This series of patches are used to enable the two H264 encoder
> > cores,
> > the difference between encoding process before and after enable two
> > cores is just like as below:
> > As-Is: Synchronous
> > V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder
> > IRQ
> > -->
> > encoding done with result --> job_finish
> > V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder
> > IRQ
> > -->
> > encoding done with result --> job_finish
> > ...
> > To-Be: Asynchronous
> > V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> job_finish
> > ..V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> job_finish
> > (venc core0 may encode done here, done the encoding result to
> > client)
> > V4L2_VIDIOC_QBUF#2 --> device_run(triger encoder) --> job_finish.
> > 
> > ---
> > changes compared with v4:
> > - reabse to the newer linux media stage tree.
> > - remove "mediatek,venc-multi-core" property since sub-device can
> >   be probed by of_platform_populate api directly.
> > - some modifications for patch v4's review comments.
> > 
> > changes compared with v3:
> > - rebase to the newer linux media stage.
> > - add a capability to indicate scp firmware support multi-core.
> > - probe core0 as main device, core1 as sub-device.
> > 
> > changes compared with v2:
> > - update venc core dt-bindings, add two new properties for current
> >   usage.
> > - parse venc multi_core mode from device tree.
> > - rebase to the newer linux media stage.
> > 
> > changes compared with v1:
> > - of_platform_populate was used in place of the component
> > framework.
> > - new yaml file for venc cores.
> > - some modifications for patch v1's review comments.
> > ---
> > 
> > Irui Wang (8):
> >   dt-bindings: media: mediatek: vcodec: Adds encoder cores dt-
> > bindings
> >     for mt8195
> >   media: mediatek: vcodec: Enable venc dual core usage
> >   media: mediatek: vcodec: Refactor venc power manage function
> >   media: mediatek: vcodec: Add more extra processing for multi-core
> >     encoding
> >   media: mediatek: vcodec: Add venc power on/off function
> >   media: mediatek: vcodec: Refactor encoder clock on/off function
> >   media: mediatek: vcodec: Add multi-core encoding process
> >   media: mediatek: vcodec: Return encoding result in asynchronous
> > mode
> > 
> >  .../media/mediatek,vcodec-encoder-core.yaml   | 218
> > ++++++++++++++++
> >  .../media/mediatek,vcodec-encoder.yaml        |   1 -
> >  .../media/platform/mediatek/vcodec/Makefile   |   4 +-
> >  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  28 +-
> >  .../platform/mediatek/vcodec/mtk_vcodec_enc.c | 113 ++++++--
> >  .../platform/mediatek/vcodec/mtk_vcodec_enc.h |  11 +-
> >  .../mediatek/vcodec/mtk_vcodec_enc_drv.c      |  44 +++-
> >  .../mediatek/vcodec/mtk_vcodec_enc_hw.c       | 156 +++++++++++
> >  .../mediatek/vcodec/mtk_vcodec_enc_hw.h       |  34 +++
> >  .../mediatek/vcodec/mtk_vcodec_enc_pm.c       | 178 +++++++++++--
> >  .../mediatek/vcodec/mtk_vcodec_enc_pm.h       |  11 +-
> >  .../mediatek/vcodec/mtk_vcodec_util.c         |  19 ++
> >  .../mediatek/vcodec/mtk_vcodec_util.h         |   3 +
> >  .../mediatek/vcodec/venc/venc_h264_if.c       | 243
> > ++++++++++++++----
> >  .../mediatek/vcodec/venc/venc_vp8_if.c        |   3 +-
> >  .../platform/mediatek/vcodec/venc_drv_if.c    |  75 ++++--
> >  .../platform/mediatek/vcodec/venc_drv_if.h    |   6 +
> >  .../platform/mediatek/vcodec/venc_vpu_if.c    |   9 +-
> >  .../platform/mediatek/vcodec/venc_vpu_if.h    |   3 +-
> >  19 files changed, 1028 insertions(+), 131 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> > core.yaml
> >  create mode 100644
> > drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.c
> >  create mode 100644
> > drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_hw.h
> > 
> 
> 


