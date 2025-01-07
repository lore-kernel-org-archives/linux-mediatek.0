Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC81BE77197
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 22:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=; b=SVbRWEHgjiAHmzOnO84wvo71ej
	aEvLpEd0u9fu25sZYNF1ruloGduIWw2If7qW2qOmcJs5QT2lyA17WyETS2FubDFTezjo+7RzkBfwM
	0XwLbXOVQuocRNJ2bo4YqQWHWcB3glXZ0dCvseQg5GxjhAD0WuS0vGaGtU5tovZ1UeJ+5SlHBblW5
	0KXhmZpDK3X6lWOSk0EfF2I2rLLNeRT70WCWGNSr2UxjWahPxdJ8H1tUl1pmrzsjuk8ZjHwkD+3+a
	k0k7DPnThQvCIM/03KVIyRpPH8NdRnmg8VC140jGJRG58wru+x6hdIx0YGxR7dILOh1/k1bd1iw7z
	uxlFo6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHy4-00000006POf-46Sl;
	Tue, 07 Jan 2025 22:22:32 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVHy0-00000006PMu-1FZg
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jan 2025 22:22:31 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54263b52b5aso5605010e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 14:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736288546; x=1736893346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
        b=LlzVtzp8kvCsJlcxmIHLrWr2728rYFUQn257rNLuyWCtFyEyHr5/axk3xDWStzNuI6
         +5IcC3vHL2slIJBVwLfyEm4W0P/Owz9NsHLZrO0NXt86n0oKroB63HO4+H2JcQwTRBoD
         gk7NxnpcqqlBPKmtkyU+jWpLscXZcZmk27EDhK0MBoEm0oc2A7U4r5DD+wjQMyMRiUFl
         Qh1CjpV38rJhq7q//KdgivKolNbz5rTrnev0ZNRPCT01so3fTto7slWGMm4zL/MS3P9B
         ZHcPXnnkdvrfk7hCsA6HCf8TRWxOCMa1YAyF99AiXoQTafiUCS8TH5JpZKRJeI1DuH4q
         40+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288546; x=1736893346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
        b=NYGMrf+oT01e3kC8XYKRTgS/PiLaG9EZ0TiQnL9pNPRz8H4jVbVWc0PiUQ8zfOXVz0
         HdRw/V4g8ZQZaSLjZARnt6ytKKLG4t0vTv2yHqhbyU7xSYKKX+P+uezV+3x8j5s1KSl4
         0H4V75DrHTXoRX8+HdqCVAXpJbhhWEClp5y6RrhwIpGCpR/u+ZPX538oPSNKO5m9cg0l
         9Rh5JipZfdTuwT35yXLo1/70j9K92KCUIA4hWNnrxQJBOiK2MvowoXitktr7Ce0kMwu3
         AfEy9k7J2JDhK0jle0gbi3Yu6WsKUR449DNNVS/WwO3Z32nsQzFls4TFjuE0HXuLDUCI
         rjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL07MrSHdhwbYlomYgMSXQQ9ns0lSV5N8b/CnDeuvAMv28OGttYpIlb/TaDTg1pKUbrgfuKkNs8YZy2M2lzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvrx/htaaHDUaRfpyOxBEOW3Vmm1grz7/j5LZNE+mi/8EP8ZOv
	aZMDtXeKr8v8aZASMxFZHOxLVtLCDf+WkH/ZHXGQgdlALmJgwluZK2VjGK/w12g=
X-Gm-Gg: ASbGncvfRclpePghejgB8yzZs+erjT63Gi5c1Art5Qfv8Q9ZE84zUWU6BR/Dt6UNheB
	P0UHEv+7sKhGBXqLMZ+jW0lBzFgG74JdkNmllJ/2cG3uoepYEVj2LyhCQxPO+WKH8fTPo/HnBGn
	kX+5IcscXoEW9xE9wcA0yUcsVoJTlTSZECtR0EB9xco2YxzoDFCaPPwaXzxuaiQ0NRQ58RfzeIq
	xInGUVZVGZRMpSLuP04bYtiTTPTslYBIOp+Q+ITirXOopPQmoVBp6kRuACIi+qmYXWFCwUvkl4H
	TRU20KNF63yeBvodzapxczqclHNO4Lb9mssI
X-Google-Smtp-Source: AGHT+IFnS+89P+R20rxSVwXMFgmVIida5oAviwnvCG7UgPRL6sqycM/IAnw4EINYUJaJOUGjeMeCug==
X-Received: by 2002:a05:6512:23aa:b0:540:358d:d9b5 with SMTP id 2adb3069b0e04-542844ad98bmr149812e87.0.1736288546084;
        Tue, 07 Jan 2025 14:22:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832b6csm5379607e87.273.2025.01.07.14.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:22:24 -0800 (PST)
Date: Wed, 8 Jan 2025 00:22:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Mahadevan <quic_mahap@quicinc.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <g5u4xazpsgoxes3bwowufrdd266uhwqw2qidqs3tm4wq2qbk6h@bpzh4cnwybaj>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_142229_193771_A305354B 
X-CRM114-Status: GOOD (  14.31  )
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

On Tue, Jan 07, 2025 at 01:58:51PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>  .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>  .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>  .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>  .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>  .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>  .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>  .../bindings/display/renesas,cmm.yaml         | 12 +--
>  12 files changed, 221 insertions(+), 222 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

I think we can take it through drm-misc-next (or even
drm-misc-next-fixes) once we get acks from Renesas and iMX maintainers.

-- 
With best wishes
Dmitry

