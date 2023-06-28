Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99306EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAqBDel36UtyC93AQGUxY3WIqcnDnwpdxhq+9skbAEY=; b=qpMgr6UpRk5jxGA7T7OYaaggCa
	o/wacFReJuf8dHO46eChGc1dMieHYvq2Vp4/JznvIS7o1CyzR+1ZWgi36bL7NwwD6WzSSVsYhU+BW
	cGmoeAlOy8Af4ZUTTkRjW5kMDqexojIHpCBNA2NOfLMv0Al0aNKfVrmRnIkXBHUV6tvY5Hoy6Un/m
	XlPxuV9kPWs3wn2H+14M7h+jowbqrGdi8xvpUb+BSQ6vkL/rBwALsgmqSrbzWhIijnUh7RRkIDFOF
	ED25GuN+8WLq8dXJYb5H4bzh6dOFrqrDdepGYmt8O/1kiSyt3U9owo+ONVLqN6JrK94RztJCxE/Ch
	HoMOopSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWrS-00Fwgh-3C;
	Wed, 28 Jun 2023 15:13:38 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWrP-00Fwfe-0w
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 15:13:36 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-44363f4f128so787423137.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Jun 2023 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687965213; x=1690557213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAqBDel36UtyC93AQGUxY3WIqcnDnwpdxhq+9skbAEY=;
        b=aO3E1RckbJtGlyqgqECmya4wwyfLTWQtVCXyMbW3No0n0HAXZvIA1IfvkvoKQ09579
         PuOszq0niqkMeI8fAsu2VFD4YWXFez7Y4za5tiBqKX1qiD9Xpu4/lkL65noHpe9wEDga
         fu9ROeYX4WiO+1IjuyKd8obvcfutZ4Y54M9yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687965213; x=1690557213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAqBDel36UtyC93AQGUxY3WIqcnDnwpdxhq+9skbAEY=;
        b=ZRWQDyPUgfc7SB37EWlfcq/2aL7PRqF1pntyK35s4IRBc//zvAZnvFIubUugefVvCQ
         M3G4Mz/HhqAJF5RybAOr9Nb+GfkSyrmoFXU0x9L+dEiGcHsnnNSwWncqSrCv/biyxB8C
         ZLiBCELWECoLQo33uA49rSgB3MS1rl71lcjaYiqBcQM4GwQANJF+Aa4uQEonJf4wZJQg
         HGe+9msy2Jaog3/L5GUWI6Clh/iekU9/RcjQMOJxKSPTuuJjH9Up6WW8rh07c11EcVjL
         pVVOWFtdVTIXFnmndQWi8QhPH+9/eFS5rjk4FR/YZdXgEojANhtEba0RdXPyhR5j8mh/
         cuZQ==
X-Gm-Message-State: AC+VfDww5OgrXcCim+0F9QHDboYm6RnF6hp9JigsVTUpj/q6Mu33Mc0x
	so1zoYJyo5CJXg/bpsqPEHfnXaaeD0m5sCSvoQLE+g==
X-Google-Smtp-Source: ACHHUZ5mfBvnkLt2XEjYwZMLrJnfmPDvIEKt2VTsaqJFS/HCQhReZM8gwfbAuFny8jkvvno8JnRdXCohfAO3ax/J5ZI=
X-Received: by 2002:a05:6102:3f94:b0:439:3e26:990e with SMTP id
 o20-20020a0561023f9400b004393e26990emr671023vsv.6.1687965213350; Wed, 28 Jun
 2023 08:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230627082731.1769620-1-yqsun1997@gmail.com> <20230627140640.GA3605278@gnbcxd0016.gnb.st.com>
 <CAA0BgY_Lj+hQdevrgK8y=wLztddnh+npP-hWz_XaPbi-5mzwnQ@mail.gmail.com>
 <20230628063353.GA3625616@gnbcxd0016.gnb.st.com> <CAA0BgY_1Rn4LJ4NM7ZMNgG1K-V9Uy0HTi6bMg_o3cPDWj7NfKQ@mail.gmail.com>
In-Reply-To: <CAA0BgY_1Rn4LJ4NM7ZMNgG1K-V9Uy0HTi6bMg_o3cPDWj7NfKQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Jun 2023 17:13:19 +0200
Message-ID: <CAGXv+5FZYjsMUOb71ZCnYif3FZZ14LDzsGV86myLsUwSAtETpA@mail.gmail.com>
Subject: Re: [PATCH] OOB read and write in mdp_prepare_buffer
To: sun yq <yqsun1997@gmail.com>
Cc: mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 499671216@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_081335_347950_CFD4C5E8 
X-CRM114-Status: GOOD (  35.20  )
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

On Wed, Jun 28, 2023 at 12:09=E2=80=AFPM sun yq <yqsun1997@gmail.com> wrote=
:
>
> Hi Alain,
>
> May I ask if you are the person involved in the code?We should  listen
> to the opinions of the code owner.

Please don't top post.

Alain has a valid point. Please describe in detail how you are running
into or detecting this problem. Are you running into this for real? Or
is this from a static analyzer? Or are you simply eyeballing the issue?


ChenYu

> On Wed, Jun 28, 2023 at 2:34=E2=80=AFPM Alain Volmat <alain.volmat@foss.s=
t.com> wrote:
> >
> > Hi,
> >
> > On Wed, Jun 28, 2023 at 07:28:54AM +0800, sun yq wrote:
> > > Hi,
> > > Because there are many functions using the plane, increasing the max
> > > number of the plane is to maximize the solution to all possible oob
> > > places.
> >
> > I don't think it is the right approach then.  If the HW is only handlin=
g
> > 3 planes, there should be no reason to have to allocate for 8 planes.  =
I
> > suspect that this 8 value is coming from the maximum allowed plane
> > number in V4L2 right ?
> > INHO driver should simply be fixed to ensure that num_plane won't go
> > higher than the real number of plane allocated in the structures.
> > It should be possible to get the num_plane value from the format
> > selected.
> >
> > Alain
> >
> > >
> > > On Tue, Jun 27, 2023 at 10:06=E2=80=AFPM Alain Volmat <alain.volmat@f=
oss.st.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Jun 27, 2023 at 04:27:31PM +0800, yqsun1997@gmail.com wrote=
:
> > > > > From: yqsun1997 <yqsun1997@gmail.com>
> > > > >
> > > > > Because format in struct img_image_buffer max index is IMG_MAX_PL=
ANES =3D=3D3,
> > > > > The num_planes max index is 8.so will be OOB like in mdp_prepare_=
buffer.
> > > >
> > > > Similarly as your other patch, could you describe why you need to
> > > > increase the IMG_MAX_PLANES while I suspect your driver only needs =
to
> > > > deal with 3 planes.  While the maximum num_planes value that can be
> > > > given by the user is 8, this has to be first compared to the config=
ured
> > > > format prior to reaching this function.
> > > >
> > > > >
> > > > > static void mdp_prepare_buffer(struct img_image_buffer *b,
> > > > >                                struct mdp_frame *frame, struct vb=
2_buffer *vb)
> > > > > {
> > > > >         struct v4l2_pix_format_mplane *pix_mp =3D &frame->format.=
fmt.pix_mp;
> > > > >         unsigned int i;
> > > > >
> > > > >         b->format.colorformat =3D frame->mdp_fmt->mdp_color;
> > > > >         b->format.ycbcr_prof =3D frame->ycbcr_prof;
> > > > >         for (i =3D 0; i < pix_mp->num_planes; ++i) {
> > > > >                 u32 stride =3D mdp_fmt_get_stride(frame->mdp_fmt,
> > > > >                         pix_mp->plane_fmt[i].bytesperline, i);
> > > > >
> > > > >                 b->format.plane_fmt[i].stride =3D stride;  //oob
> > > > >                 ......
> > > > >
> > > > > Signed-off-by: yqsun1997 <yqsun1997@gmail.com>
> > > > > ---
> > > > >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h=
 b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > > index ae0396806..e2e991a34 100644
> > > > > --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > > @@ -11,7 +11,7 @@
> > > > >
> > > > >  #define IMG_MAX_HW_INPUTS    3
> > > > >  #define IMG_MAX_HW_OUTPUTS   4
> > > > > -#define IMG_MAX_PLANES               3
> > > > > +#define IMG_MAX_PLANES               8
> > > > >  #define IMG_MAX_COMPONENTS   20
> > > > >
> > > > >  struct img_crop {
> > > > > --
> > > > > 2.39.2
> > > > >
> > > >
> > > > Regards,
> > > > Alain
>

