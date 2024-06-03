Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC876C27C4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 03:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqoXXfkLNaBeFUlnpo3xHv3wq1HsyXPs641ijeJqfYU=; b=vlg7CY8ILc+uzsOkDLQ+gbDIVt
	SOGk/rj6mbnC9Dhz4cULQHKBclGsSqVRvcVI1WtHGj3jCitP9hZAJS5url4Ns2qAXA/njMhiAQpl4
	L1hzmqaxiPjjPUk60PDI7EAyOBVIqK0xiWCxJUKFVupYKwAxP/rKqnEEnjgZ5Vvr4FvV3b7Ngk1rR
	FxZ23Dp1hQ86V/aq/EMDf3Wc70R3YjrQda6PSgohhPGL2cIqigyh7AtalvdGtx6lmv1Qh9XLDzUfc
	hFJ6JxqLlPT/4C9xHPwnTBFRKN45WBNMQnwD5R8r9d5CvT+l3LWGJxoHX6QHAFS94y6AL+xu8Z4yp
	JMBT4OXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDyNs-0000000FWvt-0deX;
	Mon, 03 Jun 2024 03:29:20 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDyNp-0000000FWuT-1QbH
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 03:29:18 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52b7c82e39eso3760577e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Jun 2024 20:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717385354; x=1717990154; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqoXXfkLNaBeFUlnpo3xHv3wq1HsyXPs641ijeJqfYU=;
        b=PKvxO0+tO2D4e2R5LRs17NSBABygKCUW3PKuLWw3ClpetFE865PSvlD+KY+/jGtUGr
         6LetrqSWN4cjNfJkSrM42r+eNKAViHnTFomncsNKrIjG5h52qhdAWVxDNBWkbCrYfCU1
         W+lGFUv3G1WUR2nvcK/4iUqfE0Rw8wMmRSuy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717385354; x=1717990154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqoXXfkLNaBeFUlnpo3xHv3wq1HsyXPs641ijeJqfYU=;
        b=ky1nZkTt3D8MfrrArJJtXhlyOEPBmkzqAnsmfL7ebCMvlDJH6zzCYlIg8vdWFWwBzm
         Vs0QMPVzKCZQ0p78QOwA1Adh21VrFg0icc2L/GBn/VhNCwnLM9Or0kCCYlH+XybkIcQG
         2bxHNWVyPkKAQV0J4AGduWq6htPNJkK8BbvvmDh9TM5nxqL+sPwXe/TEuWzX/ZpOuiDu
         oFPcKPDBD77VlwAKGFs13G0Q9Lac1wKS8tneP7MEfHJd+WNqj6DX6M6u84EN99i7pknd
         A77dMzshw48PqKXhJH16yJu0hhSGhb2ZvK6qs2z3jCbLdvpsKE/xpmbA72fJn1G09Yme
         OsJw==
X-Forwarded-Encrypted: i=1; AJvYcCUkDerRnX93FpD7NJwt0vINgzvVZQ2Netej9RQJ7Yk9JiA5NLQV1PMgfZ+NNgPxbT26m4cVTJgHCLCB0LJncx2k+rgjH+5YiJcy83B+0ZnXpKaB
X-Gm-Message-State: AOJu0Yzzmd7eoDwFfL4q5Tr2IgDeSXearSvYidyMbrYUOTPdx/gPF4wJ
	IvdIlM09NpmxNWJ8LJnMOhG4tin+NbCVfMGZCryJqQP0jlESOaCMCmL5lTJ4aAS6Q/FbxpMlQpv
	+EiOWTU5JLM8hoHDUG15L7b6+3FJbwIKJJvMO
X-Google-Smtp-Source: AGHT+IEDtRtBaOGSJnBChD4ejorRQ3d5tt8uQF6LU8aQIF4mUQzWnXLmkerka4FGapEkwbPEkl429n/sIzWje66CjaU=
X-Received: by 2002:a05:6512:3145:b0:52b:7a3d:1e12 with SMTP id
 2adb3069b0e04-52b896d9115mr5870986e87.65.1717385353646; Sun, 02 Jun 2024
 20:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-5-wenst@chromium.org>
 <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
In-Reply-To: <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 3 Jun 2024 11:29:02 +0800
Message-ID: <CAGXv+5EMMNCbxaBqiBSQwGrQt-0KXWAtJU54K20sUU8PBh8faQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/imagination: Add compatible string entry for Series6XT
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	Matt Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	"mripard@kernel.org" <mripard@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240602_202917_497932_DD7B16A7 
X-CRM114-Status: GOOD (  22.60  )
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

On Fri, May 31, 2024 at 7:18=E2=80=AFPM Frank Binns <Frank.Binns@imgtec.com=
> wrote:
>
> On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
> > of the Series6XT, another variation of the Rogue family of GPUs.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/gpu/drm/imagination/pvr_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> > index 5c3b2d58d766..3d1a933c8303 100644
> > --- a/drivers/gpu/drm/imagination/pvr_drv.c
> > +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> > @@ -1475,6 +1475,7 @@ pvr_remove(struct platform_device *plat_dev)
> >
> >  static const struct of_device_id dt_match[] =3D {
> >       { .compatible =3D "img,img-axe", .data =3D NULL },
> > +     { .compatible =3D "img,powervr-6xt", .data =3D NULL },
>
> I assume that by adding this to the list of supported devices we're essen=
tially
> freezing the existing uapi. This concerns me, as we've not yet started ru=
nning
> Vulkan conformance on any Series6XT GPUs and there's a chance we may need=
 to
> make some tweaks.
>
> I'm not really sure what the accepted approach is to hardware enablement =
/
> experimental support. I'm not sure if it's sufficient to hide support beh=
ind a
> Kconfig option and/or module parameter or whether we just have to hold th=
is
> patch back for the time being.

I guess this is more of a question for the DRM maintainers.
Added a couple Panfrost/Panthor folks for ideas.


ChenYu

> Thanks
> Frank
>
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, dt_match);

