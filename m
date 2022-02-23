Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD255C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 06:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9U0Wdg7Bd//kImOh8qHBJwrPoKP479Ek5TibrsBE2c=; b=LAsladUFGYIA3z
	d3D28Rn8IDl98Svx6kVjeUgg6cwBtdAJcbgXCskTCBPKq/KhiSApobuKTNOwxgnLcKirpytZRuiJv
	N79GWhYFGlJjISu3bvBMQ32+Gzumc8vq3fGpVK03MVzZJ2XX8VOzGXR7kpoFq8i0OjQyr5yTcVflT
	InXUtk+meKMrq0HLO8eSXsy+n4FX5sACFgTbT/KHYyWNA1UTFhQRJzAxDH9742+1lxe1lOKORX//V
	r6PWfcO0YAah+eQLkRhVo2wlX92n58eCKQykNJwG3j6alUju7bmPYObQ/zmE5Vbnk+kryX8Y6xanw
	5iGcDZXC1f4Pzz7UIuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMknS-00Cvdw-T0; Wed, 23 Feb 2022 06:06:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMknF-00Cvbd-QQ; Wed, 23 Feb 2022 06:06:31 +0000
X-UUID: 6222711a7f9a4762888e5b82a98364a2-20220222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Qo7qagrxXkMbYGTsBUlzlPuaEJGYu66wT5H14UQrT5E=; 
 b=J7s3vqrLU0FKDr513QIjsZ5hZ15fLmrJKVSJ9tdz/BUc0JnHGIHoZrdm7w5YguDfCcw8uk7tMzdEnNo5b4PL7Tk8oUOIwPTZTgu7jjMVAYxc5i32vtTja3MsGN2YT3Zo3/PRTnNpRdOlDRCcIp+KNANsi4s773x3JgEYTPySeg4=;
X-UUID: 6222711a7f9a4762888e5b82a98364a2-20220222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1021670284; Tue, 22 Feb 2022 23:06:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 22:06:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Feb 2022 14:06:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 14:06:13 +0800
Message-ID: <bc7d9d90aae903ac95e952d74a15105f51f03542.camel@mediatek.com>
Subject: Re: [PATCH v2, 00/10] Enable two H264 encoder cores on MT8195
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
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 23 Feb 2022 14:06:13 +0800
In-Reply-To: <20220117120615.21687-1-irui.wang@mediatek.com>
References: <20220117120615.21687-1-irui.wang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_220629_893393_EC163F62 
X-CRM114-Status: GOOD (  22.11  )
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

Dear all maintainers,

Gently ping.

Could you help to review this series of patches? 
I would be very grateful for any of your comments.

Thanks
Best Regards
On Mon, 2022-01-17 at 20:06 +0800, Irui Wang wrote:
> MT8195 has two H264 encoder cores, they have their own power-domains,
> clocks, interrupts, register base. The two H264 encoder cores can
> work
> together to achieve higher performance, it's a core mode called
> frame-racing, one core has 4K@30fps performance, two cores can
> achieve
> 4K@60fps.
> The two encoder core encoding process looks like this:
> 
>     VENC Core0: frm#0....frm#2....frm#4....
>     VENC Core1: ..frm#1....frm#3....frm#5....
> 
> This series of patches are used to enable the two H264 encoder cores,
> encoding process will be changed:
> As-Is: Synchronous
> V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> wait encoder
> IRQ -->
> encoding done with result --> job_finish
> V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> wait encoder
> IRQ -->
> encoding done with result --> job_finish
> ...
> 
> To-Be: Asynchronous
> V4L2_VIDIOC_QBUF#0 --> device_run(triger encoder) --> job_finish
> ..V4l2_VIDIOC_QBUF#1 --> device_run(triger encoder) --> job_finish
> (venc core0 may encode done here, done the encoding result to client)
> V4L2_VIDIOC_QBUF#2 --> device_run(triger encoder) --> job_finish.
> 
> There is no "wait encoder IRQ" synchronous call during frame-racing
> mode
> encoding process, it can full use the two encoder cores to achieve
> higher
> performance.
> 
> ---
> This series patches dependent on:
> [1]: the latest linux stage tree: 
> https://git.linuxtv.org/media_stage.git
> 
> mtk decoder patches
> [2]: 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7105
> [3]: 
> https://patchwork.linuxtv.org/project/linux-media/list/?series=7131
> 
> new yaml included files
> [4]:
> 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=551641
> [5]:
> 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579
> 
> ---
> ---
> changes compared with v1:
> - of_platform_populate was used in place of the component framework.
> - new yaml file for venc cores.
> - some modifications for patch v1's review comments.
> ---
> 
> Irui Wang (10):
>   media: mtk-vcodec: Use core type to indicate h264 and vp8 enc
>   media: mtk-vcodec: export encoder functions
>   dt-bindings: media: mtk-vcodec: Adds encoder cores dt-bindings for
>     mt8195
>   media: mtk-vcodec: Enable venc dual core usage
>   media: mtk-vcodec: mtk-vcodec: Rewrite venc power manage interface
>   media: mtk-vcodec: Add venc power on/off interface
>   media: mtk-vcodec: Rewrite venc clock interface
>   media: mtk-vcodec: Add more extra processing for dual-core mode
>   media: mtk-vcodec: Add dual core mode encode process
>   media: mtk-vcodec: Done encode result to client
> 
>  .../media/mediatek,vcodec-encoder-core.yaml   | 214
> +++++++++++++++++
>  drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  44 +++-
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 109 ++++++---
>  .../platform/mtk-vcodec/mtk_vcodec_enc.h      |   7 +-
>  .../platform/mtk-vcodec/mtk_vcodec_enc_core.c | 187 +++++++++++++++
>  .../platform/mtk-vcodec/mtk_vcodec_enc_core.h |  36 +++
>  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 118 ++++++----
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 187 +++++++++++++--
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  11 +-
>  .../platform/mtk-vcodec/mtk_vcodec_util.c     |  19 ++
>  .../platform/mtk-vcodec/mtk_vcodec_util.h     |   5 +
>  .../platform/mtk-vcodec/venc/venc_h264_if.c   | 216 +++++++++++++++-
> --
>  .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   3 +-
>  .../media/platform/mtk-vcodec/venc_drv_if.c   |  79 +++++--
>  .../media/platform/mtk-vcodec/venc_drv_if.h   |   7 +
>  .../media/platform/mtk-vcodec/venc_vpu_if.c   |  10 +-
>  .../media/platform/mtk-vcodec/venc_vpu_if.h   |   3 +-
>  18 files changed, 1097 insertions(+), 162 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/media/mediatek,vcodec-encoder-
> core.yaml
>  create mode 100644 drivers/media/platform/mtk-
> vcodec/mtk_vcodec_enc_core.c
>  create mode 100644 drivers/media/platform/mtk-
> vcodec/mtk_vcodec_enc_core.h
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
