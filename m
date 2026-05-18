Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A39CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=; b=2MrDqhgWZ+nDQPiKIJNAVzpEJA
	P+aMMynhaDxYJUbyDOSNdPIHwYDPvRBcve7A9I8COb+jp9AIXXTfAjj7hjcsonU/Uux0ZEaNupw6u
	Yt9fDDCQjAdXG1Dr26obwRGFiJvi9WvjnVWB/JN4O/Z0JTSPts+O61PtUQ+b465hSFgSkHQOhzeNY
	pC/V61B6Q4BnYcP4RALaxb0KMXH5au/6EDAU0aSGQFPQVosDR9Y51aYSnOebKUJLKXVuuRqC52o5B
	hCSOVa7B4D8KIMxic8mkJSToyj0YEXZPOjNNTzFx6T2mDePzpbEnfgfLnAoLIxkEdcuOP5bikuU87
	Q0CDQKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOu2g-0000000EyFq-0GY0;
	Mon, 18 May 2026 09:13:42 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOu2e-0000000EyEF-0UxD
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 09:13:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-38e7d983f91so22398051fa.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 02:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779095617; cv=none;
        d=google.com; s=arc-20240605;
        b=O0VbdFrmGVPRjVtb7qwBYCuGmwOcJAdv/rxGs/CTQ7IcINkpwedAIeqv1Szq7dyVC1
         v1inzqlO8eT25pz8TZQbO/uFdG9BJzgm/hXw2HTiGCg7wk6DRMFG99meemKgkVkGFEe5
         PFMfGoA9qyveZETSwa9uGo8HZPm40yPil4Y0MOtcJdlY2mpq5e7DIef5s0h6aFRCBqKw
         jAUtDnwaWtuIhV7jYfoy5uJe13NEWrdVE3c2RFCAUlp7skWxyFq8CIRtlJEoLt6jE+17
         0+Vtvju8GWjS1lfc4HCBxCz4z7OtKHerBcnm4Kh5ip7TVQkPaq0QjExu/B5Yd1I1aNeN
         5m7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        fh=LSIYLnHFeI6hnKcEfjUjr4i3gwziUNYMWMtb9/+1PkI=;
        b=NNZfWxFuXbSMKneAU62FSdgBDrRvnd4+fHRNoq/I8Rl79R7FKB0rJRU1FJJ/hsU526
         txaT9ppK7MQ5WOtDuHr50tQkW4gNnOocadKatqS5gvTVS6o2I6CEBO7fkTHlASw2RXhO
         QMTrIDQi9A4snFPBz5FrqvQ1QRZ4QeLGZy5Lh0+sboMdjgVNjcJnKxbiNk5TCPtwm6ds
         hjZFHQaz6EQHuL05lBYKZcRleCv2G2Sq/o9LpMtl5WeL70JY8EBHgUk829GBf7pnb7cT
         myKJMsHHQdlDfCpCMUdvWQeNeOdXJDwH+hEB+0RwdjqwZwpM7szsYhePOc4NvWYRy0K/
         s+jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779095617; x=1779700417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        b=JzvTGOW3Jer8YCCzwCyrmwxGijP+B46Er23jQBZVtQhLs/0V2qxNvk6yfRtkILtOfl
         x9DAyWpishqPyrgLAuv50mOgU3Pp/dVydEY8E/goc+ub5fM7algpaVRR4MOCg75JtzJn
         UZlI0xKJgyyniQ3BHWYg3JPd/897taKbmjxBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095617; x=1779700417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Amh+bVXjDqTRNawRkZLKL9MlUJaoVw2UfnFqXJanPVg=;
        b=M8EQ1GePAHzSvpK/nH68CDvQDWcuUyR+qGhEuFFco9sR4ajFfUVY+aZXlOfCb0Gow2
         yJdTNgQ8HZNVm7NwQLo7Qo6WsoIZYfo/loI0/8I8JeFvwbr//mIyrORbJS7fH441YK5V
         QiNEHx0+5wa+hmdzKRYCD6Qxi9yVaBK+nWWv84XH8YsoIxLpp1imMjAt+5TeX++zeRJX
         WqRbS0bqfUAFGS0hFOO/umRq5N68fW4PfmoXkXd3I3zavWCweT7YLhdyahxMffEUIoz0
         d4c43KgcvVsz31VaLduLpIG6v9BN8XKezk50ovpAiZ2/+FMk533rN+nCsvGrIALidQY9
         D+nA==
X-Forwarded-Encrypted: i=1; AFNElJ9NRGXFq1ubjJoL2N82fbdmzfXiCxGwplHj0UoeuiGE1l+35ow/3EX5paW3zk+nNKgxlyhskwnXgEsTqgwKkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiDl2qzhGrRSSghL1HJmQNQhn9HXJbJI44NlhaS1Ph3i+SyoEK
	l2WlDUxXV9foEYt0asP0ULpWg6ABj2MoMhp24zIePPIhDR54lWJ4VjVyia5UWpMM1c1LGrGHH4a
	0gw7TLQAvs4mfZorX0mzYapZQuaBMxN1imT03qm/WWuG1kdcRQ5aIxA==
X-Gm-Gg: Acq92OH4KTwMNzU6+DtCj/emhyqNo0/DcawzL6W0LIssuG6svwZfaQZ+ZTXYY67Jd3K
	zjN3KZ4q1EqAQvzy9qGzKYIi5fMUulDaL2arAkphnYNlTdc0Vs40tjn78OH+Z+/i+OLkXwPgthQ
	VUQWXJJO9dj6gnwFyKTDILDxWKlCArB0ZxJTTFOtBp4xkaCOR7bqPRW5A79KUGI6rH2oZdgukhK
	8dmIttzrmSiM1oUHF7+dHoZOkOFYeSkilFU2T/OPq3VsmmMjd+vw4nCfKkBesNtcETs2/W2Sta9
	CfzJ6yadc2Yvl8i9C97Luqeu23SIh6RWY758G4PozVlptCCZ
X-Received: by 2002:a05:6512:3e14:b0:5a8:9f6f:3212 with SMTP id
 2adb3069b0e04-5aa0e741fd0mr3969603e87.34.1779095617441; Mon, 18 May 2026
 02:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <20260515090149.3169406-6-wenst@chromium.org>
 <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
In-Reply-To: <41260a6d-46fa-4a45-9906-e1bc5e5dd83a@rowland.harvard.edu>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 May 2026 17:13:25 +0800
X-Gm-Features: AVHnY4KWMoq2C1egFaF2o_wZ2pbZmcxOkUhi_AoDtPCF3Cwz3jQrR0zfOzxPPG4
Message-ID: <CAGXv+5GT8vS87owuNJvMxWBnwCELCV28SbwsUXFr-Ne5O3EgsQ@mail.gmail.com>
Subject: Re: [PATCH RFC 05/12] usb: hub: Power on connected M.2 E-key connectors
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_021340_218383_71DD98D0 
X-CRM114-Status: GOOD (  25.17  )
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

On Fri, May 15, 2026 at 10:39=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, May 15, 2026 at 05:01:41PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 90ea597d42ae..4165f71e212b 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -31,7 +31,9 @@
> >  #include <linux/minmax.h>
> >  #include <linux/mutex.h>
> >  #include <linux/random.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/kobject.h>
> >
> >  #include <linux/bitfield.h>
> > @@ -888,13 +890,25 @@ int usb_hub_set_port_power(struct usb_device *hde=
v, struct usb_hub *hub,
> >  {
> >       int ret;
> >
> > +     if (set)
> > +             ret =3D pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> > +     else
> > +             ret =3D pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (set)
> >               ret =3D set_port_feature(hdev, port1, USB_PORT_FEAT_POWER=
);
> >       else
> >               ret =3D usb_clear_port_feature(hdev, port1, USB_PORT_FEAT=
_POWER);
> >
> > -     if (ret)
> > +     if (ret) {
> > +             if (set)
> > +                     pwrseq_power_off(hub->ports[port1 - 1]->pwrseq);
> > +             else
> > +                     pwrseq_power_on(hub->ports[port1 - 1]->pwrseq);
> >               return ret;
> > +     }
> >
> >       if (set)
> >               set_bit(port1, hub->power_bits);
> > @@ -1867,6 +1881,7 @@ static int hub_probe(struct usb_interface *intf, =
const struct usb_device_id *id)
> >       struct usb_host_interface *desc;
> >       struct usb_device *hdev;
> >       struct usb_hub *hub;
> > +     int ret;
> >
> >       desc =3D intf->cur_altsetting;
> >       hdev =3D interface_to_usbdev(intf);
>
> This change is totally useless.  Didn't you get a warning from the
> compiler when you built it?

Apologies. This should have been part of the previous patch.

> > diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> > index 9ebc5ef54a32..6039e5f5dcd7 100644
> > --- a/drivers/usb/core/hub.h
> > +++ b/drivers/usb/core/hub.h
> > @@ -85,6 +85,7 @@ struct usb_hub {
> >   * @port_owner: port's owner
> >   * @peer: related usb2 and usb3 ports (share the same connector)
> >   * @connector: USB Type-C connector
> > + * @pwrseq: power sequencing descriptor for the port
> >   * @req: default pm qos request for hubs without port power control
> >   * @connect_type: port's connect type
> >   * @state: device state of the usb device attached to the port
> > @@ -104,6 +105,7 @@ struct usb_port {
> >       struct usb_dev_state *port_owner;
> >       struct usb_port *peer;
> >       struct typec_connector *connector;
> > +     struct pwrseq_desc *pwrseq;
> >       struct dev_pm_qos_request *req;
> >       enum usb_port_connect_type connect_type;
> >       enum usb_device_state state;
>
> The fact that hub.h uses struct pwrseq_desc indicates that it ought to
> #include <linux/pwrseq/consumer.h>, instead of making the .c files do
> so themselves.  Then you wouldn't have to add the #include lines to
> hub.c and port.c.

I couldn't tell if the existing pattern in this file was to include
the headers or not, as it's missing a whole bunch.

Regardless of whether this header file includes linux/pwrseq/consumer.h
or has a forward declaration or nothing, I think that if the .c files
use the API, then they should include the corresponding header file
directly.

> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384c..2d09037fee93 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -7,11 +7,14 @@
> >   * Author: Lan Tianyu <tianyu.lan@intel.com>
> >   */
> >
> > +#include <linux/cleanup.h>
>
> Why is this needed?

For the __free() in usb_hub_port_pwrseq_get() below:

    struct device_node *np __free(device_node) =3D NULL;


Thanks
ChenYu


> >  #include <linux/kstrtox.h>
> >  #include <linux/slab.h>
> >  #include <linux/string_choices.h>
> >  #include <linux/sysfs.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/component.h>
> >  #include <linux/usb/of.h>
> >
>
> Alan Stern

