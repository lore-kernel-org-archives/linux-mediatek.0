Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AE4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gr6kaO8lgs2JpSsOljXHnmx0tv0/QeAfAFEg+jEyh9M=; b=baA6FxHUkSYFWD
	N34DlEqjxU+Oq2oKhnjhCB8F+a20yAt9DRtmhRkgkc5L/HX39vWaiGXBU5H+rjzHKPhN7fWMuD+WT
	zGqPnl+jrg7XIvTFgDzIde3aVdn4CNSg80/yMjWwn4EnOn6Jv/xd1bwM3BQeiMvlKMSHHD5dOXB6x
	QWXRmXNykJ4i1zAM8OfovF5d1uwb+W6sVe36mXWRIyyfVi5AJ4RyL7vNG47gsns+HQQ+Nf3HXUcOO
	7S0f/t43/oWIoe9e0op7wYPH21aCaIoTdL86ELb9wS+Prnsuk8LCcinKslNlqTY6UFGXqBsWKLhmZ
	u26B0DBAdWL/yhNjqOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK0pW-003gmc-AU; Tue, 15 Feb 2022 16:37:30 +0000
Received: from mail-4018.proton.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK0pQ-003gky-Bh
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 16:37:27 +0000
Date: Tue, 15 Feb 2022 16:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1644943039;
 bh=f1kG4y1Pad9UaeKLlKedqj/sm+OCsoIlrgJXYL6aSeI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=E9V91jN86xK6pzcMltPM69/bOQFFQNJV14lQwmcL2FYT3foga5gLBN44BK4oxAPri
 Vd8zuw1PuCIPGRg2//vtiVX9F2F6j/JTJL3odWwNmjV4QndYJ/cNzlL994kRk5oss4
 t+oB5svlaOh0xBX9GF7yyVj1AjeFwDYEvnfX4LlK0wXUUANzluIiX7MMssmf+EtKXg
 j3TEQWNZHHEFFnC96soVMV8mnPbtAkLt2VhY0qKE/ctXlMHsckdPLAA5vi0D16WsVW
 ELSgf6c8NzeavnNPc22BI1Gvf+qHdGR5FmKWYe1aX8Wak2lhTUG3wpbv4id1Yx/OtQ
 5XOlTjjx0fyLA==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Message-ID: <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
In-Reply-To: <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_083725_264587_C3FFD4FD 
X-CRM114-Status: GOOD (  32.58  )
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tuesday, February 15th, 2022 at 15:38, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> On Tue, 15 Feb 2022 at 13:55, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Tuesday, February 15th, 2022 at 13:04, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > > Greetings everyone,
> > >
> > > Padron for joining in so late o/
> > >
> > > On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > > >
> > > > drm_dev_register() sets connector->registration_state to
> > > > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > > > drm_connector_set_panel_orientation() is first called after
> > > > drm_dev_register(), it will fail several checks and results in following
> > > > warning.
> > > >
> > > > Add a function to create panel orientation property and set default value
> > > > to UNKNOWN, so drivers can call this function to init the property earlier
> > > > , and let the panel set the real value later.
> > > >
> > >
> > > The warning illustrates a genuine race condition, where userspace will
> > > read the old/invalid property value/state. So this patch masks away
> > > the WARNING without addressing the actual issue.
> > > Instead can we fix the respective drivers, so that no properties are
> > > created after drm_dev_register()?
> > >
> > > Longer version:
> > > As we look into drm_dev_register() it's in charge of creating the
> > > dev/sysfs nodes (et al). Note that connectors cannot disappear at
> > > runtime.
> > > For panel orientation, we are creating an immutable connector
> > > properly, meaning that as soon as drm_dev_register() is called we must
> > > ensure that the property is available (if applicable) and set to the
> > > correct value.
> >
> > Unfortunately we can't quite do this. To apply the panel orientation quirks we
> > need to grab the EDID of the eDP connector, and this happened too late in my
> > testing.
> >
> > What we can do is create the prop early during module load, and update it when
> > we read the EDID (at the place where we create it right now). User-space will
> > receive a hotplug event after the EDID is read, so will be able to pick up the
> > new value if any.
>
> Didn't quite get that, are you saying that a GETPROPERTY for the EDID,
> the ioctl blocks or that we get an empty EDID?

I'm not referring to GETPROPERTY, I'm referring to the driver getting the EDID
from the sink (here, the eDP panel). In my experimentations with amdgpu I
noticed that the driver module load finished before the EDID was available to
the driver. Maybe other drivers behave differently and probe connectors when
loaded, not sure.

> The EDID hotplug even thing is neat - sounds like it also signals on
> panel orientation, correct?
> On such an event, which properties userspace should be re-fetching -
> everything or guess randomly?
>
> Looking through the documentation, I cannot see a clear answer :-\

User-space should re-fetch *all* properties. In practice some user-space may
only be fetching some properties, but that should get fixed in user-space.

Also the kernel can indicate that only a single connector changed via the
"CONNECTOR" uevent prop, or even a single connector property via "PROPERTY".
See [1] for a user-space implementation. But all of this is purely an optional
optimization. Re-fetching all properties is a bit slower (especially if some
drmModeGetConnector calls force-probe connectors) but works perfectly fine.

It would be nice to document, if you have the time feel free to send a patch
and CC danvet, pq and me.

[1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/252b2348bd62170d97c4e81fb2050f757b56d67e/backend/session/session.c#L144

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
