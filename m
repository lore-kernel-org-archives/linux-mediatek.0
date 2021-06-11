Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840D8C4743D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:35:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28F6161278
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 04:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F6161278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PRoWFhoaIV+0IzUO2CIHhQKksAkga8167D+Vplpj4E=; b=Nx64iGZ/ICkmEJ
	wBsCFtYTwIF4a2fsee1qhxQ4pPsSd5ED0Or5DpSf6awuayStVgLtBpestDrBzJzQ6H7kfZNxMfuTs
	HzWLJMiKe8fQCd2zODV8zsDBHLYcu3weXEF/zXj+AVbhnp9YWPCLcnBjaT/ur/LX/3CKo/14SjpQ5
	Af/gofYFtW+HBm2DQUCZhKzgF7JRUlWghTz/x3ro8VV4X3HonJWqwdqeN3T+WygZHmWqxhxN4Fs74
	VABjs4B91lAYiGKZzhDO2ticmDfkz3hTGAt2oql5MfVhcVPYBGZQJQduGs07VsyfZrL0hCLxAgS9Y
	Qk9zDsQ5WJ0r6PXsf3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrYqm-003Xzn-KY; Fri, 11 Jun 2021 04:32:56 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrYqj-003Xyv-Qp
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 04:32:55 +0000
Received: by mail-lf1-f44.google.com with SMTP id j20so6595666lfe.8
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 21:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BL7wwDaE4EopB7RkjbdBsNrvrzyStVzJ+eECImab9V8=;
 b=lrK/fMQoR3Vm9tVm5ZFY4Iz3lGCN0Tv+1wOejKEMQrk/HKh7Sfln8F9wUxLYSiEyvp
 dnFp0ZaI9BZpfbGSrXKVcdvLy+BEnHCtxHZBhKWVZGVt9aVou9KH3glQbtWkZCUTqDRL
 NDFBuPc8y04i7r6s3pA3GsvEB0PiA02LJcx6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BL7wwDaE4EopB7RkjbdBsNrvrzyStVzJ+eECImab9V8=;
 b=ATaImMwUYNvESoA4LhSGHXz/IMJqT4mXB/HHZ2qijXz56QSsrw5q1cEH8euKxqoR7h
 tJL/XK5yxqRCpFNyOhcvTKkxvJXF1vCmUbUMWvoTcjVfvqqbP9IglIWw2vSO5oUZHMfl
 q3fEz3VI6OUmHEeef+UyW5jkdXCKuM9443J005ggZQdQ05TLT8YvhnVK+Ng+JpKQkjsS
 PaMcD/4WmNdazz8MPvujvFtMi9Snq95qczJtcrNWKNRx6rtx8AkF6FXTz4aO6vz112Q5
 9X+nymzmulG64n/mFaG+KgM4rJg0bMb+prS+6p9c4APyfaPqW219zvccPY9hP8SPmquA
 bzeQ==
X-Gm-Message-State: AOAM532JXpNwdVd2NAhAx1WQpwNNfjFzn7jmF0AWZGyc+diJ8UWCXpFz
 QzPOw/owohCrefvZmgK9H4LlPNFic9W0kPtqx6MAGw==
X-Google-Smtp-Source: ABdhPJwJpKhxZ6dLTwfknmcTnSO7Rmt13bbg3wcsXIs7ra12LdsI3N5sB+pUnQO0vVRG6tMNRWtRQds/5kNyoJC73IQ=
X-Received: by 2002:a19:9145:: with SMTP id y5mr1368993lfj.444.1623385911180; 
 Thu, 10 Jun 2021 21:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210611040145.2085329-1-eizan@chromium.org>
 <20210611140124.v2.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
In-Reply-To: <20210611140124.v2.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 11 Jun 2021 12:31:39 +0800
Message-ID: <CAGXv+5Fn=YZK2zuiFHGi7pX6aiih0DNcNQ1QFi6L8FtX174EcQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] media: mtk-mdp: treat rdma@14001000 specially when
 probing
To: Eizan Miyamoto <eizan@chromium.org>
Cc: linux-kernel@vger.kernel.org, houlong.wei@mediatek.com, 
 enric.balletbo@collabora.com, yong.wu@mediatek.com, chunkuang.hu@kernel.org, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_213253_892044_C9BAE1D7 
X-CRM114-Status: GOOD (  36.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Jun 11, 2021 at 12:05 PM Eizan Miyamoto <eizan@chromium.org> wrote:
>
> ... Instead of depending on the presence of a mediatek,vpu property in
> the device node.
>
> This property was originally added to link to the vpu node so that the
> mtk_mdp_core driver could pass the right device to
> vpu_wdt_reg_handler(). However in a previous patch in this series,
> the driver has been modified to search the device tree for that node
> instead.
>
> This property was also used to indicate the primary MDP device, so that
> it can be passed to the V4L2 subsystem as well as register it to be
> used when setting up queues in the open() callback for the filesystem
> device node that is created. In this case, assuming that the primary
> MDP device is the one with a specific name at a specific address seems
> useable because the alternative is to add a property to the device tree
> which doesn't actually represent any facet of hardware (i.e., this
> being the primary MDP device is a software decision). In other words,
> this solution is equally as arbitrary, but doesn't add a property to
> a device node which is unrelated to the hardware present.
>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 15 ++++-----------
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  6 ++++++
>  2 files changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 59911ee063c1..77ddc18c90e2 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -146,17 +146,11 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>  {
>         struct mtk_mdp_comp *comp = dev_get_drvdata(dev);
>         struct mtk_mdp_dev *mdp = data;
> -       struct device_node *vpu_node;
>
>         mtk_mdp_register_component(mdp, comp);
>
> -       /*
> -        * If this component has a "mediatek-vpu" property, it is responsible for
> -        * notifying the mdp master driver about it so it can be further initialized
> -        * later.
> -        */
> -       vpu_node = of_parse_phandle(dev->of_node, "mediatek,vpu", 0);
> -       if (vpu_node) {
> +       if (strcmp(dev->of_node->full_name, "rdma@14001000") == 0) {
> +               /* This is the primary MDP device node. */

This seems quite fragile as it likely doesn't hold true across different SoCs.
You would then end up with a bunch of of_device_is_compatible() and
name checking
combinations.

Would it make more sense to check against DT aliases? Since this
device already has
the mdp-rdma0 alias associated with it, we could mandate some alias
naming scheme
going forward?


ChenYu

>                 int ret;
>
>                 ret = v4l2_device_register(dev, &mdp->v4l2_dev);
> @@ -172,9 +166,8 @@ static int mtk_mdp_comp_bind(struct device *dev, struct device *master,
>                 }
>
>                 /*
> -                * presence of the "mediatek,vpu" property in a device node
> -                * indicates that it is the primary MDP rdma device and MDP DMA
> -                * ops should be handled by its DMA callbacks.
> +                * MDP DMA ops will be handled by the DMA callbacks associated with this
> +                * device;
>                  */
>                 mdp->rdma_dev = dev;
>         }
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 523e3c2798e1..be7d35b3e3ff 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -157,6 +157,12 @@ static int mtk_mdp_master_bind(struct device *dev)
>                 goto err_component_bind_all;
>         }
>
> +       if (mdp->rdma_dev == NULL) {
> +               dev_err(dev, "Primary MDP device not found");
> +               status = -ENODEV;
> +               goto err_component_bind_all;
> +       }
> +
>         vpu_node = of_find_node_by_name(NULL, "vpu");
>         if (!vpu_node) {
>                 dev_err(dev, "unable to finddrivers/soc/mediatek/mtk-mmsys.c vpu node");
> --
> 2.32.0.272.g935e593368-goog
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
