Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7F0C44501
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=; b=usXMuuOlcv95muHyipSeMo4o6F
	B5ZANon3ZnOe3109ibFEHWbxSAVtuY7z1X/zSMHlxxQgQ+R7Y21OOpfPq+HUzRdeQ8wl7tBu0ZH2x
	zHtfBSP6vN6IEg52nQLpxkLyGvr0/TE+v0OtiR+MZ+USI+XlLjUZWRJrCL/e3pyYxQkTMXnvPvfeJ
	b88nS+kAoRlQo9AuuApempYL/SACE93HQT4SkxPg+7gdd5SYNXpDrUHaKsqbRf/NnUcqsQPSdarGu
	GSCY3kecY2LNOuV7TaiXOR3Ke0WRMz5xj8cvRff5x8cwJLsTSaVoPo4mogJl2hVF3YQ5eXxYnroQ8
	5tb+MT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIve-0000000Gx81-0JA3;
	Thu, 16 Jul 2026 10:02:54 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIvb-0000000Gx6g-07AN
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 10:02:52 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66810946e63so2127405d50.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 03:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196170; cv=none;
        d=google.com; s=arc-20260327;
        b=RTu+kopbESvtIVUNcGRIoKVUIPevcLi2tjlp2oTNp5KHhRz0NeuFjmtoUPZYV9kl34
         1CjCKFlk6MYmsD6e6pZElrk6vNxAQcgjZCtLYLGlzuN8lGtwdphqw0j1omef8xCAaU/H
         ZZBCRF/QyQQ1ciYR8aaYeqP/IXB+Ukqh6LSpSjFklYZy6ahKDW9MypqoueS1uKnuGJhW
         DOHRePujClyuXCljTV/kfo4w9stUnjs2h6MrOp6A9gYkZoY/eS0z+I2rq9SZGEP3lsWr
         zRygHSvWSCisaWQxZBysDeQ9NZFDNQePrQRWQsT0lY//wPtC2B/TwpHMJKNoJNgCau1v
         VB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        fh=TValson+qfaTpuZZwuoqDKLLDIKIBSsaHmUvKqGVyBw=;
        b=CSrGlr6dgd2TKrYExnMqc5++JnREwzMzrYbY5hQnz8P/y1FU8tPy1m9Xr51X7lCXGl
         q9ILB7SrFEE9ylXXf5DEt8qEvSYcMAwRnw+p/pDL4aZqNQ/mtMHieKhTRs/h+elUOGh1
         dRoeeirfh5WbZO9xNakI6WY3qlC4qLv5KXA+Up8JHzujoVgd+nrkd53dELVA6I6y/hWA
         l+hDKVuRjuKlEGx+wDJs9pBxfmM5fw7zuC3oykd2Wh/AYF9jibuWKf5erQSMrSwYOi+C
         n9LChrrGssz8ElUx6ivhvwRWqZWmRs3wfZrMMXPY/vytnG7OP26TlRxcqZELxG4qHlg7
         KYGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784196170; x=1784800970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        b=DfODuXDyrSk/332aLVvFp6R3NYc6LDtbWc31C8IJum4mCb4X1NMIyemI1EZ1T0lcYG
         VrJIlBe/yRPc83mcO39QvjkADhrhheLJvliP0/NIZCVxbnIIYakBN1tVz+gO2Mwz9weC
         E2ILvHtthBw7sgOhWXyilQJ0ihUC5iIgAVYfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196170; x=1784800970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        b=I+wHH7Boa+AvZFHlXFArLoasQLeCDjm0ZefeVCCLTBLRYAbrIhGPBiSS9e9nCD6bDy
         hjwlNlBM/KaI2z7Swi+xvCF6FImqaWA3oN+3M+cj8rcOtZHRveXECSTKpvOyA0yu2IgU
         Unu6rVEzwh9nfiiHgtcooGhB92DWKaJbtbF29bc4cTO/tMkvDAHpOl2w+oQfJPIa3WM7
         p4FJEqaVJemQKvDZjiHPmGC2on5G/J0cwwcp0IvprpsjnSCGuoE2EYG+mqW9WTF9NBnl
         eadTvMNMSflsKkeblobY+Z04O07jt+lpXjGQgFJKNb0ax5bK8S7JcxkPkJaukLd+gdpI
         BO8A==
X-Forwarded-Encrypted: i=1; AHgh+RoXjyctennoIqAaz3mmTqd1gwaSOdxdWZRT5vr9MZERFf5ZSYN8kh/VgBSQ8iLp2ccaNOhr54P7s3PN1YJGgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfkV/LrrG02ZZwtqt9uaRIW5cAS+a8k7r0E58SgQq+SGd27vwQ
	V722I3EZ49UD1aD3F991foKRUi01v141In/MN31jBHqLnU/h3WstAzpkv9oE3wUN0RclPA/Qn0p
	CFROAgs6kpbnkUx8Tui++l9fJofFqYqDzKyYft7Sk
X-Gm-Gg: AfdE7cn0n0pBoCvCO3qkxclSvwYTX6ib3AfP2dKw1rpFlyomfz/jUJltSji4O79OiNk
	KRuSBFLOHdJAbltTDbovnoFN8Cfb9a6MYaNceI7Oh4Lp5zFQMUy2eisaqBWKGhjw68mamzBK2mg
	rD7z3ScR7iST+i+0qvD/PQQx1Vg93mgYOuX9XvNYNhwCwt7AFR5O60/7pAJJZk3n3qUl0ayHgNT
	6xW/xlwFzaiRpWEDa9xb9b1KNIeYUw3srlZsYRg7PZThK5oEVkfBHnixR7o11VSVeL8duSyMSQY
	C3Azt5tKI0JK60Ms
X-Received: by 2002:a05:690e:d02:b0:668:15cc:bcc4 with SMTP id
 956f58d0204a3-66815ccc501mr4350974d50.53.1784196169785; Thu, 16 Jul 2026
 03:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local>
In-Reply-To: <aleKQKH2V-ck-SX6@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 18:02:38 +0800
X-Gm-Features: AUfX_mxuW_5D4-j7y5auPPMU8fitwu4GAwXYmX14uCHTJY4CutBJo0OlCAdX-_s
Message-ID: <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260716_030251_110072_9B163174 
X-CRM114-Status: GOOD (  35.99  )
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

On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
> > The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
> > on this connector to work, its power must be enabled and the W_DISABLE2=
#
> > signal deasserted. The connector driver handles this and provides a
> > toggle over the power sequencing API.
> >
> > This feature currently only supports a directly connected (no mux in
> > between) M.2 E-key connector. Existing USB connector types are not
> > covered. The USB A connector was recently added to the onboard devices
> > driver. USB B connectors have historically been managed by the USB
> > gadget or dual-role device controller drivers. USB C connectors are
> > handled by TCPM drivers.
> >
> > The power sequencing API does not know whether a power sequence provide=
r
> > is not needed or not available yet, so we only request it for connector=
s
> > that we know need it, which at this time is just the E-key connector.
> >
> > On the USB side, the port firmware node (if present) is tied to the
> > usb_port device. This device is used to acquire the power sequencing
> > descriptor. This allows the provider to tell the different ports on one
> > hub apart.
> >
> > This feature is not implemented in the onboard USB devices driver. The
> > power sequencing API expects the consumer device to make the request,
> > but there is no device node to instantiate a platform device to tie
> > the driver to. The connector is not a child node of the USB host or
> > hub, and the graph connection is from a USB port to the connector.
> > And the connector itself already has a driver.
> >
> > Power sequencing is not directly enabled in the connector driver as
> > that would completely decouple the timing of it from the USB subsystem.
> > It would not be possible for the USB subsystem to toggle the power
> > for a power cycle or to disable the port.
>
> ...
>
> > static void usb_port_device_release(struct device *dev)
>
> >       fwnode_handle_put(dev_fwnode(dev));
> > +     /* usb_hub_create_port_device() could leave an error value */
> > +     if (!IS_ERR(port_dev->pwrseq))
> > +             pwrseq_put(port_dev->pwrseq);
>
> Hmm... I would rather make pwrseq_put() NULL and error pointer-aware, so
> it will be no-op in such cases. But I think Bart has his own opinion abou=
t
> this.
>
> >       kfree(port_dev->req);
> >       kfree(port_dev);
> >  }
>
> >               put_device(&port_dev->dev);
> > +             hub->ports[port1 - 1] =3D NULL;
> >               return retval;
> >       }
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > +     if (IS_ERR(port_dev->pwrseq)) {
> > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port_dev=
->pwrseq),
> > +                                    "failed to get power sequencing de=
scriptor\n");
> > +             goto err_put_kn;
>
> OTOH, how pwrseq can be non-NULL and at the same time port be created?

I assume by non-NULL you mean returning an error?

device_register(&port_dev->dev) is called some lines above this.

usb_port is weird in that usb_hub_create_port_device() does a bunch
of stuff that is normally done in a driver's probe function. However
usb_port's driver is just a stub driver add for userspace compatibility
reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects").

So at this point the usb_port device has been added to the driver model.
Or we can just zero out port_dev->pwrseq instead? I guess that is cleaner
than having some weird check in the release function.


ChenYu

