Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A909FC02190
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 13:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=; b=ZWcMK5xMKxYGQgKnX6kHJUBr7+
	+sBfm0IDwXSfEcfUIm6CzDUlg2n1TL62MdIA9uKuLCGmHZXoB7fbpQn4lbFBSuX3rz3QiixefCWhU
	8V2IKY8qWbL6Nj2sIxAqaX9xVSBV4CdVbOzLUTbpRR0s9aTr7F79D8MdScz0zFE15eJn306JVhzKc
	TxNwlh9zUR2MvOiR4TEnu/jx2BavRb+cPK30gXTjmq1OS4Tvkd9M+1oTlRDHQ5CSP3RBG0Q5rBqvZ
	U4NFUciVuhuWyII1G0lNbxpDZIeZHWnbWamy2/PRaPwn2lsBf2n5JP8eek+KT2TQk4hVfXtlaU3mT
	ay3NfOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td7xS-0000000703O-3BBd;
	Wed, 29 Jan 2025 13:18:18 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td7xP-0000000700G-03fS
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jan 2025 13:18:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3022484d4e4so72441041fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jan 2025 05:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738156692; x=1738761492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
        b=gVgZv+sMHicAO7GASrmbUug82EJp1O1zBpDVbb8GUMAv8VE7pDlNXjVBw9kD0B7Mn2
         +47gC+HSnMlT/UvvgstqIO2Zvg6MXiKQL/1b28iPpZtThfRr9hB9x82NsijBjLD2BiA5
         GfLF7JRK7+cKrmTJnZb76po/8xAgqTYb1ObLH0v+O+cHP7X8jpSvwg9Bfkc73hdOrME6
         EIfa6tl5XNONKmqNftDu/ka+ixYG2eFZ5VcTNSNZvBtW3KN1ST2gzL4um0ESO2N7SJoh
         RvGSnekcSNJNG7vpXrkJpuMzi1MJV/Sl1wYWdAX+LyZGCpxDt8AcPRUotsBjKc9yi6Ic
         t4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156692; x=1738761492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
        b=X8KXvycp9IbDfdpWC1rBVALk5pi/F703KE6cw/AxMyCnxS7QIRmQZxxiswgaOnpekd
         7j9/aBdzyD7Zhqf0a0szQ7CQzridJcA02Tnr2RSyuirgWKzI/FUTZvgRSrR2h6+u3/qZ
         0nTC+THOBx2OOjNCI+TBHEQMLIyq9QEBv+TWPsYdrnvcjGaIEvbnJybh5ty74qeGIe1N
         xoLm5IzzTNwH06cZ/ZbU2DkXgli1J8yp31oCc6Or2x8/bncVFzPG6ZvUfr0Ho4rf/5c5
         LAoL90/68SwwjMwk84v0DzAou5UkcbRR7Lmg9MUqcX7Az5G3pWUvI9N5W9oqZMPIqsqV
         zNGA==
X-Forwarded-Encrypted: i=1; AJvYcCVcMCslbsB1HoPTvWvHzPTLqkCckocon39DxwJWHcv65fPgel0sVZZkU52XWOy9jFhglbvRIjtf/gS4LQnkxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXGRIFvihFthopOnqdVAoAC00d5ElrehsIan522N0CnqNuO19M
	O6DOZpTzifRJMQSoVXFWRZk2G5wPK3LzQHmQTAPBMS64eVEwJCKBntGsj8+3jSlwPIbwSK3VxF3
	dEMNpgKgka0zPr91kBxAjX3lq29M4AjckA4P2nw==
X-Gm-Gg: ASbGncsPpMjsTsP1jN9OpS/wfZfMsiF9/w7vsDJMo9a5Owc0ZOZq0rAEKSvCIN3cxtn
	6ZLxlcfMo3ssHDtUt/LwyY/IPU6xFuId/UEzRIPR2v4mJ+OSh8ulrB/DRYv9bVpwCLIDk5UBsad
	YRQIuOgva2ne3uXextJ2gcAhEuoHhl
X-Google-Smtp-Source: AGHT+IGFRC+m+r/a8Okn6oewxCN7IKGCsP32ORqURIUMiUOfm5o7kOj6AXMqnFWDbj2MV05dJpu5VXuc2FEJhvoxCWI=
X-Received: by 2002:a2e:be9c:0:b0:307:2bc6:5eb4 with SMTP id
 38308e7fff4ca-307968bfa7bmr8911111fa.3.1738156692452; Wed, 29 Jan 2025
 05:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com> <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jan 2025 13:17:54 +0000
X-Gm-Features: AWEUYZktkNT_EsHcnViFnfugP1naRJeQlMuaRyszOFwlglEWr7DXeU7KaxFISbw
Message-ID: <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/vc4: move to devm_platform_ioremap_resource() usage
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, 
	linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_051815_044955_7775D903 
X-CRM114-Status: GOOD (  15.53  )
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

Hi Anusha

On Tue, 28 Jan 2025 at 22:33, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> //(devm_)ioremap/devm_platform_ioremap_resource.
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..e22733f8159aa4b247a915e24=
a236f620bae932c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2951,15 +2951,10 @@ static int vc5_hdmi_init_resources(struct drm_dev=
ice *drm,
>  {
>         struct platform_device *pdev =3D vc4_hdmi->pdev;
>         struct device *dev =3D &pdev->dev;
> -       struct resource *res;
>         int ret;
>
> -       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi"=
);
> -       if (!res)
> -               return -ENODEV;
> -
> -       vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> -                                              resource_size(res));
> +       vc4_hdmi->hdmicore_regs =3D devm_platform_ioremap_resource_byname=
(pdev,
> +                                                                       "=
hdmi");

Whilst I totally agree with this change, why was only one of the 8
instances of this pattern within this function updated? Is that a
limitation in your script?
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_hdmi.=
c#L2957-L3020

  Dave

>         if (!vc4_hdmi->hdmicore_regs)
>                 return -ENOMEM;
>
>
> --
> 2.47.0
>

