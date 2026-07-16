Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C566C43458
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 04:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=; b=2EtcWDRzySsidXYxTe0VG35QI9
	MvugJqBmZoMVoteliYhng+MxvYO131l9OMYxLbW0r2fsLGUw9tkeSxGhH7tuIjXijiqaJCzC1615Y
	cOsqL7vtNdBDgm0VSuIKNKKTTkSL+KzBzCrGxcQ0qFoS5Ikjv5Xqn0bG1rCZP9Q++xxlyLnM0Kss9
	F0Ch/z6VMOGQ8GqE8b2/E9cZQ0gUughKAyU4Kph44cW0lowJj6Thos6UJETBMY8YxuPOBZcZ+ug5V
	BjbCMhjAWjmRiqmlVq4sAz/wvtFioLForakmmF7h+BV50cOkenPsfVPIYxkc278myRZgZr7aZtNWP
	wjjQU5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDlG-0000000GPjv-3Hx4;
	Thu, 16 Jul 2026 04:31:50 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDlE-0000000GPjA-1HKB
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 04:31:49 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-81e86df8987so85654027b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 21:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784176307; cv=none;
        d=google.com; s=arc-20260327;
        b=HQNx7VCkAx0Y34ftQdidAcZJvtKUBIjOuE8dK5bo9QZgbTQwNZ+hNVsYNP0TFueMMV
         qMpa0nTYVZLTz6Yx16fYoU2pJoONMI7df0hLPNpeUX6d+V50h7kvAPE057w14aN7E01n
         USJozVuKZJKsNrJ1dpRBeYx0QgI9ecw8kPOEWcp0DgSMext7jr/6vV818USZ5Pp/CdY2
         eccm5LnTt5G1coHJjWQCXn7WFfIqj5ioNaT+L09uap5YT48Gwai0YJ7w875J1b3Wp9ed
         rzXV7+7mdHpIQFuihrgHXhbL37tefcqSAkup46IhmjpBrNLdv5v6SautkdILoethvldk
         OsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        fh=1xg441CoOIQU/CB9pWZ3tcFup6Ith4dr3IhQoyLCqcE=;
        b=F0Ho7ITKegxZPLBuRG6yjm1CT4tbYJM6xI5SXc4C4zfyMBTBY4Dbk7vmNnzr5nmKLW
         1OiB8biNtkRBPg/VuuZaXv0tE4QCpojx88Fkshnwf8bQiNM+WUU6HLlEA4RxDmlgzJxO
         iwKr2sf/rZj/Y95eYL/lfOBoSSETjNqBdA7P95uGni9825SWsTymYvfxsyMAP+CSzwOL
         zGBd+jAhgioIObi3M2VKQXfQyEARS1flJtuTIftl73YdULjuvWDQO/xWqgtq1kHby3r4
         UHXCyixOJF2/i94juaqnhHraax91lnRe416f6VXRIJCTmiQUMgwwH/T+XVHitLcCzD3T
         9uJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784176307; x=1784781107; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=OnNPH6rjM6U2qS6HwE57ocHqcq5hYS2QtijUfN0zMD0DTEj43AdGvPT7eE0iDem4Wl
         rBmlE0oup4uvj8rI7J8YThox94/2rqguN0/MEA5eQRHk4by2yTikMm+g7xsc4fhewfY4
         ZhlmH0HJu2brzSjJs2d2GrK2EQ6Dx9UyHSa1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784176307; x=1784781107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWTekTqlq1/95QNv5fW/dcyHl3msvMXWSc0NTUyJpNA=;
        b=kx1myW0jvwsP0+z3WefLYz/BpDX9JJcusQHyTMQTd2S3ZvAlksOn2WKscYHvu0vp7z
         349TWIjeIPiKqqtssEc4aKxxtjm75Y3DCxR80H14RO5E+9rkhycbCp3vZONSUDfeXFXp
         DieiSbEAJ8ajNfcRo+lW2sqP2VODADe1HS5ONOvkEmAUsiMIRp5MZgse3Obyqn7nOPxD
         wTh4liOCdkl5hD9kx2cn/EcoQ/m2WvrR0QFno8K47nqmerOQT9Ag2RoMgfGRMxKUphXG
         BFdBfwH6v6ifkBrMjWU2+zpTIiyRxspPMuNie18ZkJj84pCdL3zy1HjBYb5XDsI4HpMR
         PMgg==
X-Forwarded-Encrypted: i=1; AHgh+RrIwioRZhrHf8q4YLAFBDHsBMAsxN9LaaXcRXXZedntSEym4SZYym6+Ex6+Ty+oIcFON+FdA/V/QsbIkwv9DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YymfxaGm6irs5TMrf0dFTGQpFU3YhqkclIDIQPXOkaCAniXXRt2
	YUiqNelbXIjnD19i7rHxDz2A9ArwBdUA+2forYLxBotRLqmjZJHlr6l1jg/uHQ/NbsMSXjLAKBs
	dfENPrynnvRwv3FY9PYs76GgwG5jmaTqXsvfx/pz0
X-Gm-Gg: AfdE7cmtdFtcZL6n4L/fR4Bcc8o9ar1bsb26grn6XJ3KdbxKIPlQYOyC3Uy3uz5PCj8
	7wtiMvzfa8UU/rcoGFH8SUOykuk5tP5HyVzmkU65IwrF24inZkYhTH2J6xrJT9nnBNFTdfCl+N1
	brE/h2cEOEe7wLLpDKLHwsoK3m3wZ8L1tsmMvsWNqI87bGW5UF+wf7WibcfHrRpRAoUZbAlc8me
	JLZc4yC5cOWD53d8aa8zWwMQtm8bNVg5BoNucIt27A00QDLNvONEU1jxkHXXlhND+VjYhmdrZEA
	c3bInBu+mWpvRUTf
X-Received: by 2002:a05:690e:1c0d:b0:668:19ff:7eff with SMTP id
 956f58d0204a3-66819ff937dmr2943635d50.38.1784176307120; Wed, 15 Jul 2026
 21:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-7-wenst@chromium.org>
 <aldQ5odptfmK5aCw@ashevche-desk.local>
In-Reply-To: <aldQ5odptfmK5aCw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:31:36 +0800
X-Gm-Features: AUfX_mzQbv55XMQ4uR8jO2hQgRvrbYnVnLlttvP6FASpWrSMQxMLCCNzy4VYT9I
Message-ID: <CAGXv+5FAHZP-u1ZyWSUkUrOx7R5-YgBs5y9V4mGTycyrJG3UKA@mail.gmail.com>
Subject: Re: [PATCH v5 06/16] usb: hub: Associate port@ fwnode with USB port device
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
X-CRM114-CacheID: sfid-20260715_213148_390334_F6975FBD 
X-CRM114-Status: GOOD (  21.93  )
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

On Wed, Jul 15, 2026 at 5:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:36PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> What about adding
>
>         struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>
> to the top of the function, and...
>
> >       port_dev->dev.driver =3D &usb_port_driver;
> >       dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
> >                       port1);
> > +     /*
> > +      * ACPI FW nodes are associated later when device_register() happ=
ens.
> > +      * Skip assigning one here to avoid potential conflicts.
> > +      */
> > +     if (!is_acpi_node(dev_fwnode(&hdev->dev)))
> > +             device_set_node(&port_dev->dev,
> > +                             fwnode_graph_get_port_by_id(dev_fwnode(&h=
dev->dev), port1,
> > +                                                         FWNODE_GRAPH_=
DEVICE_DISABLED));
>
> ...shorten this a bit to

Makes sense.

>         if (!is_acpi_node(fwnode)) {
>                 struct fwnode_handle *ep;
>
>                 ep =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_=
GRAPH_DEVICE_DISABLED);
>
> // Is NULL or error pointer is fine here to be set as fwnode in port devi=
ce?
> // Perhaps add a comment?

fwnode_graph_get_port_by_id returns NULL, but not error pointers.
And passing NULL to device_set_node() basically erases the current
associated node (which is NULL anyway, since we just created the
device) so it's a no-op. I'll add a comment.

ChenYu

>                 device_set_node(&port_dev->dev, ep);
>         }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

