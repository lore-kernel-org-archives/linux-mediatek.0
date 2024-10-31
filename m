Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBCFD767FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 19:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xY8BKpUlX8dbSzUZiaXQFiaPQ0R16ABPPrXeZ4QjIzY=; b=3aNaqrnKnt1VHCkdSHVjoc31mp
	ajMsTEhKInzhli6wkoxmLqy+8kT2kSEeA/HlunKaq8YBRpmpeL09slT4o5baOjDiIhm/xYBE//mH2
	Qa7KGwR7+mpGPc1j9l/aQwZxNz8wOiX1yHdiVzwVRPbbpUhcw1lPfppfkRfOXZ7+PC1L/joGVttCm
	sq/p3MuPqqmZET7ozqorFL4PAKac/FuDuADBEFGFpsxckE1mxqCz5fd5Aw1Vf73wAcXbr/YllQAhU
	CYyiuLZk20vaAASA5GnzbaFovBYbQGY4w/RYp3eTuIiCI4oTT92AWNreq68XNnYYpSzqjNXKsj+yn
	HsbSpWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6azU-00000004f4O-47uD;
	Thu, 31 Oct 2024 19:37:56 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6azS-00000004f1y-0qWN
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Oct 2024 19:37:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso1297961e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Oct 2024 12:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730403472; x=1731008272; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xY8BKpUlX8dbSzUZiaXQFiaPQ0R16ABPPrXeZ4QjIzY=;
        b=w3QaxocnQlH5m4rpR4EHmKNwh6yj2RtOCMAsWRrCNM/6P0oQV/yp3kwFVRV8xKjonS
         TMvZwmF5mZ56wPzkRn3BqAmVnf0lHIOk2JAw2DZ2NqyeJotOJKTW2otghPiNOW2sD/hJ
         6OMcxOXaLtEsyicb6PJJs/ox6gqX6tBZI7cDEv5eHYTQ9rDL5sBYfdLeE7oMOyVJ8y9O
         zVkSYA0HPLyTCkG2GClim5hQXHtV7wwizceEWNm6ZpSnaa+G+rM0RrTo2wPuTQ9lFQgG
         24ORt/7Gi10kwnU4uX8FUc9Xmd0o11YrbPc63MKy25SFNHXgPrvuDniCu54lcPWwXQEG
         ReUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730403472; x=1731008272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY8BKpUlX8dbSzUZiaXQFiaPQ0R16ABPPrXeZ4QjIzY=;
        b=sQJd1+Niu+3j5idCEFqSlq8AOKv49ht3zxTjcGL/Ueon9/BZBgHkse3YxvhvmTZklC
         Gc9/lgggTBIHwvTUYMcfR4JPozlSXx2w7oXb5TbWy/HRyY95Z6kKdl7AN1MCYHSvwmaP
         kFDPO13DOrWBpzvcuyWuAHcbEy2DZv+R7fg9qr1O3UJcd6kR9iCNTJGjTx760YW1SKYn
         JqXaXfj7Q+4XvFDNCzTM3YsomGPDcEbzUpYGmAoWSbhV9ybFzdfTlaZw0kYAzdGx6gKc
         dxURqefTsUN/Kh/27i0SjzTMgs5DJxp9twxKHEI4dpbxrTCDTwqbJZYOmR1FR+Va3eUE
         fFvw==
X-Forwarded-Encrypted: i=1; AJvYcCX2UFBp3rfv1del1kLR6gGpRGFt65gjLT7lJKllTcv1W3ieNi75Uwcvf8Lck873WVlBQMARQgMmMK65/+lauw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2asSuWWsb9weYI1R3JefQqyc+/4vKadcfKVoHZ6rEDa3gb8Rx
	9vMCp7aPl+FuslcxMbza7bt/d75tJF1R3vRHAevKTLhrVSZnmHT8ogqpjjRpLA0=
X-Google-Smtp-Source: AGHT+IEEfUmTLPeg9xVuEZGEbyZoSx7BjCxMcZYz1YD+L+1zvJUGzjkwJa62fHfBLyTlAdyjmcsXwg==
X-Received: by 2002:a05:651c:2229:b0:2fb:6027:7c0a with SMTP id 38308e7fff4ca-2fdec4ca559mr25802861fa.8.1730403471954;
        Thu, 31 Oct 2024 12:37:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8c390csm3099771fa.112.2024.10.31.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 12:37:50 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:37:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
Message-ID: <5eic3qpeocp54my5clu3umigog6fe5zs5drpbyzpholmalcmcw@mh25vgvxd5tx>
References: <20241029095411.657616-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029095411.657616-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_123754_274526_8D44A9A7 
X-CRM114-Status: GOOD (  18.63  )
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

On Tue, Oct 29, 2024 at 05:54:10PM +0800, Chen-Yu Tsai wrote:
> The IT6505 bridge chip has a active low reset line. Since it is a
> "reset" and not an "enable" line, the GPIO should be asserted to
> put it in reset and deasserted to bring it out of reset during
> the power on sequence.
> 
> The polarity was inverted when the driver was first introduced, likely
> because the device family that was targeted had an inverting level
> shifter on the reset line.
> 
> The MT8186 Corsola devices already have the IT6505 in their device tree,
> but the whole display pipeline is actually disabled and won't be enabled
> until some remaining issues are sorted out. The other known user is
> the MT8183 Kukui / Jacuzzi family; their device trees currently do not
> have the IT6505 included.
> 
> Fix the polarity in the driver while there are no actual users.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

The datasheet describes the pin as Active LOW, so the change seems to be
correct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

