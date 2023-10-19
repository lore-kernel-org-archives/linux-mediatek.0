Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8589CCDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 06:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+5ze7EgUmEoyOeU1Hr4G9W5HRmWQeRvGRnsz9mRHI8=; b=SFu0Q/K97zIej8Pc4xhFQvQcu2
	QS0HEY+KgiYsAmV1taUQbJKCBVoGRxgw2PXRrrMYARri7aNHPIFM616GC7HnR/Nt/r6orkjAVG6ae
	r41zrR/PHdLiIMEgejWD4Cro+RLbl0mPRI1Z/KCG/LC6uKNiMEeeeffi5niUcKSjvcgIFEmvsLBVJ
	8p/RFMo6dLHTjdgw6Vt9rUsxuqY8oIUnGsmmwCgLJc6kc8gZuXjYhLpyv8epjRvFYnMxzcDIlxpff
	jXJD2U28GBVAAGCly21CsTKc+j2hokxdgeCDhkK4ABminF98K6zlyTvJlFazp1lze/h2qKgiZxzHa
	B0XvWDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMVM-00GVb0-1P;
	Thu, 19 Oct 2023 06:27:36 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMVI-00GVZN-0t;
	Thu, 19 Oct 2023 06:27:34 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-57de6e502fcso4427196eaf.3;
        Wed, 18 Oct 2023 23:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697696849; x=1698301649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+5ze7EgUmEoyOeU1Hr4G9W5HRmWQeRvGRnsz9mRHI8=;
        b=HW9wD8bFQv8A/egVA2FjAnnB2IGmt3wC6Q+TTmjHv2B4fC+Ut6W67i7dRbIkqhtxTM
         Qo9vcbE0dOcH9MRQzzCAZ483kV2eld5Nd5Xs75vV9LLMfpHwVjrVEl19BrunAHRSbwmN
         QnV4ZQVlkeq2lA0EmsbpEd0hIA3Wg6R3OBxL7NiXgjDJI0BJrPZf4BXnJ9AoTh9HaGvi
         cPclFI+8NvhkaLwShBxBnzlanJ+LX+REWVd1Kze4+CtTGleQbIBy/RuqsU1b9A37nupl
         PADO/CF+H5jCMxz+XDFjUqybwIa87CGk9h4GasRS8xEu5+h9cj8RRSMUbfTT3HJOVQW3
         Hh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697696849; x=1698301649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+5ze7EgUmEoyOeU1Hr4G9W5HRmWQeRvGRnsz9mRHI8=;
        b=ZZTgKvzN6FRaSvS9G31RGds7wtSuBGoX8n46Ikla6+kYRjoDC+ctnaq1/LDLDawrWn
         89SqmUCEg5Yb+BtwEq5tU1FmV99FHpyAFbQeR/tsWkUCaXIjG24ux7+o5OgFDgpV122y
         siHcnHRjF3rXv0hlOwIM5HE58MhoihazO2r1oNrZQSmlrdkIMyWDaaA4jZT6nn2eHYR9
         j1k97vINprivqcd7NWPbEUJ3zDYHiK4K8fw7rhAZfhmkD6kXFOkhPWkj+0jeTwgYPW79
         VbxjIHcepzcJGQG5XNJAXhYoRfBs2g725/p8E3J20sKLExNiK051AeGHDEYLfS1Pd4VB
         qCbw==
X-Gm-Message-State: AOJu0Yw2mQvoHlbPdAmQa8Kv+X+wYcGPmDC2hpUEBjZPoZm99hGEEP4F
	hELYMk59xJEBX+WbBQRvtLzMgYELRLJnZpw9qPpzoUVx8FA=
X-Google-Smtp-Source: AGHT+IEGy8I/zxrKECMqzHdVNgbQn02aN0QYgQK2POOraxlrYumj3TO2k7y/hknwuydp7D6I5lIhg5458b6LVoLSUcw=
X-Received: by 2002:a05:6870:7908:b0:1ea:2162:a898 with SMTP id
 hg8-20020a056870790800b001ea2162a898mr1655139oab.16.1697696848643; Wed, 18
 Oct 2023 23:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230925131720.7672-1-mark-pk.tsai@mediatek.com> <7e68377e780a2f4312a69ce8afda0cda8ad84568.camel@mediatek.com>
In-Reply-To: <7e68377e780a2f4312a69ce8afda0cda8ad84568.camel@mediatek.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 19 Oct 2023 14:27:17 +0800
Message-ID: <CAB8ipk8ELiSYc7z-wyrnD68UnfF6uQe=XDG5BYsXYPDrR2Z08Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: vfp: Add missing VFP instructions to neon_support_hook
To: =?UTF-8?B?TWFyay1QSyBUc2FpICjolKHmspvliZsp?= <Mark-PK.Tsai@mediatek.com>
Cc: "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"robin.murphy@arm.com" <robin.murphy@arm.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"xuewen.yan@unisoc.com" <xuewen.yan@unisoc.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	=?UTF-8?B?WUogQ2hpYW5nICjmsZ/oi7HmnbAp?= <yj.chiang@mediatek.com>, 
	=?UTF-8?B?546L56eRIChLZSBXYW5nKQ==?= <Ke.Wang@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_232732_312095_BB4E041C 
X-CRM114-Status: GOOD (  17.67  )
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

On Wed, Oct 11, 2023 at 10:51=E2=80=AFAM Mark-PK Tsai (=E8=94=A1=E6=B2=9B=
=E5=89=9B)
<Mark-PK.Tsai@mediatek.com> wrote:
>
> On Mon, 2023-09-25 at 21:17 +0800, Mark-PK Tsai wrote:
> > Add the missing "Unconditional Advanced SIMD and floating-point
> > instructions" in [1] to the VFP undef hook.
> >
> > This commit addresses the issue reported in [2], where
> > executing the vudot instruction on a platform with FEAT_DotProd
> > support resulted in an undefined instruction error.
> >
> > Link:
> > https://developer.arm.com/documentation/ddi0597/2023-06/?lang=3Den [1]
> > Link:
> > https://lore.kernel.org/lkml/20230920083907.30479-1-mark-pk.tsai@mediat=
ek.com/
> >  [2]
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  arch/arm/vfp/vfpmodule.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
> > index 7e8773a2d99d..b68efe643a12 100644
> > --- a/arch/arm/vfp/vfpmodule.c
> > +++ b/arch/arm/vfp/vfpmodule.c
> > @@ -800,6 +800,24 @@ static struct undef_hook neon_support_hook[] =3D
> > {{
> >       .cpsr_mask      =3D PSR_T_BIT,
> >       .cpsr_val       =3D PSR_T_BIT,
> >       .fn             =3D vfp_support_entry,
> > +}, {
> > +     .instr_mask     =3D 0xff000800,
> > +     .instr_val      =3D 0xfc000800,
> > +     .cpsr_mask      =3D 0,
> > +     .cpsr_val       =3D 0,
> > +     .fn             =3D vfp_support_entry,
> > +}, {
> > +     .instr_mask     =3D 0xff000800,
> > +     .instr_val      =3D 0xfd000800,
> > +     .cpsr_mask      =3D 0,
> > +     .cpsr_val       =3D 0,
> > +     .fn             =3D vfp_support_entry,
> > +}, {
> > +     .instr_mask     =3D 0xff000800,
> > +     .instr_val      =3D 0xfe000800,
> > +     .cpsr_mask      =3D 0,
> > +     .cpsr_val       =3D 0,
> > +     .fn             =3D vfp_support_entry,
> >  }};
>
> Could someone please kindly review this patch?
> Thanks.

I tested on unisoc sharkl3 platform, and no problems occurred.

Tested-by: Xuewen Yan <xuewen.yan@unisoc.com>

Thanks!

