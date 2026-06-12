Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61499CD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=; b=ejVJMp74aosIc+rDc7zpIsVx/6
	swBCrxt3x04cJwt7r8nNbrxqe3vnrW/wk77Vy3O2ynSVpncdrMvmJl9lZ4Z1qHdjQlRScnUqgAvub
	QtuHAls5D/lADwz5XOofWQYL0x4260PaA51bEF0BzGH1O2gOjr3TQCWNtab5MAey88moggsQU3CKk
	KQkApkb3K/SCuPugr+tl3KOm0CKUsLYj0f4L/ilogkxPuQxYGAEPvU7IJGoZ0LbRh0eonMRLndZbj
	VWilSyRKe84yBPDDN1rU76Q1RZutNmEcysctMIxRujI/pBpyQRXEazNxXbVZVb+CD+SrAVDCis/1S
	AYCW5xkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxfx-0000000ActC-3ZO2;
	Fri, 12 Jun 2026 08:55:42 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxfv-0000000AcsU-0VoY
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 08:55:40 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7e2fd65f968so7333617b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 01:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781254538; cv=none;
        d=google.com; s=arc-20240605;
        b=TyAm/D6tPxBp3w8f5Cop0cbHda7zfY789uytJgJCJZ3ghPknxVCzuRiEUgUY+lSDJD
         jiJ9oDgofoAo5uZtmp5mGddIuhJW0ESvl5D5f519JiijksJqSZIx+SJaazoxc3yW0ohW
         xdut9zrnlIq4ls9pGOMAZ19+1uRvyexcNhHGoTEiRA8aD4WSSP1mL1mC2b2dD3TK3Dxf
         bH1f9PLgp0iYnyDUlWJdPozQKrcvVW0/ZG582kL1M85qSocvj1hqryCtrTIDv14cS9Gm
         zDsVDbaYS7V0Pt2veMREZ3QcyB0yrjZfP09BgTyDG8GEWHDmkaWE4CzCgOhlHSVsWl69
         cgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        fh=Y9PyxjwF9AOu7hhRZvuZM/hAXEGKEehbGXYKxM970vk=;
        b=YkrjwJU88snVHvRTTP0kEG2JiVtyPzqUWNLcEf9jq/HtsMmTXRWcl0aBVxYL8RLaG1
         HiP/MYLOIhnXkXQG4FJGShmrOqml160lyHBIG89N6ZQ8m9ZVnyz6e0w6JTN3VR32E4Qd
         TURhkmknRtB3vCeM6VS95a5HPTBdnT0/xXDxpkf8hwRpesiox8283mMQmi2t8Tz/Pacr
         jb/kO0XUU1f2/RYMIR5HtrxqVZ8sL/ixN/sZpM8SYrEzT/V7eIn4nkq0tU3F4L9U+fO0
         gigMhP17T6yzQzSgB11vDe/ntunBhVW7gj7X9Cxv9fSJwMDo5Otef/I90OzyC7crQQd6
         sfSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781254538; x=1781859338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        b=NYxOIgXVOP+kHJFcSfqDyBME5fpy3aPNQhHYzQwmbsGAg8j3kv2FaGI6FRiYI6Xm+5
         WhAeF/mdytZ+tblbE7hHyKwzKJlVAwV2BHZec+mwdnO2pvht5TouhFt7whNacKSQ5wD7
         DeS0vzzAX7Hs74gWo/6weQkSczq6jchA2io6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254538; x=1781859338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJghUbDUHZkDrqU4zXDzfGhgJ/zqGoOZUi3OGZ2y5Rs=;
        b=TkPptHNQE0z5cl81aZwjtdYVTPOeaI8848ByIbu9wUwUsdJtKayBn/8QAPJoxmo1S9
         5nRm77+vQ1TpJsuNX9qORKQAY0DLm6xs6dR994+O+wN+gV4Ckjvjdwg+5ePTxRsTKfAP
         s8Ll6oQoWCI//DfnzDeta86Z9vk98hGzmDcmS+vvAC3mDFduAAenMtC9Y+Bw6r9fnyD8
         M5tr6maZuC5TrdpK8JcNuGx00FdhreOhi453RPJHRh1+Tl+OCim5XNKpkUVgWDC3nZb8
         rake3sly2rHa4EOI9A3HiYruH8YJI58XOa13rbrbQv1KoKud3eiO9XDtMj+OYDuC0Eqj
         99rQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aNUFDeieU7VqDgxTLDACm2tg66ccIfTm9ESu0C2mnLDL+wwcwSXxDjZhQfWH5LK1wY2j2jogRFJTX1hqxqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yymrd3/uenQVc2LlvwHJtDjXW3lKb+p17leXzy/bOuGRHnzEPOS
	9wHWsTKIDRNCwLHhZMbUFpXfNNcvsuQ21li6J69/N9VHdpntiBcl3bJDUy79NwCKqd7GMRA2h9q
	kb6bf7khmHdILP0h6FfrJ8F/PdfE9K4X7MO6YBe8pJpcw2PaRyOMTqQ==
X-Gm-Gg: Acq92OFsWf5CnGGxHYr53/NUGKjYuJWwqQIDA1o0Wl1Dev6PhXzMOFA88vTSl4koOvL
	TGpdXNAKK0sII5IKWrvCTJc/Ydc56riq72tP2+Yu/+WL8xJy+dcvTAvFko385YGMYbuG2GA2lw/
	/3NwfQxczb9vAAOg0oSDsmUtLFgZpwNKghZIkrT4zDXYgGLF5Oybt+DZrHw6urVJZRGbhcpe1v6
	5QmWvr8ld0UKU/GK6h5eOoJhXgzVHbODn4dcmy+EKI2VJlH41rxQXRTN/XUWAFntfR06kJ5EjFD
	QSU7wS++
X-Received: by 2002:a05:690c:e3ea:b0:7f5:87d3:c38c with SMTP id
 00721157ae682-7f7b7c3b073mr16472667b3.21.1781254537877; Fri, 12 Jun 2026
 01:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 17:55:26 +0900
X-Gm-Features: AVVi8CcqxBgWwqPnctKiq9OR5bHp6we8pjEGtqp_ZFOZvY5Ttt7Fwncjoqrnmf4
Message-ID: <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key connectors
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_015539_239050_5D7806C9 
X-CRM114-Status: GOOD (  31.95  )
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

On Thu, Jun 11, 2026 at 6:11=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
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
> >
> > This change depends on another change to make the power sequencing
> > framework bool instead of tristate. The USB core and hub driver are
> > bool, so if the power sequencing framework is built as a module, the
> > kernel will fail to link.
> >
>
> That bit needs to go away I suppose?

Yeah, instead we need

    config USB
        depends on POWER_SEQUENCING && !POWER_SEQUENCING

But I ran into a dozen or so drivers that have "select USB", mostly
input devices:

    config TOUCHSCREEN_USB_COMPOSITE
        tristate "USB Touchscreen Driver"
        depends on USB_ARCH_HAS_HCD
        select USB

Kconfig complains about unmet dependencies.

> I see Andy has some suggestions but in general I like this approach much =
better
> than adding the pwrseq_get_index() function. Thanks!

Thanks!

ChenYu

