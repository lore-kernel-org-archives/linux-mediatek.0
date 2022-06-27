Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1E6C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSimcfIaUu8P8Zd0kHKcHjUirkPTuMp+KjnpxJVA5io=; b=Xu9JcSw1kf5htQ4j9edC/jpDn4
	+Bac/Kf1Kyyb+qVX3yEwMfcU8mnxwriH5+OIPNEg4l5fdcbmVu6XCabVLdDLLV2tvE584UMKV1xkc
	M+cNkluzuAJ2qZD04L0JSmSVYGreMgrR0XX5QrGsAxW3tI4grDwfJnOLd42qfBe5ybZHcr6jMLrmg
	YJfoSO2OVeUtQJ1e0ApnsLIkgChIORSdI/v6MDPQuOjiK+iiZYIfBHM20DLhvprUvYCRjcXCueTeL
	jDGjB0Cuz9asSuOQ6a41V9M1pSwK6HjmnXIVY9isrB6P4WxNgKJ9uzXDxcmnRX2Om00O3ly+KydOb
	IOazmZ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rMs-001lyg-Nt; Mon, 27 Jun 2022 16:13:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rMq-001lxA-9c
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 16:13:41 +0000
Received: by mail-ej1-x62b.google.com with SMTP id cw10so20244651ejb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YSimcfIaUu8P8Zd0kHKcHjUirkPTuMp+KjnpxJVA5io=;
        b=NOr80kINOxbn9hWrJtWZUy0A7Z5bnVxhfzNk7yGXC9cX2y5Is9kq5gu7JXvFN2fKFO
         Wkyx/XoC6NxV63yEjFUm+CKEDH8bzoDu0gT9Dha0paYgM87Rncz+9YnPlG/fcD+ak9Db
         R7vWps1VSNAgUGBxVJVHDYadM4SEd0ThYN40Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YSimcfIaUu8P8Zd0kHKcHjUirkPTuMp+KjnpxJVA5io=;
        b=ZufGzBB7AJwumQrxyHSHoe0I9TyomezyE/BpQnk443AMTfBmPEDFdsjlgkqxJtBtGP
         Img0U1rB7UGkRyk/ti5ZBxCskWBdqRSZh5bq+LCkLk6yQaAY66oBYnAa4a1NaGJGLXHU
         Nsr6+LhF5Gj/r7Ap/iACpsJqok79RfsOzoI0UmaAoJgiQfD7EOuadaDtaYzh3NfHW13q
         cfwoHmxPQ8nQ6PEHj8/EZB0vcmhDDCS/0jSSFz9jrjbnRjrkX/CeQJHMs3NabHphYTwP
         FCReiFeF+E9Tw4E9Gn/Ni3ynd8W6Mo+v6iL03YkZbPcuNIo1dQXTj19XAxXd1wDy38vX
         HFQw==
X-Gm-Message-State: AJIora/bVQFORYamcLJKJOOanVb2MYjtlz3PVLjL0LvtjOfJOQwigVNB
	h9DWX7mx0rvfzFcpWS+ThG7Bj6DtTxZUjk6gdEbVIQ==
X-Google-Smtp-Source: AGRyM1t4SKs8xAPTAkOLharE1S0BnU6t82l9azV9EQCQJnwi3GPWnDhaPL0W18baR+3XPfgOOSa38vx0CCtKssnCvvQ=
X-Received: by 2002:a17:906:f84:b0:711:eda5:db31 with SMTP id
 q4-20020a1709060f8400b00711eda5db31mr13441225ejj.397.1656346416538; Mon, 27
 Jun 2022 09:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220627112402.2332046-1-wenst@chromium.org> <20220627112402.2332046-2-wenst@chromium.org>
 <43f393d2dcdd0bfac66bfc420e9261d31b3ceedc.camel@collabora.com>
In-Reply-To: <43f393d2dcdd0bfac66bfc420e9261d31b3ceedc.camel@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 28 Jun 2022 00:13:25 +0800
Message-ID: <CAGXv+5GweDwKPczT3GTYeiRCuaHNzV7+q4xfC_pgvo4GFDPOUg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220627_091340_363727_4F89566D 
X-CRM114-Status: GOOD (  25.36  )
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

On Mon, Jun 27, 2022 at 11:33 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
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
>
> While at it, can you constify stepwise_fhd, it is scary to think that som=
eone
> could modify it and cause big headache.

I noticed that as well, but since a planned refactoring would get rid of it=
,
I didn't fix it in this series.

I can add a patch for that.


ChenYu

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
> >               num_framesizes++;
> >               break;
> >       case V4L2_PIX_FMT_MM21:
>

