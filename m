Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D516C021A1
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2025 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVukLjmjU7JWbNgNRIVE9jMDHO3O38O0IgGphOEr4s4=; b=HH/idY3zmSTN59rYBZhfg3PRWE
	PWM3xAW/E82o4YdfuhfukxtqBc3nyvioNT5CD9spXQqlVIbOJ146bbAScA8FADCO4GWF/Xy/L7ru/
	lNb4qKGCrdGTaK2tQ8Ms1F68kYYIzNRze2EnY7+M7u0NfptDUoOwGKGnCZHSfi7siTiLzIPNV6txg
	BHmiBpbh8G0e6gkKLNK5zUqCRd0aqbSDGw6fU0GDRXAoXBxRz4lPyCb8l5uoCZiSXKcbmjJgzPWoR
	+0OQGZ6sccMKEZ8dnWXW8JKp+3VIePTe8iiiDBLfGkx1gXi4UDjC22bEgqoa6oMbNXPX6sQsHsoIJ
	bBUty0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvQN-00000004vTH-3bdz;
	Tue, 11 Feb 2025 18:55:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuKM-00000004jxm-14Kp;
	Tue, 11 Feb 2025 17:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OVukLjmjU7JWbNgNRIVE9jMDHO3O38O0IgGphOEr4s4=; b=MJwYhjVEv9hzDwOzAgX+dYyt59
	1F05MlqYJca9e4beQqo5pm/qT4Lli61AFp3VLX9c+i1eY1CF/PXfM21S4+ZUnuvXWE5WPkDfQ1bmd
	6p5dsrk9d3p/wvHRIqkkqh/sSxAyPDwNlBqb0HPqt4JiY/Sck4udJeaQ0P/K2XKgG00RH4XcOCMmA
	N6GGkwdxXPYBwo+2qsB/OiCArDjLmmb12sKKtJLXBryprJQGUKTXeJpbg92VnBsBGF8uGay5UTfAq
	9EY7BFRjIqxblxBAfQLc6NC2F288h+a1GlGUPGCib2mWU8pgfSTtHmB8Am0XIn01rpmpPPEYoBrNd
	WicsWNRQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuKJ-00000000en9-1hJ7;
	Tue, 11 Feb 2025 17:45:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43944181e68so27644005e9.0;
        Tue, 11 Feb 2025 09:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739295937; x=1739900737; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVukLjmjU7JWbNgNRIVE9jMDHO3O38O0IgGphOEr4s4=;
        b=aE4MwqgPiwdTRdiYklBk/xTyswqZFts7x2YcuXH1hI8w8mE7WO8a3adUCJ9psvJ2ss
         Dxf2WTuKkzTGG4aUlk8Zpd9h7FBpguFTfFCsVlysXczn66YJ78OVhwFtHcJIhHN4evil
         xjd35Sm4beRJfLEfWxDiQP7WjBTkqJ4DH6OWTgx/f/ZHZVq6oGZW9pacblM4zgFn8xze
         9Zk7mqQ23TzhX8zGhXL0fBoWXs8Ibau3tcP/CX7ZRK+zX8JEBcaa4h2mrDy84NlQ6nU4
         uWmfEW//ujZxIkEsMoJQI9BNe4gl9kiYrqHVmhWBgvgBdrWoet1SnINgKMaWzWIXB/pR
         a9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295937; x=1739900737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVukLjmjU7JWbNgNRIVE9jMDHO3O38O0IgGphOEr4s4=;
        b=YVv4fT40RrRgeeZK3mFufI/xaud0FpmVQgnSVDk6p2VKtef6BKmJSbLxs7oQgHv2/y
         pQVkjiClte8w7jrqn5kC1gHGQlrevGbWsHn/lOzRjbR9aj1f5nPQEP1/qpkFLrh0idx0
         jlMxKX1D4vs8l7cm0A7iCscecVpDmsBqtXtVTm3zjeB4v553eicz5Lub5mg+8UsDSCJA
         XTzSyfULdFRpbPkOIXIFazMs1T+ZUuG1rcApuM9Ler41WRGw3lHTPh8yrC3UPs4zmRaF
         3+mFE47WhoPqumc0EJlOOn1jGuqwWigFoOL+vsVfvkfoSfXMjFxLRUNFhlVhHb0TYxPW
         Vi/g==
X-Forwarded-Encrypted: i=1; AJvYcCU0/Rd/ddvufgO0SNoaCOgxzbvoBR6NkCCXlZkdtvzIuIgGHMwjeetva9sfYpJUYr1AdyzMjukfscgMI/B/91u8@lists.infradead.org, AJvYcCURkK1DQ6X/wmrlXl2nkfMuhN/Ogo/ulj5BC/CSg/C0kpcjR3wCL5vyVJyPXSM2yAzrQqo8xHZchVBq7v3yCsg=@lists.infradead.org, AJvYcCXHTyjr7h3uER+xUhYujmfXJopgZhZU5Z+hlZBZ6mbpB0yedR0K829T38KWFW1u2AQbIufbq0owh+lq5xf0A+c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqz0+tKwANLhij6q0rpJonaelkP7Hy8BAofLBMIEmEOZtvfOpR
	gv4b9utajOzhqa7gVksM9+5XTT3J7AYLjwdlrGGOkYldgyLYsJZR
X-Gm-Gg: ASbGncvM2VG1AcBwqhmzEWdGfMaMWBxD/ja++FOHhmNbGykqyfEWkdcvfrS39efA7qa
	6NpmVD4T7R7gpjz02HmZN004Au645F87LqDugXT1HvE6M/z6YD/YtSHV71ISsjaDATeyqlFj9VX
	WDpoN8M5F9CPKEF7X18+/qxd6r9ARzcoVqHO/Hr/0p1oLqvrr4ZqeMSR+xegB2CcaLdl+KmY+h4
	PKYv7dhaF5XaQO1Sj2qaiZOq5NLZvObRtkrEESHt3iVS5pza5PGXhqzajoC0uyS5LGCp/sG7d/V
	P32UBn8sp7rWmTJazrLbYN8RV0sTilCHg/SZ0QOnZDklR9LB3EpXDuOQS1zoUh0=
X-Google-Smtp-Source: AGHT+IHevhnQA52ksSDKCk/5HBFf2WQR6jKC1x+TgyxG0JLSuHfuqUjzxDwjKzCxF5CuvX9dIZjkUA==
X-Received: by 2002:a05:600c:c0c:b0:430:57e8:3c7e with SMTP id 5b1f17b1804b1-439581caafbmr1240075e9.28.1739295936426;
        Tue, 11 Feb 2025 09:45:36 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5? ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11750sm222041925e9.40.2025.02.11.09.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:45:36 -0800 (PST)
Message-ID: <c11a234e-de9e-465e-bd09-bfa516dba6dd@gmail.com>
Date: Tue, 11 Feb 2025 18:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/sti: move to devm_platform_ioremap_resource()
 usage
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner
 <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_174539_566474_AE0A25B4 
X-CRM114-Status: GOOD (  17.84  )
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



Le 05/02/2025 à 21:08, Anusha Srivatsa a écrit :
> Replace platform_get_resource/_byname + devm_ioremap
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> 
> @rule@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap = devm_ioremap(...);
> +ioremap = devm_platform_ioremap_resource_byname(pdev,name);
> 
> and
> @rule_2@
> identifier res;
> expression ioremap;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource(pdev,...);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap = devm_ioremap(...);
> +ioremap = devm_platform_ioremap_resource(pdev,0);
> 
> v2: Fix compilation error.

Hi Anusha,

Just a nit: changelog should be after the ‘---’ separator. :-)

Other than this, it is
Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks,
Regards,
Raphaël
> 
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>   drivers/gpu/drm/sti/sti_compositor.c | 10 +---------
>   drivers/gpu/drm/sti/sti_dvo.c        | 10 +---------
>   drivers/gpu/drm/sti/sti_hda.c        |  9 +--------
>   drivers/gpu/drm/sti/sti_hdmi.c       | 11 +----------
>   drivers/gpu/drm/sti/sti_hqvdp.c      | 10 +---------
>   drivers/gpu/drm/sti/sti_tvout.c      | 10 +---------
>   drivers/gpu/drm/sti/sti_vtg.c        | 10 +---------
>   7 files changed, 7 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
> index 063f82d23d80c4ba83624a0066a18416a2b37351..7aefce6706ba2cd7d97a33228c9b9812edecf06f 100644
> --- a/drivers/gpu/drm/sti/sti_compositor.c
> +++ b/drivers/gpu/drm/sti/sti_compositor.c
> @@ -177,7 +177,6 @@ static int sti_compositor_probe(struct platform_device *pdev)
>   	struct device_node *np = dev->of_node;
>   	struct device_node *vtg_np;
>   	struct sti_compositor *compo;
> -	struct resource *res;
>   	unsigned int i;
>   
>   	compo = devm_kzalloc(dev, sizeof(*compo), GFP_KERNEL);
> @@ -194,14 +193,7 @@ static int sti_compositor_probe(struct platform_device *pdev)
>   
>   	memcpy(&compo->data, of_match_node(compositor_of_match, np)->data,
>   	       sizeof(struct sti_compositor_data));
> -
> -	/* Get Memory ressources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res == NULL) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENXIO;
> -	}
> -	compo->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	compo->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (compo->regs == NULL) {
>   		DRM_ERROR("Register mapping failed\n");
>   		return -ENXIO;
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index c6c2abaa1891cd3ea025805b50d275ec314512c3..660588f01f90950a9b2c180ab230188c19901f26 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -511,7 +511,6 @@ static int sti_dvo_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct sti_dvo *dvo;
> -	struct resource *res;
>   	struct device_node *np = dev->of_node;
>   
>   	DRM_INFO("%s\n", __func__);
> @@ -523,14 +522,7 @@ static int sti_dvo_probe(struct platform_device *pdev)
>   	}
>   
>   	dvo->dev = pdev->dev;
> -
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvo-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid dvo resource\n");
> -		return -ENOMEM;
> -	}
> -	dvo->regs = devm_ioremap(dev, res->start,
> -			resource_size(res));
> +	dvo->regs = devm_platform_ioremap_resource_byname(pdev, "dvo-reg");
>   	if (!dvo->regs)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index b12863bea95559c4f874eb94cea8938609d435d4..0b5dbaf4d5305989846e25a1cab6f82d191aa9a5 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -750,14 +750,7 @@ static int sti_hda_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	hda->dev = pdev->dev;
> -
> -	/* Get resources */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hda-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid hda resource\n");
> -		return -ENOMEM;
> -	}
> -	hda->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	hda->regs = devm_platform_ioremap_resource_byname(pdev, "hda-reg");
>   	if (!hda->regs)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index ca2fe17de4a5d1e0199e59a97e6c7601e139ed9e..666143c48b0d0f2c20cd26323ddbc8e69d966622 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1380,7 +1380,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct sti_hdmi *hdmi;
>   	struct device_node *np = dev->of_node;
> -	struct resource *res;
>   	struct device_node *ddc;
>   	int ret;
>   
> @@ -1399,15 +1398,7 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>   	}
>   
>   	hdmi->dev = pdev->dev;
> -
> -	/* Get resources */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid hdmi resource\n");
> -		ret = -ENOMEM;
> -		goto release_adapter;
> -	}
> -	hdmi->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	hdmi->regs = devm_platform_ioremap_resource_byname(pdev, "hdmi-reg");
>   	if (!hdmi->regs) {
>   		ret = -ENOMEM;
>   		goto release_adapter;
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
> index 0f658709c9d0d398c4eed65202443db9d0b41f8c..420395598d119a403d531211022e6005d6a2bd59 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -1356,7 +1356,6 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct device_node *vtg_np;
>   	struct sti_hqvdp *hqvdp;
> -	struct resource *res;
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> @@ -1367,14 +1366,7 @@ static int sti_hqvdp_probe(struct platform_device *pdev)
>   	}
>   
>   	hqvdp->dev = dev;
> -
> -	/* Get Memory resources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENXIO;
> -	}
> -	hqvdp->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	hqvdp->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (!hqvdp->regs) {
>   		DRM_ERROR("Register mapping failed\n");
>   		return -ENXIO;
> diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
> index af6c06f448c4819def8cc0d0836e30f991529690..0bebe815f5e7567f84388af93723a6fa7d2cc7a2 100644
> --- a/drivers/gpu/drm/sti/sti_tvout.c
> +++ b/drivers/gpu/drm/sti/sti_tvout.c
> @@ -838,7 +838,6 @@ static int sti_tvout_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct device_node *node = dev->of_node;
>   	struct sti_tvout *tvout;
> -	struct resource *res;
>   
>   	DRM_INFO("%s\n", __func__);
>   
> @@ -850,14 +849,7 @@ static int sti_tvout_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	tvout->dev = dev;
> -
> -	/* get memory resources */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tvout-reg");
> -	if (!res) {
> -		DRM_ERROR("Invalid glue resource\n");
> -		return -ENOMEM;
> -	}
> -	tvout->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	tvout->regs = devm_platform_ioremap_resource_byname(pdev, "tvout-reg");
>   	if (!tvout->regs)
>   		return -ENOMEM;
>   
> diff --git a/drivers/gpu/drm/sti/sti_vtg.c b/drivers/gpu/drm/sti/sti_vtg.c
> index 5ba469b711b5318e9e9e6d8df127fb8933d1fac1..b5353fe774d72fd629ecd3ef75a5d2817ca8617f 100644
> --- a/drivers/gpu/drm/sti/sti_vtg.c
> +++ b/drivers/gpu/drm/sti/sti_vtg.c
> @@ -380,20 +380,12 @@ static int vtg_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct sti_vtg *vtg;
> -	struct resource *res;
>   	int ret;
>   
>   	vtg = devm_kzalloc(dev, sizeof(*vtg), GFP_KERNEL);
>   	if (!vtg)
>   		return -ENOMEM;
> -
> -	/* Get Memory ressources */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		DRM_ERROR("Get memory resource failed\n");
> -		return -ENOMEM;
> -	}
> -	vtg->regs = devm_ioremap(dev, res->start, resource_size(res));
> +	vtg->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (!vtg->regs) {
>   		DRM_ERROR("failed to remap I/O memory\n");
>   		return -ENOMEM;
> 


