Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20345C77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 06:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPmMK/vjZZrn+75oLPGLVOkpQXhNBYzPy7ovkiUarXQ=; b=Fjxu2nkGKdmsoiy0+BWq981fjs
	cyLBS8q6Mudmy18o+BmOtEJnYGjdnR/1kprAb4a1wFyBw/nEsOBPKnl2vgSG15AL7BDTfswGaBzmh
	GPb0PM4SlUQOFc2JfX2tVKKqlx5Nqvxa/iAYIZ1JJTwClJE5f1uUiM2/7jIrBw/ScWP+VLv039ac7
	d4FJyyyVL37V5zsYH4lysrxTIbgd69yPa8alMSg+dH/GJXO9gRB9iLZ+U7KyfBr6Zn4EbHQcaYTgY
	mqQrwLNCCIJ8C5gHhwwvdiazNmP4qXIeWK8sWX9R+lJRmerMCEsUbZKdwGQX5cgyl3NhQVi6F84cl
	aCuLOeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwzuf-0081nV-1t;
	Thu, 11 May 2023 06:36:29 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwzuc-0081m0-1Z
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 06:36:28 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3315ccc1ce0so57452715ab.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 May 2023 23:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683786982; x=1686378982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPmMK/vjZZrn+75oLPGLVOkpQXhNBYzPy7ovkiUarXQ=;
        b=kjCIFcsdkhcPLKIY42R9P9VLODjVEkWncsZjJ6vsNTQUMmZL89OIcWDQ/vLL9+IOWx
         9mXW4QHhGkFOQGFsugXpG18MElrtpGTIFm3OhHWNc1roHxGj6jPeQwMEt4VcAaeSRH3i
         ISKMksmsK1m7SXi/5IWLuokazwRhO2wEXgrlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683786982; x=1686378982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPmMK/vjZZrn+75oLPGLVOkpQXhNBYzPy7ovkiUarXQ=;
        b=GU+hERgXKgPsgAYywKE9eidiJwDsmYh/jpcNlQBRCenXSenFrJXLOLWIebiRbZzuYj
         lY4BrmjWWGYGkbVZXb3l6Woey70B1GtROMNpIlKYez7baHhBSFqMG6VoOtLhzRWXtcqO
         Apkh2Dx0aKoY5Opq1vTGYfyUHFQrWta7V5up0PFxdt6EtfAKbN8WAeIAFKJKYUE7o8eq
         PHfvqBtXEPLGExXeEBKI+w7BFVH5DM5m95F48bUP5DI+ApfuV8TSltYTMNmz6R1nZ0k+
         hfQYF5xv0SmLJ4BqOqfP1Vrqul0x8C+SJYk+tmb6d5N0/5TDgt21N+SwAuCaiTtmbPPB
         Eb9A==
X-Gm-Message-State: AC+VfDz0xZMnFXTluRGqEE8WFmTrh+HIP5HdQrDjXAa4A4xPpYqrtNBQ
	Ar0VhC4iQ8twsJiNnBdyFfynWloXK4o81BEUyDaTLA==
X-Google-Smtp-Source: ACHHUZ5wNdfOlhFcBhaS5Dr/Te9AZ1DEkR4qT035MXG/6P1UjWu3u9jtQNQv4NKbwu7xyIvunOwoeg==
X-Received: by 2002:a92:cd47:0:b0:331:7709:3ba with SMTP id v7-20020a92cd47000000b00331770903bamr13171496ilq.3.1683786982325;
        Wed, 10 May 2023 23:36:22 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id t8-20020a92cc48000000b0032ca6a1d1bbsm4104683ilq.72.2023.05.10.23.36.20
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 23:36:21 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-76c73f7443dso88752139f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 May 2023 23:36:20 -0700 (PDT)
X-Received: by 2002:a5e:8e07:0:b0:760:ea63:3385 with SMTP id
 a7-20020a5e8e07000000b00760ea633385mr13727151ion.19.1683786980560; Wed, 10
 May 2023 23:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid>
 <20230510164330.z2ygkl7vws6fci75@pengutronix.de> <CAGXv+5HBM+eksJaxL2GqLfqSmK8vsQx5NXHfhe075HkOK3vjHw@mail.gmail.com>
In-Reply-To: <CAGXv+5HBM+eksJaxL2GqLfqSmK8vsQx5NXHfhe075HkOK3vjHw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 11 May 2023 14:35:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1niad5qa-rGFSqqRQX=DZN9f4U=WWoP8-A0LQ-UyF31OnA@mail.gmail.com>
Message-ID: <CAC=S1niad5qa-rGFSqqRQX=DZN9f4U=WWoP8-A0LQ-UyF31OnA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Convert mtk_vcodec_dec_hw
 platform remove callback
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_233626_588541_1424197A 
X-CRM114-Status: GOOD (  28.05  )
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

On Thu, May 11, 2023 at 1:50=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, May 11, 2023 at 12:43=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > [expanding the audience a bit for more expertise]
> >
> > Hello,
> >
> > On Wed, May 10, 2023 at 11:31:35PM +0800, Fei Shao wrote:
> > > This aligns with [1] and converts the platform remove callback to
> > > .remove_new(), which returns void.
> > >
> > > [1]: commit a3afc5b10661 ("media: mtk_vcodec_dec_drv: Convert to
> > >      platform remove callback returning void")
> > >
> > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > >
> > > ---
> > >
> > >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 6 ++---=
-
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw=
.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > > index b753bf54ebd9..bd5743723da6 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > > @@ -193,16 +193,14 @@ static int mtk_vdec_hw_probe(struct platform_de=
vice *pdev)
> > >       return ret;
> > >  }
> > >
> > > -static int mtk_vdec_hw_remove(struct platform_device *pdev)
> > > +static void mtk_vdec_hw_remove(struct platform_device *pdev)
> > >  {
> > >       pm_runtime_disable(&pdev->dev);
> > > -
> > > -     return 0;
> > >  }
> > >
> > >  static struct platform_driver mtk_vdec_driver =3D {
> > >       .probe  =3D mtk_vdec_hw_probe,
> > > -     .remove =3D mtk_vdec_hw_remove,
> > > +     .remove_new =3D mtk_vdec_hw_remove,
> > >       .driver =3D {
> > >               .name   =3D "mtk-vdec-comp",
> > >               .of_match_table =3D mtk_vdec_hw_match,
> >
> > While the patch looks fine, I wonder if having a remove callback just t=
o
> > do pm_runtime_disable() is worth keeping it. Doesn't the core care for
> > things like that? I grepped a bit around, device_unbind_cleanup() is
> > called after device_remove() which calls pm_runtime_reinit(). Does that
> > mean calling pm_runtime_disable in .remove() is useless? In that case,
> > you could just drop the .remove() callback.

Thanks for the feedback.

I wonder if the core would handle that for drivers... if I understand
it correctly, pm_runtime_reinit() does not disable runtime PM for a
device, otherwise pm_runtime_remove() wouldn't need to bother
calling __pm_runtime_disable() before pm_runtime_reinit().

In fact, from the runtime_pm documentation [1] I read the following:
"Drivers in ->remove() callback should undo the runtime PM changes
done in ->probe(). Usually this means calling pm_runtime_disable(),
pm_runtime_dont_use_autosuspend() etc."

Based on the above I assume it's still necessary given pm_runtime_enable()
was called in ->probe().

[1]: https://www.kernel.org/doc/Documentation/power/runtime_pm.txt

>
> Maybe just switch to devm_pm_runtime_enable() on the enable side?

That sounds like a good alternative, I'll revise and send a new patch, than=
ks.

Regards,
Fei

>
> ChenYu

