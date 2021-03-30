Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED65C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:51:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620C261874
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620C261874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MmMgoZ0OJdOCv20Y1Ln1YZQClSJn5J5+JPoCoJ+pOR4=; b=ORP4BH2poR/3yiYJiCXMjQKSk
	78LVq5hRgEfh3IqOb5DxkZsoxANiE/kNe+26Uw9D11Pl08aTRAAGbPsXwYZ+/RIxRD6+s8pquJyqb
	ng4sm5Z9zGgdGoQF7mvKV/ziPNoCuB4idhUJGVXIK/IXAFmk+mS9zD6vEGT1g6FgC1YzyMBecdwio
	A1pTx6KsPXtHkxGO+h60PwH3n8yTn47vQfvgB8L0Ta2Z8hR1AdX4OMNOuVEtnNo2CqnzhtpRSCwbh
	rcZZ//bASO66WxlxAlSQEtmPLQglzyLv1CksN+rj0ytHh6xL2z7MhFDQApmGF++Wq+y+wnlAQhjSb
	NWAy+hfWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRByG-003T6y-HZ; Tue, 30 Mar 2021 10:51:40 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBvZ-003SWm-J0
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 10:48:58 +0000
Received: by mail-io1-xd35.google.com with SMTP id r193so15915195ior.9
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rP4kknX4xAvleYYg0u92Em0z72hot5F8BzD9RddRRUk=;
 b=EbUxrwGTbHNhFj3dhzWvOVejXKYejKx9ObBGEO2MgczgMKQnT+vXFQRfGg8vrNb/79
 KL/A0537a2GEjEYCAl7GY3oVE68vAS1j+oDWC6SotMtY9X5GCV/J4ATA4Uek1T+EnTTF
 /S+nYVBYnx+p8PzqDMOT6+sZ1DJeuObbYabHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rP4kknX4xAvleYYg0u92Em0z72hot5F8BzD9RddRRUk=;
 b=fwwdP8j5VTBwMqyzKsSUzMuFU8rP1BSZ1toQHQOMAKqkbfhv+brQb9rOv9xvexThks
 vHhofn2xvyDdXDxuLkLBCZ/QLXOzHPbWwTSmtLhTr8La4BVJUB6OliwNla4Tlya8kMAM
 Ouy7kzixnQTD/au0yi2feh402hJakecTvXqRf62fTIg0cm41j8I6adH2cr6VV9ZgIn50
 wVoagvbWQfHN5/XOAQFaQEnTNRL+1wK14os6lVuEKlgWF327RPjZOqNhuO0Jiky7JMmN
 EH2SfpqyttIwZr1M5mkAdDa/6T05DulpDD5IU/8IJVxHaB3EaXEF/oqXH0BteyFPDp8M
 fsAA==
X-Gm-Message-State: AOAM531TKQJaJuUlHq3/8meprieaRZW+L1/PnR6sNbSx2XRzlgG/FwQb
 jqXuWHxjH6yuk7IXkhLbCXkOhUCkZyzgZSOcTIpgHw==
X-Google-Smtp-Source: ABdhPJw/U5SlztC8bxQ7GW+0c8uKyz5qnR7FWLJK/549d5I/fXM+w1ZQvMlnX4P6c7fKXRSF8zGbDwvXCWFsbPHN0hA=
X-Received: by 2002:a05:6638:2bb:: with SMTP id
 d27mr28069519jaq.98.1617101330606; 
 Tue, 30 Mar 2021 03:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210203110717.686204-1-enric.balletbo@collabora.com>
 <8c8309fb-babe-3ed4-d2a1-111fbab91e9f@collabora.com>
In-Reply-To: <8c8309fb-babe-3ed4-d2a1-111fbab91e9f@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 30 Mar 2021 18:48:24 +0800
Message-ID: <CAJMQK-hNwBm8r9GokjjbapyS+1MwtfL_DJda9q4xjK2Ud6SvvA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add missing MODULE_DEVICE_TABLE()
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>,
 Collabora Kernel ML <kernel@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_114853_922638_88FE03AC 
X-CRM114-Status: GOOD (  23.33  )
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

On Tue, Mar 30, 2021 at 5:43 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi,
>
> On 3/2/21 12:07, Enric Balletbo i Serra wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > This patch adds the missing MODULE_DEVICE_TABLE definitions on different
> > Mediatek drivers which generates correct modalias for automatic loading
> > when these drivers are compiled as an external module.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

>
> A gentle ping for someone to review this patchset :-)
>
> Thanks,
>   Enric
>
> > ---
> >
> >  drivers/gpu/drm/mediatek/mtk_cec.c      | 2 ++
> >  drivers/gpu/drm/mediatek/mtk_dpi.c      | 1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 1 +
> >  drivers/gpu/drm/mediatek/mtk_dsi.c      | 1 +
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c     | 1 +
> >  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c | 1 +
> >  6 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> > index cb29b649fcdb..3b86e626e459 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/interrupt.h>
> > +#include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> >
> > @@ -247,6 +248,7 @@ static const struct of_device_id mtk_cec_of_ids[] = {
> >       { .compatible = "mediatek,mt8173-cec", },
> >       {}
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
> >
> >  struct platform_driver mtk_cec_driver = {
> >       .probe = mtk_cec_probe,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 52f11a63a330..2680370652fd 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -822,6 +822,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
> >       },
> >       { },
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> >
> >  struct platform_driver mtk_dpi_driver = {
> >       .probe = mtk_dpi_probe,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 5f49a809689b..e4645c8ae1c0 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -470,6 +470,7 @@ static const struct of_device_id mtk_drm_of_ids[] = {
> >         .data = &mt8183_mmsys_driver_data},
> >       { }
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
> >
> >  static int mtk_drm_probe(struct platform_device *pdev)
> >  {
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 0527480c07be..c71ce62d1bec 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1193,6 +1193,7 @@ static const struct of_device_id mtk_dsi_of_match[] = {
> >         .data = &mt8183_dsi_driver_data },
> >       { },
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
> >
> >  struct platform_driver mtk_dsi_driver = {
> >       .probe = mtk_dsi_probe,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > index 8ee55f9e2954..b4696a9d73f7 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > @@ -1818,6 +1818,7 @@ static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
> >       },
> >       {}
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
> >
> >  static struct platform_driver mtk_hdmi_driver = {
> >       .probe = mtk_drm_hdmi_probe,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> > index 62dbad5675bb..6207eac88550 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
> > @@ -335,6 +335,7 @@ static const struct of_device_id mtk_hdmi_ddc_match[] = {
> >       { .compatible = "mediatek,mt8173-hdmi-ddc", },
> >       {},
> >  };
> > +MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_match);
> >
> >  struct platform_driver mtk_hdmi_ddc_driver = {
> >       .probe = mtk_hdmi_ddc_probe,
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
