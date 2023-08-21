Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5075EE49A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 06:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e24p/QGiX61DaJt8Acom0fYKmpB5lPPX58liDQjeNco=; b=wYf/IowEF8YXa/WugT6QQCHvR6
	VjLeC4Ctdi/+rXekq3uOXoZc/ab4Kby/lf/xCiYeZMrcQk0pvw7TFGfWBJe03RPXJhYbF9bMnsT+V
	OaK8LeRdTbc9nfxN4dLQ/3c7AWOudV3Hc/GF5cv3ZE18cx4nXhcwOG2WrmlweqRQWDwWfxNH0ShIY
	SMuSNR3vs4V2xC2ChYC0rIktsSg/zwACuSSGw6RTfNaWR3xfHJI6QJgv4TxdWZ6zzy3sBkHphyCuN
	wKKg0lYww/icOOMMtrO9Rf4OuHxNcaG5Ii7myoTZZLLmj01tl3ImiwUxn4uRAe4PWs0FYbLPmW2I3
	upmRY/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXyGK-00DFI1-2e;
	Mon, 21 Aug 2023 06:19:40 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXyGI-00DFGS-1U
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Aug 2023 06:19:39 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7923483bb68so13435939f.3
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Aug 2023 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692598771; x=1693203571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e24p/QGiX61DaJt8Acom0fYKmpB5lPPX58liDQjeNco=;
        b=RChzXgenZ+d85W6GQymEYq8ktRQowjZPrdDPrXKUpf7q0SR9c6NdglxKFbxEeZH4RZ
         Du6Yb3+hd8RDhWNOWRDTPyfNliSG2IT9JpXNm5fQHIjY0eGCu+gDOXN9cSKa67KfL3Mo
         iasRcYPysh5nFEEnyPKLoYZjZGuUgfy53faBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598771; x=1693203571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e24p/QGiX61DaJt8Acom0fYKmpB5lPPX58liDQjeNco=;
        b=fcELccwsgR3BLpxOLXmjZIHuqZCmpCixOr/pFFwPwJ9xye1SV297WP2XSd0c74REtX
         jZECS8GpIftDuPhmYbiXqv4P7nXYGqKTmdmogd/TkI/jJkBa5Q70uiZF2zu+SADsbx0Q
         pozOtl3/q0SAgvepCL53baMIie+ysvsehYUuvKI8diXBnl10YdTYC3pIh6zfnigreVR4
         Hk9IHfzpFKB/nZ5RWwn9V+VaTTp+dkViz7grkLm62Yj+m3e6Nuraj4VUzVhVqUUThSnE
         XP+Ac4TwiYFHUEX9dDvh9LfRgj75Rcyz312u172JXcAypLwgMC5Ai8BBZNRVKPH5vp7e
         02kg==
X-Gm-Message-State: AOJu0Yx6ODJvq/QRAjPBe0nn39xnPMIedqwIBo/8xL6ZRdZTjxMYKmeT
	2x19lVWX1Pic+JvTQvIQmIlA/qy/6guBqJ4RxUs=
X-Google-Smtp-Source: AGHT+IGoVxRypMxbYz6GphPw6AEmGL4SOqukC2AjGqWaDeMNBn7VLEvXEugQ49bg4FK2lLedRJxKCA==
X-Received: by 2002:a5e:9e02:0:b0:787:8d2:e0c with SMTP id i2-20020a5e9e02000000b0078708d20e0cmr7366282ioq.12.1692598771473;
        Sun, 20 Aug 2023 23:19:31 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id fq2-20020a056638650200b0042b2d43ee3fsm2292362jab.82.2023.08.20.23.19.30
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 23:19:30 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7923483bb68so13435139f.3
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Aug 2023 23:19:30 -0700 (PDT)
X-Received: by 2002:a5e:9e02:0:b0:787:8d2:e0c with SMTP id i2-20020a5e9e02000000b0078708d20e0cmr7366242ioq.12.1692598770209;
 Sun, 20 Aug 2023 23:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid>
 <20230821033532.GA21555@google.com>
In-Reply-To: <20230821033532.GA21555@google.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 21 Aug 2023 14:18:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhT8b8aWAA=eDq_6kEjS3fWTMBTAjV2BGc2CNtGy_rD0Q@mail.gmail.com>
Message-ID: <CAC=S1nhT8b8aWAA=eDq_6kEjS3fWTMBTAjV2BGc2CNtGy_rD0Q@mail.gmail.com>
Subject: Re: [PATCH] spmi: mediatek: Fix UAF on device remove
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yu-Che Cheng <giver@chromium.org>, Stephen Boyd <sboyd@kernel.org>, 
	James Lo <james.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_231938_503074_D7EF0720 
X-CRM114-Status: GOOD (  26.63  )
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

On Mon, Aug 21, 2023 at 11:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Mon, Jul 17, 2023 at 05:39:35PM +0800, Yu-Che Cheng wrote:
> > The pmif driver data that contains the clocks is allocated along with
> > spmi_controller.
> > On device remove, spmi_controller will be freed first, and then devres
> > , including the clocks, will be cleanup.
> > This leads to UAF because putting the clocks will access the clocks in
> > the pmif driver data, which is already freed along with spmi_controller=
.
> >
> > This can be reproduced by enabling DEBUG_TEST_DRIVER_REMOVE and
> > building the kernel with KASAN.
> >
> > Fix the UAF issue by using unmanaged clk_bulk_get() and putting the
> > clocks before freeing spmi_controller.
> >
> > Reported-by: Fei Shao <fshao@chromium.org>
> > Signed-off-by: Yu-Che Cheng <giver@chromium.org>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Stephen, could you pick this up?
>
> > ---
> >
> >  drivers/spmi/spmi-mtk-pmif.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.=
c
> > index b3c991e1ea40..74b73f9bc222 100644
> > --- a/drivers/spmi/spmi-mtk-pmif.c
> > +++ b/drivers/spmi/spmi-mtk-pmif.c
> > @@ -465,7 +465,7 @@ static int mtk_spmi_probe(struct platform_device *p=
dev)
> >       for (i =3D 0; i < arb->nclks; i++)
> >               arb->clks[i].id =3D pmif_clock_names[i];
> >
> > -     err =3D devm_clk_bulk_get(&pdev->dev, arb->nclks, arb->clks);
> > +     err =3D clk_bulk_get(&pdev->dev, arb->nclks, arb->clks);
> >       if (err) {
> >               dev_err(&pdev->dev, "Failed to get clocks: %d\n", err);
> >               goto err_put_ctrl;
> > @@ -474,7 +474,7 @@ static int mtk_spmi_probe(struct platform_device *p=
dev)
> >       err =3D clk_bulk_prepare_enable(arb->nclks, arb->clks);
> >       if (err) {
> >               dev_err(&pdev->dev, "Failed to enable clocks: %d\n", err)=
;
> > -             goto err_put_ctrl;
> > +             goto err_put_clks;
> >       }
> >
> >       ctrl->cmd =3D pmif_arb_cmd;
> > @@ -498,6 +498,8 @@ static int mtk_spmi_probe(struct platform_device *p=
dev)
> >
> >  err_domain_remove:
> >       clk_bulk_disable_unprepare(arb->nclks, arb->clks);
> > +err_put_clks:
> > +     clk_bulk_put(arb->nclks, arb->clks);
> >  err_put_ctrl:
> >       spmi_controller_put(ctrl);
> >       return err;
> > @@ -509,6 +511,7 @@ static void mtk_spmi_remove(struct platform_device =
*pdev)
> >       struct pmif *arb =3D spmi_controller_get_drvdata(ctrl);
> >
> >       clk_bulk_disable_unprepare(arb->nclks, arb->clks);
> > +     clk_bulk_put(arb->nclks, arb->clks);
> >       spmi_controller_remove(ctrl);
> >       spmi_controller_put(ctrl);
>
> Maybe we need devres versions of spmi_controller_alloc and
> spmi_controller_add to avoid this in the future? I'm sure
> drivers put all sorts of stuff in their private data.

Sounds good, I think I can send a follow-up series for that.

Regards,
Fei

>
> ChenYu
>
> >  }
> > --
> > 2.41.0.255.g8b1d071c50-goog
> >

