Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A728C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbTnDk6xm8bXsJTdMm/u5KzN9buEZoXHsYvGilXN/vg=; b=Ns8CZL5uTj05G+Z3yhiD1UGFbX
	FAWbMNQqAQSiDjnXZdr/kUyGKudgiHLzJRJuKs7eX0LOLA9pNK/f7Fipe2b6E4uONKis2M/Tz/Grn
	LtR53HESmGj2OIu/G5wA2lWTUmgOqaQG6y61mxJQ38Gite5fqCQ88w+/GcQKQXTjr/31WnDKL5otZ
	I3v2jo4eQ5dcHym5gahCoFdJUbbi0yjPRCXvdNlVuEFAK0BculdgVUD6zqRbdoKFidge5BY1d79Vt
	Wdh5eFeG9VTx22fPniuJD9/FTCuGA1pBjaJUvdmxhkYX69oTzrk5Ik4wHvijBqI2Gsp3xi8d1qcd1
	79Vi5SNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTcu-0070ro-1Q;
	Thu, 03 Aug 2023 08:24:08 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTcr-0070q0-1u
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 08:24:07 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-521caf0d7a6so183183a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 01:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1691051043; x=1691655843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nbTnDk6xm8bXsJTdMm/u5KzN9buEZoXHsYvGilXN/vg=;
        b=bneCMVzipA/D/51dwZGjvL4lizIX2tke0yFhsH7g4BVayRJ4/dhIhy35lwTqmV1wow
         yIxbU+ZzR1zICMiO+fkFG7QjXP8iN9AceuitqhBWmNchJ7Ei3H7Z6+oPEw9O3vh00l2p
         pRMso+mGPdC/Jptnc21GaaXxBVORbrgUyC7OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691051043; x=1691655843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbTnDk6xm8bXsJTdMm/u5KzN9buEZoXHsYvGilXN/vg=;
        b=aK13+mE+RQzUWd/uvNRiLf+OF/weM8b8PLLDU2vwCRj5+YPJc3RQ+/OvengE+P1DSE
         XSb/axLvubHkwmzgEqcdKZhYjKuOTwDP+TYp0f/VzjWqVbUpjWr1IjvpPyBVT5iosaj5
         Yu42ESRZ+KUl/D92mh0Kachgr3fS+vZbl9Sm5qUNr05VrvwksgFob2xNFw/ZPdR8QhIE
         XoSBz+NSZWNyOqF+WQYGKO23fRrSWOCzOlLSyNeGxukHtuIhXk1ikguPUTtaxstxN/dC
         uQ/e8wPl4o4aBYDt7VikGzpC/A+g/F8cym0xjNG3AdXvI+uasiMk1fFYDFLBp2GxV5mc
         hlug==
X-Gm-Message-State: ABy/qLZdHEQgsxtVx7/xPbqz/4L6TNV8S36qqxXaz6mTcbVHW/q2mmtE
	0/wScoPKPfCELdnpHRhUokEZCw==
X-Google-Smtp-Source: APBJJlHLFD2eZSNkRmGTYcicJHy3ZlecbYJADNzo18jX1yclgyf54H93esOpSSGvRtGepaDZ+LbKIA==
X-Received: by 2002:a05:6402:35d4:b0:522:28b9:e85f with SMTP id z20-20020a05640235d400b0052228b9e85fmr13889998edc.1.1691051042729;
        Thu, 03 Aug 2023 01:24:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7dbcf000000b0050488d1d376sm9726889edt.0.2023.08.03.01.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 01:24:01 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:24:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com, wenst@chromium.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
Message-ID: <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
References: <20230724175839.675911-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724175839.675911-1-greenjustin@chromium.org>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_012405_646548_F2107AAC 
X-CRM114-Status: GOOD (  24.97  )
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

On Mon, Jul 24, 2023 at 01:58:39PM -0400, Justin Green wrote:
> Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> is not the AFBC mode supported by MT8195's display overlays.
> 
> Tested by booting ChromeOS and verifying the UI works, and by running
> the ChromeOS kms_addfb_basic binary, which has a test called
> "addfb25-bad-modifier" that attempts to create a framebuffer with the
> modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> EINVAL.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index cd5b18ef7951..2096e8a794ad 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
>  	if (info->num_planes != 1)
>  		return ERR_PTR(-EINVAL);
>  
> +	if (cmd->modifier[0] &&
> +	    cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
> +					AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +					AFBC_FORMAT_MOD_SPLIT |
> +					AFBC_FORMAT_MOD_SPARSE))
> +		return ERR_PTR(-EINVAL);

If you set the modifiers/format properties correctly and use all the
helpers then the drm core should already validate that only formats you
can use are allowed.

See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
fb helper functions to see how this is supposed to be done. These kind of
checks in driver code for gem drivers (which really is everyone at this
point) should not be needed at all.

Cheers, Sima

> +
>  	return drm_gem_fb_create(dev, file, cmd);
>  }
>  
> -- 
> 2.41.0.162.gfafddb0af9-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

