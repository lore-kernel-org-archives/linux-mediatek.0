Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D294AC43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 06:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=; b=1tlFCS2qbnSrgxnT1tKmSsLQ46
	T65l9FRmHycwFSMF75ElNh3RhD5ZL8Y9dJ0LXOBp5Qf5RdAetJoqW8J4FAoEN/HM7Ww3Co3R5QZuW
	JdpBcsneJc4BzVXMjYmUt4156EQ27mZqv2H6F9yl8yW1MXWLTEM93nRJrXlMZ94Um5jY9e/W8Ln/r
	FJQ6UcokCENE+iujHJYifoW+/TCyvjQJjEyi0zyHc27NKKxoRM4fAmf1bwPT1st5w6Awomnn/UhAB
	bbk7El6SOkS0DEheXuAyYvBUPsCoJoMKenfSAoaFLPGzboAfvfKcNFFwTrgAOwCnuc0thbNC3PxaG
	oynZGlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjALn-00000008I1E-2hpU;
	Mon, 13 Jul 2026 06:41:11 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjALl-00000008I0X-3Vo5
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jul 2026 06:41:11 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6647bc8f900so4693977d50.0
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2026 23:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783924868; cv=none;
        d=google.com; s=arc-20260327;
        b=nLVa4LHRmCNxYo4dPaWHFNT8gSvQXHIYPBc4SZTTMoj3MXrvNC//hFCULouj1QfjI9
         v1RlUpydvJnvgKCeeGyfF0fsH7X/a0qcBapaT/1PQZnI9VKTttKc0puEHjdu0R+Ly7d9
         2+/CX6gxc9lqhhyBa4F9Z5lc+KFvRdMr0e/UkcCrAYkIapGDdd80iWfoBSOKmZN7NpAi
         oNyVPzcPx/XPnblsnDhAsiUWPpn/UrSg1VltONYs5p2V6uWfGUhpm6jkz7vHBuhfm80F
         27xiKrs8x7x61DPs6wS4DmB70vGoBO0LgkIpTFWIzagySammNoPGirzOZ6cqSaKwgQ58
         qOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        fh=enmTpRBHF7VnePfXHPHwSYwRAZQbYSXE/Td6JqnerBQ=;
        b=d4D2/ABK515itBZ3ex3e4qnpyekpVhK7IKrGNydpjfnE7d5qbq5kv2EF0NRHsA1Y37
         pu3+EaXJK2aIuY7Ma4uXX2bDw9LIRecUJBUqSZDGfPdBJChbYiooJSzW/rX0f6AIH5xU
         Kb3ieDIgBYAOwE3zno5ODXpj1JG7OP0azQRMJ6c9Mc2MU5ueHo0NZrhYjy9QMQ8+8jCU
         xU/PiMrK6EwmT6+h2+deKlv0vuOsNcuMJn0BH2aYwhH918/f3kkf9Gm2AiKxiEHzSISf
         m9UkWycFHT/7SuKIh/QkEX0/Fu2qHI3uRGXhqLtHvZZd11hz6faCrshurRikkqA1skTq
         lb1g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783924868; x=1784529668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        b=jRnadhR0Y7x0WqkAhoJH3xrpjdNnoB0i9Z9kymLzccLe6BcI/asl6Yk6IKxBQdUmD1
         uNp4pzuYSu1uR3KS+ifCnA5waoVncrC9e6hiihyAamLxMisUT8XMalTq9yV2Cm1yVL1J
         UmnVgdZ4EqTBtq2mfBHPTygnr6MhKPr07YFeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924868; x=1784529668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        b=mgOg9pSfiV1ZluqvdUka2NNeXmAZOT8OQa3tXSODM/B6l+YSURthjHyBKezV3s4mg+
         3JEXYr63nJPuVYQZogASygk+3q6IpC6lV6fhiHfFaxWV2GVhVPfImHCzDAGyOKJrzSkU
         kZi0JtR675cT7nkJ5l2Cr6G5jaWnsPXzr3Z9O5Q7srYhtqLPhuq51CiTWYoO9XVdBzGX
         5iU1pm+HOdAxSCSV7MegjFensvZiboji/dzgXlkLJgVbmeA4Ifl4tuvcxUZDVmOrP2rl
         qfpCwFBHWXMtxRNvbTpViz33Xtb19+Ek91S4GCRh6M2EWtNUaeKqT45ZNJaCOhkLl0XX
         iswg==
X-Forwarded-Encrypted: i=1; AHgh+RoFQthtfH3Zee+4x7xvcukFycl+2meVMmlJUCpI3CEyhp2voKA5ArpVA6h2DPvBein0A2nm1reuCy7rn+s2zw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8AcKR6bXNPOXofup6bTJGSL7dSkaNLbp6AAiUbDMVViNqjHLi
	pLOLdf4C/2CVcxB2rgMAXWwQNhN31H8yICTl2voKPLaegau3bVbJk0dqUmf8n3T8+pWCzfiJTHz
	bJFETUufk1tbxjF2qIHWsD7YCZOmbwz6ch+FIKYi0
X-Gm-Gg: AfdE7cl1M1x2dWw8VT+0AspwMe742FXDCpuj/sY/03/912POLgbFg97QQkmgmaMMdQi
	iBmalUGPGnRNIY6h3q+Zstedm5gW2ZtF8T/h+jWGJYfoILxZ8Q0MEyIeROiuC7yEISlqjKlq7wP
	7sxpdh5rZvHFkWGOt14NWU7W6xIuCoHgCkJHmDgqMK2zjZ5i9qeFvZ3I+NKWczilEHApb7U1cok
	YvYQ4GrH8WewOAlP3E687KZ4wH1I6I1a+TTgfAb4ScIbT8i8MnT3T7qskMc0Yd/O8DsssFrP+9O
	uGvPi++DHtNz1+JC4DFAlfhzoZJ9dllxcNVi
X-Received: by 2002:a05:690e:138f:b0:667:db66:eb59 with SMTP id
 956f58d0204a3-667db66f471mr5286970d50.22.1783924867897; Sun, 12 Jul 2026
 23:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260709095726.704448-1-wenst@chromium.org> <20260709095726.704448-6-wenst@chromium.org>
 <2026071025-diffused-jersey-0d94@gregkh>
In-Reply-To: <2026071025-diffused-jersey-0d94@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 14:40:56 +0800
X-Gm-Features: AVVi8CffSvw8dKrdOHbSnASMEsx0puSGrR918doi02cLaaF9gK20T18TFDW9zpc
Message-ID: <CAGXv+5EyJ3WewkWfEy=XNA=VoU4Fuhi2K6evkvFanWhVe8J=ag@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20260712_234109_933668_5765F3CA 
X-CRM114-Status: GOOD (  29.79  )
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

On Fri, Jul 10, 2026 at 8:08=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 09, 2026 at 05:57:10PM +0800, Chen-Yu Tsai wrote:
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
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v3:
> > - Added missing fwnode_handle_put()
> >
> > Changes since v2:
> > - Skip assignment if hub firmware node is ACPI node
> > ---
> >  drivers/usb/core/port.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384c..e8fb2acd77be 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -7,6 +7,7 @@
> >   * Author: Lan Tianyu <tianyu.lan@intel.com>
> >   */
> >
> > +#include <linux/acpi.h>
> >  #include <linux/kstrtox.h>
> >  #include <linux/slab.h>
> >  #include <linux/string_choices.h>
> > @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device =
*dev)
> >  {
> >       struct usb_port *port_dev =3D to_usb_port(dev);
> >
> > +     /*
> > +      * At this point ACPI nodes and swnodes have been removed by
> > +      * device_platform_notify_remove() in device_del().
> > +      */
> > +     fwnode_handle_put(dev_fwnode(dev));
> >       kfree(port_dev->req);
> >       kfree(port_dev);
> >  }
> > @@ -780,6 +786,13 @@ int usb_hub_create_port_device(struct usb_hub *hub=
, int port1)
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
dev->dev), port1));
> >       mutex_init(&port_dev->status_lock);
> >       retval =3D device_register(&port_dev->dev);
> >       if (retval) {
> > @@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub,=
 int port1)
> >
> >  void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
> >  {
> > +     struct usb_device *hdev =3D hub->hdev;
> >       struct usb_port *port_dev =3D hub->ports[port1 - 1];
> >       struct usb_port *peer;
>
> Is this last variable addition not needed here?  It's not used.

Indeed it is not used. It was left over from me figuring out how to release
the fwnode handle. Will drop it in the next version.

I still have some other comments to cover. And I want to go through the
code one more time to check Sashiko's concerns on the main patch
"usb: hub: Power on connected M.2 E-key connectors with power sequencing AP=
I".


ChenYu

