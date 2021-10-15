Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04393C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 10:06:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848FA60F23
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 10:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 848FA60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O83xKrqlY3hnqzt1f1qtUn1O1JP8rPuoPPCP3wMgPrU=; b=tqLondYWCNSaBlITqXCQ62Zr6f
	ta/5md2dYhcghTyjJ3hC4r2E0WnliwACHGxBGUN657sRZ9VzR55P92lwfbF5lHkF9SiOlzWI2AxR+
	cqtkzFRp3za/U0rTKLjQDvCCvFNHpUK/rWn3YWM/NjfP9o2uGwUYCnxw2k5UiHdR1zhwM+AS37h6t
	rv7AsvalYsrH9Cf98kd4jD4gkIGRjf0eV4aaKHB/xqyQ5e9OPIbPjn2971ZV3Jdty1AM0nrQ4iyWp
	CkK4eq8wsUbJpPYsbwtcpxUgxNBGA0baLixM+HhZ4eXoyXqSZ0CmIp5ZttOlQSkV0MYAhpCfgbCGK
	8a4trv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbK6M-006QNk-RS; Fri, 15 Oct 2021 10:06:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbK6D-006QLK-Cj
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 10:06:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 56A7B1F450A1
Subject: Re: [PATCH v1 3/9] media: platform: mtk-mdp3: add chip independence
 architecture
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org
References: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
 <20210917032728.22367-4-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <865a7780-f619-8e36-264e-56efa98bb938@collabora.com>
Date: Fri, 15 Oct 2021 12:05:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917032728.22367-4-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_030601_737015_9A61E020 
X-CRM114-Status: GOOD (  22.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/09/21 05:27, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add chip independence architecture
> - Add hal architecture for mt8183
> - Add driver data to adapt other soc
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 154 ++++---
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 181 ++++-----
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   | 193 ++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   | 383 +++++++++++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  19 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   2 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 233 +----------
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   | 262 ++++++------
>   8 files changed, 908 insertions(+), 519 deletions(-)
> 

...<snip>

> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> index d996d9e71356..f6d70af80b3e 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> @@ -35,6 +35,18 @@ struct mdp_platform_config {
>   
>   struct mtk_mdp_driver_data {
>   	const struct mdp_platform_config *mdp_cfg;
> +	const enum mdp_comp_event *event;
> +	unsigned int event_len;
> +	const struct mdp_comp_list *comp_list;
> +	const struct mdp_comp_data *comp_data;
> +	unsigned int comp_data_len;
> +	const struct mdp_comp_info *comp_info;
> +	unsigned int comp_info_len;
> +	const struct mdp_pipe_info *pipe_info;
> +	unsigned int pipe_info_len;
> +	const struct mdp_format *format;
> +	unsigned int format_len;
> +	const enum mdp_mmsys_config_id *config_table;
>   };
>   
>   struct mdp_dev {
> @@ -67,6 +79,13 @@ struct mdp_dev {
>   	atomic_t				job_count;
>   };
>   
> +struct mdp_pipe_info {
> +	enum mtk_mdp_pipe_id pipe_id;
> +	u32 mmsys_id;
> +	u32 mutex_id;
> +	u32 sof;
> +};
> +
>   int mdp_vpu_get_locked(struct mdp_dev *mdp);
>   void mdp_vpu_put_locked(struct mdp_dev *mdp);
>   int mdp_vpu_register(struct mdp_dev *mdp);
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> index 584804ef7bc4..2a8bb05226a0 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> @@ -629,6 +629,8 @@ static int mdp_m2m_open(struct file *file)
>   	int ret;
>   	struct v4l2_format default_format;
>   
> +	mdp_format_init(mdp->mdp_data->format, mdp->mdp_data->format_len);
> +
>   	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> index a6caefb097be..d5bdba00b946 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> @@ -10,226 +10,8 @@
>   #include "mtk-mdp3-core.h"
>   #include "mtk-mdp3-regs.h"
>   
> -static const struct mdp_format mdp_formats[] = {
> -	{
> -		.pixelformat	= V4L2_PIX_FMT_GREY,
> -		.mdp_color	= MDP_COLOR_GREY,
> -		.depth		= { 8 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_RGB565X,
> -		.mdp_color	= MDP_COLOR_RGB565,
> -		.depth		= { 16 },
> -		.row_depth	= { 16 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_RGB565,
> -		.mdp_color	= MDP_COLOR_BGR565,
> -		.depth		= { 16 },
> -		.row_depth	= { 16 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_RGB24,
> -		.mdp_color	= MDP_COLOR_RGB888,
> -		.depth		= { 24 },
> -		.row_depth	= { 24 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_BGR24,
> -		.mdp_color	= MDP_COLOR_BGR888,
> -		.depth		= { 24 },
> -		.row_depth	= { 24 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_ABGR32,
> -		.mdp_color	= MDP_COLOR_BGRA8888,
> -		.depth		= { 32 },
> -		.row_depth	= { 32 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_ARGB32,
> -		.mdp_color	= MDP_COLOR_ARGB8888,
> -		.depth		= { 32 },
> -		.row_depth	= { 32 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_UYVY,
> -		.mdp_color	= MDP_COLOR_UYVY,
> -		.depth		= { 16 },
> -		.row_depth	= { 16 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_VYUY,
> -		.mdp_color	= MDP_COLOR_VYUY,
> -		.depth		= { 16 },
> -		.row_depth	= { 16 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_YUYV,
> -		.mdp_color	= MDP_COLOR_YUYV,
> -		.depth		= { 16 },
> -		.row_depth	= { 16 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_YVYU,
> -		.mdp_color	= MDP_COLOR_YVYU,
> -		.depth		= { 16 },
> -		.row_depth	= { 16 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_YUV420,
> -		.mdp_color	= MDP_COLOR_I420,
> -		.depth		= { 12 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.halign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_YVU420,
> -		.mdp_color	= MDP_COLOR_YV12,
> -		.depth		= { 12 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.halign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV12,
> -		.mdp_color	= MDP_COLOR_NV12,
> -		.depth		= { 12 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.halign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV21,
> -		.mdp_color	= MDP_COLOR_NV21,
> -		.depth		= { 12 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.halign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV16,
> -		.mdp_color	= MDP_COLOR_NV16,
> -		.depth		= { 16 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV61,
> -		.mdp_color	= MDP_COLOR_NV61,
> -		.depth		= { 16 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.walign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV24,
> -		.mdp_color	= MDP_COLOR_NV24,
> -		.depth		= { 24 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV42,
> -		.mdp_color	= MDP_COLOR_NV42,
> -		.depth		= { 24 },
> -		.row_depth	= { 8 },
> -		.num_planes	= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_MT21C,
> -		.mdp_color	= MDP_COLOR_420_BLK_UFO,
> -		.depth		= { 8, 4 },
> -		.row_depth	= { 8, 8 },
> -		.num_planes	= 2,
> -		.walign		= 4,
> -		.halign		= 5,
> -		.flags		= MDP_FMT_FLAG_OUTPUT,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_MM21,
> -		.mdp_color	= MDP_COLOR_420_BLK,
> -		.depth		= { 8, 4 },
> -		.row_depth	= { 8, 8 },
> -		.num_planes	= 2,
> -		.walign		= 4,
> -		.halign		= 5,
> -		.flags		= MDP_FMT_FLAG_OUTPUT,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV12M,
> -		.mdp_color	= MDP_COLOR_NV12,
> -		.depth		= { 8, 4 },
> -		.row_depth	= { 8, 8 },
> -		.num_planes	= 2,
> -		.walign		= 1,
> -		.halign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV21M,
> -		.mdp_color	= MDP_COLOR_NV21,
> -		.depth		= { 8, 4 },
> -		.row_depth	= { 8, 8 },
> -		.num_planes	= 2,
> -		.walign		= 1,
> -		.halign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV16M,
> -		.mdp_color	= MDP_COLOR_NV16,
> -		.depth		= { 8, 8 },
> -		.row_depth	= { 8, 8 },
> -		.num_planes	= 2,
> -		.walign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_NV61M,
> -		.mdp_color	= MDP_COLOR_NV61,
> -		.depth		= { 8, 8 },
> -		.row_depth	= { 8, 8 },
> -		.num_planes	= 2,
> -		.walign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_YUV420M,
> -		.mdp_color	= MDP_COLOR_I420,
> -		.depth		= { 8, 2, 2 },
> -		.row_depth	= { 8, 4, 4 },
> -		.num_planes	= 3,
> -		.walign		= 1,
> -		.halign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}, {
> -		.pixelformat	= V4L2_PIX_FMT_YVU420M,
> -		.mdp_color	= MDP_COLOR_YV12,
> -		.depth		= { 8, 2, 2 },
> -		.row_depth	= { 8, 4, 4 },
> -		.num_planes	= 3,
> -		.walign		= 1,
> -		.halign		= 1,
> -		.flags		= MDP_FMT_FLAG_OUTPUT | MDP_FMT_FLAG_CAPTURE,
> -	}
> -};
> +static const struct mdp_format *mdp_formats;
> +static u32 format_len;

Is it really necessary to add global variables here?

I see many different possible solutions to that:

A. You can avoid doing that by passing a structure holding both the pointer to the
    soc-specific mdp_formats and format_len to every function internally calling
    mdp_find_fmt() and mdp_find_fmt_by_index(); or

B. You can add a enum variable that would be used to select an array entry based on
    the soc version and keep the mdp_formats in here as a bidimensional array, such
    that you can do something like ARRAY_SIZE(mdp_formats[soc_ver]) where "soc_ver"
    may be something like FMTS_MT8183, or FMTS_MT8195, etc.

I would prefer solution A.

>   
>   static const struct mdp_limit mdp_def_limit = {
>   	.out_limit = {
> @@ -256,7 +38,7 @@ static const struct mdp_format *mdp_find_fmt(u32 pixelformat, u32 type)
>   
>   	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
>   					MDP_FMT_FLAG_CAPTURE;
> -	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
> +	for (i = 0; i < format_len; ++i) {
>   		if (!(mdp_formats[i].flags & flag))
>   			continue;
>   		if (mdp_formats[i].pixelformat == pixelformat)
> @@ -271,7 +53,7 @@ static const struct mdp_format *mdp_find_fmt_by_index(u32 index, u32 type)
>   
>   	flag = V4L2_TYPE_IS_OUTPUT(type) ? MDP_FMT_FLAG_OUTPUT :
>   					MDP_FMT_FLAG_CAPTURE;
> -	for (i = 0; i < ARRAY_SIZE(mdp_formats); ++i) {
> +	for (i = 0; i < format_len; ++i) {
>   		if (!(mdp_formats[i].flags & flag))
>   			continue;
>   		if (index == num)
> @@ -744,3 +526,10 @@ int mdp_frameparam_init(struct mdp_frameparam *param)
>   
>   	return 0;
>   }
> +
> +void mdp_format_init(const struct mdp_format *format, u32 length)

...and avoiding to have globals in here would also eliminate any need to have
this function.

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
