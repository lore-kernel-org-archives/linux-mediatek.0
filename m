Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221C0C43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=; b=IDqtaHn5Lr2skQK3gi21Wv4MBX
	yDtfvl8oEjp1tcLb8v49yi6XWwz8UYEVpGH88bDFU4GQ8Mn+g4NylVlOa8GaGTFowSZOvl44oxJHi
	R0EhTMMcwZwR32NRMZuncB+uR70bYgC18tHNAblKMCWp9Ex9Hz7Jim32OCVSfnnPs0CpgBUYs/ZhD
	E4QAjk1bUOW2j032ch0YUf6M5IkeFU37cnYnb/ZNwGjDodh+pJqgQ8va3IzH9nW9R2ybMq8RL000O
	Ox2wBukdCAyVc+0uhfehtHpMQ+2xNUYurqNpd3+Ehz+gV3lRZHzAmnEsSZ2D2gX2eDWQERHEMUYHe
	mbOFuihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdlr-000000074Ct-2bMB;
	Fri, 03 Jul 2026 13:17:31 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdlp-000000074Bh-0X9h
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 13:17:30 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-664b84118d5so847390d50.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 06:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084648; cv=none;
        d=google.com; s=arc-20260327;
        b=LIYW5G/82vJjzGcR7X3CxMdB6QKdu0T2dS2frnYO887DWfhlrwX4pxr8+dZwTDNl3o
         fYYBxb1JFtf9HW1iJ7I9mVlrw9wUHaanUq0fV6lg6eWKuRTLVpegR4XTYY+y561MwMOL
         TIDlk8Rk0OLk+DNLYjE6mw19nljrS++YcSxD0OyWBg2KoIoXgB0nDgSEXK7Sr1sumx3K
         CrvV8yAcn6Z4goiIdfQKIrUTvz8l0JFVDhY1jYengim5HeDXDexBRDazAufAIGOOgPtg
         jVb3BFBRhmduZSif4xAkdHiWJVzi1JoRGeskBJi9sz87C7FVhIjU3kBYv4D67EllIx52
         qmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        fh=hg+sYmVTVqABv9j70hVVdQpRXWcq0Dqlu6UDsmf25vs=;
        b=ceomFvBjVsoiLBkibSCifHCsAVCPnEO8goq6+s6x2d4gPvb9eWdmsayq9q36E+8hJ+
         pff5/O3XP0B79Po5Nwu3qSk8oe45d60/xaA2CdyDltjGIrx4mH7NfdmSjjdPd4MdUPn/
         vR4MFGyk8moYIw+9iciIjq7cguA3cdyZXJKvLmHYBOgqGDQbRgTl98ZC60P5Wxqba58I
         QuPkC/a4C8zPXSOJHNy70MIrmGKBZm2hAiRXnVcosNMLCwhmeVdLXvhaB+6sHDS57uPR
         equ2nUa+7ZjKE4nu96nuPouOdhxNnlETXrElvTyGVJBwAjLL8xlxPbATNOmr380UkwnT
         uJ4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084648; x=1783689448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=ReeZhFaERUjLjzcluUPlFsalzWRh2JqHAOquBNHPggaIajZY2GIeNRntJvCvaTvJfz
         dR1ipmrZm93m3PBvXjVbBFdvyjEvzjJSBGRatyVHt/t1AhDJev/FcXG3xkh3F+aAsYVU
         seexNpxAkB4rAC+psMKOnSE8fQhqPDPyqq+Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084648; x=1783689448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=aB+TlNW+UyrIQvilU7voH1rGvdNmU1dS6m8PY4omhJ5b3JGAJhhkVZUBc2NrVvrhTb
         eXkRqB3nMizZvTyFQXAYUK3v9vI8nL8r67y7XRfpiLr+DYRC6t9X6ABFRknk7MZjoF+Q
         3C/3DHV7RJ9HVQih3jjMC77+woJR+wnmSep6jPG+dw8l5daXue8PiiVuC8dZzW3FDkSx
         5gu8wFjTG5D+Fhq1uniL3KBjwoM5Spva6JFSYA0snpklgBmI0WTFyKQCiSL1fnDwJ6ju
         cfYAMOpuf7rHXjOanXtUK8H4pbwVeUUyU3OGaPd6NtNA02rXFyRRteLkLUMXMA/UuXSi
         koyA==
X-Forwarded-Encrypted: i=1; AHgh+RoHs8Acal9sE0I1G/k1pFXCTFnzmWEgIf4Xr2U4snyCIjNyXzt+2aQ2L+u+vpbKPzS7izCH+13O3QnBSQHuRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5KJnkHx8S1bA/jGEk/REIkin5X6qeI1+3o4nZ8IR/EpXEnh+r
	4vb/3gO9c3NWIGwk60n6KwMyogCmw2RiIchrPgWPtBJWRupJrFLZm2646au69xGv0UUMF+mirBW
	HjB1mwJ3OxI4Axqfhoy2mLunOkVY1jHZIy0Sv7AXEWEibFFtEhPnFFQ==
X-Gm-Gg: AfdE7clnEy1bICq9TdTbUl3K80KVz86HEtEt4Nyzs1XJ+TR/EJ2GLXpmKOz/waw0nCj
	ILmoj1CJnsuKzF/7H23PbGfmume2KjtEiKOjV37clHQ97HQHrLI10DUsK3awYDny5Qx9rhNVFUR
	blfZrL31rF8WOBIxs6AcpsbYoDVV19q7MtHAc8K9WID1hzqDFZvnxFOFeShY039iTsnMU2y9NkG
	eeA7UD49iWe2bZlPXkvtVhYQMRCUl3V4EgYXnu9VbK348XPmzDDroBNhDNWlqHdAPrBS3ILfQmI
	qL7jk2kd9mw7sdKVIM3/MowrBK0=
X-Received: by 2002:a05:690e:4805:b0:664:de7a:a014 with SMTP id
 956f58d0204a3-66521a07484mr6637877d50.34.1783084648062; Fri, 03 Jul 2026
 06:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local>
In-Reply-To: <ake09vk4fEv1D9QC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:17:16 +0800
X-Gm-Features: AVVi8CfejZEcwq-X4tSLhB9B5zlOpwIE7AknFvssi26xknUZgb1hl9QfxXck8os
Message-ID: <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260703_061729_205639_441F71A7 
X-CRM114-Status: GOOD (  18.02  )
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

On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > usb_port_is_power_on() currently takes |struct usb_hub*|, but only need=
s
> > it to tell if the hub/port is SuperSpeed or not.
> >
> > In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> > state tracking field in |struct usb_port|. Either structure can be used
> > to identify whether a port/hub is SuperSpeed or not, as the field in
> > |struct usb_port| is inherited from the hub:
> >
> >     port->is_superspeed =3D hub_is_superspeed(hub)
> >
> > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > |struct usb_port*| so a subsequent change can use it.
>
> At a brief look this will be the only function that takes usb_port
> instead of usb_hub in the entire hub.h (I don't count container_of()
> as a function). With that being said I would rather see it to be moved
> to port.c altogether (yes, it's more invasive change, but looks more
> consistent).  I would even dare to move struct usb_port (and container_of=
()
> accompanied with that) and this function to port.h. This might require
> a separate patch, though.

I agree with the reasoning, especially given the function name. However
I wonder if it would cause problems given the linking order. I'll give
it a try nevertheless and report back.

ChenYu

> Perhaps something like: 1) "move struct usb_port and associated APIs to p=
ort.h";
> 2) "...this patch...".
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

