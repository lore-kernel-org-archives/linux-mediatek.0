Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A15C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwrNUsFFjx0kIkQOK6KscPYe6Gk789pm4yunG5LcclA=; b=YAZrhI/1A+KPNXY7Ne2eQP/wZE
	S8ARZ13IGzqzXi7+atUH5JJNKY5mJ7L31tcCkzMnvLlDLOqrD4kzQpWrZuOJCyhYDVrAKtACqzJhs
	vts6/VwosUfrvo4jTDn2AlDU1d8j1HEDJwA36XylFYzJEOWRXUn4csZYjYDQfStry4fLscpCrshnq
	b1usBE6yIknUrVRnB1mRP5MrGovacWQi9bhDo0rlrvWpUwraSbl7wmQ+UlpYNIzSSqnxpjvSxBho1
	3GVwgUBHVDx+gDD370yz0jIVHh70pdo6nVT9+toE/2H/n/sfCfXIPEDfzrxJGbuNJv1toWlDFfzk3
	soCxAnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rI6-001l4S-V1; Mon, 27 Jun 2022 16:08:46 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rI4-001kzE-4h
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 16:08:45 +0000
Received: by mail-ej1-x632.google.com with SMTP id cw10so20216342ejb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qwrNUsFFjx0kIkQOK6KscPYe6Gk789pm4yunG5LcclA=;
        b=JWWB+9WHA5Yuc+abc36EnLEi/L3PeMuKG9xOsBDskAMlwdrsQwxwdERIRlRagCVIy5
         EJho5GNMeMFquiaSsnDwuWEOboyZlNoVeOqQwYv8jZVcNAljBts3Oj8jSg9tlHxU6IoR
         Oq85tXcn+3fVRHwzMhJHkICyHCZKWa98LgJkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qwrNUsFFjx0kIkQOK6KscPYe6Gk789pm4yunG5LcclA=;
        b=Svw0pKWDqxOHHGu4f9sFikyu+6sNTpJuDHcutI2s02eC8U5kpV2KeMeoGPjNJxA5G+
         GG+wwUcRQZFSeMXNDnEBoAGVQ6zw9oyhuqqYHQhVs5yzO0Ndhfnn3S5jtB1XqxmpuLu9
         wd1DYQLrMCz8pYt2UsIstMsBnkre7XJreHaENGCHsQs5+XsIHShBL22eg+oVBzWqRulR
         zs97B1gCaNgWQzWfHYU0hVL8kOEPuRTMWSbsRgYzdfO2OQmf8UfHHskCgnoJnjHfhkXp
         ueu5yRae699zPF8PcG7hV9tBY+E++5C5wTgvZEOAhSaEtUTMU12W4PRnzW2V8udqiyMp
         8qOA==
X-Gm-Message-State: AJIora9+ha30QEKDX10v6siR1GxHTvDt3wUEsaMUSBn2hkYf5DKgXaEW
	HGKmophqBrjd1a7jeg5Zt8sUv78LbIR7w+EaVDAgiQ==
X-Google-Smtp-Source: AGRyM1sbwF/uUpyJYLZOvER/koGn3oJmZ4/B+2870vS3UWHeOqRcd1W7KoWRNLHKyQv3UbOhog7S7U6wlwqeHu53stA=
X-Received: by 2002:a17:906:58c7:b0:722:f4bf:cb75 with SMTP id
 e7-20020a17090658c700b00722f4bfcb75mr13820511ejs.450.1656346115529; Mon, 27
 Jun 2022 09:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220627112402.2332046-1-wenst@chromium.org> <20220627112402.2332046-2-wenst@chromium.org>
 <f5e68826df868ae5a3cd5737fd9d7f7683bbad73.camel@collabora.com>
In-Reply-To: <f5e68826df868ae5a3cd5737fd9d7f7683bbad73.camel@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 Jun 2022 00:08:24 +0800
Message-ID: <CAGXv+5GA04LBN0bnLDdL8g_+_8HXpc-KwtPxpXyXi_WgUOPrtQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: dec: Fix 4K frame size enumeration
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_090844_210909_D127E2ED 
X-CRM114-Status: GOOD (  32.98  )
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

On Mon, Jun 27, 2022 at 11:32 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Chen-Yu,
>
> Le lundi 27 juin 2022 =C3=A0 19:23 +0800, Chen-Yu Tsai a =C3=A9crit :
> > This partially reverts commit b018be06f3c7 ("media: mediatek: vcodec:
> > Read max resolution from dec_capability"). In this commit, the maximum
> > resolution ended up being a function of both the firmware capability an=
d
> > the current set format.
> >
> > However, frame size enumeration for output (coded) formats should not
> > depend on the format set, but should return supported resolutions for
> > the format requested by userspace.
>
> Good point. Though, I don't see any special casing for the CAPTURE case. =
As this
> HW does not include a scaler, it must only return 1 resolution when being
> enumerated for CAPTURE side (or not implement that enumeration, but its
> complicated to half implement something in m2m). The return unique size s=
hould
> match what G_FMT(CAPTURE) would return.

There are no frame sizes added for the capture formats, so this function
effectively returns -EINVAL for any of them. This is also what rkvdec
does: it only looks through the list of coded formats.

Also, struct v4l2_frmsizeenum does not have a field saying whether it's
capture or output side; it simply specifies a pixel format.

>
> >
> > Fix this so that the driver returns the supported resolutions correctly=
,
> > even if the instance only has default settings, or if the output format
> > is currently set to VP8F, which does not support 4K.
> >
> > Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from=
 dec_capability")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c    | 2 --
> >  .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    | 7 +++++++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/=
drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > index 5d6fdf18c3a6..fcb4b8131c49 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > @@ -595,8 +595,6 @@ static int vidioc_enum_framesizes(struct file *file=
, void *priv,
> >               fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> >               fsize->stepwise =3D dec_pdata->vdec_framesizes[i].stepwis=
e;
> >
> > -             fsize->stepwise.max_width =3D ctx->max_width;
> > -             fsize->stepwise.max_height =3D ctx->max_height;
> >               mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
> >                               ctx->dev->dec_capability,
> >                               fsize->stepwise.min_width,
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stat=
eless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > index 16d55785d84b..9a4d3e3658aa 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> > @@ -360,6 +360,13 @@ static void mtk_vcodec_add_formats(unsigned int fo=
urcc,
> >
> >               mtk_vdec_framesizes[count_framesizes].fourcc =3D fourcc;
> >               mtk_vdec_framesizes[count_framesizes].stepwise =3D stepwi=
se_fhd;
> > +             if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DIS=
ABLED) &&
> > +                 fourcc !=3D V4L2_PIX_FMT_VP8_FRAME) {
> > +                     mtk_vdec_framesizes[count_framesizes].stepwise.ma=
x_width =3D
> > +                             VCODEC_DEC_4K_CODED_WIDTH;
> > +                     mtk_vdec_framesizes[count_framesizes].stepwise.ma=
x_height =3D
> > +                             VCODEC_DEC_4K_CODED_HEIGHT;
> > +             }
>
> I don't particularly like to see this special cased check being added int=
o
> multiple places. Its also in your patch 2, and I think it exist in a thir=
d
> place. Could it be possible to have an internal helper to ensure we don't

It's also in s_fmt(), so touched on in patch 4. I could also rewrite it so
only this spot has the special case, and all the other places look though
mtk_vdec_framesizes to get the maximum, like what I did for try_fmt in
patch 3. What do you think?

Ultimately I think it would be better to move framesizes into the
(driver-specific) pixel format data structure. That is a bigger refactoring
than a simple fix though.

> duplicate this logic ? Somehow, it seems there is something in common bet=
ween
> set_default, try_fmt and this code.

Yes. That is what I mentioned in chat about refactoring the ioctls and form=
at
handling code. set_default should really not set anything format specific,
but instead call set_fmt with a default format.


Regards
ChenYu

>
> >               num_framesizes++;
> >               break;
> >       case V4L2_PIX_FMT_MM21:
>

