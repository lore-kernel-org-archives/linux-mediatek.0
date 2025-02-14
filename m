Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C57C021A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 01:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4aqqg9T7Texkg+zEN9mq7DtWDF92KdPzGxhWCeQ+QA=; b=dbaAbF8D7Iv47rTY7JYUzl8iOI
	T2y81a+VY/dq3I/TAJdsTi80jeaNZq6cC3BfX/KPvBGiGxhkzE1rGydHyZMqo+oEApmRT4d1sgukO
	JUiOcgE8ENGj3GgnVEGyef10CrvBsDcpzQ9JfnsdFc9VT7eaLt73csa6FgCYVRH+/Yu4HvdS2nByr
	xIfdjfW67ufemobWY6AZH9khLmOLEc2OrfhVDUqjjCoFMiQHjcRavvkgAhL9tGEjaWs+JgTrLbn5r
	bh9RSKQRb/6KCPAKixNXmrJA3eAZvT704i8cbhSOm9mNnPf6t70BM+NEV6f2aPDonI+hCkyNinzvE
	QrnCEW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tikhH-0000000DD5h-3dsQ;
	Fri, 14 Feb 2025 01:40:51 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tikh5-0000000DD1t-49IG;
	Fri, 14 Feb 2025 01:40:41 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5f6b65c89c4so445162eaf.2;
        Thu, 13 Feb 2025 17:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739497238; x=1740102038; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p4aqqg9T7Texkg+zEN9mq7DtWDF92KdPzGxhWCeQ+QA=;
        b=Kj1VH/nhA+o6e0ChF5Wy7PMLIf18lxyRVef3zGyCXLo38ZBDlPhcyK9TLYWYIkLjN2
         VlfenlRZkRhX79DLIrhuJtJEd4Mwk32Ei/Hkg9jnwQz0YZBkg8OborQZ8Ph/hC2ZnAz1
         EkgHWKNInWDcdjTpKvjw+ddSTYz8eyzn7Ecx4hI0G4M+CgdUqXW/OX93IlA8ezyAUJik
         DhkLkfcOd0Hd8998qkd4J+W1SOA1uGDF2UnxcVDOeVc1DcdIJczy/fTzQ2Okik5Ksn96
         +wFZimqMGpMha5LDfGXkszbYAipT0SEn5GsmkdoqpjQ7DWfuyDCS6NJzCGg45U55G/N+
         rmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739497238; x=1740102038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4aqqg9T7Texkg+zEN9mq7DtWDF92KdPzGxhWCeQ+QA=;
        b=XpYS4OECQXATIsDTN8QIgQrabfS4i/PNq5cKc9L8vfmv+WXVVPtLyTq8hNFPBo2sYd
         ko3sT699+NrXD3vdaYAstJ8rwXedQQzyq4/26j0l82Ryde7q/b6T4pvVc+4KT3HozvQU
         g9yUFxb0Xc5Gg7ENVZyQBGf4eMIfdQ20/3JND3Smw9hCeMbQkQMOyZs89w5pVvwEfcMT
         uJ/bWsf9YrbsZyWq67f/Pcsm6TFeA1uEpxEGRQKUsq3FTcY/XyUMsiWDHbT/fC1bDG5G
         MWDQwy6/rRJ2nA+OXFhdSBQtV8icT9WnARyjq0ltJEtre39wArUo6FnOp3ANgwLapyiI
         Yg0g==
X-Forwarded-Encrypted: i=1; AJvYcCVx/xsAmxt/QjhqltkhYVfd376sbYW2Fm4FkC47JirL+11TjPJMyemMI8bWCwLtdGUoznk3TRx42CZONWD33XUI@lists.infradead.org, AJvYcCX6Ri3+bjwIoJXnQy4xtJjAO8KMkb+tEx5mNn4pKEMmSVohuO0psSAcVk8yg1zNjy7vUXxxTmGO0aEorgXiH10=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzBXCx7w3leY+Yaw6zqJ++yYIqf6s1mrwQlRLTxBHWFuHlUFC7
	irIS/Cyk4RBkNaainX4+OCktyqrclcJYuXrhVZgNtXHJUnKt30bGlaZDi8prBgvqtYPUVmyU9TG
	g053P3Haq2JOPcocZGphWzpSzJeY=
X-Gm-Gg: ASbGncv/TYbAP3vF330LTfZ6wN1yXIwVf1V6uNuybMJIYZaXfanFhrryiAxx7hdKU9B
	GRUAT91vB1kiH2nqF7DMTBw2dDH6bA7byZZ8Y8CzmAvjzyIVSFnkzXNSf6JUCdrmtgakEGn3dFX
	X1q/INsvbWEZOskz6QInt7km5PGcfU
X-Google-Smtp-Source: AGHT+IHaPhkpQ5sudo7SaVi7TcjcMdEkzloixKb0RO5UQ+Y460AaIBKtk0bx5VU/HVpLudsUAUuG+ituDRPvvbj3Blg=
X-Received: by 2002:a05:6870:3313:b0:29e:4578:5f74 with SMTP id
 586e51a60fabf-2b8f8aaf65amr3390978fac.4.1739497238239; Thu, 13 Feb 2025
 17:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com> <20250213-mem-cocci-v3-v1-6-93466d165349@redhat.com>
In-Reply-To: <20250213-mem-cocci-v3-v1-6-93466d165349@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 14 Feb 2025 09:40:01 +0800
X-Gm-Features: AWEUYZmNNW2GxKBvhWTtapwmiPwzOWM-ubPmXZmO79ZpLPJrrgzjYmiy7fGvf4g
Message-ID: <CAAfSe-tNuzNCi=oR4Yv=TLRPt5jUmcozv+mtfu=PBT+6LqsHDw@mail.gmail.com>
Subject: Re: [PATCH 06/12] drm/sprd: move to devm_platform_ioremap_resource() usage
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
X-CRM114-CacheID: sfid-20250213_174040_045731_7DD3A2AE 
X-CRM114-Status: GOOD (  16.39  )
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

On Fri, 14 Feb 2025 at 08:20, Anusha Srivatsa <asrivats@redhat.com> wrote:
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
> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 9 +--------
>  drivers/gpu/drm/sprd/sprd_dsi.c | 9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

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
> 2.47.0
>

