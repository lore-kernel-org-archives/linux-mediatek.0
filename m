Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A898C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 11:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=; b=H9R4+CT0PNdeSxQDxZkv6h10rO
	Vf998DQj0ud6n3GK6cp1mZ41XVH6jftWU35KYMJECcEQzvK3W4UUdLQyQXSV0mkbtSGmMHv9X5eJH
	IzfO+VdK0dIMA07uL9HxrQ3w3ANZulLFDRJU1vgfbIQN+LXWYEjfuhJYTS5sx+teKnUBb73u2O3ed
	Ja3npDOoSWYFjrqva6f0KOnf2sXrXgVxIkKlX7HP21myifqNwepaf6Jj8LMLElpFYdzexGapzmH6m
	gQCREz5iDIp6MfbylLgePbqvd91/qKvyE5aAukT2arxoExhT6WaP9jMRsnKKFaBHq0j9T8oQzoCDB
	nrsr54Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghBX-0000000CJYj-1Hx8;
	Mon, 06 Jul 2026 11:08:23 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghBU-0000000CJWq-2sLo
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 11:08:21 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-6651bc57458so1746942d50.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 04:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783336099; cv=none;
        d=google.com; s=arc-20260327;
        b=GHsW09OdhvdsQ6c4jeSKzegSB6zPAY571Gd/LWqwlMXvGk1z795W/lZcY+yoYAXUcj
         4RGYz+2TaqMwnfEEt7gyaT1vvLkwkWusySy/sUmEO+CTmRKR5EzF48taUdl2VT86/oHw
         JwNO1laRltNU0RC9aaviiX4Jb+xWIgL3bc//4MrAwapiHtbsxjzUu67TwL0t4f3YTv1f
         MGilvYT7Kw4sULao23+2wtQdyATUCe6uReHs6FKs/Y1V7ngmE1ajTrJmlRBC0Dv5PvCK
         3ck+6NSVpcOhOrZdY4wklMBNvWKumvRlLolWZqqUwzEKm4phVhXP8IdUiuIb7zkGXVxG
         jWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        fh=jR1ULywkxSZ/YsnNT94M9Sw3Z6g5VPEoICKg0mNRQVk=;
        b=GIjbV8PJCjpL0KnGuigOxUUeOXNjLr7QLtsCkIgxqU/hKPTRl3dDD5Qdt4P/3KxsOP
         VEFzn4kLd4FKFpO/NKdPOhc9VNdulb/TFdiM1ZT6x4OoIkkQyPjhYFJ2rsF2EuvO+C0g
         7m1a8oxdQHHrLGfgcft5rmKR7IeRZoLQFzJnF/BZtWq68vrDc+ZM085/eb346V79XtJp
         5I59Idn7hGEP0+wsDqTKfQdoyzNxGVaepm+9HffyMAbGtA4sf9RhkKl3QMH7YIURqS2/
         XdoTdXHNWkS3EfLpwbBKPvlaVoJmjTOPrGyb0Znmsc+FZin2Km9ryhtOUc5yjRd7vk0l
         YY3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783336099; x=1783940899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        b=diHDloUihjh1sy7/I7i+7UHTpVjqZHHw1aQK1qmTek3WLrvRe/Nm0jbnDfsg3Y3Hh+
         7OVulum0g22WbNkd2Y1zC68nA8m4yEtJaHdfuC1CeSH+CN+ehCVXrgRR4iQIe0bbB+rc
         qGQJAfVZ8ObzD9/a6jFPLI5280YCS8svXw728=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336099; x=1783940899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIs5mr1YlXuHrRAWD0Cvvhp1KPf82E28pNtyAHr0i7A=;
        b=meglKEm/iOcC4hX2TXoQUk7kYfTh8/2o7x7xZ6O1XftUbWFDqZUF4NTZ0oPJ1la/BC
         h7Ka2GBPXPrTMBEcdrISyT5MBE8/Fl826m8u8do/KdiBWjQciPgXQ5gQsvFqVW3dAT7L
         G04sCUquOQoKkGNEFgjGiPeUQSkcJqhfLE6Uokab2J2LfY8ZRpW+/yijL/mKSQX21UZi
         qpohZhSa5Fgk9O6Y3W1+fjchDy2o4iiSUaVPRu1EtuNfKQgjvsnIsm0kkUDysqLdeEKI
         3fDn7aWr+kLEiAEXHZpxcPPJKQxxvYqDWBYyuj25mXZFxz/efiNneQrkLRb0TZkJqSGy
         PQXA==
X-Forwarded-Encrypted: i=1; AHgh+RqDukeYWw6sj3P6aEaibJ8NVUSQ1SEkV2+MoxMlbtN1qZc6vIp++f0Swsq5luBnxP3vLYpQ6V/ZePAitMQx6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjoLSZlqYtcQxpObMEEc9HZMlFdbn1vN025avpjyo+uPgUiyGT
	HHge7rw/6/e5ZxyvU9fyeTYsHD3mnPgBhkjyu4CaIpksIRblL/vOTbFHfnXmXq3yJOdQy+OI31d
	48BD0R6N5m4jWC9ZNtYS+LjpmTLAxoZiNcvV0QxoN
X-Gm-Gg: AfdE7cnYytJdS8hj6efaeOXxkFWvxI80LJD78+xWcyWbmZ6KE4uX1stkmUaGiBgRB5p
	xVgEroM8oeSzngHsbn7baRinS/hnOsjRL4vFBOH9KGkZegfsz9ML4XTUw/EjQRVCTq4UOJCR01o
	Sa/EP1U39EHLju04LfEW4MwuQUJUbvg7WqfXLk9hHBQPv1+yfCk4gyJdt7sloLEYlLvyAebh/lY
	HgxQUHpFg2IAvTcdTALEIaUWnrdKU39q6H4Y+j2qcCtzwzv0j4doBIGt0ueib3i9UYjoisyOPlS
	0/GLufBHW3gd2xlSc0LbBdt0enY=
X-Received: by 2002:a53:d016:0:b0:664:c436:e525 with SMTP id
 956f58d0204a3-6677fd49ec4mr103596d50.58.1783336099517; Mon, 06 Jul 2026
 04:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local> <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
 <ake6FNy83LLtCs3b@ashevche-desk.local>
In-Reply-To: <ake6FNy83LLtCs3b@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 6 Jul 2026 19:08:07 +0800
X-Gm-Features: AVVi8CcaHXwr5vK-Mk50Hl5ytWXCTbNUaYqO2byI6p2Q5_6clKTL9yyyDNsH5MY
Message-ID: <CAGXv+5EgpizA3Pc8ScNuChPhvFKWd5F6dxB-wT4-7EwabE-9dQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_040820_735433_D2EDF3BA 
X-CRM114-Status: GOOD (  25.41  )
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

On Fri, Jul 3, 2026 at 9:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 09:17:16PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > > > usb_port_is_power_on() currently takes |struct usb_hub*|, but only =
needs
> > > > it to tell if the hub/port is SuperSpeed or not.
> > > >
> > > > In a subsequent change, usb_port_is_power_on() needs access to a pw=
rseq
> > > > state tracking field in |struct usb_port|. Either structure can be =
used
> > > > to identify whether a port/hub is SuperSpeed or not, as the field i=
n
> > > > |struct usb_port| is inherited from the hub:
> > > >
> > > >     port->is_superspeed =3D hub_is_superspeed(hub)
> > > >
> > > > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > > > |struct usb_port*| so a subsequent change can use it.
> > >
> > > At a brief look this will be the only function that takes usb_port
> > > instead of usb_hub in the entire hub.h (I don't count container_of()
> > > as a function). With that being said I would rather see it to be move=
d
> > > to port.c altogether (yes, it's more invasive change, but looks more
> > > consistent).  I would even dare to move struct usb_port (and containe=
r_of()
> > > accompanied with that) and this function to port.h. This might requir=
e
> > > a separate patch, though.
> >
> > I agree with the reasoning, especially given the function name. However
> > I wonder if it would cause problems given the linking order. I'll give
> > it a try nevertheless and report back.
>
> Thanks!
>
> In case it won't fly (but I still think it's better to split), can you at=
 least
> group usb_port APIs and struct? Means moving the proto closer to that str=
uct
> usb_port followed by container_of().

Looks like it works out fine. port.o is linked in after hub.o, so moving
the function from the latter to the former doesn't cause issues. One might
even say that it is the correct thing to do.

> > > Perhaps something like: 1) "move struct usb_port and associated APIs =
to port.h";
> > > 2) "...this patch...".

There are still some left in hub.c:

static void usb_lock_port(struct usb_port *port_dev)
static void usb_unlock_port(struct usb_port *port_dev)
static void port_over_current_notify(struct usb_port *port_dev)
static void hub_usb3_port_prepare_disable(struct usb_hub *hub,
                                          struct usb_port *port_dev)

These are used only in hub.c and moving them probably makes things
messier?

OOTH, the following bits are in port.c but declared in hub.h:

int usb_hub_create_port_device(struct usb_hub *hub,
         int port1);
void usb_hub_remove_port_device(struct usb_hub *hub,
         int port1);

Any preferences for these while we're reorganizing the code?


ChenYu

