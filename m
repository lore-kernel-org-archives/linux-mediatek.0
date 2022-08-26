Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9F4ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 04:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfavuWqsga9k882E8+MW27Dc7w6nkSmp6dmrzCaSBa8=; b=0c59RCAkrj22cT4W62NfzzXNdt
	eRIYs1bcE/0YlgSGDtk95ELov1INb9s3toaj6ZMAeDoO/iy/vJK9nheQeI9ozyfPdBCLpD5f1WlSY
	g/fOze6YzsyqAzWGLQEdAEtFsq1D5k+2fTkL+4S4bK7HkmI8GYWUt7E0Rh/eNC/oYJZEsxj1rHu+P
	B3UO9wPXC3ZcwZPs1p9eeHimjwt7k4irLRIjbMxyFyr25cbNvTXsiITDx+hfwIZ8ekq3+/CI+Jmmd
	shhP1qQJXMncs+t0mwkyd/368V08De/4GVFpyIbmukrGghhQzhpD0+0njHzXFu8F+qxgYar5gCJS1
	yZGQRG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRQeb-00CY5L-1a; Fri, 26 Aug 2022 04:09:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRQeX-00CXj6-Ah
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 04:09:06 +0000
Received: by mail-ej1-x634.google.com with SMTP id fy31so488625ejc.6
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 21:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nfavuWqsga9k882E8+MW27Dc7w6nkSmp6dmrzCaSBa8=;
        b=auaX9NL078V2jQ22g6geanRo4qZgCfxascPAwZLxdTpxPyzPYywc2dou1ZYhcRULDj
         SPoXe+ojJ8cZ26IfVZM+1e593dZ30nsOzMbK8OQ3BD+4Ii44ZUIxjQxzbARwlnIbYBZ4
         eFv5ITB4zd1gSGzc6fvPICF/Xe8xA2tDVwNX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nfavuWqsga9k882E8+MW27Dc7w6nkSmp6dmrzCaSBa8=;
        b=6rinWq5/2jAmb0LHUIguHeDvkBWWc3f+RqvVZERSKlYLS3gt1Fxor9x9Wc6xmBfqQY
         W+CMj9OifqgCgLTcMH+idJ4MhQG/dbiXrUqMHpwy/LMVM2B5Z/oz5Q4CAL9FfsVP0eqK
         K0L+kiZ/2BJKW7IxcQ8h1Km/ocewxBBpPGYEGRQy6+u8PXyWKSIsmHqtzrT+lXihFZbx
         A37SsX5HWAKRPO4kiVHass8qzO26TnFasam27+vI3NhDtMNx526WkErfPsed2STvbLg7
         A46E1dBbv11HHFGgKvXOyN029sV061lC30K8cVNjoE02j2CQjCGOV7mEVsy9XDFwy1J5
         Z1zw==
X-Gm-Message-State: ACgBeo142FFZK9YuXv44hd7FFbFdYbj55f+3E4ALqokr69XIlG5HcmRA
	TgY6LeAvGiqicb69BpcwBKNckpIGj7Lk8EU5cCewFw==
X-Google-Smtp-Source: AA6agR4P9lJ2jCOXLxO3fu5pzVr8QQon3biII9pZufVQXE6IfPh3piLXnL5yinNDFW3MHI/dSrraW9UClF4wseNeZfY=
X-Received: by 2002:a17:907:60c7:b0:739:52ba:cbd0 with SMTP id
 hv7-20020a17090760c700b0073952bacbd0mr4329186ejc.152.1661486940981; Thu, 25
 Aug 2022 21:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220720085731.11011-1-irui.wang@mediatek.com> <20220720085731.11011-5-irui.wang@mediatek.com>
In-Reply-To: <20220720085731.11011-5-irui.wang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 26 Aug 2022 12:08:49 +0800
Message-ID: <CAGXv+5Eqcv-K1O-5foTcHYXKh+0yipo-i+EjgYOMemS3_82fAQ@mail.gmail.com>
Subject: Re: [PATCH v2, 4/6] media: mediatek: vcodec: Remove encoder driver
 get IRQ resource
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	angelogioacchino.delregno@collabora.com, 
	Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_210905_428449_1409D5A4 
X-CRM114-Status: GOOD (  19.79  )
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

Hi,

On Wed, Jul 20, 2022 at 4:58 PM Irui Wang <irui.wang@mediatek.com> wrote:
>
> The "platform_get_resource(pdev, IORESOURCE_IRQ, 0)" is no longer
> used after commit a1a2b7125e107("of/platform: Drop static setup of
> IRQ resource from DT core"), so just remove the function in
> encoder driver to avoid driver probe failed.
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c   | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> index ea667b867b56..6d8964fb4fa2 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> @@ -228,7 +228,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  {
>         struct mtk_vcodec_dev *dev;
>         struct video_device *vfd_enc;
> -       struct resource *res;
>         phandle rproc_phandle;
>         enum mtk_vcodec_fw_type fw_type;
>         int ret;
> @@ -272,13 +271,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>                 goto err_res;
>         }
>
> -       res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -       if (res == NULL) {
> -               dev_err(&pdev->dev, "failed to get irq resource");
> -               ret = -ENOENT;
> -               goto err_res;
> -       }
> -
>         dev->enc_irq = platform_get_irq(pdev, 0);

platform_get_irq() returns a negative number on failure. You should
check for errors here as the previous check was removed.

The description of platform_get_irq() explicitly mentions:

    Device drivers should check the return value for errors so as to
    not pass a negative integer value to the request_irq() APIs.

Hans has queued up this patch, so maybe you could provide a follow-up
patch to fix this?


Regards
ChenYu


>         irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
>         ret = devm_request_irq(&pdev->dev, dev->enc_irq,
> --
> 2.18.0
>

