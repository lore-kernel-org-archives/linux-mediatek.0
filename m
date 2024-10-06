Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396B2CFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 08:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3T5Hjfmtymv+/wWpF42wQYfRxK2aZeO3+nu4Wywvmc=; b=I/ngCYaMBPdjo4gDxpeJBguTfX
	z9RXa01DD7BBkdgec/luYKX4K/JDOv0cT1CVKVffIqAYj3xhc/l7vZHbTmsr0mzEpXi5QtUJLyEDM
	Ue/TUuS5OHPNpHnQ3hWSJz4rvRrxC1eA5ETT8Ut0vzeAceaqQHqorXXYEIh/SmYCPOjFGlmcsvhVM
	66KJzJJ1/xfuCzTzTtjwUEVwkVsz5pYEnHDxJ9thNVfBAoxwglu2CxCyNFNt2rF+wQyaOFkDNQJ68
	JlbDo8IlhGIkPAZd/MRIHE+CUvFzveFQVnpino6dUILWJeNL0hw/awVnb4T40TpJ25c5D89Ky5D6L
	EV/WvvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxMPI-0000000HJwF-0iJC;
	Sun, 06 Oct 2024 08:14:24 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxMPF-0000000HJvf-0K6e;
	Sun, 06 Oct 2024 08:14:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a9950d27234so15059266b.1;
        Sun, 06 Oct 2024 01:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728202458; x=1728807258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3T5Hjfmtymv+/wWpF42wQYfRxK2aZeO3+nu4Wywvmc=;
        b=b2f504btHCpBOlY22k2KiNDZOW4pdICIcsSGfhs7FJQWJg074/6b98JEBdr6piN0TA
         qls9jjx1EFpaBGxzkbtFShuZTBPo9/aOOZy+/2ujDa4YFbtaBbmacAmwTsQ82KeII5uq
         ZH59qa5cQXlsDEdUAWnWwRaHfnWj2nQWkL7RghM2fx6Khoo3aiQe39/vQezVxpJKGZLs
         5K6oQXseMst1PARl5llrMyQxZrpY5Xv3gjaqntE/qdGXU43dxl4fNirjlvuhrpQwuxNR
         gw4S3BmDVMLHW5z8xbIq0FD/okRTp5Ho46ZZfmKyC3SUrOkMK5RQg3lh68YdYT3Aaoxw
         lP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728202458; x=1728807258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3T5Hjfmtymv+/wWpF42wQYfRxK2aZeO3+nu4Wywvmc=;
        b=dZD6fF3N2/LZaZfZUp4k+PV8PryPRBakGJh7bnbsNQptny69oSnYRQqWeXJ5PWZ21k
         KGtEbmeZvQGi8qvxjUTbspNS3xexyHpmyOGHKUXPQ+UgQszA3u5UkUHxOmQW+TVLeCUA
         XVTUzwu/GTnQbUvug9fUNP/gq2KuGGrFe0tULOjNqV0OsmYXvN5t27qb0MjK2Ey1cZTy
         FWxlW00mCFu2IaFJF0TLTCtA9wIecKhlhVhcdo0geGHAewMDI/Gz/Wjcan5W7mlAmXRx
         F5qBXqHCGN2DYg7WCbdwMVd92x/onvX8O8a8W4y2LYKKJVnSFLj/m9aqwjdhpRw4xAwF
         3x5g==
X-Forwarded-Encrypted: i=1; AJvYcCV7ThqNaEhrKwSGTD03YL4r7xIOm7W/b6Rqtukr7DBmy6S+s2fjMp+ADRWiNoZQ57xc0MSz18DTY1H/VX7CZEvz@lists.infradead.org, AJvYcCWsh0c8mgy4N3wlyWYta0oLAUCcmlXEXp4/nvO6DrSGMfiYhVPUJ5z0+N6VySIv18AT9znBNlc+aXiHcd3YXFY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yym3yWEu4q1mvQrWMnPJfw3rn3cvmM69YEQAbQORz1qTKaBNVql
	bBQKBeLYIOXno6OyM0idwdQouXuYzjQYA8/hOlKN+Dq4Bem/I0aY
X-Google-Smtp-Source: AGHT+IHG1K1x0pP5Pn8L1WV8joKe+lZYAKwFgKNtSe3mpghD65+PEFtH7oYtHcRa9CsMIs3wXr0lwg==
X-Received: by 2002:a17:906:fe4d:b0:a90:1300:e613 with SMTP id a640c23a62f3a-a991c077ddbmr851592366b.55.1728202457375;
        Sun, 06 Oct 2024 01:14:17 -0700 (PDT)
Received: from [10.32.3.23] ([95.183.227.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994a1464a1sm80746066b.106.2024.10.06.01.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 01:14:15 -0700 (PDT)
Message-ID: <61891c81-3172-4bca-a660-88518e051f9c@gmail.com>
Date: Sun, 6 Oct 2024 11:14:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix XRGB format breakage for blend_modes
 unsupported SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241005095234.12925-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <20241005095234.12925-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_011421_162910_6B238821 
X-CRM114-Status: GOOD (  20.51  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

On 05/10/2024 12:52 pm, Jason-JH.Lin wrote:
> If the constant alpha always set, the SoCs that is not supported the
> ignore alpha bit will still use constant alpha. That will break the
> original constant alpha setting of XRGB foramt for blend_modes
> unsupported SoCs, such as MT8173.
> 
> Make the constatnt alpha only set when setting has_alpha or supported
> blend_modes SoC to fix the downgrade issue.
> 
> Fixes: bc46eb5d5d77 ("drm/mediatek: Support DRM plane alpha in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 28 +++++++++++++++----------
>   1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 703cd3f6c6d3..de3addd89442 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -494,19 +494,25 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   
>   	con = mtk_ovl_fmt_convert(ovl, state);
>   	if (state->base.fb) {
> -		con |= OVL_CON_AEN;
> -		con |= state->base.alpha & OVL_CON_ALPHA;
> +		/*
> +		 * For blend_modes supported SoCs, always set constant alpha.
> +		 * For blend_modes unsupported SoCs, set constant alpha when has_alpha is set.
> +		 */
> +		if (ovl->data->blend_modes || state->base.fb->format->has_alpha) {
> +			con |= OVL_CON_AEN;
> +			con |= state->base.alpha & OVL_CON_ALPHA;
> +		}
> +
> +		/*
> +		 * Although the alpha channel can be ignored, CONST_BLD must be enabled
> +		 * for XRGB format, otherwise OVL will still read the value from memory.
> +		 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
> +		 * affect the result. Therefore we use !has_alpha as the condition.
> +		 */
> +		if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
> +			ignore_pixel_alpha = OVL_CONST_BLEND;
>   	}
>   
> -	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
> -	 * can be ignored, or OVL will still read the value from memory.
> -	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
> -	 * affect the result. Therefore we use !has_alpha as the condition.
> -	 */
> -	if ((state->base.fb && !state->base.fb->format->has_alpha) ||
> -	    blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
> -		ignore_pixel_alpha = OVL_CONST_BLEND;
> -
>   	if (pending->rotation & DRM_MODE_REFLECT_Y) {
>   		con |= OVL_CON_VIRT_FLIP;
>   		addr += (pending->height - 1) * pending->pitch;


