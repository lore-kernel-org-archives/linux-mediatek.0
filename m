Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317DAC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 12:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5iQ77oe1JgmhvYa3Us+B5CazhxOGmyhVSfoeL9ANaw=; b=3Z2KkLeEv6RbQa
	rlDTxpdPqv13h8TjgvLdZXttavdZe8zdflzvvukj56HnDqVRfrgKckbAR3R33Eegj6qKh26PXK7vE
	MS7B4bwzof4ki/q8KTY2HIlwRVKHpDZxHfzo4YsVVgghfhQU3LqyfIlD4ce/CP2PiiD7Gz/YRN4wg
	HwXi0OHps0oRsfBCFGRedK40I5W+LkgXPXIsBKCKP04ttnwMA0X1buo09cH9HNhma79NM3UAxB+7Q
	76N0lYLK/3M6qLXS7nQb+JE8Ok8fyhBm8Nwdyih0HlVQDE566rY5mrT/w6YccWuVFyR++qNscrGYy
	qHfK8lUK23tqPveHBEBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIzY-006rTE-R0; Wed, 16 Feb 2022 12:01:04 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKIzI-006rMO-Mo; Wed, 16 Feb 2022 12:00:51 +0000
Received: by mail-qv1-xf35.google.com with SMTP id fh9so1849277qvb.1;
 Wed, 16 Feb 2022 04:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cQvOjIROjp4zDNuMZYbqh86L4m+vxJGvKJ604jfTJTw=;
 b=N9wnl8+At1bfN/IgY71qE/9enXNC/I0uomEOiyCqHs1huRf80v1vPyf1KPwTBtuuMY
 ySRrLpd/13BnMtPnT7dsgCj7vksrB9Vnz5k521h31u402pz97WT/nQvNlr7HCmrEk5Jd
 S8QvmdldTCng6bBWqBb9wbHuEGB687ESAVndbnYFA3Ic7aaUpeTGW3Pil6EbgJ3yw84R
 GILrnTSmsLHTiUVrt79J9hMQqfjtojnyiim9lpVXK9cSf9sUTip3OqGYZkBMxYDh03yi
 MJ3IwWCRgjUyTDySrE7H66awu/k+u62bEdMul20Kqp+EOUn6qGgKHBaI99awmFHe8Cc0
 3n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cQvOjIROjp4zDNuMZYbqh86L4m+vxJGvKJ604jfTJTw=;
 b=ZGD2TjYhjlmt803evFG/g5LpDKDYmEPRLrZuDaHQt0wO1F5tFqx3O1o0LHbjqr9TfO
 7PVMsT4J30Kx1W2HmAcBj4F9Nqqjl0LYH1BVp5WDrJjZnL6fqlFMqnX3jRSp5hwSPEww
 LqvL9BRgaseHvR+7ey0ec7W4PSzgQEkhOpZnh23T5QfuQJhAwbd+IHs6QxZ3Uxvnyxso
 b67yPFROcurie7fC5T5Las0b9NfkAIwMpFfqNSYpvhZoxOONWTeTXQYLfmaLqTzRmo2z
 yuC1o5AA97xRn/Q3hRf/Jv54fghh/z8eZ8xGrxebkTz2vwf9Sxp7CBCbhEgY/Cst5L7k
 uUkw==
X-Gm-Message-State: AOAM5304tWT2rU5pkXqvezZKtdB/D5cgLAY8JbuuWmME7JV51ba42qdU
 vitcr2R6p5twxjZvjQETVjIiErl9U4sXC7sLUgA=
X-Google-Smtp-Source: ABdhPJwg7yjA4t72Kpkib54Bk/3LZCXg5ZKFnD3VS3sB64mSjOVkkzuHZ7deSjR6ZyjiByrca9BkgKOtd/mBXxfw0Cc=
X-Received: by 2002:ad4:58af:0:b0:42c:33e5:ddda with SMTP id
 ea15-20020ad458af000000b0042c33e5dddamr1483996qvb.27.1645012843985; Wed, 16
 Feb 2022 04:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
In-Reply-To: <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 16 Feb 2022 12:00:32 +0000
Message-ID: <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Simon Ser <contact@emersion.fr>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 LAKML <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_040048_756924_A3244831 
X-CRM114-Status: GOOD (  44.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 15 Feb 2022 at 16:37, Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, February 15th, 2022 at 15:38, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > On Tue, 15 Feb 2022 at 13:55, Simon Ser <contact@emersion.fr> wrote:
> > >
> > > On Tuesday, February 15th, 2022 at 13:04, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > >
> > > > Greetings everyone,
> > > >
> > > > Padron for joining in so late o/
> > > >
> > > > On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > > > >
> > > > > drm_dev_register() sets connector->registration_state to
> > > > > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > > > > drm_connector_set_panel_orientation() is first called after
> > > > > drm_dev_register(), it will fail several checks and results in following
> > > > > warning.
> > > > >
> > > > > Add a function to create panel orientation property and set default value
> > > > > to UNKNOWN, so drivers can call this function to init the property earlier
> > > > > , and let the panel set the real value later.
> > > > >
> > > >
> > > > The warning illustrates a genuine race condition, where userspace will
> > > > read the old/invalid property value/state. So this patch masks away
> > > > the WARNING without addressing the actual issue.
> > > > Instead can we fix the respective drivers, so that no properties are
> > > > created after drm_dev_register()?
> > > >
> > > > Longer version:
> > > > As we look into drm_dev_register() it's in charge of creating the
> > > > dev/sysfs nodes (et al). Note that connectors cannot disappear at
> > > > runtime.
> > > > For panel orientation, we are creating an immutable connector
> > > > properly, meaning that as soon as drm_dev_register() is called we must
> > > > ensure that the property is available (if applicable) and set to the
> > > > correct value.
> > >
> > > Unfortunately we can't quite do this. To apply the panel orientation quirks we
> > > need to grab the EDID of the eDP connector, and this happened too late in my
> > > testing.
> > >
> > > What we can do is create the prop early during module load, and update it when
> > > we read the EDID (at the place where we create it right now). User-space will
> > > receive a hotplug event after the EDID is read, so will be able to pick up the
> > > new value if any.
> >
> > Didn't quite get that, are you saying that a GETPROPERTY for the EDID,
> > the ioctl blocks or that we get an empty EDID?
>
> I'm not referring to GETPROPERTY, I'm referring to the driver getting the EDID
> from the sink (here, the eDP panel). In my experimentations with amdgpu I
> noticed that the driver module load finished before the EDID was available to
> the driver. Maybe other drivers behave differently and probe connectors when
> loaded, not sure.
>
I see thanks.

> > The EDID hotplug even thing is neat - sounds like it also signals on
> > panel orientation, correct?
> > On such an event, which properties userspace should be re-fetching -
> > everything or guess randomly?
> >
> > Looking through the documentation, I cannot see a clear answer :-\
>
> User-space should re-fetch *all* properties. In practice some user-space may
> only be fetching some properties, but that should get fixed in user-space.
>
> Also the kernel can indicate that only a single connector changed via the
> "CONNECTOR" uevent prop, or even a single connector property via "PROPERTY".
> See [1] for a user-space implementation. But all of this is purely an optional
> optimization. Re-fetching all properties is a bit slower (especially if some
> drmModeGetConnector calls force-probe connectors) but works perfectly fine.
>
Looking at KDE/kwin (the one I'm running) - doesn't seem like it
handles any of the three "HOTPLUG", "PROPERTY" or "CONNECTOR" uevents
:-\
Skimming through GNOME/mutter - it handles "HOTPLUG", but not the optional ones.

Guess we're in the clear wrt potential races, even though the
documentation on the topic is lacklustre.

> It would be nice to document, if you have the time feel free to send a patch
> and CC danvet, pq and me.
>

Doubt I will have the time in the upcoming weeks, but I'll add it to
my ever-growing TODO list :-P

Thanks
Emil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
