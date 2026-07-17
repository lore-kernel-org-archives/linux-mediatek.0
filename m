Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69E0C44507
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=; b=pKr1I6B0qHMyvsDlYqW8A/8qt7
	aM9JQe/DvOePluUgOOIKq1xMHmOnqKr2M8Rb7tAZYmghwo7/y54g4CTi0uPUZh7+n0hdulVaHfJD9
	UQl09C/iS77rhzkUAWHepKxyHZ976cX5jmQGlH4WY8Wt+mDQv094J8nLXehDwzJSwD0q4WGLNq66f
	TVaBemvpiLPVf88V1TzpfPYE865pF0EIyU3QDO0a0wKY1DlsgIybODBSvDaiLYgubsOhNLYCW/Pp4
	7m4Pa/NpokWoTcPL/Ro5a2UDVv5pwqmXeDHmXq2mWC8AaqHoVymP8ZEMuPvP91LE0FVEiMsJzX5M6
	Be72Y0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke0G-00000001egd-2bH2;
	Fri, 17 Jul 2026 08:33:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke0F-00000001efS-0qs1
	for linux-mediatek@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=; b=dpQMPNictlsWgefayJ0r13SCG+
	/dTKaBxJ1igUVuUyhWP3O0rM6UjUMJiVsJUv42l4ZlyTG8y6qJKiy6OtzzUB68Zase6RJFRhGHTMX
	q3lN23BFyFJ9NNvwn533/ZrKwjUvDrDErP4e36Jfrim7qFca+f3TsVEb3s9sjZNJf9yy9KGzTPKHe
	DFRPFgVsFqJyESDxk2shjq5jh4hLKYCtR8xTDj+aPC3ZS0HUF5ZYsH1adAlLKYS85acktfu3WotOL
	Dbkthq6WpYs1xemvcoklZyElO5cjg8zVNiurR10rIchUEmjHXGx5H4dfJuRd3K3nR73/NCEbnGIzk
	r27bT5Xg==;
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wke0B-0000000Efqf-456h
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 08:33:01 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-667bae10ba3so4053133d50.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 01:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784277177; cv=none;
        d=google.com; s=arc-20260327;
        b=S+VjVhPIIUUCzKwswLeMSng61qhOBqjux+L96dDQK7JWy17Owgpp8wCQJOOPVmH9OK
         afYrc/y/LJYBGibLSyn0L1wRE04wzRnJX+TLFq6fw29jFS591dd7KNPdLyGNkipccQB2
         Xt5VstQSWWW3iytHlWXHtYFJbAoLR4iClGynaUJCIEDF4U0ST6a39UWebCDrj4Sz5zW5
         /O8hQyPfRbfW4F6BZUQh711+qs3t7jk1sC1WfcEAIllC6BXtN+YHDQ5DbAKvAQMjIJ+7
         86LJHSyRojMTwplaBj4m7TrwJFnlBGCT8y/oZkYe/VL5zppWyyNcNa9gDfnt3AVIj6Mx
         uPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        fh=I3ib1qroPgNvSQHbOONWegLeiQz2BQwaRoRrR2I4E/E=;
        b=aidIFIjWIFRS5UPpl/ssGK/I2t4gCc4KV/6Tf+E7kO1GB6iw+CzfP4BcWyVp1avECn
         UkBKdCueN8XYYqhXi4vdfeb9KPauEftfKUrd0kCc3HDYM4scft4uj180bPHAfSsHxsTd
         xCGbld7FSvqKXLMSqSImhOPoEtgHXGW1h0Sq+7URcy5PLaHjqxulE6wF458HkQPLNAT5
         f8CQTavm2ED4kXXzctlz6B3y84kj1Jb8ouIYmjeVXB1n25tpqL0h3Og/hGDfRe8226fd
         j+lgPOkHAPk33ebOvJFzvIblhy+liy/3aqO6qdt64Umj1lkQGV+e5XKeNeMeVbgYj59x
         Ox+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784277177; x=1784881977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=faF+zrQ1xK0EYUHX6g6wVKnsv4/yQ41WVGc7KEjRkgSbCXkOi9iH5Dp0oCiltULYlM
         EJeDyF+q8zVe4+IidDaZ6QHzBm+KGLlsgcGLkRTIfv7VDiVOeq0db5LXe/7xOXTXF0o/
         zRcuI4GfFoy8BvGyqEUPsa8/e/Whq0jzRBCWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277177; x=1784881977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=mO/bZYFWC3i42VaLfkyOwOMKOASH3VaG5XYCUN539516t0xX6v9vJjksZN7r4ocQGt
         yXimBp9g7+mIoTQfm8ycKbnNcgP7EDwHwptH4qoG5snWk34nhc81IayY48blaJm8H0zC
         IdVOUWixPrJ/6AAanMUaHMR6vewuTKams+c7O1ii56c9kG72rQmdxpzIbZjw7vMnCRzQ
         NYxb6d1C80J2x6uaiu0H4dg1BzuJpwvY48XXHSDLwkKqwnegsnGeglTlA/8xbFaNHTDo
         9MQnmPDow3wxsE2nTeC7mUIB9a3aboZM0CXlV7A5ouIRUKfH3MAbahMNLMauz3mto9ZS
         kuhg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4sbw9KeL+wHFBcu25RI+qHHO7MigQNIbc6+snjpMXo1Fr4lR2qclXAxY/66C0aiTLZBLpEV4Q4pNFzf3kAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU7lzlksLgSEbgRvXUC4yp4rxXi7E/ITZ51D3g+cu9jkBgjGo2
	YYassRjGON9nOORiSD8M2LXWLywW+BGqYdcrONmTVlHDp0jPipKG/rmZloRLrD9X1ToHFfNQQyh
	gjP9LWfwrfYtSksV3+16R8YzlAZK0opzf58pulYt3
X-Gm-Gg: AfdE7ckchQdGVtRral081/LIUyNi5Kb++qQ+4mIaMwgFW0Sc8NYoxGOiB35i06XtFiJ
	Lahis+i6ACbTYxH/bF+LxHOQ2mcc32Dwbu5jvKbuPyBG4varQ2xwIytx5wYfYFQuMlhKgzDFtVi
	2/yDpiqckABqmsKKZXPoSltOEvpyQuwYDyr+ESXV+Gj3I4QrXzVj9YyfAdPFWCna5kVyzKUqfx+
	0DjqWHStD7c24fs7JLCEdCquFqcaqgxSR6Fcr5sjS1+5V2h1tygQ58FqE0RrjQkNsL1FHij36Zb
	2f7mL49B1qf2
X-Received: by 2002:a05:690e:1644:b0:667:af05:2e8d with SMTP id
 956f58d0204a3-6683bde30b0mr341998d50.79.1784277176987; Fri, 17 Jul 2026
 01:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local> <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
 <alkWE-bQ9gGIXIJj@ashevche-desk.local>
In-Reply-To: <alkWE-bQ9gGIXIJj@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jul 2026 16:32:46 +0800
X-Gm-Features: AUfX_mzoGIeMcv7EV_g3RqR3VRvLvguofP9ZSODwjiLGO0JAlL2g0unPo14vZls
Message-ID: <CAGXv+5FJkmOJgpwRBp4nAea6_moF=gH6wGmNpP+g8URNd--jbQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_093300_257920_C792B014 
X-CRM114-Status: GOOD (  26.50  )
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

On Fri, Jul 17, 2026 at 1:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 06:02:38PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
>
> > > >       fwnode_handle_put(dev_fwnode(dev));
> > > > +     /* usb_hub_create_port_device() could leave an error value */
> > > > +     if (!IS_ERR(port_dev->pwrseq))
> > > > +             pwrseq_put(port_dev->pwrseq);
> > >
> > > Hmm... I would rather make pwrseq_put() NULL and error pointer-aware,=
 so
> > > it will be no-op in such cases. But I think Bart has his own opinion =
about
> > > this.
> > >
> > > >       kfree(port_dev->req);
> > > >       kfree(port_dev);
> > > >  }
> > >
> > > >               put_device(&port_dev->dev);
> > > > +             hub->ports[port1 - 1] =3D NULL;
> > > >               return retval;
> > > >       }
>
> ...
>
> > > > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
> > >
> > > > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > > > +     if (IS_ERR(port_dev->pwrseq)) {
> > > > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port=
_dev->pwrseq),
> > > > +                                    "failed to get power sequencin=
g descriptor\n");
> > > > +             goto err_put_kn;
> > >
> > > OTOH, how pwrseq can be non-NULL and at the same time port be created=
?
> >
> > I assume by non-NULL you mean returning an error?
> >
> > device_register(&port_dev->dev) is called some lines above this.
> >
> > usb_port is weird in that usb_hub_create_port_device() does a bunch
> > of stuff that is normally done in a driver's probe function. However
> > usb_port's driver is just a stub driver add for userspace compatibility
> > reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects=
").
> >
> > So at this point the usb_port device has been added to the driver model=
.
> > Or we can just zero out port_dev->pwrseq instead? I guess that is clean=
er
> > than having some weird check in the release function.
>
> So, why do we need to assign the error pointer to the field directly then=
?
> Make a local variable and assign it if and only if there is no error poin=
ter
> in it. Would it work?

That's the next thing to do on my list. :)


ChenYu

