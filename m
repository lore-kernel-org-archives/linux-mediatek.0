Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB03C3601A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=; b=az9ov9hcpuGFkR0YKRa9xsn6Gk
	zGCw/RxLXiNKEZLppcMGrVE0fHEjSBAY24FdxQaxVMUN+RGUD4b+Yd3Q8kGmtlCO2LdjzlphwdfCE
	rjc+Swf7YNJvGq5HlzPXWCNWLx1BsmQQ/YkGqLjZYWL+HPiWsXr7zc1Z1kISRbpZRXifmJgkby/yt
	hq7Ko/CmwFdNvhMTEJNGEf42SzOeTUwdw7g9omazd1OJNijCN4AF9yGtXKgTg9IfKZ/8lGtFVXyiJ
	eCqZhhtZUAQmaz10scqyK6aXLp3kdSKSjNcb3srHbBD1VTQo/PtYnz+vA52hUmWurKXyjV7ShVQJf
	sQawysXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzucf-00000005iab-0qZe;
	Wed, 02 Apr 2025 09:43:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzucd-00000005iZj-0bMC
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 09:43:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2243803b776so62632665ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743586978; x=1744191778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=;
        b=FN3a3IVVt3/9ne4y1gN4R2kZxBODBPRSDzsuF8b/7+9gAd9ffq9ZGDJ3MmoPx5uwrs
         rtrZFNUUSbmzfWVwSdQp3J0Xu6xd2qNNtdsCeg3UfmMGAWR/GRPwcnfX8AoL8/LSLYOo
         ALDZuOvgmbueUR8avMSwCZcCOXYhU2Iin6nJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586978; x=1744191778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=;
        b=mg2wH7iI9oYh33MwsfAwdjbhs/OOXFP7Zzwjf0Vj+bmBvEnrdrkE+w7PiMTKBUVx3i
         n1JM4ApVvhbixTlmdCvLALvHXd+mRnSbBhlRgHT6/pq2hpVucXUeul9zsIIimEmZHr2M
         I/0OrXxiNU4XpNYWP8PBn5KU+iFtz11By+TpqERYQ2DhsKRF1+Ofjt5N/sbVzkkCxkZb
         f/4r66ksxszDdtec5TARrTElay3Gzkcqv2pVhf17aK4NZogf9cnSGXH6pBjO2/rLSgum
         kb5OXqsjA230hI5mI4CB14uz7fap1XsMCEcMcuG/kaJOptrHQZoODHfvcHnkcLZgh43W
         COOA==
X-Forwarded-Encrypted: i=1; AJvYcCWYYezNTXQ62nWUg5Rzh/JGsn+lZ8frQ1MqJDXLqp1V4knkKez+A4Bv5awJtT34YksPp8ae6O7CGOLk3eQM1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGO4+6BQPg7HjrxsrrA4h+hxZUvZM8qKDRsY7tI5MT5zlfgu8M
	7MS75CJGtndB621QBn0kz1XYtSpnBOuLW53hOWgT3zysMjTT3JvEfDPQ2GSlE4PTeqJp/EuLfZa
	LrB/+VsnHGnGRKWYQOXgvLsQ7SIZ3fp7qftXt
X-Gm-Gg: ASbGncvus6fnHGcqzo+IlZ+PjFGrC9WAn2w5XZakWvmu7VnRJPotw8JZpyPdkxTNC9t
	N+nkaMe+LhO1pIqWFCDwIsDECJByzEglubficPe9D/SI3tDJsrwBMmw/YDcYBIy0hy6RTNDeVq+
	Z/gSdCauj2Lw9fCOhXswO0mb5fKLzZlYAOgWmryNqLThkkKeF3mmEB
X-Google-Smtp-Source: AGHT+IGMZDQXr98ZNR/OTYIob8ILLj+AqDEEsuZ8JN3W+IxwuRQKfzlFXjpxIo8J+CbSTybZ0f55Aqhe9qvbkLunHuc=
X-Received: by 2002:a17:903:1110:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-2296c65f3b4mr20133075ad.17.1743586978295; Wed, 02 Apr 2025
 02:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:42:45 +0800
X-Gm-Features: AQ5f1JpfpbwiH6bCyV4YV_ME0bLhkIPk06VpTzeijPYQFz6wYmEpVSh-GkNPq_Y
Message-ID: <CAGXv+5EnGbYTPh9vrrcn0T1oskCY=AHDJsd1rfGw4MiPoUAAxQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm/mediatek: mtk_disp_rdma: Enable/disable
 interrupt on bind/unbind
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_024259_185213_33E51BFD 
X-CRM114-Status: GOOD (  26.23  )
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

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The RDMA driver is installing an ISR in the probe function but, if
> the component is not bound yet, the interrupt handler may call the
> vblank_cb ahead of time (while probing other drivers) or too late
> (while removing other drivers), possibly accessing memory that it
> should not try to access by reusing stale pointers.
>
> In order to fix this, like done in the OVL driver, add a new `irq`
> member to struct mtk_disp_ovl and then set the NOAUTOEN flag to
> the irq before installing the ISR to manually disable and clear
> the hwirqs with register writes, and enable_irq() and disable_irq()
> in the bind and unbind callbacks respectively.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 35 ++++++++++++++----------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index bf47790e4d6b..8c5021365a04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -81,6 +81,7 @@ struct mtk_disp_rdma_data {
>  struct mtk_disp_rdma {
>         struct clk                      *clk;
>         void __iomem                    *regs;
> +       int                             irq;
>         struct cmdq_client_reg          cmdq_reg;
>         const struct mtk_disp_rdma_data *data;
>         void                            (*vblank_cb)(void *data);
> @@ -295,13 +296,23 @@ void mtk_rdma_layer_config(struct device *dev, unsi=
gned int idx,
>  static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
>                               void *data)
>  {
> -       return 0;
> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       /* Disable and clear pending interrupts */
> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
>
> +       enable_irq(priv->irq);
> +
> +       return 0;
>  }
>
>  static void mtk_disp_rdma_unbind(struct device *dev, struct device *mast=
er,
>                                  void *data)
>  {
> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       disable_irq(priv->irq);
>  }
>
>  static const struct component_ops mtk_disp_rdma_component_ops =3D {
> @@ -314,16 +325,15 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_rdma *priv;
>         struct resource *res;
> -       int irq;
>         int ret;
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> -       irq =3D platform_get_irq(pdev, 0);
> -       if (irq < 0)
> -               return irq;
> +       priv->irq =3D platform_get_irq(pdev, 0);
> +       if (priv->irq < 0)
> +               return priv->irq;
>
>         priv->clk =3D devm_clk_get(dev, NULL);
>         if (IS_ERR(priv->clk))
> @@ -347,21 +357,18 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>         if (ret && (ret !=3D -EINVAL))
>                 return dev_err_probe(dev, ret, "Failed to get rdma fifo s=
ize\n");
>
> -       /* Disable and clear pending interrupts */
> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
> -
> -       ret =3D devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
> -                              IRQF_TRIGGER_NONE, dev_name(dev), priv);
> -       if (ret < 0)
> -               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", irq);
> -
>         priv->data =3D of_device_get_match_data(dev);
>
>         platform_set_drvdata(pdev, priv);
>
>         pm_runtime_enable(dev);
>
> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
> +       ret =3D devm_request_irq(dev, priv->irq, mtk_disp_rdma_irq_handle=
r,
> +                              IRQF_TRIGGER_NONE, dev_name(dev), priv);

Same comment as OVL driver change.

ChenYu

> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", priv->irq);
> +
>         ret =3D component_add(dev, &mtk_disp_rdma_component_ops);
>         if (ret) {
>                 pm_runtime_disable(dev);
> --
> 2.48.1
>

