Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAA3EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jun 2023 23:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTLlHzeVzmFSv260WpYR+JDo/t7d6UIr+DL3Zrgz+gI=; b=2xytNTciXlkVU+40ysOB286HaJ
	LA9VTg7pBOAfda27Jiw2lTSWMCNbDAKWyNrGe2/Pbs0CIP/+40UMzQKyAGtNBrZd6YWAU5e4KYU2l
	QcsQWNBFqVfndzAvGROiHQWGyfG+FY/IAE8EPrVXHNXRLa12KyUR0Hl9t61C6qTXw4Xd0goUINIKZ
	Xe86sHfqV8KHdZPhtqcktns4n3iL1/6tjqNcebeWUsHrZqJGU9/Ehg+YGRuOvxuaVtdyXHCwS1PBN
	g7Y1Oed2qdm/+JV14I4weu3AaknXFvT2HNFdwq1U4LOBhwhLF5+MKj4lwXpwMpiaXHmHFK+YLdxgC
	2AGqDqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEI7V-00ENQ4-1I;
	Tue, 27 Jun 2023 23:29:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEI7P-00ENOs-31;
	Tue, 27 Jun 2023 23:29:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9922d6f003cso148045866b.0;
        Tue, 27 Jun 2023 16:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687908545; x=1690500545;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTLlHzeVzmFSv260WpYR+JDo/t7d6UIr+DL3Zrgz+gI=;
        b=MkHxg/tRzu+NmFgdp1s8QcOlR/T5IbnMvr1QgwOX+u1t8EhB3hyizP2RpgcAG4vC3T
         ajsAC6ZaRgIn5odaiyB8hp3/6KBnuY7AQ/TOScjabepxp0GB8A8c6/PoSC9B6QOIQUcO
         6bPZl3rOiv0juGAr9xklhl//cvoyXntTnJJnVt9TGCdZVYStALoS7Oc5Un8FlOn/zEXA
         ajZg3DCYgnVNBP+tkGjoKfAXOEiX1dnz1Z1pNzq3xVGiu2MJjo5+Om2xyVgsvt6gQ2xA
         DeAXgUFRw0cv9YH9VbPjLpvIga4kGtKwFa/wfBfBOXOjGsvaanWcjO3XYHOtpV5g8dTZ
         pWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687908545; x=1690500545;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTLlHzeVzmFSv260WpYR+JDo/t7d6UIr+DL3Zrgz+gI=;
        b=Sxsir1TMucvgO6oOjUuwqMwZjgA4UdWm/NyA/0m5V+8P5pzTkwzA/3K3O3/7lqvQbr
         KxEbs5Yso48l14tZ3bd4mT2fTfRFKqUSx59KtZRxm78vCiNK47Py/DhJ8yGx0cxRow+A
         /aPEchlYM6CM/Yo9aR1UqULYxxhOZeT8QPAVm49haT5cWTMsbEh4TrhQiXQRYuQZ1vw7
         ogZ0w58Z54+qiXaLhG9jCZrqu4aQwtmOLqloU38xT2JK0SyZaGuiR8hQw2xlnxhi+0xi
         p4lZpmvZzLZxAMtd6ARmVsntpO0AQ0RWMsOLm3HCtx48RP1yaC3CyDNu3nDqTikZhM8S
         GiVg==
X-Gm-Message-State: AC+VfDzRx481OsjdXLVAJf+jYRP1dvk3P/U1kq9KtRt4BbEtb53SFpzl
	qEETjhagDTuONCld9/HaV//x69krDUZRD6AqJUY=
X-Google-Smtp-Source: ACHHUZ5Rigm/EiE5W1SPmoMMTSqZ/AjJAZooAxQh7MPBQadZiYJmF+ofcl6Kc3U2Dha6v/EoUNuG8B3KIvcjbuCkPZs=
X-Received: by 2002:a17:907:1b0b:b0:982:8ec0:15a3 with SMTP id
 mp11-20020a1709071b0b00b009828ec015a3mr29557553ejc.67.1687908545121; Tue, 27
 Jun 2023 16:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230627082731.1769620-1-yqsun1997@gmail.com> <20230627140640.GA3605278@gnbcxd0016.gnb.st.com>
In-Reply-To: <20230627140640.GA3605278@gnbcxd0016.gnb.st.com>
From: sun yq <yqsun1997@gmail.com>
Date: Wed, 28 Jun 2023 07:28:54 +0800
Message-ID: <CAA0BgY_Lj+hQdevrgK8y=wLztddnh+npP-hWz_XaPbi-5mzwnQ@mail.gmail.com>
Subject: Re: [PATCH] OOB read and write in mdp_prepare_buffer
To: yqsun1997@gmail.com, mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 499671216@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_162907_998620_3E965136 
X-CRM114-Status: GOOD (  21.69  )
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
Because there are many functions using the plane, increasing the max
number of the plane is to maximize the solution to all possible oob
places.

On Tue, Jun 27, 2023 at 10:06=E2=80=AFPM Alain Volmat <alain.volmat@foss.st=
.com> wrote:
>
> Hi,
>
> On Tue, Jun 27, 2023 at 04:27:31PM +0800, yqsun1997@gmail.com wrote:
> > From: yqsun1997 <yqsun1997@gmail.com>
> >
> > Because format in struct img_image_buffer max index is IMG_MAX_PLANES =
=3D=3D3,
> > The num_planes max index is 8.so will be OOB like in mdp_prepare_buffer=
.
>
> Similarly as your other patch, could you describe why you need to
> increase the IMG_MAX_PLANES while I suspect your driver only needs to
> deal with 3 planes.  While the maximum num_planes value that can be
> given by the user is 8, this has to be first compared to the configured
> format prior to reaching this function.
>
> >
> > static void mdp_prepare_buffer(struct img_image_buffer *b,
> >                                struct mdp_frame *frame, struct vb2_buff=
er *vb)
> > {
> >         struct v4l2_pix_format_mplane *pix_mp =3D &frame->format.fmt.pi=
x_mp;
> >         unsigned int i;
> >
> >         b->format.colorformat =3D frame->mdp_fmt->mdp_color;
> >         b->format.ycbcr_prof =3D frame->ycbcr_prof;
> >         for (i =3D 0; i < pix_mp->num_planes; ++i) {
> >                 u32 stride =3D mdp_fmt_get_stride(frame->mdp_fmt,
> >                         pix_mp->plane_fmt[i].bytesperline, i);
> >
> >                 b->format.plane_fmt[i].stride =3D stride;  //oob
> >                 ......
> >
> > Signed-off-by: yqsun1997 <yqsun1997@gmail.com>
> > ---
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h b/dri=
vers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > index ae0396806..e2e991a34 100644
> > --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > @@ -11,7 +11,7 @@
> >
> >  #define IMG_MAX_HW_INPUTS    3
> >  #define IMG_MAX_HW_OUTPUTS   4
> > -#define IMG_MAX_PLANES               3
> > +#define IMG_MAX_PLANES               8
> >  #define IMG_MAX_COMPONENTS   20
> >
> >  struct img_crop {
> > --
> > 2.39.2
> >
>
> Regards,
> Alain

