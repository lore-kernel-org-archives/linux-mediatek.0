Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55396C43458
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 04:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bHz8pIdj5qCHMVmE3ZgrvqBvuIVwQ8F/DhCqlx20Pk=; b=hFUf6dnDxWbG50BQctFcTNfR5Q
	xKpwd0/30Y60uyFcCVgApxb47IyuI26o09vjhgXfl9+WPECKfT7tp+MaIf709qbM/C2DMoYIqR3PD
	ozuPEDz8wHxRuYJM7ZhO6GKKELAWPWngxjIUAGro0BCLAqu38x+Y7KDCnUyhU3Z1NN41BEdweSZeU
	0I1SAn4p2jSv8qjTF08N1A7OKvMGM/7Wz+VxZlPTb+iyEOkt5m7HfSiyrQl9tqv6FirCrQ/K9oPgc
	q1A3VhIenIfdxL7KW41v1r1OCfOsMe3ZxcVgvW/YekBxVkZ9AmLrn/nrqC9r1RpVH0uOAN5O7rVMw
	Ph5IQJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgxQt-0000000E4fu-39Ao;
	Tue, 07 Jul 2026 04:29:19 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgxQr-0000000E4fD-2shz
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 04:29:18 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-664dd23829eso3376204d50.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 21:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783398556; cv=none;
        d=google.com; s=arc-20260327;
        b=T3HM+cXo69TaXirAEfgCMI7gbEFXihIMr6tX23zvHit1jQOqUQuOXbe1Cs4G+NngFB
         oEy+y+l+ayIuASeoO+JMJvYgZfMqhp7ErxiBAgD4cBesTlNA3AzNIjQtE+oVXrUBkYTU
         FA5rino+y4qSnXl67goYbH7C9ZIgSX/EB0iC13aXE3fbywGOZnCe83lq7rOBHOJ71apk
         Jr/RH/R/aIQNZiBqRXb3h+kySdn6ONhQxwdOJAbgswWZ4NZkdLNzZtV+2lIJPg25kjfK
         ZXaZGE3XCJZUKcLHE0UCWycsDLKqdYP6QDPxg6oYwHKQ+ywbTJpZdVRzneYlk5ZnVEVw
         TBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bHz8pIdj5qCHMVmE3ZgrvqBvuIVwQ8F/DhCqlx20Pk=;
        fh=O7S7nHmG4wGfGRlZy2LAZkpRetsTHO3zHurz6+jyzVw=;
        b=Am5/ZxmC+MVGLC7xdCIUx1dFKZ27fSFDsIIofZZm8rAOKDQsdMtAuBEtWkk1WBhWdV
         v8Mndkwsv/nrIsBEWkYgV+t2gbLrdNjxEjTq8bk6RpI1V/1YrbeRFB9Dj/0opljbdg7n
         C/Fzk8COeJ8+ioZpNgvBB+LEHg8oVlw26R5moPEGdawSLmQAilX4Ej5QHQfrqw9MurG4
         gUfyT7yHF1D8M0r60J6jeZHE5yTWsTw6GTsp3XaPPgMPZSsK2sytP0FJ3Pmvns3exxuU
         SiX8SJ+Co6yjJkUKYigYHd8a0635Qe9bqQadlBDif8HEKKgvCUya8uh72A05P5tTyYq0
         tyMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783398556; x=1784003356; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bHz8pIdj5qCHMVmE3ZgrvqBvuIVwQ8F/DhCqlx20Pk=;
        b=R3v8cxWHHKs/J+OG4UUgF1wEZVIf72lMoZSaxDZF7m8s8ZRnzJvj3V0wdp4v6G2lG1
         e3OyFMCc6v+skW3gOkbuKy4w/W4qNjABdjoEXJmMNIPhlvgAOOm2UBudzk7USWL94ciX
         TjjomfQL3ZWxyS+yhc1aF3txUClFEjRLZklzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783398556; x=1784003356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bHz8pIdj5qCHMVmE3ZgrvqBvuIVwQ8F/DhCqlx20Pk=;
        b=cSxznfOsXMzJM1A7PzVLLvAeAPruHne8DiCKKryheINR/1ob2yRveFRG7RbyVpWQBa
         w4/SAhKYTvq/p03UOXw1ZFd8vjsCdsQcdVfUCY2UqsRgJBXL7ZEtiKYE2Slk9SyZGg3t
         fgspyG6+kCyOn6OnSz+zqUGlyXFly+zlifVPFsTTCm2YnDHv5LbWDon/2pL4WdYRb5hp
         hsvsalY7SznAhn6yNm3fPGquLyjHmyIIkxsbxYw2QdQoIW4Uv+O7og5hP03Huc3fMI+0
         xRkVmStFy+/ZLs+qZrMSNlK9Qo5gTag4xzKvFT61I14NGusAANVA1OChwOCAMQwnAk7p
         vG4A==
X-Forwarded-Encrypted: i=1; AHgh+RqXrHRc71WEw3JhfPOGosJC57rv82ZNQ1VT7GqKinXEY6l+1zTI3Rf99nrq1g4PwmEhTbW7HfDhry5OCl2xdg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2AvGt8zX56PLH9tlHgi4CX/mrLnsCXv9Kj37Vhbk7dEvcBZYb
	7vWEEAntSoWdoXv+/xProPXXUQnSn4OxUjIpkbr0Sc71ni7X50SXdfTgw0SJ9/vYzulsQPDizDh
	J7eoIQpDPtZ51FEUu/YvArBbrsyzL/AV74B1MRdml
X-Gm-Gg: AfdE7cnV1bmrYBQ/Bhsm33cSzib2rlmF2THatRMvybWyzUTvq8dNb5HPOLi26TDIEIU
	16YqWyfXcAQq0HLdyeRAHz7JXPaha/qbGyCvDdp8asRv77ec0XhI4+hJbLt3xD6Jf/fqiszlJF8
	7YHAStklXAvXILc8hAaMHPzN2w8CRtQrnTVrFHaXTbhXKBShi4T7b/EIkAzoIVAoWB9YqqJlwbz
	zPkws+1MQ8HUtvqy9Ev09eXHfIdJFmkpZKqodkxZsBL3ipSe5zIlsakfiFnN4dwywjdjYlno4qw
	B7c6zQ5rY3GEqnvq+abG+UnDVYFZIQTT57purQ==
X-Received: by 2002:a05:690e:4549:10b0:662:b6fc:ab84 with SMTP id
 956f58d0204a3-6677fa2ea7bmr2174279d50.17.1783398556262; Mon, 06 Jul 2026
 21:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local> <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
 <ake6FNy83LLtCs3b@ashevche-desk.local> <CAGXv+5EgpizA3Pc8ScNuChPhvFKWd5F6dxB-wT4-7EwabE-9dQ@mail.gmail.com>
 <akvRMcGnUPxE3sxR@ashevche-desk.local>
In-Reply-To: <akvRMcGnUPxE3sxR@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jul 2026 12:29:05 +0800
X-Gm-Features: AVVi8CeDQS-P0cN7_fGlNwSI_p7eUQN2BPzLo_iMICLRCJ8sboVGUDAVuWI9R6g
Message-ID: <CAGXv+5EqsDbzTg9eDMGK3Ph6Pe3_uDoSrjVL4q23cy6jZCk2tw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260706_212917_796912_06A611A9 
X-CRM114-Status: GOOD (  33.29  )
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

On Tue, Jul 7, 2026 at 12:01=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jul 06, 2026 at 07:08:07PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Jul 3, 2026 at 9:33=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Jul 03, 2026 at 09:17:16PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > > At a brief look this will be the only function that takes usb_por=
t
> > > > > instead of usb_hub in the entire hub.h (I don't count container_o=
f()
> > > > > as a function). With that being said I would rather see it to be =
moved
> > > > > to port.c altogether (yes, it's more invasive change, but looks m=
ore
> > > > > consistent).  I would even dare to move struct usb_port (and cont=
ainer_of()
> > > > > accompanied with that) and this function to port.h. This might re=
quire
> > > > > a separate patch, though.
> > > >
> > > > I agree with the reasoning, especially given the function name. How=
ever
> > > > I wonder if it would cause problems given the linking order. I'll g=
ive
> > > > it a try nevertheless and report back.
> > >
> > > Thanks!
> > >
> > > In case it won't fly (but I still think it's better to split), can yo=
u at least
> > > group usb_port APIs and struct? Means moving the proto closer to that=
 struct
> > > usb_port followed by container_of().
> >
> > Looks like it works out fine. port.o is linked in after hub.o, so movin=
g
> > the function from the latter to the former doesn't cause issues. One mi=
ght
> > even say that it is the correct thing to do.
>
> That's what I say! :-)
>
> > > > > Perhaps something like: 1) "move struct usb_port and associated A=
PIs to port.h";
> > > > > 2) "...this patch...".
> >
> > There are still some left in hub.c:
> >
> > static void usb_lock_port(struct usb_port *port_dev)
> > static void usb_unlock_port(struct usb_port *port_dev)

These are only used internally in hub.c as a wrapper for the port mutex.

> > static void port_over_current_notify(struct usb_port *port_dev)

This is only used by the hub's overcurrent event handler.

> > static void hub_usb3_port_prepare_disable(struct usb_hub *hub,
> >                                           struct usb_port *port_dev)
>
> This one takes hub as well.
>
> > These are used only in hub.c and moving them probably makes things
> > messier?
>
> Perhaps better naming to each (kinda moving to usb hub namespace)?
>
> > OOTH, the following bits are in port.c but declared in hub.h:
> >
> > int usb_hub_create_port_device(struct usb_hub *hub,
> >          int port1);
> > void usb_hub_remove_port_device(struct usb_hub *hub,
> >          int port1);
> >
> > Any preferences for these while we're reorganizing the code?
>
> These ones would be good to be in hub.c if there is no circular dependenc=
ies or
> alike.

Those two, along with all the static functions they call, ends up being
half of port.c. That doesn't help the size of hub.c, which is already
over 6000 lines. I think I'll leave this one as is.

Both this part and the remaining bits in hub.c I mentioned above are
outside the scope of this series. We can discuss whether they really
need to be moved or renamed.


Thanks
ChenYu

