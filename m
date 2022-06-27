Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 19:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00sk1nkqFTzRRBvGDEbf19owLEwm7v5mN2NfaZqIsZo=; b=ZWiZQpbciFQM7vmKkxaNKSceHB
	hZNQ/Dolya+H2Ii6LS8Da3QD/6MBIlIOtKA+nMqmzDEoqUw8sO0HdvehV2UWGku4npUhv/OydnIm6
	SJDVt+W5254eEbIP4mNK7uTVwhH+rnwbyMPG5J4HR3Nk+4WXdzI6HW31ADQeTtrMjuTT/SYxB4kEG
	IXKh1NGrPzP3uwjLrhjzE61BeJ5ZezZl3AA4n0TjqjKF7AAa/kFx70eGaoUlfXYB5CEaSvS+ACRUb
	qMI7SHYXTbCgxJPm+8HdmEOCluZYOt2wLKoZrsCfR2QODJkJxJtgMa2ofZIIbuiaKtUIZhMswW+E1
	vtGpomlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uPs-002Y2A-NN; Mon, 27 Jun 2022 19:29:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uPq-002Xzx-48
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 19:29:00 +0000
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A3726601667;
	Mon, 27 Jun 2022 20:28:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656358133;
	bh=JZYd0oVkoFsjInwx5U+1zSTfshvu3TjOpPrckSxmunY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KPL/iEY8nrk6fxhY0AV6HQHyyclAKSz9FgBDVYmg2cHkOANS8ggYrC8ykwlknpC9R
	 /EZzxnPh/RcveQnL9H3XiHDBUtYF+pZe+zul8tJ3+CoHt5hDpPhpQ8hNjD9D0SlluM
	 xHaTDmuShtIX+ZRnRzwUGv+OIUfXoJPGER0ymYd4uM/Ih0dNyIZRYq4/UU+/bAaqFd
	 T59Od+iA1h9FJuf7UQurtcXGNBNKjU6e2SshvTkCthlh6+W9tYvIkX3viv78U3Rl9g
	 0NYHMHGS+Jsx/3ZC/2MTWCfpUl0ED4Y90qNyoKpYT69UTR6gphElinlVPKDJ4vUeTm
	 6jmGVIL68RPgw==
Message-ID: <f05953a93fb8f250f4da7c3384b6e1c43c7b1605.camel@collabora.com>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: dec: Fix 4K frame size
 enumeration
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org,  linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Date: Mon, 27 Jun 2022 15:28:42 -0400
In-Reply-To: <CAGXv+5GA04LBN0bnLDdL8g_+_8HXpc-KwtPxpXyXi_WgUOPrtQ@mail.gmail.com>
References: <20220627112402.2332046-1-wenst@chromium.org>
	 <20220627112402.2332046-2-wenst@chromium.org>
	 <f5e68826df868ae5a3cd5737fd9d7f7683bbad73.camel@collabora.com>
	 <CAGXv+5GA04LBN0bnLDdL8g_+_8HXpc-KwtPxpXyXi_WgUOPrtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_122858_474738_F6FAAC94 
X-CRM114-Status: GOOD (  41.08  )
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

Le mardi 28 juin 2022 =C3=A0 00:08 +0800, Chen-Yu Tsai a =C3=A9crit=C2=A0:
> On Mon, Jun 27, 2022 at 11:32 PM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > Hi Chen-Yu,
> >=20
> > Le lundi 27 juin 2022 =C3=A0 19:23 +0800, Chen-Yu Tsai a =C3=A9crit :
> > > This partially reverts commit b018be06f3c7 ("media: mediatek: vcodec:
> > > Read max resolution from dec_capability"). In this commit, the maximu=
m
> > > resolution ended up being a function of both the firmware capability =
and
> > > the current set format.
> > >=20
> > > However, frame size enumeration for output (coded) formats should not
> > > depend on the format set, but should return supported resolutions for
> > > the format requested by userspace.
> >=20
> > Good point. Though, I don't see any special casing for the CAPTURE case=
. As this
> > HW does not include a scaler, it must only return 1 resolution when bei=
ng
> > enumerated for CAPTURE side (or not implement that enumeration, but its
> > complicated to half implement something in m2m). The return unique size=
 should
> > match what G_FMT(CAPTURE) would return.
>=20
> There are no frame sizes added for the capture formats, so this function
> effectively returns -EINVAL for any of them. This is also what rkvdec
> does: it only looks through the list of coded formats.

This is effectively against the spec, ENOTTY would be the only alternative =
to
not implementing both sides. Though, I'll agree with you, this bugs predate=
s
anything here. Perhaps you could at add MM21 to the switch and returns ENOT=
TY
there ?

>=20
> Also, struct v4l2_frmsizeenum does not have a field saying whether it's
> capture or output side; it simply specifies a pixel format.

Acked.

>=20
> >=20
> > >=20
> > > Fix this so that the driver returns the supported resolutions correct=
ly,
> > > even if the instance only has default settings, or if the output form=
at
> > > is currently set to VP8F, which does not support 4K.
> > >=20
> > > Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution fr=
om dec_capability")
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c    | 2 --
> > >  .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    | 7 +++++=
++
> > >  2 files changed, 7 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c =
b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > > index 5d6fdf18c3a6..fcb4b8131c49 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > > @@ -595,8 +595,6 @@ static int vidioc_enum_framesizes(struct file *fi=
le, void *priv,
> > >               fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > >               fsize->stepwise =3D dec_pdata->vdec_framesizes[i].stepw=
ise;
> > >=20
> > > -             fsize->stepwise.max_width =3D ctx->max_width;
> > > -             fsize->stepwise.max_height =3D ctx->max_height;
> > >               mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
> > >                               ctx->dev->dec_capability,
> > >                               fsize->stepwise.min_width,
> > > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_st=
ateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless=
.c
> > > index 16d55785d84b..9a4d3e3658aa 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless=
.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless=
.c
> > > @@ -360,6 +360,13 @@ static void mtk_vcodec_add_formats(unsigned int =
fourcc,
> > >=20
> > >               mtk_vdec_framesizes[count_framesizes].fourcc =3D fourcc=
;
> > >               mtk_vdec_framesizes[count_framesizes].stepwise =3D step=
wise_fhd;
> > > +             if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_D=
ISABLED) &&
> > > +                 fourcc !=3D V4L2_PIX_FMT_VP8_FRAME) {
> > > +                     mtk_vdec_framesizes[count_framesizes].stepwise.=
max_width =3D
> > > +                             VCODEC_DEC_4K_CODED_WIDTH;
> > > +                     mtk_vdec_framesizes[count_framesizes].stepwise.=
max_height =3D
> > > +                             VCODEC_DEC_4K_CODED_HEIGHT;
> > > +             }
> >=20
> > I don't particularly like to see this special cased check being added i=
nto
> > multiple places. Its also in your patch 2, and I think it exist in a th=
ird
> > place. Could it be possible to have an internal helper to ensure we don=
't
>=20
> It's also in s_fmt(), so touched on in patch 4. I could also rewrite it s=
o
> only this spot has the special case, and all the other places look though
> mtk_vdec_framesizes to get the maximum, like what I did for try_fmt in
> patch 3. What do you think?

I don't have a strong opinion, could be a totally internal (and unrelated t=
o any
ioctl naming) helper that does the right thing.

>=20
> Ultimately I think it would be better to move framesizes into the
> (driver-specific) pixel format data structure. That is a bigger refactori=
ng
> than a simple fix though.

Agreed.

>=20
> > duplicate this logic ? Somehow, it seems there is something in common b=
etween
> > set_default, try_fmt and this code.
>=20
> Yes. That is what I mentioned in chat about refactoring the ioctls and fo=
rmat
> handling code. set_default should really not set anything format specific=
,
> but instead call set_fmt with a default format.

So if this could have a simple helper that returns the max width/height for=
 the
specified format and HW capability, I'm then fine with the series. If you c=
an
change the EINVAL (which means nothing is supported) into ENOTTY for the MM=
21
case, I'd also be more confortable (even though still a bit odd, but no lon=
ger a
lie).

regards,
Nicolas

>=20
>=20
> Regards
> ChenYu
>=20
> >=20
> > >               num_framesizes++;
> > >               break;
> > >       case V4L2_PIX_FMT_MM21:
> >=20


