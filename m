Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6BFCF044A
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0rHA6o7fEnKoxnbIqkjDvNg7OWynFv+yvsSWN9V+aM=; b=KVDEo2d6qmrp/Nh7CZNN4R3/cX
	FP2FAM4IinPLm+6KHXns6z+ea0rt0CMFoWGinHQSajygFdbPylndemn9ftDah1TsOd94UOC14NxzN
	cHmEiWmy5VegXYIh3hptLuqqiasZ2wYd69wvgdoYUNPZUFZgKuL+3zCDKCR8PUSQUgq/RYChHUuVg
	CE/YIbo/65+rZZorRKiDhQFMyQsA019NgXiK9YXs5trovKJIkx/hPJ8W8zbo40gOZSagNwg7hTt8R
	ru1Lts+Az+Pf39A3oE3mIWytDcqTjL9+LCDAuSJ60TPRkDZNZ2mQ7bfY93BlD8/b9WORWuAc91Uzd
	OblEli4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTtm-00000008sWp-38Rv;
	Wed, 09 Oct 2024 10:26:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTny-00000008qyD-1VB5;
	Wed, 09 Oct 2024 10:20:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AB685C5EE7;
	Wed,  9 Oct 2024 10:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AEDC4CED3;
	Wed,  9 Oct 2024 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728469229;
	bh=ImAK0CpUwm+JPbTzbW7azTUBVNfLGbvl7aS7sfbdp0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sypaa8E4XTR2h+6vO973S9djHACjIXek0KLq783ADF8tNtOe1bMZrJFf0zlt8+zSs
	 OLRAtppFEIb5Ic0mWDNDYNRaI6e9/Z7vBQGyOQ8guZklNp3J6lYVvOJPY0Nte+XhtF
	 xT1b91GGI33rYAt7gxwLcB1d3y1SBKs6bb4MxTTF1y6tGBweQi8zO12oDVI1/KpONI
	 bOJQtQv0XV690wHla57wDR2aHvoM6Up16kaIYdw6AVyfMWDvtpnERh2dLqJ6WBvkYw
	 EhkKXnH7yqObLqkMathJ5jYncRSwZXMHxI2dTYJuZPN1g66Yyks/L1YgZFWJ7ipDTo
	 JPDgtbBAM36Bg==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5e5d0a80db4so3555288eaf.3;
        Wed, 09 Oct 2024 03:20:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk3V7I2PvncIqlf4fr6Y3d/J2gZidnsGcPwLDEmLI/TTllUxCP8K8xVHJXokTwHwxI3M37nZ+nddDLT/nhJG4=@lists.infradead.org, AJvYcCVzGMRvIfC9gGq+QRAzxqY1nH09TKsgqVEiALgJdbW0nUVQ6dzFps+9GL6CPuOCAwZ+WhKd+HCU+fAQ@lists.infradead.org, AJvYcCWXqV+/m1r1aEyF4JjJoeEbRCRmNbMg/yPNt4feO4fhl6sOQHSbiVsA8AkdaH9U3jOSraVqy8lbt1oFzmsunT4g@lists.infradead.org, AJvYcCWqSFrevRpbRkC8Eb98Oilw9BZMVTmoRDJXmOtFYvNlfCMXxA1bgr6h5isGG0oWGIK1ARFWeWPksxg2@lists.infradead.org, AJvYcCXX6aQEGxZrGOXieHiR4Y2oyc7VHGGBScNxvu/TTSvn9UrZWm9ATBswSxhppYb0B9i6fETSLlfVRM5z@lists.infradead.org
X-Gm-Message-State: AOJu0YxD54b7STzieR/dtL8RtNXjpELzSmLxEceNKF50my7Gp6S2UGAd
	jIu69zeRHMOwSYvjR6FGzRxWesKD94SQohjpuAXe7qK7iyhcQb06ExfGLqUZAPQs8RNqMm/QRIl
	VWGnYDpjiE2JcEQ3f6vsnUkKL6go=
X-Google-Smtp-Source: AGHT+IF28e1A9mtOEy4wCWwLUrfMAFq/4+DT8Vi41Eljnp8AjlauSlJofg4NJprxAH2sFsPScvE36aWo6OHCPjXQ49c=
X-Received: by 2002:a05:6820:270f:b0:5e7:c925:b05 with SMTP id
 006d021491bc7-5e987aadf58mr1212364eaf.2.1728469228716; Wed, 09 Oct 2024
 03:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Oct 2024 12:20:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: Ulf Hansson <ulf.hansson@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
	iommu@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, 
	asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_032030_512998_D061FBB5 
X-CRM114-Status: GOOD (  43.24  )
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

On Tue, Oct 8, 2024 at 8:24=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.o=
rg> wrote:
> >
> > On Tue, 8 Oct 2024 at 00:25, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Ulf,
> > >
> > > On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> > > > On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > > > > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > > > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > > > > >
> > > > > > > Hello everyone,
> > > > > > >
> > > > > > > This set will switch the users of pm_runtime_put_autosuspend(=
) to
> > > > > > > __pm_runtime_put_autosuspend() while the former will soon be =
re-purposed
> > > > > > > to include a call to pm_runtime_mark_last_busy(). The two are=
 almost
> > > > > > > always used together, apart from bugs which are likely common=
. Going
> > > > > > > forward, most new users should be using pm_runtime_put_autosu=
spend().
> > > > > > >
> > > > > > > Once this conversion is done and pm_runtime_put_autosuspend()=
 re-purposed,
> > > > > > > I'll post another set to merge the calls to __pm_runtime_put_=
autosuspend()
> > > > > > > and pm_runtime_mark_last_busy().
> > > > > >
> > > > > > That sounds like it could cause a lot of churns.
> > > > > >
> > > > > > Why not add a new helper function that does the
> > > > > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy(=
)
> > > > > > things? Then we can start moving users over to this new interfa=
ce,
> > > > > > rather than having this intermediate step?
> > > > >
> > > > > I think the API would be nicer if we used the shortest and simple=
st
> > > > > function names for the most common use cases. Following
> > > > > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is =
that
> > > > > most common use case. That's why I like Sakari's approach of repu=
rposing
> > > > > pm_runtime_put_autosuspend(), and introducing
> > > > > __pm_runtime_put_autosuspend() for the odd cases where
> > > > > pm_runtime_mark_last_busy() shouldn't be called.
> > > >
> > > > Okay, so the reason for this approach is because we couldn't find a
> > > > short and descriptive name that could be used in favor of
> > > > pm_runtime_put_autosuspend(). Let me throw some ideas at it and may=
be
> > > > you like it - or not. :-)
> > >
> > > I like the idea at least :-)
> > >
> > > > I don't know what options you guys discussed, but to me the entire
> > > > "autosuspend"-suffix isn't really that necessary in my opinion. The=
re
> > > > are more ways than calling pm_runtime_put_autosuspend() that trigge=
rs
> > > > us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> > > > calling pm_runtime_put() has the similar effect.
> > >
> > > To be honest, I'm lost there. pm_runtime_put() calls
> > > __pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
> > > pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
> > > RPM_ASYNC | RPM_AUTO).
> >
> > __pm_runtime_idle() ends up calling rpm_idle(), which may call
> > rpm_suspend() - if it succeeds to idle the device. In that case, it
> > tags on the RPM_AUTO flag in the call to rpm_suspend(). Quite similar
> > to what is happening when calling pm_runtime_put_autosuspend().
>
> Right.
>
> For almost everybody, except for a small bunch of drivers that
> actually have a .runtime_idle() callback, pm_runtime_put() is
> literally equivalent to pm_runtime_put_autosuspend().
>
> So really the question is why anyone who doesn't provide a
> .runtime_idle() callback bothers with using this special
> pm_runtime_put_autosuspend() thing, which really means "do a
> runtime_put(), but skip my .runtime_idle() callback".
>
> > >
> > > >
> > > > Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> > > > during rpm_resume() too, for example. So why bother about having
> > > > "mark_last_busy" in the new name too.
> > > >
> > > > That said, my suggestion is simply "pm_runtime_put_suspend".
> > >
> > > Can we do even better, and make pm_runtime_put() to handle autosuspen=
d
> > > automatically when autosuspend is enabled ?
> >
> > As stated above, this is already the case.
>
> What really is needed appears to be a combination of
> pm_runtime_mark_last_busy() with pm_runtime_put().
>
> Granted, pm_runtime_put() could do the pm_runtime_mark_last_busy()
> thing automatically if autosuspend is enabled and the only consequence
> of it might be delaying a suspend of the device until its autosuspend
> timer expires, which should not be a problem in the vast majority of
> cases.

That said, it is likely better to avoid surprising the current users
of pm_runtime_put() and define something like

static inline void pm_runtime_touch_and_put(struct device *dev)
{
        pm_runtime_mark_last_busy(dev);
        pm_runtime_put(dev);
}

