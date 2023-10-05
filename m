Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4500DE7C4F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 08:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RA+Vl0TFvQv/YPYnZ9AtIDhxy0C3bUxH0kGu3wUPxs=; b=zOAG8WTxsL+/8TNVf96exfYdw4
	FBBNPkvZLCLcu0U7q06TYXy0Z62kRNvlyhyZhWXA2GeEv1+M8pEzlqXo7xh000olBlzQlzOx65K8/
	2CoMo+5fzRhtTHs7O4mVKdZIYE5W9negVzERdOiQXIChLouczTcjmcqGMEUJRXweT6kSIGhFDA6y5
	zJ9U0+CN9lpE13lRj+yAnMflI3OeOz6oTM4m89//UosXPYG9UwR4w8BwuGfsOkEt0XdAL/WARl1bA
	uU332PNKkhnJqWPSrKozEH+XVSwKLYF0cxExW4bj0NwfInxzN8ggWL0n5wNeoyn3BpR6WQ71WIjjg
	5p0DklGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJx9-001hZb-39;
	Thu, 05 Oct 2023 08:43:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoJx6-001hXi-3B;
	Thu, 05 Oct 2023 08:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2A858CE2104;
	Thu,  5 Oct 2023 08:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C973EC116AF;
	Thu,  5 Oct 2023 08:43:19 +0000 (UTC)
Message-ID: <b7c19673-a3bd-449a-9e84-49a68c89b0ea@xs4all.nl>
Date: Thu, 5 Oct 2023 10:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: mediatek: vcodec: Handle encoder vsi NULL
 pointer case
Content-Language: en-US, nl
To: Irui Wang <irui.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20230926101909.15030-1-irui.wang@mediatek.com>
 <20230926101909.15030-2-irui.wang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230926101909.15030-2-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_014325_199075_44D19DE7 
X-CRM114-Status: GOOD (  16.09  )
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

On 26/09/2023 12:19, Irui Wang wrote:
> There will be a kernel null pointer exception if 'vsi' is NULL, check
> 'vsi' is not NULL before assign it to encoder instance.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c     | 5 +++++
>  .../platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c      | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index a68dac72c4e4..385bcc0d14f3 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -597,6 +597,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
>  	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
>  
>  	ret = vpu_enc_init(&inst->vpu_inst);
> +	if (!inst->vpu_inst.vsi) {
> +		mtk_venc_err(ctx, "share buffer is NULL");
> +		kfree(inst);
> +		return -EFAULT;
> +	}

Shouldn't this check be done in vpu_enc_init?

It looks weird that a function can return 0, but there is still an
error that needs to be checked manually afterwards.

Regards,

	Hans

>  
>  	if (MTK_ENC_IOVA_IS_34BIT(ctx))
>  		inst->vsi_34 = (struct venc_h264_vsi_34 *)inst->vpu_inst.vsi;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c
> index 05abca91e742..23ca0d93324f 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_vp8_if.c
> @@ -326,6 +326,11 @@ static int vp8_enc_init(struct mtk_vcodec_enc_ctx *ctx)
>  	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_LT_SYS);
>  
>  	ret = vpu_enc_init(&inst->vpu_inst);
> +	if (!inst->vpu_inst.vsi) {
> +		mtk_venc_err(ctx, "share buffer is NULL");
> +		kfree(inst);
> +		return -EFAULT;
> +	}
>  
>  	inst->vsi = (struct venc_vp8_vsi *)inst->vpu_inst.vsi;
>  


