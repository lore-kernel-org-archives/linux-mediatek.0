Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103D8CFC60F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+x3iV/CIf8g2B/YB5Bs5R77iYgZ3oFoxwp/q40/M0ok=; b=ClEvd6o7Lb4tuHGkOVwHWqCN0T
	ZFVoKYicOUTbClGTZ2OZj7QJGs7Q0NkCiwQRQK25T5CM0qnMxXWatoc+3Q3d4sVIG4H7H+dFs3jNd
	k5T6OmC4iAdoQ1+1u75Ep28R0UsLdQcetX+9eFwiGPL5trNlPmowNcV/Nwh/bRR+26+btP4Z8uWeb
	ziWBHxpvxjoXCIksYyICuhIgS608vHAKjysB/3pOrebE5sqpCSGThcKV8SbqkseH4E4bdeZR4MmgS
	L/rt3dX25eCrjFty84KJP1ilqUILlcv+hBeGFffsi2OYeIxQpAxHmJfoc1xLYltTH5NG2YUrAbFqf
	DgTdPwqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szAO3-0000000FbYU-49ZA;
	Fri, 11 Oct 2024 07:48:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szAMe-0000000Fb3U-2dXF;
	Fri, 11 Oct 2024 07:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01C52A4521C;
	Fri, 11 Oct 2024 07:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B610BC4CEC3;
	Fri, 11 Oct 2024 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728632827;
	bh=oAwiclH4R473iyZQa5x0BV8e2TNLGMme2GM+GzFIaRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/4qcOVZn7ymB14RPWSPh6g2mNaRupkX5VHemC8y2LaZ7JtAbTN56bDZDND/94F6y
	 o3YReBMn7TQWdBTh8AgpzJJu41XVFlWK4N68XtkoG9t+2W039z1lGDVC7HMtu39hC7
	 kWTWey8GUZld5cI5QZFsssndCu018luVpnrfCJ7g3ChqLPx547hwN8CNydrKFFFd/G
	 3UONBDPGYTEnT2bpBM3tJqZFwdyTaapdtEt4l8JBY0v/iuai3E4xbiGJO2nqMVsLCl
	 Gmp3hJwGPhRyP+8LzIZjCRLGVsZ2AYbkn3HlKpMRYslltraGtBKJfbdW43bWnYQo6C
	 hRqSLroNFoBjg==
Date: Fri, 11 Oct 2024 08:47:02 +0100
From: Lee Jones <lee@kernel.org>
To: SurajSonawane2415 <surajsonawane0215@gmail.com>
Cc: pavel@ucw.cz, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
Message-ID: <20241011074702.GN661995@google.com>
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241006131337.48442-1-surajsonawane0215@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_004708_767228_9C89D3F2 
X-CRM114-Status: GOOD (  15.45  )
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

On Sun, 06 Oct 2024, SurajSonawane2415 wrote:

> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
> to resolve the following warning:
> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
> error: uninitialized symbol 'ret'.
> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
> access.
> 
> Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>

Real names only.  Please update your .gitconfig.

> ---
>  drivers/leds/rgb/leds-mt6370-rgb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
> index 10a0b5b45..87805c21e 100644
> --- a/drivers/leds/rgb/leds-mt6370-rgb.c
> +++ b/drivers/leds/rgb/leds-mt6370-rgb.c
> @@ -587,7 +587,7 @@ static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
>  	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
>  	struct mt6370_priv *priv = led->priv;
>  	struct mc_subled *subled;
> -	int i, ret;
> +	int i, ret = 0;
>  
>  	mutex_lock(&led->priv->lock);
>  
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]

