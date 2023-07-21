Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4451CEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AvsOr8fU2DfulVSoTTJrsc4l2TYuMXQKXyGia7zNhg=; b=Vv8vVSmKDTWujFAV6caNJ+12JJ
	TWz0e0JDVsNkv3LbsLoWAPgiC0QqP6lDX6DWxHjlnlDt+vr/53KtPji17+A78NTGlBq2peKOzUcXP
	aKEldMEmOQSsBySbxQv6GxFSc6KMAtHIzItoSNHL+oYtReEcl7HGKY3LHw38deYjKjgrVvMXqm21i
	hFpq6uU7wV1cSrEF74PQ3bQB3q3oIaVfpmssDccLvxLIDPD5NRLSB+DbMDayEpLTzdB89t/AB4d7M
	rfrRmq/lBvC8u4RKFm6iTeg8tPt6lSMNnDEEsUmPiZgyLOJyANyimnCkkop8nwyFwedG9T/4fQUhT
	iCC41oaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrlA-00EODY-0l;
	Fri, 21 Jul 2023 15:09:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrl5-00EOCF-16;
	Fri, 21 Jul 2023 15:09:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4DAD61CE8;
	Fri, 21 Jul 2023 15:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E173C433C8;
	Fri, 21 Jul 2023 15:09:26 +0000 (UTC)
Message-ID: <7917efd2-7b37-66c6-5213-3bfab192a76b@xs4all.nl>
Date: Fri, 21 Jul 2023 17:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6,0/11] media: mediatek: vcodec: separate encoder and
 decoder
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230704131349.8354-1-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230704131349.8354-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_080931_466401_0C72D32B 
X-CRM114-Status: GOOD (  26.86  )
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

Hi Yunfei Dong,

On 04/07/2023 15:13, Yunfei Dong wrote:
> With the driver more and more complex, encoder and decoder need to add more parameter
> in shared struct 'mtk_vcodec_ctx' and 'mtk_vcodec_dev'. Encoder use about 40% and
> decoder use 60% parameter. Need to allocate extra unused memory when encoder and decoder
> working.
> 
> Separate encoder and decoder in different folder and use independent data struct.
> 
> patch 1 remove unused parameter.
> patch 2~3 align fw and interrupt related interface.
> patch 4~6 remove the dependency of debug log
> patch 7~8 separate mtk_vcodec_ctx and mtk_vcodec_dev
> patch 9 fix unreasonable parameter
> patch 10 removed unused header files
> patch 11 separate encoder and decoder in different folder

There were quite a few vcodec patches that still used the old location of
these sources, so I decided to make PRs for those first.

That means that you need to rebase all your current patch series on top
of that.

My tree with the pending patches is here:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v6.6g

Your set of patches that need to be rebased are here in patchwork:

https://patchwork.linuxtv.org/project/linux-media/list/?submitter=7655

I basically had a choice of either taking your patches, and then having
to ask a lot of people to rebase their work, or take theirs first, and
only asking one person, you, to rebase. So I went with the latter choice.

You can choose whether to post a single patchseries for all 16 patches,
or just post a v7 for the first and v2 for the other two patchseries.
Up to you.

I do promise to process your the rebased series as soon as possible
to avoid more conflicts.

Regards,

	Hans

> ---
> Changed from v5:
> - fix some words error for patch 3/6/11.
> - rename mtk_vcodec_comm_drv.h to mtk_vcodec_cmn_drv.h for patch 7.
> Changed from v4:
> - add one parameter to record register base for reg_base for patch 3.
> - add debug string for non ctx log for patch 6.
> - change the comment of struct mtk_vcodec_dec_ctx and struct mtk_vcodec_enc_ctx for patch 7.
> - prefer to use struct mtk_vcodec_dec_dev an current period, will re-construct in the future for patch 8.
> Changed from v3:
> - re-write commit message for patch 3.
> Changed from v2:
> - This patch main changed:
>   1: add different macro mtk_dec_debug and mtk_enc_debug calling common
>      macro mtk_vcodec_debug in order to use dev_dbg instead of pr_debug.
>   2: add different macro mtk_v4l2_venc_dbg and mtk_v4l2_vdec_dbg calling common
>      macro  in order to use dev_dbg instead of pr_debug.
> Changed from v1:
> - Change pr_dbg to dev_dbg for mtk_v4l2_level and mtk_vcodec_dbg for patch 4.
> - Change pr_err to dev_err for mtk_v4l2_err and mtk_vcodec_err for patch 5.
> - Fix unreasonable parameter for patch 8.
> ---
> Yunfei Dong (11):
>   media: mediatek: vcodec: remove unused parameter
>   media: mediatek: vcodec: align fw interface
>   media: mediatek: vcodec: Removing struct 'mtk_vcodec_ctx/dev' for
>     shared interface
>   media: mediatek: vcodec: Removing useless debug log
>   media: mediatek: vcodec: remove the dependency of vcodec debug log
>   media: mediatek: vcodec: replace pr_* with dev_* for v4l2 debug
>     message
>   media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'
>   media: mediatek: vcodec: separate struct mtk_vcodec_dev
>   media: mediatek: vcodec: fix unreasonable parameter definition and
>     style
>   media: mediatek: vcodec: remove unused include header
>   media: mediatek: vcodec: separate decoder and encoder
> 
>  .../media/platform/mediatek/vcodec/Makefile   |  55 +-
>  .../platform/mediatek/vcodec/common/Makefile  |  21 +
>  .../vcodec/common/mtk_vcodec_cmn_drv.h        | 147 +++++
>  .../vcodec/{ => common}/mtk_vcodec_dbgfs.c    |  57 +-
>  .../vcodec/{ => common}/mtk_vcodec_dbgfs.h    |  24 +-
>  .../vcodec/{ => common}/mtk_vcodec_fw.c       |  21 +-
>  .../vcodec/{ => common}/mtk_vcodec_fw.h       |   8 +-
>  .../vcodec/{ => common}/mtk_vcodec_fw_priv.h  |  14 +-
>  .../vcodec/{ => common}/mtk_vcodec_fw_scp.c   |  26 +-
>  .../vcodec/{ => common}/mtk_vcodec_fw_vpu.c   |  64 +-
>  .../mediatek/vcodec/common/mtk_vcodec_intr.c  |  68 +++
>  .../vcodec/{ => common}/mtk_vcodec_intr.h     |   6 +-
>  .../vcodec/{ => common}/mtk_vcodec_util.c     |  67 +--
>  .../mediatek/vcodec/common/mtk_vcodec_util.h  |  73 +++
>  .../platform/mediatek/vcodec/decoder/Makefile |  25 +
>  .../vcodec/{ => decoder}/mtk_vcodec_dec.c     | 182 +++---
>  .../vcodec/{ => decoder}/mtk_vcodec_dec.h     |  10 +-
>  .../vcodec/{ => decoder}/mtk_vcodec_dec_drv.c |  84 ++-
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h       | 315 ++++++++++
>  .../vcodec/{ => decoder}/mtk_vcodec_dec_hw.c  |  19 +-
>  .../vcodec/{ => decoder}/mtk_vcodec_dec_hw.h  |   6 +-
>  .../vcodec/{ => decoder}/mtk_vcodec_dec_pm.c  |  38 +-
>  .../vcodec/{ => decoder}/mtk_vcodec_dec_pm.h  |   6 +-
>  .../{ => decoder}/mtk_vcodec_dec_stateful.c   | 176 +++---
>  .../{ => decoder}/mtk_vcodec_dec_stateless.c  |  91 +--
>  .../{ => decoder}/vdec/vdec_av1_req_lat_if.c  | 158 +++--
>  .../vcodec/{ => decoder}/vdec/vdec_h264_if.c  |  79 ++-
>  .../{ => decoder}/vdec/vdec_h264_req_common.c |   4 +-
>  .../{ => decoder}/vdec/vdec_h264_req_common.h |   6 +-
>  .../{ => decoder}/vdec/vdec_h264_req_if.c     |  75 ++-
>  .../vdec/vdec_h264_req_multi_if.c             | 157 +++--
>  .../vdec/vdec_hevc_req_multi_if.c             | 129 ++---
>  .../vcodec/{ => decoder}/vdec/vdec_vp8_if.c   |  72 ++-
>  .../{ => decoder}/vdec/vdec_vp8_req_if.c      |  81 ++-
>  .../vcodec/{ => decoder}/vdec/vdec_vp9_if.c   | 132 ++---
>  .../{ => decoder}/vdec/vdec_vp9_req_lat_if.c  | 129 ++---
>  .../vcodec/{ => decoder}/vdec_drv_base.h      |   2 +-
>  .../vcodec/{ => decoder}/vdec_drv_if.c        |  12 +-
>  .../vcodec/{ => decoder}/vdec_drv_if.h        |  10 +-
>  .../vcodec/{ => decoder}/vdec_ipi_msg.h       |   0
>  .../vcodec/{ => decoder}/vdec_msg_queue.c     |  64 +-
>  .../vcodec/{ => decoder}/vdec_msg_queue.h     |  14 +-
>  .../vcodec/{ => decoder}/vdec_vpu_if.c        |  57 +-
>  .../vcodec/{ => decoder}/vdec_vpu_if.h        |   6 +-
>  .../platform/mediatek/vcodec/encoder/Makefile |  11 +
>  .../vcodec/{ => encoder}/mtk_vcodec_enc.c     | 296 +++++-----
>  .../vcodec/{ => encoder}/mtk_vcodec_enc.h     |  12 +-
>  .../vcodec/{ => encoder}/mtk_vcodec_enc_drv.c |  73 +--
>  .../vcodec/encoder/mtk_vcodec_enc_drv.h       | 246 ++++++++
>  .../vcodec/{ => encoder}/mtk_vcodec_enc_pm.c  |  12 +-
>  .../vcodec/{ => encoder}/mtk_vcodec_enc_pm.h  |   4 +-
>  .../vcodec/{ => encoder}/venc/venc_h264_if.c  | 110 ++--
>  .../vcodec/{ => encoder}/venc/venc_vp8_if.c   |  69 +--
>  .../vcodec/{ => encoder}/venc_drv_base.h      |   4 +-
>  .../vcodec/{ => encoder}/venc_drv_if.c        |  10 +-
>  .../vcodec/{ => encoder}/venc_drv_if.h        |  11 +-
>  .../vcodec/{ => encoder}/venc_ipi_msg.h       |   0
>  .../vcodec/{ => encoder}/venc_vpu_if.c        |  75 +--
>  .../vcodec/{ => encoder}/venc_vpu_if.h        |   3 +-
>  .../platform/mediatek/vcodec/mtk_vcodec_drv.h | 548 ------------------
>  .../mediatek/vcodec/mtk_vcodec_intr.c         |  43 --
>  .../mediatek/vcodec/mtk_vcodec_util.h         |  83 ---
>  62 files changed, 2217 insertions(+), 2183 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/common/Makefile
>  create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_dbgfs.c (76%)
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_dbgfs.h (62%)
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw.c (75%)
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw.h (86%)
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_priv.h (75%)
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_scp.c (70%)
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_fw_vpu.c (58%)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_intr.c
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_intr.h (68%)
>  rename drivers/media/platform/mediatek/vcodec/{ => common}/mtk_vcodec_util.c (55%)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
>  create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/Makefile
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec.c (83%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec.h (91%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_drv.c (83%)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_hw.c (91%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_hw.h (92%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_pm.c (81%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_pm.h (61%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_stateful.c (73%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/mtk_vcodec_dec_stateless.c (84%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_av1_req_lat_if.c (93%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_if.c (84%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_common.c (98%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_common.h (97%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_if.c (86%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_h264_req_multi_if.c (85%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_hevc_req_multi_if.c (90%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp8_if.c (87%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp8_req_if.c (81%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp9_if.c (87%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec/vdec_vp9_req_lat_if.c (94%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_base.h (95%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_if.c (86%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_drv_if.h (89%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_ipi_msg.h (100%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_msg_queue.c (82%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_msg_queue.h (95%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_vpu_if.c (79%)
>  rename drivers/media/platform/mediatek/vcodec/{ => decoder}/vdec_vpu_if.h (97%)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/Makefile
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc.c (82%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc.h (78%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_drv.c (86%)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_pm.c (83%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/mtk_vcodec_enc_pm.h (78%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc/venc_h264_if.c (88%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc/venc_vp8_if.c (88%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_base.h (94%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_if.c (86%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_drv_if.h (94%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_ipi_msg.h (100%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_vpu_if.c (82%)
>  rename drivers/media/platform/mediatek/vcodec/{ => encoder}/venc_vpu_if.h (96%)
>  delete mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
>  delete mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_intr.c
>  delete mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> 


