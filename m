Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC8CCD4F54
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 May 2026 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=; b=PRoqqz6B4E7mxQGwJoKWkCBeen
	O1U3yeNO95MGGIoZ+7dCxWX6eLHsX65gZ3fFyJPqcbg+7nnIRrOl/PbzI6RMkXhCmbfCK95dWsw0r
	bWS5Qa/8HQmfuEzLMIL8qWvFOQJFnObGfTalmPCGwVtFdidQwWPE+8D8S6j+i0TMAo7vIAV4dF6RW
	/AfYDxK6T9FuW7Ny5wbKhnbbkHm8C6OsgF9OxoT2pv4UOzVuDiysLvdamVvuapAvJtw38+CzO4pq+
	FiXrJ1uEnKla/0YxPJjtQapR+ZRBZ42ZHoPgzAXRscms9eqMhNnJpfkp2krOXZ//vMX7CvvA+bXRY
	YhM8tHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3r9-0000000EfCH-0G8M;
	Sun, 24 May 2026 08:06:43 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3r6-0000000EfBL-0nhs
	for linux-mediatek@lists.infradead.org;
	Sun, 24 May 2026 08:06:41 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a88db610ccso8831436e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 24 May 2026 01:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779609997; cv=none;
        d=google.com; s=arc-20240605;
        b=Ifw2gGNDO5xKKN29y/74KaiVC3UQDMLeFsXLP4ggO9Wt6K83OAydn16LIXngRAHShY
         pzTTulLqs3zcpryJb25p/GTT/DfgDP0cOHnTBqQ1M8uurKZJMBYryBL0oIqmvwN284zj
         bAIMzMV+LxssMz7Z9MeZrKARF+q1ZfcW1A1HDCK8mV8f6tg+d7R+pV/B/fHkfZCY01Gi
         8UY20ophIskmrafWftmnfesFuX8AdoXjGetm+GTqE89PmodsakrYJ0fsXPcR6qYPYx/M
         2js1PtbqVPZf9j/6azeAQyOasnVyvHo0Bd7/HBf94SGlojcC30gxttYWMg5EOILEWYMp
         vR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        fh=AiKGzUvWwS263todyA3QLR6bMwSsIo6xNk+eWRmJJtI=;
        b=J2WTaL6ofcWuu6aYO6mWg/Ra4M2JeYJBzNgKcbzuep7kv451xYgn0NZH1JJ23XkzKK
         D+yGW3y5qZS+WLzalHBTR53BBpOIKnX9ce6MmgtHdrI0lBxzo2TdMLDdHZXV9c3e58tc
         0sbR1pBDv6+92wsdhavYY6C9vkXlqQQQgbNUsdVmALqVR1gxQQOkwUa+Y1vX65gXenqf
         0jYoL6Spy4/Lk7SXd62WKbKb/YAch8n29DviGTGqyo8nggz6ZI0E6fWJ3ts/ye2DBE2X
         oilpIdlnDpaSnNigVoWitzbpyP+UuMuwn+znu3mxp7VVrxX7S1nQoSBcNsyM3Yyus+ND
         fx2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779609997; x=1780214797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        b=VjzeJho192ayUzD1D9eJOBDIVzUAw5mGn77fL5JcIlWeFMPfbdZxzcaitYFYZc8nZI
         coaULb5SwfDWd3tjtwnYQ/5FFN8ppLu2kFsIVE+GHUqjtTLk9nqHHQwI5L5bWPo1r1CU
         TIcQqHKBfAaprRkE7vRhlJ7oITucx99nrTfxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779609997; x=1780214797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WMpRmGDV6X/z1OH5zMJ111/X3tKN2AtCzBErEW3G/E=;
        b=UzWHxNmTWaNnB6JsXw5bpZ2JlNHJXpo5pTfWhZ5sqEDiqXpgyvzJC1YLq+bYcEp6NX
         TnM9mmIju4L31Bm2r8hjTFs1HJ48+M0MVC1vR8UuORM8KZpPMaDZBZ8FXfsWdBu187fX
         GfeDgJ2xP9xWY7OPMuOWakGjTw7dh3nKviD58DVoghAtMThVBEvOViEy88SMh0nMPkyq
         JXeS6tekhiL/Ho/zE700nfif9Zly5dhjOwFybtTngG/rF5M4zpuKxhex0lqh1c7ccOR1
         4aVljpOumLLUWO5Zfez18fiHh7TCqd19AKBrun8hBa1zoRtD5zqRlbMtFQlDByy1VWn3
         62mQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XedODMv4snvlHHCz/RduR9TJ2j/aqeNapHv7WWrr5GVt/Zr88zoTtYZgpvup64QzN994bVQgWhVgRnelFpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Rz2Ru/WkTP7p5FWtMzPJ42hMeTzx5kl8+0e6ivEyCbGiB3+c
	CGAzQU2fO9vPaoRNz3VvI44Ie8yOu+1j6U8g/G0rtwEmg+JEdMunk2LdGYYlanF+QrmsTf+aasl
	N5fPs/NyJraqlu5CNH02TKfhoROEfunMAGjjAzFZE
X-Gm-Gg: Acq92OFNDaqpKkJ4aWfzS4TZ22qa2lzEg/5SSQ1BzKzLfjUlV2VH+da28inDy67+7mH
	OF/hd+RZpRu4HNP9g4PNKKK8VQglYBnmFh9skC8TvOLKwZjS4kX67iaXCVM7OBpGE8kjJM+NPGU
	ftdf0dp+UXN3DdXuZFCck28a0+ypPYXjYu0d80aCAdJCgHJ2Rk/rC+wkqgOvyer2/9yHEBsBHqQ
	MwjFudKcOOZhnhPof+SPJSM4vzDavj/tvas8PZ9y+fHM3dbxYAJwtb3rjnAV4YfVpkEk/IF8oUT
	3buLdl3lNLdCSBK1
X-Received: by 2002:a05:6512:1548:b0:5a4:52e:5933 with SMTP id
 2adb3069b0e04-5aa3235c913mr2060405e87.5.1779609997332; Sun, 24 May 2026
 01:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
In-Reply-To: <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 24 May 2026 11:06:26 +0300
X-Gm-Features: AVHnY4KQQKvEna3YmFG3JiRUMuMCSWWGPOX7GZHTMr-aA0Q2R8PaQnONHyygdDE
Message-ID: <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_010640_408172_E5E98B00 
X-CRM114-Status: GOOD (  45.76  )
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

On Wed, May 20, 2026 at 7:01=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, May 15, 2026 at 11:02=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > Hi everyone,
> >
> > This series is my attempt at enabling power sequencing for USB to suppo=
rt
> > the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc=
1
> > with just PCIe and UART supported [1].
> >
> > Most of the series is based on next-20260508, while the DT changes also
> > depend on some other DT cleanup patches I sent [2][3].
> >
> >
> > Patch 1 reworks the power sequencing framework to allow matching agains=
t
> > different USB ports. The consumer API gains an "index" parameter (which
> > is the USB port number on the hub), while the provider API is reworked
> > to pass the index to the matching function of the providing driver.
> >
>
> Sigh... I would really prefer to avoid going in this direction. IMO
> it's not very clear what this index actually refers to in generic
> terms, given that pwrseq is flexible on purpose and there's no
> specific, well-defined DT property which could have an "index".
>
> > Patch 2 implements the index matching in the pcie-m2 driver. Matching
> > only happens when a valid (>=3D 0) index is given.
> >
> > Patch 3 reworks the power sequencing targets for the E-key connector in
> > the pcie-m2 driver to add targets for USB and SDIO. The former is used
> > later on in this series.
> >
> > Patch 4 reworks the USB hub driver to return the actual error code from
> > hub_configure() in hub_probe(). This is needed in the next patch to
> > correctly return -EPROBE_DEFER.
> >
> > Patch 5 lets the USB hub driver look for power sequencers for each port=
.
> > Currently this only works for M.2 E-key connections, but it could be
> > extended to cover other cases. It should also make port reset via turni=
ng
> > off the port VBUS work, even when VBUS is not directly controlled by th=
e
> > hub.
> >
> > I expect some discussion on this patch, because a) it adds some
> > OF-specific code into an otherwise generic (core) driver, and
> > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powerin=
g
> > on the port twice, which negates the port reset part.
> >
>
> I understand that you do this because the port device has no OF node
> assigned. If we wanted to call pwrseq_get() for the port device, is
> there really no other way to associate it with the correct pwrseq
> provider?

I suppose we could tie the "port@X" node to the usb port device, but
AFAIK no other subsystem does this so we would be introducing a new
pattern.

In the M.2 pwrseq driver, we would have to match by port node instead
of its parent device node. We may end up with different behavior for
the USB target vs the other targets.

Also, the "port@X" nodes only exist for the OF graph connections to
connectors and/or muxes (this series doesn't deal with the latter).
For directly connected devices, there is a "device@X" child node
directly under the USB hub node. That node is what gets tied to the
the USB device.

> Does the child index in hub_configure() relate to the port index as
> defined by the unit address of the port DT node? I'm talking about the
> X in port@X?

Yes. The downstream port numbers start at 1. I believe 0 corresponds
to the upstream port.

> > Patch 6 reverts an incorrectly modeled OF graph connection for the
> > MediaTek XHCI controller.
> >
> > Patch 7 then adds a proper representation.
> >
> > Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
> > USB type-A connectors found on MediaTek-based Chromebooks. These are
> > provided in this series for reference. The USB type-A connector changes=
,
> > while not directly related, have overlapping context, and was easier to
> > include. They were also used to test some extra local changes I tried
> > to convert the USB A connector from an onboard USB device to a power
> > sequencing provider.
> >
> >
> > As this series changes existing power sequencing API, and also uses the
> > changed API in subsequent patches, I think the best way to merge this
> > is for Bartosz to take the power sequencing patches and provide an
> > immutable tag for Greg to merge and then merge the USB patches.
> >
> > The DT patches can go through the soc tree once all the driver and DT
> > binding changes are merged.
> >
> >
> > Thanks
> > ChenYu
> >
> > P.S. I'll be at Embedded Recipes if anyone wants to discuss details.
> >
>
> I'll be there too! Or should i say "here"? I live here after all. :) Let'=
s talk!

Sure!


Thanks
ChenYu

