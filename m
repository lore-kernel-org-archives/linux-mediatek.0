Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB99DC5AC82
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+Pd7gzYvWcuRMdfZQyzumi66vIiFyICFv4uiNpdGrM=; b=Ou4s622wmd/ooV
	qQjn6Ct+vvGMp/O7AZ6SNqfiToKqdAwQJX7yJdXnvjLcyzgPOV5/Gi9D4uPrEiEPiG+9fnkBcvEo7
	V7MmV2vvqS6u8QD/uVA3q3OV6X/GDKOFqUI9PjSQd1SMy8dkvRmdJiTM+G3FJR31Y/HUQntljBj1p
	RKFdaLlyvXsOs80ryWljjXBb90itiY70OEirNut+gMayGwaVgFD4mep+hAMZRf9MjcRqnDzLd8J8M
	+ybxVn5grAV9MXfcoWbbbPYtI8FBLydS4UHP9NJrbCa3JoHn0IvNb3c8eCZTKR+r9icYznyQa1mZZ
	Ily6uaSut0h+NhyNR9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtME9-0000000BO8V-21DP;
	Mon, 10 Aug 2026 09:23:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtME8-0000000BO8F-0ISZ
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 09:23:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E8FF440AC
	for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 09:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E9C1F01565
	for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 09:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786353803;
	bh=H+Pd7gzYvWcuRMdfZQyzumi66vIiFyICFv4uiNpdGrM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=fpPxxjIfHHUhO8hA/zHg1A1bDypQJAMf9/v982lf9TLkQjU7BOIXjpiZG5ubVFask
	 YB05vgdg8CzcYwLxRUCPDj51wEaaxGNIMaOIklH7TkLT00IQp8W9y6xzcWWarq5ojG
	 EeB2zj9ZwTkO3YklwO2fmjI/9H8maknTGU3SBfEiI09ooh5j7d9zO4l8IZaBnYpdG/
	 6AJXvonKi4P9m6Ikj4ecFXmByNZv4pXZik+4Tjo++r+Ogt2cbLrWr/ToU+4YE5cZQ0
	 vpFRHf8dRGWDF1naUKjnvRjNHPliOyrgSeLfl9UKK7GBH4SkVJqcQm7lvRFc3q90ij
	 bHmT/f0wHS+EA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39faaf1efd3so8805681fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 02:23:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro3z7NqdiO1F9BGUazo8ubU2u47Pw5raWT04xecD/Ll5CVpm0RnvOW6gswAQypsVY40QB2YskgHhJPqL5G4pw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3P/zeGuJ9wdprURWmUwBYNy5pe4SFePL9nWSjhEOfNBsh3g00
	Uvdw/g5FGltD/CxCt7ZAnEs33rNM3QYlwjlzHtM0RRsfk6iTm8Vcpn7clWV0MkK6jmVdFgPLw3Y
	UHxTmDVVhEgZLzHkQArPeIY3B9mhGgWo=
X-Received: by 2002:a05:651c:a103:20b0:39c:6ea4:f0a1 with SMTP id
 38308e7fff4ca-39fdf52c7e1mr14697041fa.26.1786353801578; Mon, 10 Aug 2026
 02:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-12-wenst@chromium.org>
 <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com> <7855a0c3-29ac-4842-8e07-352fcb535a63@gmail.com>
In-Reply-To: <7855a0c3-29ac-4842-8e07-352fcb535a63@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 10 Aug 2026 17:23:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v66GkGcWqYGps3vRk55NcUfV8AS3io4LcRRAunvDP492JQ@mail.gmail.com>
X-Gm-Features: AUfX_mysoxlkJEUQJ5Yf2_OF5ZLWAw7NKOoCLgdNhCiwn0C9Cq3aA06OlGMS7Go
Message-ID: <CAGb2v66GkGcWqYGps3vRk55NcUfV8AS3io4LcRRAunvDP492JQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
To: Konrad Dybcio <konradybcio@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

(Resending in plain text ...)

On Fri, Jul 31, 2026 at 10:34=E2=80=AFPM Konrad Dybcio <konradybcio@gmail.c=
om> wrote:
>
> On 7/31/26 4:33 PM, Konrad Dybcio wrote:
> > On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> >> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
> >>
> >> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
> >> and USB 3.x Super Speed (SS). The block can also be synthesized with
> >> either HS-only capability or HS+SS capability. The SSUSB controller
> >> handles the device or gadget mode. Saying that SSUSB handles the HS
> >> portion is wrong.
> >
> > [...]
> >
> >> +  ports:
> >> +    $ref: /schemas/graph.yaml#/properties/ports
> >> +
> >> +    properties:
> >> +      port@1:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Super Speed (SS) data bus if SS-capable;
> >> +          otherwise High Speed (HS) data bus.
> >> +
> >> +      port@2:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: High Speed (HS) data bus if controller is SS-cap=
able.
> >
> > FWIW this is opposite vs what the (most common) DWC3 schema defines:
>
> (s/opposite/different to)

My version for mtk-xhci is modeled against what the hardware actually
reports, and thus what the kernel maps things to.

Yes it's different from what DWC3 uses, but then I'm not sure if folks
actually verified that the kernel maps the ports or onboard devices
correctly. The kernel doesn't actually check if the USB IDs one gives
in the device tree nodes matches or not. It only matches against the
port number. Put in another way, binding the device node to the USB
device is an afterthought.

I did a quick test on my Orange Pi 5 Plus, which is an RK3588 with a
GL3523 USB 2.0+3.0 hub connected to one of the DWC3 XHCIs. It seems
that port 1 is USB 2.0 and port 2 is USB 3.0. The ordering matches
the dwc3 binding, but the port number is off by 1. In hardware, USB
downstream ports are numbered starting at 1.

So yeah, we have problems.

> >
> >
> > (also true for mediatek,mtu3 and renesas,usb3-peri)
> >
> > -- Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> >   ports:
> >     $ref: /schemas/graph.yaml#/properties/ports
> >     description:
> >       Those ports should be used with any connector to the data bus of =
this
> >       controller using the OF graph bindings specified if the "usb-role=
-switch"
> >       property is used.
> >
> >     properties:
> >       port@0:
> >         $ref: /schemas/graph.yaml#/properties/port
> >         description: High Speed (HS) data bus.
> >
> >       port@1:
> >         $ref: /schemas/graph.yaml#/properties/port
> >         description: Super Speed (SS) data bus.

I feel like this numbering was only implemented for the gadget case, not
the host case. And it certainly doesn't match what one would put in for
onboard devices such as hubs. Ideally the numbering should be the same,
because it is a hardware property.

Any ideas for reconciling this? Mapping a device node to a USB host port
or downstream device is buried in the USB core. For example,
usb_of_get_device_node() and usb_of_get_connect_type() just take the USB
downstream port number (1-based).

OOTH dwc3 seems to just want _any_ graph connection to find an extcon
provider. The mtu3 driver doesn't even have any OF graph related calls.


Thanks
ChenYu

