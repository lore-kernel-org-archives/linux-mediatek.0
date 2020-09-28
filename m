Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2782AC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 17:14:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D472820773
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 17:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="13jmeQHU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkFN+z9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D472820773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AnWz23f/AxX+HS1lCjpD6U4fCNXB7alT1Hi7dy/xEBM=; b=13jmeQHU0mA2QhH0q6ns5aD3s
	NyYfyXfafpw2SaJa/5INvc5Nr63KLy8XCCzI0Pp2XVpxqv+a08wl7vRel+LAaB8q1+1CenaHUYVFI
	VDFBnrOJ2UqeAb8NsG72A8n2mGd2M+/rdS8zZe/fkJiGGJEh97heJhuHP/bRuOjsPIEaFQjkawCSK
	cl5vDXpoeEeeyRf1nnwFbRAKx4TZWmI9ibbz+ZjH4uIkl2oQ2Hx01w8n5tyhUo0o+9NDeuc7Z0bhI
	kStLVuuVyz4smmyfjCMGsdjyEyXgDf53O2uCf9gr9FyCJg9iY5z4KjkW0dYz8avMYKVcTpYmHdtAG
	Wsbv+sTOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMwjM-0004mF-Vi; Mon, 28 Sep 2020 17:14:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMwjI-0004jl-Fa; Mon, 28 Sep 2020 17:14:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id w5so2189143wrp.8;
 Mon, 28 Sep 2020 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAW6dcCoUbddPaYdr5/lbjgYoSVn9vUyYWWh66IQR2M=;
 b=nkFN+z9v1kUNrol7AqK7Z6xx6MoDko4TE7Cw30iHBx68So86SMFHvxbK9rNAYyLh8O
 kJomHCfJB+poR3gVVUrh7734yNNn0CCyVz2lwjDs7LVEoYYFIpH0xHXz0moihZ2JcOQ1
 uacch0SprOmJexYeiwRvnwkhF2iEnvEWLeUdzbGpTH8wbfBzCT75o9+WyEP07HT5bXsA
 Y5M5XGLcKMIOcnWaX+0e5Mfx00oZZpVMok6cBnqY/UPWM1Gh6Xtz65EGxMygG/Sbg7MI
 hGd8wOBw5MEXXEojX9/J/IiOQYUiisVOwVtlc/nUmfEdqNG0OWcw5pUQHx3vEc7GbAhp
 m6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZAW6dcCoUbddPaYdr5/lbjgYoSVn9vUyYWWh66IQR2M=;
 b=rRffujktbVKY4sUufvhMXwxUMTH/ng3kMwvuLXP1yNA1bkmUrgCjmNg6sN5FNCs7Wv
 FUXGE/Dj6cHY258bmiItUoI4mYQQjeE2mB18CKAUN8SH1LP9xuAWFWlcdQcRgGsf1gvS
 evgCQcP96SkJ9So8rgN2+E9d6jP58acbVVMHPc/21tBU7Cug9sP56IfQU0wqU0iOEwQB
 t0AzQ5nb3rG2JGIgn58xMUloEMcvwSph+nqaJqeGKYgkU23ZFkSAx7TcVGT2BOFArCBL
 px3SJbUd979puxnEPxSHOjuStse+7BqMgfKYV3FuA1QsFtjCHvx8z9ESRDkcxjYQll+8
 CCLg==
X-Gm-Message-State: AOAM531c4HnSAwaUG56RSwR66EHKlhr6HzX/OnTbWwVWuVIHtmA8qW5L
 /H2+YiY0OT3ki4DmxUUYI/U=
X-Google-Smtp-Source: ABdhPJxzDWkSo4Db8lLVYiLe3RVkBDu7Qbr3OCQEll/PrffgJ7nvwrBvb7FsZx00rdn33neO2ikp2g==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr2818976wrp.370.1601313261840; 
 Mon, 28 Sep 2020 10:14:21 -0700 (PDT)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id q20sm2010984wmj.5.2020.09.28.10.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 10:14:21 -0700 (PDT)
Date: Mon, 28 Sep 2020 22:14:14 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3 PATCH] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
Message-ID: <20200928221414.5cb079a9@a-VirtualBox>
In-Reply-To: <20200917033009.24799-1-jitao.shi@mediatek.com>
References: <20200917033009.24799-1-jitao.shi@mediatek.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_131424_774212_E349184E 
X-CRM114-Status: GOOD (  20.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, ck.hu@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao, 

On Thu, 17 Sep 2020 11:30:09 +0800
Jitao Shi <jitao.shi@mediatek.com> wrote:

> Replace horizontal_backporch_byte with vm->hback_porch * bpp to aovid
> flowing judgement negative number.
> 
> if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
> 	data_phy_cycles * dsi->lanes + delta)
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 54
> ++++++++++++++------------------------ 1 file changed, 19
> insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c index 16fd99dcdacf..ddddf69ebeaf
> 100644 --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -445,6 +445,7 @@ static void mtk_dsi_config_vdo_timing(struct
> mtk_dsi *dsi) u32 horizontal_backporch_byte;
>  	u32 horizontal_frontporch_byte;
>  	u32 dsi_tmp_buf_bpp, data_phy_cycles;
> +	u32 delta;
>  	struct mtk_phy_timing *timing = &dsi->phy_timing;
>  
>  	struct videomode *vm = &dsi->vm;
> @@ -475,42 +476,25 @@ static void mtk_dsi_config_vdo_timing(struct
> mtk_dsi *dsi) data_phy_cycles = timing->lpx + timing->da_hs_prepare +
>  			  timing->da_hs_zero + timing->da_hs_exit +
> 3; 
> -	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> -		if ((vm->hfront_porch + vm->hback_porch) *
> dsi_tmp_buf_bpp >
> -		    data_phy_cycles * dsi->lanes + 18) {
> -			horizontal_frontporch_byte =
> -				vm->hfront_porch * dsi_tmp_buf_bpp -
> -				(data_phy_cycles * dsi->lanes + 18) *
> -				vm->hfront_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -
> -			horizontal_backporch_byte =
> -				horizontal_backporch_byte -
> -				(data_phy_cycles * dsi->lanes + 18) *
> -				vm->hback_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -		} else {
> -			DRM_WARN("HFP less than d-phy, FPS will
> under 60Hz\n");
> -			horizontal_frontporch_byte =
> vm->hfront_porch *
> -						     dsi_tmp_buf_bpp;
> -		}
> +	delta = (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) ? 18 :
> 12; +
> +	if ((vm->hfront_porch * dsi_tmp_buf_bpp +
> horizontal_backporch_byte) >
> +	    data_phy_cycles * dsi->lanes + delta) {
> +		horizontal_frontporch_byte =
> +			vm->hfront_porch * dsi_tmp_buf_bpp -
> +			(data_phy_cycles * dsi->lanes + delta) *
> +			vm->hfront_porch /
> +			(vm->hfront_porch + vm->hback_porch);
> +
> +		horizontal_backporch_byte =
> +			horizontal_backporch_byte -
> +			(data_phy_cycles * dsi->lanes + delta) *
> +			vm->hback_porch /
> +			(vm->hfront_porch + vm->hback_porch);
>  	} else {
> -		if ((vm->hfront_porch + vm->hback_porch) *
> dsi_tmp_buf_bpp >
> -		    data_phy_cycles * dsi->lanes + 12) {
> -			horizontal_frontporch_byte =
> -				vm->hfront_porch * dsi_tmp_buf_bpp -
> -				(data_phy_cycles * dsi->lanes + 12) *
> -				vm->hfront_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -			horizontal_backporch_byte =
> horizontal_backporch_byte -
> -				(data_phy_cycles * dsi->lanes + 12) *
> -				vm->hback_porch /
> -				(vm->hfront_porch + vm->hback_porch);
> -		} else {
> -			DRM_WARN("HFP less than d-phy, FPS will
> under 60Hz\n");
> -			horizontal_frontporch_byte =
> vm->hfront_porch *
> -						     dsi_tmp_buf_bpp;
> -		}
> +		DRM_WARN("HFP + HBP less than d-phy, FPS will under
> 60Hz\n");
> +		horizontal_frontporch_byte = vm->hfront_porch *
> +					     dsi_tmp_buf_bpp;
>  	}
>  
>  	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);

Can you explain how this patch is relevant to
https://patchwork.kernel.org/patch/11718191/? It was sent out on
17/Sept while the v2 was merged before that. 

As the v2 patch (https://patchwork.kernel.org/patch/11718191/) breaks
HDMI (eDP) on my Chromebook Elm (starting from 5.9-rc6), I'm guessing
that that was a bad patch, and should be reverted? Instead, this v3
should be applied? Is this correct? 

If so, can you kindly send a new patch which reverts v2 and applies
this one, as application of this patch on rc7 fails.

Thanks,
Bilal


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
