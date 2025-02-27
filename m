Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCCAC021B8
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2025 01:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=; b=lRcwa9wvc+TzCb4FWCtxtosnXP
	1ES/X1kLuSd+EfXmPKTAlRfGWr0vP7fzwWv09LvkapVVrpYHbuFQndbDXrnIUN301m8uJv6BWqMpk
	IucssuX9dSQ1XsKg1yWiA8yx6sY6xhFgj+J+BY3/GOzQdtmTC8oUir/nZ3oV9Ns3bhcte+twog7tt
	ESzGrhgppBaSTlFFJEtCNa5XBrQEIaXqd6lu3z99jLe0OyihIEwKHg0BwS/xJzOL9TIUvuEPQxjAl
	VkuUihIHPKl0Y3+ku9WLfk0vmsAbR/d35qB66dp1j+HgBZHAH+hXeFJhYMbqRgxBsWF6i20uwwqqE
	eqIqmrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnT4w-000000060TS-3muP;
	Thu, 27 Feb 2025 01:52:46 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnT4t-000000060SB-360t;
	Thu, 27 Feb 2025 01:52:45 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3f404933b1cso136801b6e.3;
        Wed, 26 Feb 2025 17:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740621162; x=1741225962; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=;
        b=JynFrU4WG4d7mBeMtOxdJ40LfDaPnzyYe4bV5Owov+zzjzacSAIrY12sfUAcZ3k8U2
         Q9RojyAIH6cZa+RStKgeiGPn2bpvsbNVAZeIcp4NSwKs7mgaEsr9YseKVkBvlBkkNPBW
         kR3XT+/7z/YlYxeo99my2Jj9Aak3buXHqU+bufxwbUmXcdhLrjInMKZMRxcvpJoyAons
         WWR0T+oUlyBEU6mdCtb9/gMApJ9nf2ZBqY/mNBZX6u4en8wDMaBo/ryTPrjUCx6NJ0lX
         laVep3S2E9rsBQ/8sX7rOXd0plh9kNF620E+hqo8El5qPO6J+QQ10WknPD4gbFGSfcuT
         fEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740621162; x=1741225962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=;
        b=rVBjwfcN2vJXn/aaahPN68Cy+ImXH66FTjAOxjL70S6lRM4fI5mbwqLmjaG38Otphs
         yg2cV3D6CTooEGYGjL7yBO6E3fNa+Xldr1dMjNgWNQVe2EY9n94TZr4/OBuA1HhXe6f7
         ltt3VvbP+Z+BmssnS/CwqvmU/uDHzitvFQuDexXcvmreTNbNqO/vGfjiNJxxoibj4ZdC
         osKLMX4qOZpDBmFW6lnJslogAz/9uOEx/DCIQR0wMX+6Yo1YIbJppzFM535ZazMrAHPU
         IIQGS7yNTFEfeLfp6GtN1vaWPZ2BGBod67V74hO5S0z8ZFUJL3z2dR+DCcLXbMkpiVGr
         vKDA==
X-Forwarded-Encrypted: i=1; AJvYcCVXrtayJXgR0BySkx4M81nYUeAr92Ib9QSJZX9wS+SI8tOtY5gZthx8NLxVGhOzdhzufGQsUfAWnDLXyKm83dc=@lists.infradead.org, AJvYcCWHlntfz810WjS/luEhUsiuKQv2zRID/OBDW7COhSWIY8xGgzP+Lr5emcXiEz5251Fo+ePt0YA+xeazGl1XowsN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx6dprfP9NVG42GxIvNCNFj1IjH8rAC8ghjt+VC00wBvHrSc8b
	twnMFnd3a0zyuhPQQIE2Uc4I+/k3/orl5wW/XucqSL61uUvzW9cizavCVDMzGJBXtQ5NSRxmRr9
	n5BBftljxYqUA2RCtIhZKwCKVPLo=
X-Gm-Gg: ASbGncunYGWUxuYCoXKyGxcPPauEfMW4G0QFJRz6MErz7YKKyOxZW1Aye/A3HJico4G
	vg8CQG6qnDICpLJhKGdoqY06xxj+ushsn9Y7QxQY7yigcgdAJtB1NS8RWmpumxDJITBgNQ7LXIq
	0BL8EMtXi/g2UKJR7EW9KWpLGIn+yNxV3ok649Ywc=
X-Google-Smtp-Source: AGHT+IGqnXgTmRNVtKjZ/iy4Us2fHmhfpIjxOOKmUbGHr3+Ih8p+w6kJGd3DiiswHNSoSt374klMkalELnpHhT8BfD0=
X-Received: by 2002:a05:6808:1513:b0:3f3:f90b:f1b3 with SMTP id
 5614622812f47-3f425a658admr16487647b6e.5.1740621162105; Wed, 26 Feb 2025
 17:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com> <20250225-memory-drm-misc-next-v1-6-9d0e8761107a@redhat.com>
In-Reply-To: <20250225-memory-drm-misc-next-v1-6-9d0e8761107a@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 27 Feb 2025 09:52:06 +0800
X-Gm-Features: AQ5f1Jo4V-x_aMe6cNu_t6bm5DyuMpmkfFoBZmOQ95iqLbLXuNwjk8JtAQUipWI
Message-ID: <CAAfSe-vGC2bA10yNRjSkLo3Y=2K8HJvssuM8qLeB=57vQk1eZg@mail.gmail.com>
Subject: Re: [PATCH RESEND 06/12] drm/sprd: move to devm_platform_ioremap_resource()
 usage
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Marek Vasut <marex@denx.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_175243_776010_CA261AF7 
X-CRM114-Status: GOOD (  17.04  )
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

On Wed, 26 Feb 2025 at 06:22, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> Replace platform_get_resource + devm_ioremap
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
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
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 9 +--------
>  drivers/gpu/drm/sprd/sprd_dsi.c | 9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index cb2816985305fd19eac27413c214681a5a1e9ffa..65cd5aa1634eee5a6735ccffa4ee3979844d92ce 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -784,16 +784,9 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct dpu_context *ctx = &dpu->ctx;
> -       struct resource *res;
>         int ret;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "failed to get I/O resource\n");
> -               return -EINVAL;
> -       }
> -
> -       ctx->base = devm_ioremap(dev, res->start, resource_size(res));
> +       ctx->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!ctx->base) {
>                 dev_err(dev, "failed to map dpu registers\n");
>                 return -EFAULT;
> diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
> index 8fc26479bb6bce0aa94914f49d0986a7e19326c1..1668bb4166ab0ad3812c5654244544a9caf249a6 100644
> --- a/drivers/gpu/drm/sprd/sprd_dsi.c
> +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> @@ -901,15 +901,8 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct dsi_context *ctx = &dsi->ctx;
> -       struct resource *res;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "failed to get I/O resource\n");
> -               return -EINVAL;
> -       }
> -
> -       ctx->base = devm_ioremap(dev, res->start, resource_size(res));
> +       ctx->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!ctx->base) {
>                 drm_err(dsi->drm, "failed to map dsi host registers\n");
>                 return -ENXIO;
>
> --
> 2.48.1
>

