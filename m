Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6557C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 09:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85514610CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 09:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85514610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIDgdRBqDW/nLNawrwnk9gKAGpn4U8PUJZwdJnxbGZ4=; b=hjgoUvDamqY+avAohzWMWMl7Qj
	VNw5jE2LdYClAhK5DfLaj8cVQ4jjFl8qXcmPMEVXGI1fCPYK+xnnqrgtAEUZevomZX0qS6L0QYq2j
	39kWWsrpv5z86jdEXBAPg9BeTnUXn63SD2R0pRWoS1Im2y1tLi7EmSqnX9F92hEpt0QacgVxhLP8s
	zzbG3jI1E0VMDe74QE1wnD9kqsE9JKRJ+q3P2BeaYXvwbc3eRQeye1naeHEwR33b6A4t3uW4CcU25
	tNSoX93CD2yl3c/T6AgZIShqE43R1Ib8Pis/nYVZdcflqmAYaVIr5Le3oAMIJ5NjedtOxqlf/HZF9
	hLSdqJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg1V6-007M2p-If; Thu, 28 Oct 2021 09:15:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg1Ut-007Lyp-EK; Thu, 28 Oct 2021 09:14:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D0B471F44910
Subject: Re: [PATCH v1] media: platform: mtk-mdp3: Revise frame change criteria
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211028040902.437-1-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <f2be422f-5b0b-4f9e-d462-0c1308247a1c@collabora.com>
Date: Thu, 28 Oct 2021 11:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028040902.437-1-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_021455_784532_A4256596 
X-CRM114-Status: GOOD (  25.76  )
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

Il 28/10/21 06:09, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> frame_change will trigger MDP SCP to re-calculate path and parameter.
> MDP fails when it doesn't get correct parameter to process frame.
> frame_change raises when size change occurs
> no matter it happens in input or output frame
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> ---
> This patch is based on [1]
> [1] Reconfigure SHM to improve performance
>      - https://patchwork.kernel.org/project/linux-mediatek/patch/20211022092827.24631-3-roy-cw.yeh@mediatek.com/
> ---
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |  2 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    | 20 ++++----
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   | 50 +++++++++++++++++++
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  8 +++
>   4 files changed, 71 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> index 737082093997..0d2b86019723 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
> @@ -11,6 +11,7 @@
>   #include <media/v4l2-mem2mem.h>
>   #include <linux/soc/mediatek/mtk-mmsys.h>
>   #include <linux/soc/mediatek/mtk-mutex.h>
> +#include "mtk-mdp3-regs.h"
>   #include "mtk-mdp3-comp.h"
>   #include "mtk-mdp3-vpu.h"
>   
> @@ -107,6 +108,7 @@ struct mdp_dev {
>   	atomic_t				cmdq_count;
>   	struct mdp_cmdq_pkt_pool		*cmdq_pool;
>   	struct mdp_cmdq_pkt_pool		*cmdq_d_pool;
> +	struct mdp_framechange_param		prev_image;
>   };
>   
>   struct mdp_pipe_info {
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> index 4684bb3718d3..6cd7bd610715 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
> @@ -98,8 +98,8 @@ static void mdp_m2m_worker(struct work_struct *work)
>   	struct vb2_v4l2_buffer *src_vb, *dst_vb;
>   	struct img_ipi_frameparam param = {0};
>   	struct mdp_cmdq_param task = {0};
> +	struct mdp_framechange_param cur_frame = {0};
>   	enum vb2_buffer_state vb_state = VB2_BUF_STATE_ERROR;
> -	static u8 prev_scenario;
>   	int ret;
>   
>   	if (mdp_m2m_ctx_is_state_set(ctx, MDP_M2M_CTX_ERROR)) {
> @@ -118,21 +118,23 @@ static void mdp_m2m_worker(struct work_struct *work)
>   	mdp_set_src_config(&param.inputs[0], frame, &src_vb->vb2_buf);
>   	mdp_set_scenario(ctx->mdp_dev, &param, frame);
>   
> -	if (prev_scenario != param.type) {
> -		prev_scenario = param.type;
> +	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
> +
> +	cur_frame.scenario = param.type;
> +	memcpy(&cur_frame.in, &param.inputs[0], sizeof(cur_frame.in));
> +	memcpy(&cur_frame.out, &param.outputs[0], sizeof(cur_frame.out));
> +
> +	if (mdp_get_framechange(ctx->mdp_dev, &cur_frame))
>   		param.frame_change = true;
> -	} else {
> +	else
>   		param.frame_change = (ctx->frame_count == 0) ? true : false;
> -	}
>   
>   	if (param.frame_change)
>   		dev_info(&ctx->mdp_dev->pdev->dev,
>   			 "MDP Scenario: %d\n", param.type);
>   
> -	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> -	dst_vb = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> -	mdp_set_dst_config(&param.outputs[0], frame, &dst_vb->vb2_buf);
> -
>   	dst_vb->vb2_buf.timestamp = src_vb->vb2_buf.timestamp;
>   	param.timestamp = src_vb->vb2_buf.timestamp;
>   
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> index 91c5e35947d3..e182d27a1c3f 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
> @@ -434,6 +434,56 @@ static u32 mdp_fmt_get_plane_size(const struct mdp_format *fmt,
>   	return 0;
>   }
>   
> +int mdp_get_framechange(struct mdp_dev *mdp,
> +			struct mdp_framechange_param *cur)

This function is returning 0 or 1, so it would be more appropriate to return
a bool instead.

> +{
> +	int ret = 0;

This would also be a bool.

> +	struct mdp_framechange_param *prev;
> +
> +	prev = &mdp->prev_image;
> +	if (prev->scenario != cur->scenario)
> +		ret = true;
> +
> +	if (prev->in.buffer.format.width != cur->in.buffer.format.width ||

It's useless to perform other checks if you've already determined that
ret = true... so I think you should aggregate all checks in one big
conditional.

if ( (prev->scenario != cur->scenario) ||
      /* Input buffers */
      (prev->in.buffer............ || .... ) ||
      /* Output buffers */
      (.....) ) {
	ret = true;
}

> +	    prev->in.buffer.format.height != cur->in.buffer.format.height)
> +		ret = true;
> +
> +	if (prev->out.buffer.format.width != cur->out.buffer.format.width ||
> +	    prev->out.buffer.format.height != cur->out.buffer.format.height)
> +		ret = true;
> +
> +	if (prev->out.crop.left != cur->out.crop.left ||
> +	    prev->out.crop.top != cur->out.crop.top ||
> +	    prev->out.crop.width != cur->out.crop.width ||
> +	    prev->out.crop.height != cur->out.crop.height)
> +		ret = true;
> +
> +	dev_dbg(&mdp->pdev->dev,
> +		"prev[%d] [%d, %d], [%d, %d], [%d, %d, %d, %d]\n", prev->scenario,
> +		prev->in.buffer.format.width,
> +		prev->in.buffer.format.height,
> +		prev->out.buffer.format.width,
> +		prev->out.buffer.format.height,
> +		prev->out.crop.left,
> +		prev->out.crop.top,
> +		prev->out.crop.width,
> +		prev->out.crop.height);
> +
> +	dev_dbg(&mdp->pdev->dev,
> +		"cur[%d] [%d, %d], [%d, %d], [%d, %d, %d, %d]\n", cur->scenario,
> +		cur->in.buffer.format.width,
> +		cur->in.buffer.format.height,
> +		cur->out.buffer.format.width,
> +		cur->out.buffer.format.height,
> +		cur->out.crop.left,
> +		cur->out.crop.top,
> +		cur->out.crop.width,
> +		cur->out.crop.height);
> +
> +	memcpy(prev, cur, sizeof(struct mdp_framechange_param));
> +	return ret;
> +}
> +
>   void mdp_set_scenario(struct mdp_dev *mdp,
>   		      struct img_ipi_frameparam *param,
>   		      struct mdp_frame *frame)
> diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> index 7979ad60ab87..2d0b3e77f959 100644
> --- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> +++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
> @@ -329,6 +329,12 @@ struct mdp_frameparam {
>   	enum v4l2_quantization		quant;
>   };
>   
> +struct mdp_framechange_param {
> +	u8 scenario;
> +	struct img_input in;
> +	struct img_output out;
> +};
> +
>   int mdp_enum_fmt_mplane(struct mdp_dev *mdp, struct v4l2_fmtdesc *f);
>   const struct mdp_format *mdp_try_fmt_mplane(struct mdp_dev *mdp,
>   					    struct v4l2_format *f,
> @@ -341,6 +347,8 @@ int mdp_try_crop(struct v4l2_rect *r, const struct v4l2_selection *s,
>   int mdp_check_scaling_ratio(const struct v4l2_rect *crop,
>   			    const struct v4l2_rect *compose, s32 rotation,
>   	const struct mdp_limit *limit);
> +int mdp_get_framechange(struct mdp_dev *mdp,
> +			struct mdp_framechange_param *cur);
>   void mdp_set_scenario(struct mdp_dev *mdp,
>   		      struct img_ipi_frameparam *param,
>   		      struct mdp_frame *frame);
> 

Regards,
- Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
