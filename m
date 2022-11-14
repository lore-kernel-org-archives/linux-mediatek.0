Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6208C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gobOXpKHnCnVJRUDKHW6r+tIVF7eKMc+LZwLTHorn4M=; b=og/AMItP0hdaXLQHva+Sm6H8Sa
	CG4K+M1PrK2pVRcZgDC3suJTkOw+AG+2pjRmcIAsU7Bd5hH5bTYE0i/SlNtxtwT+TGlsiqIVgtq8W
	1tCmEEQT8UhzzopIVavUT5wCwNXVe9eqOR5YT2RrpVGmIo43gvsf3YQ/bzKyohRAQ0h0mXRa35OLj
	7ARil9Kv17WpZ5agSALR2SqtMP21U+Tz7RM95IUplLcUmiRyX5QnQZ0jSF+VIhtNgadI8TuS5rZYO
	Qu1JEtgvV/6VNqA7pFKe0uphmZSZntFWPH8nYk+GDy/IKS5jGIx+JUCkapC2ZXfemQHHSqcsU+bOz
	qwtWfn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXcH-000MC9-Kb; Mon, 14 Nov 2022 11:27:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXby-000M1V-Jw; Mon, 14 Nov 2022 11:26:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B80E6660231A;
	Mon, 14 Nov 2022 11:26:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668425204;
	bh=XifCq/axZLBlXf4U0/opeUK0341SCz1UOz+Nkb9EfVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aDUvkxXsUxmHSLgh1elCk9KmlE2qa5h/iiL5HMRv+CEd0pihqpgJuEIN+EhABBEXA
	 zWkRKkrbNNWCS8YkUzgkuRncYJBO1tPi70p8I430FopA2p1xEObQJQd8lkFPknre+B
	 p5869i/ddLmyvysVN3eA51JM79Ruol7+7YsTCLnHVOtmzCfyKFVUnFQAA43/OWQmZe
	 2KLSOZrWh67v0Rva6eJH6+UPQQuoCS55O9+6WQo6LoOndsHvawzTMCtsIh+voBnbAC
	 P5Ti8ukVINdsGdorg5KvZonlU7dhCa7IUJQmqyt9N3Kb/V2bBRrYrHbk+1PHqFjd4w
	 mY7ZHo+D/M4Zg==
Message-ID: <11a5fbb6-f462-bdc5-1592-32e8f2664a48@collabora.com>
Date: Mon, 14 Nov 2022 12:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 3/5] media: mediatek: vcodec: Fix h264 set lat buffer
 error
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221112094144.4256-1-yunfei.dong@mediatek.com>
 <20221112094144.4256-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112094144.4256-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_032646_819676_C3124231 
X-CRM114-Status: GOOD (  16.61  )
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

Il 12/11/22 10:41, Yunfei Dong ha scritto:
> Will set lat buffer to lat_list two times when lat decode timeout for
> inner racing mode.
> 
> If core thread can't get frame buffer, need to return error value.
> 
> Fixes: 59fba9eed5a7 ("media: mediatek: vcodec: support stateless H.264 decoding for mt8192")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../vcodec/vdec/vdec_h264_req_multi_if.c      | 23 ++++++++++++-------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
> index 4cc92700692b..2b7576265f48 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
> @@ -471,6 +471,12 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
>   	       sizeof(share_info->h264_slice_params));
>   
>   	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
> +	if (!fb) {
> +		err = -EBUSY;
> +		mtk_vcodec_err(inst, "fb buffer is NULL");
> +		goto vdec_dec_end;
> +	}
> +
>   	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;

If you're jumping to vdec_dec_end, this check becomes pointless as y_fb_dma
will never be set to 0, so you can remove the conditional on assigning
the dma address to `y_fb_dma`.

Same comment a few lines later for `c_fb_dma`.

Regards,
Angelo


