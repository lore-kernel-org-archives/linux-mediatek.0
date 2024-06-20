Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053D6C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oRTqaQV+LstrjwZixpKFYUALXmKtaF0Ow0RUXHlll0=; b=rXBXcXDwQ455aBz0eJCATM7GMO
	MgbPEJg0HuOo9ENomlPjXU5tJbNbQRACzv7k2Lcfiz7FtqOqa/UISEjAO5dJ7VOSrezxqRClcsPVL
	1ejamOE1re0bUl3qXX9hppKLy6hDXk1UxqQz6avUeNw3hJThxyuVCgmmHic2ub/IGALydDfTNdSu0
	JpXQkKEHt0ZhmVHnQ2+fKF9X0hfFTwW4WOeyod4S5gzOiXTgrzl+FTDblS32GAQ+u0Itt2NlSq3vN
	5Zrpb2tjB5ihJt0nmysC+eSghsTQj7wECj2vbAS2rrmVUL6S0AQV6qKOiAkFetq0TpSVj0/rDbXWO
	oAcGLRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDUj-00000004FtJ-1ulM;
	Thu, 20 Jun 2024 08:50:13 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDUg-00000004Frp-2yRq
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 08:50:12 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2e724bc466fso6599121fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718873409; x=1719478209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oRTqaQV+LstrjwZixpKFYUALXmKtaF0Ow0RUXHlll0=;
        b=FWcLod8S4ZXTGw+9jayP1vw2gajHk6uMUBrjDQzWmjFB3aSyJAbEtY+PVu+VTwtiAL
         m+FO552rgllkSrPbgm8FZOXPVgJ5Dr/KN3FWLb/8V+stU64LxfV6Cii+2Z8yRpV69Wao
         0+oZO/6GUUv9q+89LfUkKsEl86Q+TGbbvy87k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873409; x=1719478209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0oRTqaQV+LstrjwZixpKFYUALXmKtaF0Ow0RUXHlll0=;
        b=t3R751X2IWywXxknxJuqYwnH6axAgSlVc+siMFPGgTBuN4+sa3ayGVtotuzLhtGQkp
         lb2jonKbpv1lSkdowYvB43xkb8O5DzmoTHDK4+47L+wN2HYhyBBOV4Qt3jQwdSh66bOm
         Ko3uwI4fyKTp0Sk5mntHAuxJKaAohq0gUrFVSRx85ddhwoPilGdeXNMDu6e4rjVdee6I
         +vUrtKHNtEm8bxSCUsUyMecUBcRFxkciOatXG9M6gD64mkw35yT/gihenjdIu5Qq2fmp
         tIS75LL6o+dztGkFwqZe6ryvu6EDzflMuU1fx2ZPLZ1wzjdzNVcjGoDaBSETcq73nFqA
         PVrw==
X-Forwarded-Encrypted: i=1; AJvYcCWGFbXkLXZ+CiSebV7eXK5NzEL9AyrdfpXXtRRnV3vZeZETO9impuG0rR+q83WodxWkmVOePmteocrukCFNXX8IqhMa0PgyZc+PdL2DUZlYrbAp
X-Gm-Message-State: AOJu0YxbcrpQsycl4bCy1+qmaV8/Sv8uU441PnJCmVKrlsznSBiWwJZy
	a9rfl+3fFq8HS4aw5BvNRQCRZ8VMww2X74uKbZzuEKIUs1p8yM5dwnslZjIQMGHk2Tka92iLkjS
	N10vnPb2aFmLHyMf3ECZcDK3bjw1/v6Ro6HI4
X-Google-Smtp-Source: AGHT+IHcXpqJLWmBKdXeI91LoMKrVXewns1BNu07e4js70I9FeW6r0+Qp26QuOLQHYvE8hHnxAzWJBo7v4Fc1y9Nr0o=
X-Received: by 2002:a2e:2416:0:b0:2eb:e137:6584 with SMTP id
 38308e7fff4ca-2ec3ce940bamr36303391fa.20.1718873408841; Thu, 20 Jun 2024
 01:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240620054708.2230665-1-wenst@chromium.org> <743577a0-ef60-4731-8901-daf1ae4f7f7f@suse.de>
In-Reply-To: <743577a0-ef60-4731-8901-daf1ae4f7f7f@suse.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 20 Jun 2024 16:49:57 +0800
Message-ID: <CAGXv+5G8sC0JAWg_1k-x6+XeqMSMHQDuHfhOJkJYe1OzHkdH-g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION=y
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_015010_772127_8C0B80C0 
X-CRM114-Status: GOOD (  21.77  )
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

On Thu, Jun 20, 2024 at 2:37=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 20.06.24 um 07:47 schrieb Chen-Yu Tsai:
> > With the recent switch from fbdev-generic to fbdev-dma, the driver now
> > requires the DRM GEM DMA helpers. This dependency is missing, and will
> > cause a link failure if fbdev emulation is enabled.
> >
> > Add the missing dependency.
> >
> > Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Apart from this problem, would it make sense to convert the driver's
> management to GEM's DMA helpers? It appears there's some code
> duplication in mtk_gem.c and these helpers.

It seems at least import_sg_table could be converted. I don't have
the bandwidth to do a more in-depth review though.

Thanks
ChenYu


> Best regards
> Thomas
>
> > ---
> > The commit this patch fixes is in drm-misc-next. Ideally this patch
> > should be applied on top of it directly.
> >
> > CK, could you give your ack for it?
> >
> >   drivers/gpu/drm/mediatek/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediate=
k/Kconfig
> > index 96cbe020f493..d6449ebae838 100644
> > --- a/drivers/gpu/drm/mediatek/Kconfig
> > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > @@ -7,6 +7,7 @@ config DRM_MEDIATEK
> >       depends on HAVE_ARM_SMCCC
> >       depends on OF
> >       depends on MTK_MMSYS
> > +     select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
> >       select DRM_KMS_HELPER
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>

