From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: remove unneeded proxy functions
Date: Fri, 14 Jun 2019 02:11:51 -0700
Message-ID: <9fd990d12ea1488592c5a590046f001a187b9c3f.camel@perches.com>
References: <20190614075640.106709-1-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614075640.106709-1-acourbot@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-06-14 at 16:56 +0900, Alexandre Courbot wrote:
> We were getting the codec interface through a proxy function that does
> not bring anything compared to just accessing the interface definition
> directly, so just do that. Also make the decoder interfaces const.
[]
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
[]
> @@ -485,16 +485,9 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
>  	return 0;
>  }
>  
> -static struct vdec_common_if vdec_h264_if = {
> +const struct vdec_common_if vdec_h264_if = {

probably better to fixup whatever chains prevent
this (if any) from being static const

>  	.init		= vdec_h264_init,
>  	.decode		= vdec_h264_decode,
>  	.get_param	= vdec_h264_get_param,
>  	.deinit		= vdec_h264_deinit,
>  };
