Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CD0C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQ5Ll723gxJOQriEEst7t1/UHqzXhr3nL1YtxUNySoU=; b=Ge16QQDDH0Yc0BKhHwf182NTVF
	ZZKmXLfenV5toNR0W/DYFZa5o7SK+21WfskZgUKv3eeWbGe9i21LmNlSsxG8vNdX2IVvMa5V7Ek7o
	YKjsLgoXU8P2wyGY4ylpH3kzHPwRhGDHbVorf+1beIulzvsmuxBKsx4plNzh4VTc/8pvJY7jXg9vW
	j2soGuHu9mw6sSV7/FZyUU+PV3sjSwHm8FiVmesm3GHpIGatvXgOyTQhSVHlUUQC/4BfDM+hJJjrP
	WQb6N+0Gi6tkanaaV5iuuQzWREQRIwebnyRSeaxxrVQFr8OO+u0CNM0TncCuFLJlV9pz50pU/ITK0
	HPCXfTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1j2S-00Cd2e-00;
	Wed, 24 May 2023 07:36:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1j2N-00Cd1g-21;
	Wed, 24 May 2023 07:36:01 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24E3766032B2;
	Wed, 24 May 2023 08:35:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684913758;
	bh=2P4uUVGWSU1yuuIGABANv5MaXiV9HCTbYclu2/IM3PI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BFGNHizBzrDirVgLuoG5p0bLgQGskneur9IIARgRKquZxXDqU5cbeqxLvmAelQpx2
	 wIQOL1vD2uI6BZk5VzvitQonsIXe53UegCK/lnLH2qGKgOzMcfTFEeRlWvmrEyPkdF
	 a3H2jcrI2lXF1T0ZdY/5IToW7eTbki7UDR2xDHulp3N3pcynSh/2H8g37ZfY8/7zFO
	 ZS8ofYgPXodKinoxhur7XfqRDjxgHWP0WFwe6u+PJg8o6VVyuP2vXfoflUoFJ+BRde
	 sSCzluBsADd0iaAaoVU3hgTDdQmE6fURduxAk9NQFRjKF+RoEYixtpgk/YK3YI/rqZ
	 Np5iExasUbyoA==
Message-ID: <2dde9a06-1ed3-f95e-f11e-91b65c039c92@collabora.com>
Date: Wed, 24 May 2023 09:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5,2/2] media: mediatek: vcodec: support stateless hevc
 decoder
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230524021625.13708-1-yunfei.dong@mediatek.com>
 <20230524021625.13708-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230524021625.13708-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_003559_925228_4EBCFDA0 
X-CRM114-Status: GOOD (  23.02  )
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

Il 24/05/23 04:16, Yunfei Dong ha scritto:
> Add mediatek hevc decoder linux driver which use the stateless API in MT8195.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Nathan Hebert <nhebert@chromium.org>
> ---
>   .../media/platform/mediatek/vcodec/Makefile   |    1 +
>   .../vcodec/mtk_vcodec_dec_stateless.c         |   59 +-
>   .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
>   .../vcodec/vdec/vdec_hevc_req_multi_if.c      | 1101 +++++++++++++++++
>   .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
>   .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
>   6 files changed, 1166 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
> 

..snip..

> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
> new file mode 100644
> index 000000000000..9a96547af33c
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
> @@ -0,0 +1,1101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023 MediaTek Inc.
> + * Author: Yunfei Dong <yunfei.dong@mediatek.com>
> + */
> +

..snip..

> +
> +/**
> + * struct vdec_hevc_slice_share_info - shared information used to exchange
> + *                                     message between lat and core
> + *
> + * @sps:               sequence header information from user space
> + * @dec_params:        decoder params from user space
> + * @hevc_slice_params: decoder params used for hardware
> + * @trans_start:       trans start dma address
> + * @trans_end:         trans end dma address

Wrong documentation, there's no trans_start, trans_end, but just `trans`.

> + */
> +struct vdec_hevc_slice_share_info {
> +	struct v4l2_ctrl_hevc_sps sps;
> +	struct v4l2_ctrl_hevc_decode_params dec_params;
> +	struct vdec_hevc_slice_lat_dec_param hevc_slice_params;
> +	struct vdec_hevc_slice_mem trans;
> +};
> +
> +/**
> + * struct vdec_hevc_slice_inst - hevc decoder instance
> + *
> + * @slice_dec_num:      how many picture be decoded
> + * @ctx:                point to mtk_vcodec_ctx
> + * @pred_buf:           HW working predication buffer

pred_buf is not present in this structure; either add it and make use
of it, or remove the documentation for it.

> + * @mv_buf:             HW working motion vector buffer
> + * @vpu:                VPU instance
> + * @vsi:                vsi used for lat
> + * @vsi_core:           vsi used for core
> + * @wrap_addr:          wrap address used for hevc
> + *
> + * @hevc_slice_param:   the parameters that hardware use to decode
> + *
> + * @resolution_changed: resolution changed
> + * @realloc_mv_buf:     reallocate mv buffer
> + * @cap_num_planes:     number of capture queue plane
> + */
> +struct vdec_hevc_slice_inst {
> +	unsigned int slice_dec_num;
> +	struct mtk_vcodec_ctx *ctx;
> +	struct mtk_vcodec_mem mv_buf[HEVC_MAX_MV_NUM];
> +	struct vdec_vpu_inst vpu;
> +	struct vdec_hevc_slice_vsi *vsi;
> +	struct vdec_hevc_slice_vsi *vsi_core;
> +	struct mtk_vcodec_mem wrap_addr;
> +
> +	struct vdec_hevc_slice_lat_dec_param hevc_slice_param;
> +
> +	unsigned int resolution_changed;
> +	unsigned int realloc_mv_buf;
> +	unsigned int cap_num_planes;
> +};
> +
> +static unsigned int vdec_hevc_get_mv_buf_size(unsigned int width, unsigned int height)
> +{
> +	const int unit_size = (width / 16) * (height / 16) + 8;

This is supposed to be `const unsigned int`, otherwise you may overflow here (even
if it's unlikely to, but still....!)

> +
> +	return 64 * unit_size;
> +}
> +

..snip..

> +static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> +				      struct vdec_fb *fb, bool *res_chg)
> +{
> +	struct vdec_hevc_slice_inst *inst = h_vdec;
> +	struct vdec_vpu_inst *vpu = &inst->vpu;
> +

Please remove this extra empty line.

> +	int err, timeout = 0;
> +	unsigned int data[2];
> +	struct vdec_lat_buf *lat_buf;
> +	struct vdec_hevc_slice_share_info *share_info;
> +

...after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



