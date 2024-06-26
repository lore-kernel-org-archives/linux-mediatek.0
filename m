Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CF8C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 06:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCHdJxQ4oC2ts4y76NGgpAIUHQqpky7E3Iqo+x2BgZM=; b=zxcSPotAcb9tj2qnZHC3iCCyra
	2DopPxFzLrBqjPD+ujByikvSZOYciS1E+sGLx3jW/YipPJt+Ewq7NCCCcqYCwVWFxjN5cCjyiWe0l
	Zo9vmHJgWw5ez8y9UtBlRUOHn2RQvxDjo5j5kNyncnWpslf75GxPvQbZeO/G+STHZy5FUBviv9rXf
	k7KKJnUg15ffGJHhL2PBplimTOlxBENkaWAmWqtslcvpZ5LLP7+uswyQem2sza5zpVQ7f8zQOgqEy
	2ho/KmBEUZjmH61bCWlZMuLsBwH9oLmH2G0O8BRVu+9QUGJKAe7CBpU8X5F99wN6Jb4ofQTZdsqIS
	ezj7TOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMMHi-00000005cdc-3ii8;
	Wed, 26 Jun 2024 06:37:38 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMMHf-00000005ccU-2JOn
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 06:37:37 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso5515094e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jun 2024 23:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719383854; x=1719988654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCHdJxQ4oC2ts4y76NGgpAIUHQqpky7E3Iqo+x2BgZM=;
        b=bExDQUfFARq+vOSUMru3xGyGbfaJx3BVYlYRV+UMPr7nE0EYIQ0iGsMn9d4IRu2mKI
         GOzCv9dxOWO0U1F5LymJbVPuaMWBIvbVp2zi8QYG75nDjf5Shd+WU8Dip7yCZD9kmIwg
         MAPXYrRZnXMPJ4kfREOj6vgIQrgrnjdUwkIfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719383854; x=1719988654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCHdJxQ4oC2ts4y76NGgpAIUHQqpky7E3Iqo+x2BgZM=;
        b=ill4vndiJe4/DPUCVBH66nFtJSwgFt0C/H1qSmmvecgDh9cWJsbrCUBI7ZKcVgztsP
         14v6aQVP/hIk9ELUpoRU5Iafb7uoCuQgqwKo575czIjOWndBocZUQ1YtFXzWFRy8AXWq
         yfOLXTDE6deKPkCqvgXPAa2AzxfM9SwJqPelz1ssXlmaSQUpLVWWJAOTbz342G0pdcSA
         m+wby0zQh7i7eNkewWISklKQDpGXI43k3bnsubrkJykPHuwPDwQN3p93E+BVVQCKxBky
         h13NBFMUL9x0suqyyIxIRw2PTmfFdJIKPdiOGu2K2mnhmbxocaQgoT4vkwiFgf2H8ufv
         YWhg==
X-Forwarded-Encrypted: i=1; AJvYcCXF7jzm+qg6pVzGIJNJ2bJ5POUzIF6dCtEu35O+ACCArl+/ldkgSZxPEP67GtdJzh8DAIyHwpFzGcAygSydtGgpj1l2q5+vHl7d7sjJ+tUMCJ+3
X-Gm-Message-State: AOJu0YwirRGwyt+aalhdZq3viWuueEioICRKRKZtY7kiEefkPtJTrIFU
	MowlCYTIeo9MzE6PQ4Gu3Iu13/aLBhhno/M2kLx46YxjkAQaM0Tri7P4DPwwLV+liya3E3EYuJP
	iXWUh4lbCVI5W0H560YzqQ34Ka1EdTG6Gf6pk
X-Google-Smtp-Source: AGHT+IGXqfaK3Lp76aXfYjIzKpRey4MNxVqRhxxMs8nwcgXn/YAU0hTJQfa4vETDGz2L4s7B3bv6pwtt1mZk4jfCHBU=
X-Received: by 2002:a05:6512:39c8:b0:52c:e4cf:4f31 with SMTP id
 2adb3069b0e04-52ce4cf502dmr7041057e87.49.1719383853555; Tue, 25 Jun 2024
 23:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240620054708.2230665-1-wenst@chromium.org> <CAAOTY_9tLUAcw+C5D78SNwrV6kHds7JhtAoFYFmxxfAH9vtkDQ@mail.gmail.com>
In-Reply-To: <CAAOTY_9tLUAcw+C5D78SNwrV6kHds7JhtAoFYFmxxfAH9vtkDQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 26 Jun 2024 14:37:22 +0800
Message-ID: <CAGXv+5FQaJFuouB4feS4KEK+KqSZaJ=en8d9700gkqpQLOBr5g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240625_233735_866120_AC4AD713 
X-CRM114-Status: GOOD (  19.23  )
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

Hi Thomas,

On Thu, Jun 20, 2024 at 10:20=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@kernel=
.org> wrote:
>
> Hi, Chen-Yu:
>
> Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=8820=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:47=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > With the recent switch from fbdev-generic to fbdev-dma, the driver now
> > requires the DRM GEM DMA helpers. This dependency is missing, and will
> > cause a link failure if fbdev emulation is enabled.
> >
> > Add the missing dependency.
>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>

Could you help merge this?

Thanks
ChenYu

> >
> > Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > The commit this patch fixes is in drm-misc-next. Ideally this patch
> > should be applied on top of it directly.
> >
> > CK, could you give your ack for it?
> >
> >  drivers/gpu/drm/mediatek/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediate=
k/Kconfig
> > index 96cbe020f493..d6449ebae838 100644
> > --- a/drivers/gpu/drm/mediatek/Kconfig
> > +++ b/drivers/gpu/drm/mediatek/Kconfig
> > @@ -7,6 +7,7 @@ config DRM_MEDIATEK
> >         depends on HAVE_ARM_SMCCC
> >         depends on OF
> >         depends on MTK_MMSYS
> > +       select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
> >         select DRM_KMS_HELPER
> >         select DRM_MIPI_DSI
> >         select DRM_PANEL
> > --
> > 2.45.2.741.gdbec12cfda-goog
> >

