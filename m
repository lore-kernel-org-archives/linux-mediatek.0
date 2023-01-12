Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BDBC54EBE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 20:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3WK6A6So6mtupzVs6lzhOLm4q3JpGomWJszVptAGng=; b=oeKFbFwm1DXJFr7xDt4jIV2BM5
	S182rttCgt+NSNworZ8swWRdTFEZu50XnwoZ9WcRrtW+liw29uiGGVoGKVKwmGImMla1GcpxUhx9x
	fbMhKqjDTOLOP5Nv/IaL+h8OCeBz7aGnaiQggAxXWyv8sQjouEhEFbpAYgXZPxjcTkJ10xXgcIVdh
	oWqTKRMG4uzP6RoAYORTXTT/l/X/wkiu8XD4a37lDawIv6Dg1FkpOc2t9rfPdeMYVa2pZ2VyBKrAc
	luhuSJgvlZgcGzm3d3aq9rVUkpJi39dMYuvi3JYO9oNfQv/ky3l71rbVTy6sOcvwK0QfkFAvzYNN8
	FymQY5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4ex-00H3lh-3x; Thu, 12 Jan 2023 20:58:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4ek-00H3ju-0M; Thu, 12 Jan 2023 20:58:39 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C7E06602D59;
	Thu, 12 Jan 2023 20:58:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673557116;
	bh=wlus3ItbPJlKKgtyc4iIkSQkGdha2/qmSLhvIsGYOgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1bC2BxC39SXJ66hdDZKauBr+s8XAfK/NxeGin7AZJrszz/zAD9M6t29DN6f5DjxT
	 7INqYrfNiR+XRJNdNTHiANz08OLMOrc/xIoEnurfCcaoKydH9CLimMnRZixEz+1XgW
	 xxepSrerWFKxzOXKs7T9bRIw2CYR8BhT3CZVahS5jUYkbFR5+1sVMcsOgh6wmVeran
	 bvT71bJT5Hvan+yE9lRBkQF1GY6kM7I58pc3jA7bMZuibiC+nk/zyHTRCMMDVZEQIX
	 /OVvB9jkdmBbiVfpPAstqDddlNF4DFNazF3kZmias4W/HkcIj+Rs1FQIZzQi5FL00P
	 ArsSx0Cda7ILg==
Date: Thu, 12 Jan 2023 15:58:25 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tomasz Figa <tfiga@google.com>,
	George Sun <george.sun@mediatek.com>,
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Irui Wang <irui.wang@mediatek.com>,
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7, 5/7] media: mediatek: vcodec: Different codec using
 different capture format
Message-ID: <20230112205825.wb5qcqhh5kwvyi3y@notapiano>
References: <20220518123004.18286-1-yunfei.dong@mediatek.com>
 <20220518123004.18286-6-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220518123004.18286-6-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_125838_203230_AFDE0730 
X-CRM114-Status: GOOD (  22.20  )
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

On Wed, May 18, 2022 at 08:30:02PM +0800, Yunfei Dong wrote:
> Vp8 need to use MM21, but vp9 and h264 need to use HyFbc mode
> for mt8195. Vp8/vp9/h264 use the same MM21 format for mt8192.

Hi Yunfei,

why do VP9 and H264 need to use HyFbc (is this the same as MT21C?) mode on
MT8195? The SCP firmware on linux-firmware for MT8195 [1] only has MM21
available and based on my testing it works just fine. And contrary to what the
commit message states this logic is also being applied to MT8192, preventing it
to use MM21 when there are more than one format available.

Thanks,
Nícolas

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/mediatek/mt8195/scp.img?id=375d4500d315ff20c59911d12d86b477d4979b1d

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 52e5d36aa912..254649240b34 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -35,6 +35,44 @@ mtk_vdec_find_format(struct v4l2_format *f,
>  	return NULL;
>  }
>  
> +static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
> +{
> +	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
> +	const struct mtk_video_fmt *fmt;
> +	struct mtk_q_data *q_data;
> +	int num_frame_count = 0, i;
> +	bool ret = true;
> +
> +	for (i = 0; i < *dec_pdata->num_formats; i++) {
> +		if (dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
> +			continue;
> +
> +		num_frame_count++;
> +	}
> +
> +	if (num_frame_count == 1)
> +		return true;
> +
> +	fmt = &dec_pdata->vdec_formats[format_index];
> +	q_data = &ctx->q_data[MTK_Q_DATA_SRC];
> +	switch (q_data->fmt->fourcc) {
> +	case V4L2_PIX_FMT_VP8_FRAME:
> +		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
> +			ret = true;
> +		break;
> +	case V4L2_PIX_FMT_H264_SLICE:
> +	case V4L2_PIX_FMT_VP9_FRAME:
> +		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
> +			ret = false;
> +		break;
> +	default:
> +		ret = true;
> +		break;
> +	};
> +
> +	return ret;
> +}
> +
>  static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
>  					      enum v4l2_buf_type type)
>  {
> @@ -566,6 +604,9 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
>  		    dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
>  			continue;
>  
> +		if (!output_queue && !mtk_vdec_get_cap_fmt(ctx, i))
> +			continue;
> +
>  		if (j == f->index)
>  			break;
>  		++j;
> -- 
> 2.18.0
> 
> 

