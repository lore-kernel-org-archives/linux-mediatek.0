Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AA3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Te4SQ9P/QMFRbmUYNkmcLwXE289Y3jAwdTWV+wpZjEI=; b=GiVnZIcG2a0Pac
	ACFqCxROJzJJ/awb+s7AlMHiFEe1YKp6VkKhD0RSt3hMSzrEF2QgJf1QGVxJlyays3hGQTD7W1aTc
	03KhilmKhluR3NrEbpkaX5r1CL8EnPXhngf896nrFs5KdDZV3kpuXnShBtuYojJjye46aIlK5dYiQ
	mck9UM0e4lRuimJ857E1d8Xp0YfCHfO9TjIc+J1eR1T2QPxPJHRexw2r4npQFyvF4R8QvSBbGJBoM
	/gce/GqP6MClqsSDnuSmIE7zp88ubOJcVBiJgqzJ765XGcaKCjrLu8CXbU1PmRNU8tn3IRrCoK17y
	RxX5K3wUr+4zy9uAk00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF7a-000tGY-Us; Thu, 09 Jun 2022 10:10:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzF63-000sAC-ET; Thu, 09 Jun 2022 10:09:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BCF8FB82C86;
	Thu,  9 Jun 2022 10:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE40C34114;
	Thu,  9 Jun 2022 10:08:51 +0000 (UTC)
Message-ID: <3cd958be-41a8-707d-983a-c9950e913ae5@xs4all.nl>
Date: Thu, 9 Jun 2022 12:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: Fix decoder v4l2 bus_info
 not correctly
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220526095737.21118-1-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220526095737.21118-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_030859_769494_C6A9626E 
X-CRM114-Status: GOOD (  20.49  )
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

Hi Yunfei Dong,

On 5/26/22 11:57, Yunfei Dong wrote:
> Fix v4l2 capability bus_info value with correct chip name according to compatible.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 52e5d36aa912..ccfa426a34ab 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -185,11 +185,32 @@ static int vidioc_vdec_dqbuf(struct file *file, void *priv,
>  	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
>  }
>  
> +static int mtk_vcodec_dec_get_chip_name(void *priv)
> +{
> +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	struct device *dev = &ctx->dev->plat_dev->dev;
> +
> +	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
> +		return 8173;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
> +		return 8183;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
> +		return 8192;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
> +		return 8195;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
> +		return 8186;
> +	else
> +		return 8173;
> +}

Nice, but...

> +
>  static int vidioc_vdec_querycap(struct file *file, void *priv,
>  				struct v4l2_capability *cap)
>  {
> +	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
> +
>  	strscpy(cap->driver, MTK_VCODEC_DEC_NAME, sizeof(cap->driver));
> -	strscpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d", platform_name);

...this will result in identical bus_info values for the decoder and encoder
video devices. The bus_info field is supposed to be unique, and that's now
no longer the case.

I suggest changing this to:

	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);

(and '-enc' for the encoder patch).

Regards,

	Hans

>  	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
>  
>  	return 0;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
