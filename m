Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C35BC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrnpWE7dPEJmYiT/RDr1bXYldnFvFFfi6hz3R8sA0hI=; b=tqZuVhaWgNxQsz+EgSW+UwKKG8
	RKF7DV2UZOf+AVySZ1Zo87jLoU6Gtm+mc8S4S7a/jI6MEMDA/xI9QhAmnRtHycZtP/aXZTU3oxmOV
	SL5sep2Zqsk5JpGRLTA0nMN8bw3onspXe7lkr4F67n/2j+yVG65rWrPaWPyMdXTLaWUTF7KvEOiHf
	83wDctFsBo72aSIeqvmULlZmYS2V8ULzzf1OA9TXpMOYeUmt2kzrSyyddDw8HL+DHwhx9UWBPqGEO
	BvPcMw4EZGmlns2vCkCdJEWxm1QcCCkQcTNf66C1CjZFCV//eOz9usUAStUn+2VWHSi+vXLiikEC8
	8kSuJGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90o7-0000000EEge-3ufc;
	Mon, 20 May 2024 11:03:55 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90o5-0000000EEfi-0mVe
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 11:03:54 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2e1d6166521so31654691fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716203031; x=1716807831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrnpWE7dPEJmYiT/RDr1bXYldnFvFFfi6hz3R8sA0hI=;
        b=DtdKg7zZcN0qEyrqTOpPFL5ybjFYjIfPoIX1HbgcSqafDpaK9Xnl/218l/iWwRmVbD
         FZTHryg6PFJjK+YSTa9sxCw6FGIdYuBy6aFgm73HgVHd2D5bupwBDBpVbBj5mCq3QN6N
         IljaTWlzf7NswvjaJPhXiJt+UysTb3J/HoPi2R8CEp2bT1ySgzfQfkFLgSqOT0bwxGLC
         uCelGNTpn60swXF5E6q0eXCS/ETHOKSuXWr7NlGkDEw/TnU7u585DysFifST6ESsf2Gh
         EWNFX17GmvA2+K7uLKqv0lOMYbQKEvC3gj36kG+ewPZ/mY6uOCx1AU5rit7sRPYYibPS
         hQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716203031; x=1716807831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrnpWE7dPEJmYiT/RDr1bXYldnFvFFfi6hz3R8sA0hI=;
        b=Q/s1qznHxNX+N/9NnXtPWeXjCOdY+cO3ZoPm2ptiRUhCAWeRLgZmlf9f7spQsM4KxH
         r8QrAWIb/LUmcliOlGIb+pL+0eD0SF9YZ9xAGR22gYZYVZcjwakkmt12dZd3/uGLCfEX
         sM9YOhegptzlMEx+8BfZv4K+HWYcZ9Y8TPbft28guDCJSUuhCTv/Mg9EYXgR6fbRj6dt
         IOBPEqSOxhSSWQkQCt88bWzCajMbWEtzcF+/tm9vxMUqhnwZ6r7DG7SFXy0UFKfr6/Jh
         2dzgJ1zKdzkxPuBDcQhGlY8TRCKgcgiOE4hy5AV2/hl3pehhws3G7lwbgcSzM+hlfIci
         prQg==
X-Forwarded-Encrypted: i=1; AJvYcCXm93Smepcmyf/FdoAsaZGGwvuy4bPySQ1RoKUUUwPL8wX0V4fGDrDQqrd57KQR1Hrp9IvKktR8Buqo792/w57babkXDoNkL85fioYrtFZQAdN5
X-Gm-Message-State: AOJu0YzMYV8bFZjdKwxc6nU7yajszwvJgivTWe4U5Cuuun3avbgvAk/F
	8VXShwxGuZtyZ0TRfuBouybOwboPuz+jUx2MFea0e+/RxnQAqn0SCvNx9QZcJMg=
X-Google-Smtp-Source: AGHT+IHrPX1EE5HJbqIWKfZcM1kS0oKboB5I8XtzpfJrKSrhX0xiWZVBV8AXw8xry+E6Y03ekdH7bw==
X-Received: by 2002:a2e:9d8a:0:b0:2d8:611c:228a with SMTP id 38308e7fff4ca-2e71714cb85mr17078161fa.8.1716203031220;
        Mon, 20 May 2024 04:03:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0ce30e1sm34354131fa.38.2024.05.20.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:03:50 -0700 (PDT)
Date: Mon, 20 May 2024 14:03:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drm/ci: skip driver specific tests
Message-ID: <mxolwwmi5rjaevuwi7qy6rm5n62rhnpbi7hz4n7xbshmi2hoqq@5uzamkipouek>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-6-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-6-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_040353_253332_D317EE34 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

On Fri, May 17, 2024 at 02:55:01PM +0530, Vignesh Raman wrote:
> Skip driver specific tests and skip kms tests for
> panfrost driver since it is not a kms driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---

I didn't perform a through check, but generally looks good.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

