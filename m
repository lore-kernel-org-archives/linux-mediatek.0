Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F79CA9EB6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 17:03:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AFB12086D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 17:03:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F4dDuyoE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yt+R8SVz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AFB12086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbbIbuuGrTZRu2UnHqfgYC4rMetcR4nW+Vx4nIbbato=; b=F4dDuyoEQLactm
	ZvGI9WMQToCzsAxtE+g355I/2Go6SEa8k62rwqIIFoCsPpZOPmdGA7yteSAOQwKYtf8KiHzgkkyhI
	jPfMAMAGlbpZoWVoz1H3VEw0dFm2VyW+ErLD8kdmMyP2gLLRYhlT/+qV1LPQiooBgkR+5jiO6VDIq
	J1yvAAQyIJvOLorAAHatAl/jvA/YfH0LFn27TGTI9NwZguFOZ2n1mjtXN/reSAzLQ2OT0DJxUsYTe
	wtRguo+S/GfzmrwgAT8YWvL/GUOXW72cSxqjWWLtiE3kSgFjdaUKq0NI0CGO5bgL5ozWPWdCrmivL
	vxNl4QGgf6HDKmwwA5JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNK37-0006px-Sj; Wed, 23 Oct 2019 17:03:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNK2r-0006ZC-3S; Wed, 23 Oct 2019 17:03:38 +0000
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA89E222D0;
 Wed, 23 Oct 2019 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571850215;
 bh=ihBP6BXDEvO8yUMGC7tug3Z2exooYjvRbgn9CV5bTLQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yt+R8SVz2QRw0MKgNErw43SEf7W63p5bM02gjWmXwwVyMkvYolLSgZIUgD97HvVo8
 0pZw+pb5YgS+2DaNTF+cVeVffCg3QWMar/Uj3LRoYtQ3/mi6XeJi+9qdYJuyl+ubZd
 grRtNhkx5jfyBJFoi/fYMbQXoP1h1zvqp4TNfsHQ=
Received: by mail-qt1-f173.google.com with SMTP id t20so33308077qtr.10;
 Wed, 23 Oct 2019 10:03:35 -0700 (PDT)
X-Gm-Message-State: APjAAAWsnIJDsVKppjPevKY8X+Ji6qTeW5Jh4Okk7oEFHE48d6TIlCig
 BDerN5pZhIi8Wab/sc11vZz6saElkmqzvr2jng==
X-Google-Smtp-Source: APXvYqydyP5/fo5/99UQI9czsCJqaOzK2MK1XOv+Xr/dtt91fbc56oj9LdcqusUtndMeC7d+VytU1zFYCVFVz2cOJ0Y=
X-Received: by 2002:ac8:293b:: with SMTP id y56mr10449944qty.224.1571850214685; 
 Wed, 23 Oct 2019 10:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-3-robh@kernel.org>
 <20191022111443.GE4756@pendragon.ideasonboard.com>
 <CAL_Jsq+kyLZ8LAVN-5UDJUy9nMLiAjN452HWg5WYAfLS7QD=Yw@mail.gmail.com>
 <20191023142844.GC1904@pendragon.ideasonboard.com>
In-Reply-To: <20191023142844.GC1904@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Oct 2019 12:03:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLTqBW8-hUbj37MKx8-8YOXwLWRSsQ5g_Jh+i86LReOmw@mail.gmail.com>
Message-ID: <CAL_JsqLTqBW8-hUbj37MKx8-8YOXwLWRSsQ5g_Jh+i86LReOmw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_100337_184516_2FB5AF9A 
X-CRM114-Status: GOOD (  31.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Sandy Huang <hjc@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 23, 2019 at 9:28 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Tue, Oct 22, 2019 at 07:42:06AM -0500, Rob Herring wrote:
> > On Tue, Oct 22, 2019 at 6:14 AM Laurent Pinchart wrote:
> > > On Mon, Oct 21, 2019 at 04:45:46PM -0500, Rob Herring wrote:
> > > > Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
> > > > drm_mode_create_dumb. This flag is for internal kernel use to indicate
> > > > if dumb buffer allocation needs a kernel mapping. This is needed only for
> > > > CMA where creating a kernel mapping or not has to be decided at allocation
> > > > time because creating a mapping on demand (with vmap()) is not guaranteed
> > > > to work. Several drivers are using CMA, but not the CMA helpers because
> > > > they distinguish between kernel and userspace allocations to create a
> > > > kernel mapping or not.
> > > >
> > > > Update the callers of drm_mode_dumb_create() to set
> > > > drm_mode_dumb_create.flags to appropriate defaults. Currently, flags can
> > > > be set to anything by userspace, but is unused within the kernel. Let's
> > > > force flags to zero (no kernel mapping) for userspace callers by default.
> > > > For in kernel clients, set DRM_MODE_DUMB_KERNEL_MAP by default. Drivers
> > > > can override this as needed.
> > > >
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Sean Paul <sean@poorly.run>
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_client.c       | 1 +
> > > >  drivers/gpu/drm/drm_dumb_buffers.c | 5 ++++-
> > > >  include/uapi/drm/drm_mode.h        | 2 ++
> > > >  3 files changed, 7 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> > > > index d9a2e3695525..dbfc8061b392 100644
> > > > --- a/drivers/gpu/drm/drm_client.c
> > > > +++ b/drivers/gpu/drm/drm_client.c
> > > > @@ -264,6 +264,7 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
> > > >       dumb_args.width = width;
> > > >       dumb_args.height = height;
> > > >       dumb_args.bpp = info->cpp[0] * 8;
> > > > +     dumb_args.flags = DRM_MODE_DUMB_KERNEL_MAP;
> > > >       ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
> > > >       if (ret)
> > > >               goto err_delete;
> > > > diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> > > > index d18a740fe0f1..74a13f14c173 100644
> > > > --- a/drivers/gpu/drm/drm_dumb_buffers.c
> > > > +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> > > > @@ -97,7 +97,10 @@ int drm_mode_create_dumb(struct drm_device *dev,
> > > >  int drm_mode_create_dumb_ioctl(struct drm_device *dev,
> > > >                              void *data, struct drm_file *file_priv)
> > > >  {
> > > > -     return drm_mode_create_dumb(dev, data, file_priv);
> > > > +     struct drm_mode_create_dumb *args = data;
> > > > +
> > > > +     args->flags = 0;
> > >
> > > I would prefer returning an error if flags is set to a non-zero value,
> > > to catch userspace errors early, but I'm also worried it would break
> > > existing userspace by uncovering existing bugs. Still, if we later add
> > > flags that userspace can set, those existing bugs will be triggered, so
> > > we'll have to deal with them anyway, and we could already give it a try.
> >
> > I would like that too, but the comment just above this code tells me
> > that's likely to break things:
> >
> >         /*
> >          * handle, pitch and size are output parameters. Zero them out to
> >          * prevent drivers from accidentally using uninitialized data. Since
> >          * not all existing userspace is clearing these fields properly we
> >          * cannot reject IOCTL with garbage in them.
> >          */
> >
> > Maybe userspace does correctly zero out input params.
>
> But if that holds true, it means that we will never be able to add
> userspace flags, as doing so could break applications for the same
> reason. The flag field should thus be marked as deprecated for userspace
> usage. I wonder how big the risk is.

Good point. I guess another option is add a WARN(flags != 0) and see
what happens.

The commit adding the comment was f60859522a83 ("drm: Sanitize
DRM_IOCTL_MODE_CREATE_DUMB input"). Maybe Thierry has some comment?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
