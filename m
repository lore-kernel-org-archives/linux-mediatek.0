Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F311C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Aug 2024 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8CC5Hli2VvYPqemvO/qI3GDNvN29YYbcLL0ZYScO44=; b=AGWDqew78VhhtLaAS5rRfsPGlX
	VbRW+bGb9z0jxfNz7AdoZys7KUpz3cXTheXF2CI+dKRdWx1p15m+DzMuBVuvAttfGEv3ZOVq1PQQg
	EuNPU6/1UsCcNOsc5Pzdl7E5FhDgfxk9lQuHOF0i5Xd1dacUrzzogkbOWR20u0K818BhOGaM82UAr
	jyu1yIppL64rmHR63IUXCyq8EHd4GqL3oqVH5tcfWYSMrTAxZxrKQt7KbycITf1FrkDCtX1jZ1e5g
	Xo39VoZVpr+AIPb8axq3B1yxyUHqWbDaL59RwMd4CB8396BLZ/LEVkjYcLmIP5smzBjdGTBa6IB4o
	gfZ7ulYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sclNy-0000000E94H-0exH;
	Sat, 10 Aug 2024 12:39:54 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sclNt-0000000E92l-2S2m;
	Sat, 10 Aug 2024 12:39:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1723293583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QyH4Jwd6Yg/lZk16RtIbLj59ifl+n7IAOWwawevdrzZkyGl1vf/HWs8oVam+J1/Y0O9e5YBfwYWfvvAsltY382lXRV1NeSnrAtEkXrxfxvWwt18aV3Mud78OTpOAcijmaiCbUuOrRI/Oe/nhTRmVVJGjQj/gH3Zstv0u/vwhVuc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723293583; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x8CC5Hli2VvYPqemvO/qI3GDNvN29YYbcLL0ZYScO44=; 
	b=QlNoixQi4+N3pIHjUYAGhfZjBJsdQPo6yr08em3TTlsZGUDf6S0X7Ap91R3mcMV0/9Zs2/rBKMpKiBg+ctmqM/99FWzCsGhRv2TAsx791VA32X2UqTIFKzLO62E4IgT6Mje6Av2o4zR90sYPS3nw7WvY7tHqRHo7ZvVsBxEeths=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723293583;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=x8CC5Hli2VvYPqemvO/qI3GDNvN29YYbcLL0ZYScO44=;
	b=dnrTkd9SWhYGrJ+/Tk3ZPwexyIF2n15RKjCfxksh12KUze0cwI75TaqgT/t7W/td
	dvZ8NsNXuqDXbGA9rbMbUANzHfYttZl1YMtwK8TVRNPMGp5M8cbMMRQEHwHemP80poD
	ioKw+dOSz8vJVFaHEVfskxE34ya9ZK8JFHMjpjggv9klLmLCb9v4kFC61JLAeSF4Fr8
	fI8qQCNhCKRnmWYvVkGrRq2SlDEQ/rfPnEEk2wG0p4C9xpVu0Gf9XSc3nA57sfHXiJG
	znOxFqKoVNOcx1efLcfJX8OgeB4dhR4xSbuwuy8tae7KUHJd32r2rh9FKKz1279d/rJ
	J439K7+2HA==
Received: by mx.zohomail.com with SMTPS id 1723293581631329.92947824948465;
	Sat, 10 Aug 2024 05:39:41 -0700 (PDT)
Message-ID: <77dc97aa009ae6eb54c616ac03cd85817836f0cf.camel@icenowy.me>
Subject: Re: [PATCH 4/6] drm/imagination: Add compatible string entry for
 Series6XT
From: Icenowy Zheng <uwu@icenowy.me>
To: Frank Binns <Frank.Binns@imgtec.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, Matt
 Coster <Matt.Coster@imgtec.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "wenst@chromium.org"
 <wenst@chromium.org>,  "mripard@kernel.org" <mripard@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,  "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Date: Sat, 10 Aug 2024 20:39:31 +0800
In-Reply-To: <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
References: <20240530083513.4135052-1-wenst@chromium.org>
	 <20240530083513.4135052-5-wenst@chromium.org>
	 <efdacd820d13368816973f57c4a817e039ec4a2d.camel@imgtec.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <77dc97aa009ae6eb54c616ac03cd85817836f0cf.camel@icenowy.me>+zmo_0_
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_053949_700034_7F9D9495 
X-CRM114-Status: GOOD (  25.34  )
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

=E5=9C=A8 2024-05-31=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 11:18 +0000=EF=BC=
=8CFrank Binns=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, 2024-05-30 at 16:35 +0800, Chen-Yu Tsai wrote:
> > The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is
> > part
> > of the Series6XT, another variation of the Rogue family of GPUs.
> >=20
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > =C2=A0drivers/gpu/drm/imagination/pvr_drv.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/imagination/pvr_drv.c
> > b/drivers/gpu/drm/imagination/pvr_drv.c
> > index 5c3b2d58d766..3d1a933c8303 100644
> > --- a/drivers/gpu/drm/imagination/pvr_drv.c
> > +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> > @@ -1475,6 +1475,7 @@ pvr_remove(struct platform_device *plat_dev)
> > =C2=A0
> > =C2=A0static const struct of_device_id dt_match[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "img,=
img-axe", .data =3D NULL },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "img,power=
vr-6xt", .data =3D NULL },
>=20
> I assume that by adding this to the list of supported devices we're
> essentially
> freezing the existing uapi. This concerns me, as we've not yet
> started running
> Vulkan conformance on any Series6XT GPUs and there's a chance we may
> need to
> make some tweaks.

Is there anything in the Series 6 XT GPUs that will affect conformance
test and need new ABI to drive? Well I think the GX6250 GPU has TLA
despite AXE (and BXE) has none, but what TLA does seems to be for
transfer jobs, which we already support by using fragment pipeline?

In addition, if we add bits to the ABI, we can recognize the new ABI by
raising the version number returned by the DRM driver.

And, if my understand is right, I think we're keeping the command
stream the same among different GPUs, so if the FWIF is changed, it's
quite possible that every GPU, not only S6XT but also AXE will be
affected too.

>=20
> I'm not really sure what the accepted approach is to hardware
> enablement /
> experimental support. I'm not sure if it's sufficient to hide support
> behind a
> Kconfig option and/or module parameter or whether we just have to
> hold this
> patch back for the time being.
>=20
> Thanks
> Frank
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{}
> > =C2=A0};
> > =C2=A0MODULE_DEVICE_TABLE(of, dt_match);


