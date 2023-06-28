Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE770EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Osa+sqzunCfgSVMTf5LNK7jPD500rEs+nNv3O7VOhU=; b=sGQ+J4cJEgbE/B6PwSfJLMctMF
	nDu64i+Eznjf5K1gMPOZjsLzrIUw1OSuKx3ZslbgmF1vshoa0GWH899JN690zzrPPwZagfaQGp5TH
	nDtibFZFV4xUqrDHlF9DRJGX1MvhrUW/g5FpRV8kqOQ0lsLhAeJVTr8xNX67OapAjXlLpB21RFMFP
	cYf75/bNaSUqe/HvFq6kWXTPmRMP1bY0I/UuR6R0YbF3oAN+k46c9dxUj7lN1einjExbPyCvkCHDo
	fjt5qwSk8/fcL6b3TJ7HWhAqP/BgjhoI0DLCmz8MMbAzvmVCsRqkDkKJK96mcb8lBRuS1am7deBXc
	YjLqwoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qES7H-00FKCF-21;
	Wed, 28 Jun 2023 10:09:39 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qES7E-00FKAb-2b;
	Wed, 28 Jun 2023 10:09:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so655671266b.2;
        Wed, 28 Jun 2023 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687946973; x=1690538973;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Osa+sqzunCfgSVMTf5LNK7jPD500rEs+nNv3O7VOhU=;
        b=JBqXHfLGZ/b6JXkE2bmBNKNSCl4IsgBxe59NraVtvAqa+FX8eqr5hPftgi8tgbbsC4
         ehTt208s+MGm2bNpm9J7fPORw11So39eQp6eGcuulfjhJQvugxOFt79zRo+HyQ1w55Qv
         bQ/S+7+foVtTijdEoNcEN0HnnLnlSKNXAauwHlnhA2jatUO2DM7cFOe0WhN8+gmVz+sQ
         RggctWprYR+9uSX7yr7HsC8AGP6KBrJlRFvBWV8jXZ8+VqxU95m234hofEQpFw5us7UI
         +M46nV2xcOVEVOH+h2LbZLCvbXm10a/K8N9HCoewSsbpGngO96b0d1zw45SYvfLJwA2w
         yezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687946973; x=1690538973;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Osa+sqzunCfgSVMTf5LNK7jPD500rEs+nNv3O7VOhU=;
        b=MTg/BBPN7Yms3F09YHD7Ft7i51xfF3h+geZyvvekKHxzhN4aFbrbllNxD/hf/T0mmR
         5L9jvdxqZi3lFnZtTTWyWsvMETHaioX/xTZaaqGPrRxvAvKjRUBC1gUDakVdHalpQBvw
         hT1y955uGHaR8c4ulcA4ej610KTenYCW6itJHrLqdlw0K2XUTy4UvGBFe2NvQDUkXE8f
         84FTw0rHXpckBCoR4b73qgvP4zRTfNzxTz+ga197amp9WcHXqFVXd1e0SrCPjEnBFBzJ
         TLAzvsxYlYYLNSLhSRNoPHrW1lkkhzQ/+VO/n5h5OmHL5xTmw6klrfYT4OHHlfBfyn+e
         1wjQ==
X-Gm-Message-State: AC+VfDwYFAbhJTGKbiQEELyboGjnv8pnWLBmxcf/Jc2/fCokWk4J0P4y
	/Ypduw68T/t1sUUGohfOBSV3srkcoVHUfqTdaL8=
X-Google-Smtp-Source: ACHHUZ4hV0XF9mN/Yy7HZaehKx5DaM6NMZQ2Ggx6m6TRWZMsZVTRBKRzapqwf+mEqU8SM4IFLM92V+FRAoLJCQobX+Q=
X-Received: by 2002:a17:906:80d0:b0:98d:e7e3:5ab7 with SMTP id
 a16-20020a17090680d000b0098de7e35ab7mr9123961ejx.11.1687946973053; Wed, 28
 Jun 2023 03:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230627082731.1769620-1-yqsun1997@gmail.com> <20230627140640.GA3605278@gnbcxd0016.gnb.st.com>
 <CAA0BgY_Lj+hQdevrgK8y=wLztddnh+npP-hWz_XaPbi-5mzwnQ@mail.gmail.com> <20230628063353.GA3625616@gnbcxd0016.gnb.st.com>
In-Reply-To: <20230628063353.GA3625616@gnbcxd0016.gnb.st.com>
From: sun yq <yqsun1997@gmail.com>
Date: Wed, 28 Jun 2023 18:09:22 +0800
Message-ID: <CAA0BgY_1Rn4LJ4NM7ZMNgG1K-V9Uy0HTi6bMg_o3cPDWj7NfKQ@mail.gmail.com>
Subject: Re: [PATCH] OOB read and write in mdp_prepare_buffer
To: sun yq <yqsun1997@gmail.com>, mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 499671216@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_030936_840359_566DA363 
X-CRM114-Status: GOOD (  32.52  )
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

Hi Alain,

May I ask if you are the person involved in the code?We should  listen
to the opinions of the code owner.

On Wed, Jun 28, 2023 at 2:34=E2=80=AFPM Alain Volmat <alain.volmat@foss.st.=
com> wrote:
>
> Hi,
>
> On Wed, Jun 28, 2023 at 07:28:54AM +0800, sun yq wrote:
> > Hi,
> > Because there are many functions using the plane, increasing the max
> > number of the plane is to maximize the solution to all possible oob
> > places.
>
> I don't think it is the right approach then.  If the HW is only handling
> 3 planes, there should be no reason to have to allocate for 8 planes.  I
> suspect that this 8 value is coming from the maximum allowed plane
> number in V4L2 right ?
> INHO driver should simply be fixed to ensure that num_plane won't go
> higher than the real number of plane allocated in the structures.
> It should be possible to get the num_plane value from the format
> selected.
>
> Alain
>
> >
> > On Tue, Jun 27, 2023 at 10:06=E2=80=AFPM Alain Volmat <alain.volmat@fos=
s.st.com> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Jun 27, 2023 at 04:27:31PM +0800, yqsun1997@gmail.com wrote:
> > > > From: yqsun1997 <yqsun1997@gmail.com>
> > > >
> > > > Because format in struct img_image_buffer max index is IMG_MAX_PLAN=
ES =3D=3D3,
> > > > The num_planes max index is 8.so will be OOB like in mdp_prepare_bu=
ffer.
> > >
> > > Similarly as your other patch, could you describe why you need to
> > > increase the IMG_MAX_PLANES while I suspect your driver only needs to
> > > deal with 3 planes.  While the maximum num_planes value that can be
> > > given by the user is 8, this has to be first compared to the configur=
ed
> > > format prior to reaching this function.
> > >
> > > >
> > > > static void mdp_prepare_buffer(struct img_image_buffer *b,
> > > >                                struct mdp_frame *frame, struct vb2_=
buffer *vb)
> > > > {
> > > >         struct v4l2_pix_format_mplane *pix_mp =3D &frame->format.fm=
t.pix_mp;
> > > >         unsigned int i;
> > > >
> > > >         b->format.colorformat =3D frame->mdp_fmt->mdp_color;
> > > >         b->format.ycbcr_prof =3D frame->ycbcr_prof;
> > > >         for (i =3D 0; i < pix_mp->num_planes; ++i) {
> > > >                 u32 stride =3D mdp_fmt_get_stride(frame->mdp_fmt,
> > > >                         pix_mp->plane_fmt[i].bytesperline, i);
> > > >
> > > >                 b->format.plane_fmt[i].stride =3D stride;  //oob
> > > >                 ......
> > > >
> > > > Signed-off-by: yqsun1997 <yqsun1997@gmail.com>
> > > > ---
> > > >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h b=
/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > index ae0396806..e2e991a34 100644
> > > > --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > @@ -11,7 +11,7 @@
> > > >
> > > >  #define IMG_MAX_HW_INPUTS    3
> > > >  #define IMG_MAX_HW_OUTPUTS   4
> > > > -#define IMG_MAX_PLANES               3
> > > > +#define IMG_MAX_PLANES               8
> > > >  #define IMG_MAX_COMPONENTS   20
> > > >
> > > >  struct img_crop {
> > > > --
> > > > 2.39.2
> > > >
> > >
> > > Regards,
> > > Alain

