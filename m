Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F52FC7618A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 20:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYj5s0VQqdIrOS0nX9IOIqNGVF8ihEK7YqHoMcFQwi4=; b=DZcc8YsMbOt+ZW3y5gTteTlqqu
	lSSVOhjOjjRTGCE74x+bIsm+RC/BLAVl0w360sKwVlR0X3/E8IDwb0x0VV1w03OahNqnFAVaWgmLL
	OOFl8U0Kdtz9O5kp1kUIzNgh/QUcH++q2N4uJhIHq6PszE+oyqaCPcO94B+18JZvmgDeR3YMJoyO6
	n8xMiBeoRkDR/aSUp3GBDQMgp9po+EZsSGQmxctDJxmr7mYDGvpVe/LMGKjbzYJxnvQ3c6KV5TnvT
	g+9YenCLRa6r/90wq4vMhmHezy2zlRTajOIBJJPVW6NCYKVsfAKIfkwXnWy9VakT9UJPnguxWQgVm
	t05qLLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcuZm-00HYjX-1Q;
	Thu, 16 Mar 2023 20:51:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcuZi-00HYhC-1S;
	Thu, 16 Mar 2023 20:51:52 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD6766603096;
	Thu, 16 Mar 2023 20:51:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678999906;
	bh=k3z29yPOnuz0kpwls7c9eR3QIXarYfLJxqFV5EuLcLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nh/NeXJh/Ryon7FaBxfjX3GELNPbyT8cyUiEtLU0EhxnORZPm/wrQxYXQaVnIeqRh
	 Kbr22sPvqZBaG0AqeDW2XAFb3aPiNZe02TWhtp+coMGMYD1WDmzh+XBmJFtYDw4u/P
	 CGZBzjmUhQ8HInBX9tWBTseElnSLaDX7b+9TBTdcZUg5wqWS1pjhz3jx6GCn7l9z3x
	 YtCEYb2GW0WquyemRuSMmpq2kcZH7ayDuXWDrl2em5DwcHs0BGEW/CCmflEv8dMx6I
	 Ni2ulSHZNirqMll9c7dbKvntDwR81uB37qlDkDFULsVXFphfePk4fjK61vExOlOzS8
	 h95mPzFzX2eDA==
Date: Thu, 16 Mar 2023 16:51:40 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3] media: mediatek: vcodec: Force capture queue format
 to MM21
Message-ID: <20230316205140.sjkdwrpj2xwquho2@notapiano>
References: <20230314072557.29669-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314072557.29669-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_135150_853734_77A814F1 
X-CRM114-Status: GOOD (  26.87  )
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

Hi Yunfei,

thanks for the patch.

On Tue, Mar 14, 2023 at 03:25:57PM +0800, Yunfei Dong wrote:
> Libyuv is one software library used to covert format. Only covert
> mediatek uncompressed mode MM21 to standard yuv420 for MT21 is
> compressed mode. Need to set capture queue format to MM21 in order
> to use Libyuv when scp firmware support MM21 and MT21.

This commit message is a bit confusing still. Here's a suggestion:

	While the decoder can produce frames in both MM21 and MT21C formats, only MM21
	is currently supported by userspace tools (like gstreamer and libyuv). In order
	to ensure userspace keeps working after the SCP firmware is updated to support
	both MM21 and MT21C formats, force the MM21 format for the capture queue.

	This is meant as a stopgap solution while dynamic format switching between 
	MM21 and MT21C isn't implemented in the driver.

> 
> Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using different capture format")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> changed with v2:
> - re-write commit message.
> - change the driver flow.
> changed with v1:
> - add Fixes tag.
> ---
>  .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 24 +++----------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 

While this change works (that is, I'm able to run fluster tests on both MT8192
and MT8195 using the new MM21+MT21C firmware), it causes a regression on
v4l2-compliance:

	[..]
	Format ioctls:
	[..]
			fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
		test VIDIOC_G_FMT: FAIL
			fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
		test VIDIOC_TRY_FMT: FAIL
			fail: v4l2-test-formats.cpp(478): pixelformat 3132544d (MT21) for buftype 9 not reported by ENUM_FMT
		test VIDIOC_S_FMT: FAIL
	[..]
	Total for mtk-vcodec-dec device /dev/video2: 46, Succeeded: 43, Failed: 3, Warnings: 0

The patch makes only MM21 show in VIDIOC_ENUM_FMT, but VIDIOC_S_FMT,
VIDIOC_G_FMT and VIDIOC_TRY_FMT still show MT21. So I think you need to do the
same forcing of MM21 for those ioctls.

Thanks,
Nícolas

> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 641f533c417f..c99705681a03 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -39,10 +39,9 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
>  {
>  	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
>  	const struct mtk_video_fmt *fmt;
> -	struct mtk_q_data *q_data;
>  	int num_frame_count = 0, i;
> -	bool ret = true;
>  
> +	fmt = &dec_pdata->vdec_formats[format_index];
>  	for (i = 0; i < *dec_pdata->num_formats; i++) {
>  		if (dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
>  			continue;
> @@ -50,27 +49,10 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
>  		num_frame_count++;
>  	}
>  
> -	if (num_frame_count == 1)
> +	if (num_frame_count == 1 || fmt->fourcc == V4L2_PIX_FMT_MM21)
>  		return true;
>  
> -	fmt = &dec_pdata->vdec_formats[format_index];
> -	q_data = &ctx->q_data[MTK_Q_DATA_SRC];
> -	switch (q_data->fmt->fourcc) {
> -	case V4L2_PIX_FMT_VP8_FRAME:
> -		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
> -			ret = true;
> -		break;
> -	case V4L2_PIX_FMT_H264_SLICE:
> -	case V4L2_PIX_FMT_VP9_FRAME:
> -		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
> -			ret = false;
> -		break;
> -	default:
> -		ret = true;
> -		break;
> -	}
> -
> -	return ret;
> +	return false;
>  }
>  
>  static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
> -- 
> 2.25.1
> 

