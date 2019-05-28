From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFCv1 04/12] media: mtk-vcodec: fix copyright indent
Date: Tue, 28 May 2019 11:07:04 +0200
Message-ID: <fa11a504-071e-f786-8564-cb7e95248f64@xs4all.nl>
References: <20190528055635.12109-1-acourbot@chromium.org>
 <20190528055635.12109-5-acourbot@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528055635.12109-5-acourbot@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Minor identation fix for copyright notice in a few source files.

How about converting to using SPDX as well?

Regards,

	Hans

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [acourbot: refactor, cleanup and split]
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 26 +++++++++----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 26 +++++++++----------
>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 24 ++++++++---------
>  3 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 109c7578a8b2..76905e2d56a7 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -1,17 +1,17 @@
>  /*
> -* Copyright (c) 2016 MediaTek Inc.
> -* Author: PC Chen <pc.chen@mediatek.com>
> -*         Tiffany Lin <tiffany.lin@mediatek.com>
> -*
> -* This program is free software; you can redistribute it and/or modify
> -* it under the terms of the GNU General Public License version 2 as
> -* published by the Free Software Foundation.
> -*
> -* This program is distributed in the hope that it will be useful,
> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -* GNU General Public License for more details.
> -*/
> + * Copyright (c) 2016 MediaTek Inc.
> + * Author: PC Chen <pc.chen@mediatek.com>
> + *         Tiffany Lin <tiffany.lin@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
>  
>  #ifndef _MTK_VCODEC_DRV_H_
>  #define _MTK_VCODEC_DRV_H_
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 2d5a61c06287..32d8ce9c8f6e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -1,17 +1,17 @@
>  /*
> -* Copyright (c) 2016 MediaTek Inc.
> -* Author: PC Chen <pc.chen@mediatek.com>
> -*         Tiffany Lin <tiffany.lin@mediatek.com>
> -*
> -* This program is free software; you can redistribute it and/or modify
> -* it under the terms of the GNU General Public License version 2 as
> -* published by the Free Software Foundation.
> -*
> -* This program is distributed in the hope that it will be useful,
> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -* GNU General Public License for more details.
> -*/
> + * Copyright (c) 2016 MediaTek Inc.
> + * Author: PC Chen <pc.chen@mediatek.com>
> + *         Tiffany Lin <tiffany.lin@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
>  
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 39375b8ea27c..2fdae50173be 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -1,16 +1,16 @@
>  /*
> -* Copyright (c) 2016 MediaTek Inc.
> -* Author: Tiffany Lin <tiffany.lin@mediatek.com>
> -*
> -* This program is free software; you can redistribute it and/or modify
> -* it under the terms of the GNU General Public License version 2 as
> -* published by the Free Software Foundation.
> -*
> -* This program is distributed in the hope that it will be useful,
> -* but WITHOUT ANY WARRANTY; without even the implied warranty of
> -* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -* GNU General Public License for more details.
> -*/
> + * Copyright (c) 2016 MediaTek Inc.
> + * Author: Tiffany Lin <tiffany.lin@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
>  
>  #include <linux/clk.h>
>  #include <linux/of_address.h>
> 
