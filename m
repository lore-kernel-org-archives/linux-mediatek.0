Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33090C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 08:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CR+Zuj41V9OcnwxkujW0Dat+YRKGS6lOdavnOivT+n8=; b=f5MNWqbbmB6R3tTjAA4HeCl3rM
	Ygg5BG9NUvQEPyoiK6Dc/4PqYBQnUfIHNrsRVQuqBXeUxhdrzeP0ujcSOQVRFWyCGl/g+V4rx5Der
	NISmgwH62MtQR7l7vDI3M3t8+ZBWPZKEcm3IAPyLb8E9v9R5w7262+QIgykCaidfegjsf2CdgBqJD
	mJffo8B7OdmgRcwyd13a0B7OcywN9ZKdFk6X608MaSiPMt5/DKvQEeo2Bfk98VODJ3kshdBW/UPQ9
	beotTxzBOHfEK+URIu+MJPPr/sZ7CSghkg1PyNgPDMXYe1PwBSxNABGTqpT20reGNplyyFj7swhqG
	ifQD+FbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2kK-000dA4-W2; Thu, 09 Feb 2023 08:57:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2kA-000d6v-Iq; Thu, 09 Feb 2023 08:57:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id r3so1461137edq.13;
        Thu, 09 Feb 2023 00:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CR+Zuj41V9OcnwxkujW0Dat+YRKGS6lOdavnOivT+n8=;
        b=OG0UMkcht3W1uLChw55NX4r8OMofbgx3cnsiQ9qFDhnznOtXOgYAH7jY69/bGtHfjB
         6hwGxQZZT2nFtWkhvV2cB806ESghC4undw+8MrUf/fHS+rjh41BIp6zpTdt4ypJHmlVx
         SysPdxIq/aHC+yv57qonEF7B690N/6Wg88l99mqtC+zkdgDqAPeRoLR/ZZNdm0O9fPC1
         6Vhz3l6eKj6vymTF4azg4Ljd7MKn4rY30H7KLfabCnt1fvD+qo2gs7UVvEFlYm9n41mZ
         D9rn5+pxxe8GfVjzsk7YC9FN+pMhzPWmtL4O/fJ+MBYggKLFTdy2a9Em31MJVLDsO6Us
         yuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR+Zuj41V9OcnwxkujW0Dat+YRKGS6lOdavnOivT+n8=;
        b=4eQsFPhdXKc0kJmMRO4fOFniTvAlYYWAzGhXqdeYImiLZUq724mwvKhcjH8nO/ze+h
         bu5evz7n7QaC3RhqstAMMAi9XonMVHXWl98IY4TpSjGLbl5aqZ433z/397hLw4OqUrj8
         l07OSi1X+o1zZ55BteloTIKx6I+aEfHihPuiuyswL8XCgoMP082hQ0NpcF5FGbgCu/AH
         NJaXRcra21U+CoIIc5b7ECG2s/ial6jn8829TyrRS3S5isQoIDXLfoX209DJxjf9YLM9
         X8lWS5H9LTB2Ad33NmAPp6OxUFKwsHM4SKhQnDo7zfITTPaio44djIQU6GQu4+fKEmJX
         SIwQ==
X-Gm-Message-State: AO0yUKUa2qgvFVlzAb3sQWNK1byy8PM7a2w4ecrjB6RUT44R1ZlwSDta
	UfqOptVhE0dMsDmWEPtmG5c=
X-Google-Smtp-Source: AK7set/ljAZnzz7RXHpqE+yV4xbCb6FV0Lp47/Gn9bYBkkX3OE9cAh0INkNdrI29LcQwlKoVOWyrjQ==
X-Received: by 2002:a50:955b:0:b0:4aa:9ac7:403d with SMTP id v27-20020a50955b000000b004aa9ac7403dmr11306719eda.1.1675933043302;
        Thu, 09 Feb 2023 00:57:23 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-57-202.cust.vodafonedsl.it. [188.217.57.202])
        by smtp.gmail.com with ESMTPSA id u1-20020a50c2c1000000b004a21263bbaasm455224edf.49.2023.02.09.00.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 00:57:22 -0800 (PST)
Date: Thu, 9 Feb 2023 09:57:20 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] media: mediatek: vcodec: Force capture queue format to
 MM21
Message-ID: <Y+S1cA4PXT1MVJm8@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230209074025.1816-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209074025.1816-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_005726_639940_092FCC85 
X-CRM114-Status: GOOD (  20.21  )
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

Hi Yunfei Dong,

On Thu, Feb 09, 2023 at 03:40:25PM +0800, Yunfei Dong wrote:
> In order to conver the format of capture queue from mediatek MM21 to
> standard yuv420 with Libyuv, need to force capture queue format to
> MM21 for Libyuv can't covert mediatek MT21 format.

Sorry, just some clarifications on my side, just to understand :)
The problem is that libyuv can't convert mm21 format into yuv420
than you need to use mm21 (forcing this).
Did I understand correctly?

Thanks in advance,
Tommaso

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.org>
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 641f533c417f..4f5e9c20214f 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -41,7 +41,7 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
>  	const struct mtk_video_fmt *fmt;
>  	struct mtk_q_data *q_data;
>  	int num_frame_count = 0, i;
> -	bool ret = true;
> +	bool ret = false;
>  
>  	for (i = 0; i < *dec_pdata->num_formats; i++) {
>  		if (dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME)
> @@ -63,7 +63,7 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx *ctx, int format_index)
>  	case V4L2_PIX_FMT_H264_SLICE:
>  	case V4L2_PIX_FMT_VP9_FRAME:
>  		if (fmt->fourcc == V4L2_PIX_FMT_MM21)
> -			ret = false;
> +			ret = true;
>  		break;
>  	default:
>  		ret = true;
> -- 
> 2.18.0
> 

