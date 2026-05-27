Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9047CCD5BD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 16:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=; b=qCa7DSxvX+aADPQFmQRFqa7Tcs
	KLcUA41YgV//B5NOupKjcHC0lcR+KjOvQWLOXWLFJeqBddyP+5GUqdm2IbCrGs6mlzMaYP21e/Pt6
	vEBa+MKf7Fa121YrRVvohBFh1nXMFxOIxRkltItnZMCi/A33e6j33A5hC8oizU3QtMWU/WIesv8s0
	pE7zOiC2WR/+Q3BeZIJJWCuZiTU0Q8t7rqZfkcB5GhffBzJ3U7whx40LtRM8xTpuH7uQMOW7n/2EQ
	KQkrMVqEBIyBq9Z4GJeXYbnXoAEE0jqKHeHh3B+mGx0xkgQmtymj+oxFYmrXZ1FUHLhC/bdOc+Qt1
	QB8uPP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH0R-00000004UeV-20kw;
	Wed, 27 May 2026 16:21:19 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH0O-00000004Ucs-3gv8
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 16:21:18 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-38be5e86918so10582161fa.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 09:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779898874; cv=none;
        d=google.com; s=arc-20240605;
        b=KL9xZwB9UiDe8ih1tt1NahuSnfAcWPOoemysaHVbUjUlvmdUlm4Xd87mGYtD1FCA88
         dxbakHorIlNxfN8hqpXNzIolHbIOPcbHZEBFz0/w6Eu1Lma/Ln6fWHeIACweY9w0vjs/
         C0w2X1NPpo32vgMItSKW1+OVE2OqV6crr9PAcfS7MO63gRhU7pxn3NECmwSv2jUS2mfX
         eEhCDYechodeYwJ3snq3+Bo8FBkwIdvIKt2tePgJeGdaJ/J3dlveByV0vtA2OZAmOV1D
         tw8mRHhj55S+jxn9TZ60Gfx5IolIZt4I2NG73j1UUD/brLl6vApnupSeKVYDCk6YDfK5
         x8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        fh=Vxkftp7QWva0JksAuxomrMluGOFEh0JgGnEPuja8wDc=;
        b=HqSWKjCy8sIdeHG1qRde9TZ0d6n1NUu2ZkLl4oYAPYx13ZMnEGqnFOrgxTI4XD4QwP
         aPKJMv+elyRH67jmI7CDkFTuZbhHiqDBpwMNInyoTSMUBYSVYaGGO8fAAKhZMzwK8EXA
         9PfvgYrDW2vqp5rh0LFCJQtLtPkb5hY6mLdVPkxVLxtndzNxw8VamAj7qn8ZXReC0exi
         dcAmwq+BSNSqRgmbsk40vXnNOPhbOLd36HEK0Yoqe4gCA7uz4JuIzSUQ2RNxSxO3V05/
         3/cRPP4EHH04pIvPfwmQIdHwDd6BnqE+YmXfQ/LjTBncGxMSekXL/RTy/eDxk7kS/Neu
         NbbQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779898874; x=1780503674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        b=K5DhtC8B+dzwYuhVAFjXVDw1RygposiZ5SHd2uOs2TDnYQdpTeuS9wTBWN1hePfQC0
         nv6JbqJw/2xXfxjAadc6Oww7SWAEKnN3Xz602M+SSckIZU1R4LT23q/K83Ml6eUzOGM1
         npB/rHVYwxgwAfw04aJWOpfhhEA50j9Ve1sGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898874; x=1780503674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dxrqcdNnKYVhdfP7nh0R/VHpio1dU95MRkKy/vXfjQ=;
        b=bnfJojMXzHEGH51DVy8IsciXGGhFSk8UOu6qOamlRBppttqBaVZlJ5DwuFjVRxWugW
         fpupBA0gXaKkRkx+dhlc6BV3ikumY0RqHVeYKFBOjOtHbH3ixTttwjFD9ong8vnx3hD8
         XxcNJKGY1Egg7T2dQaiKUQZ9SmHbX7Yy94W0Sci1rUSuZZ2R++wsc4dIzIcXIYRuL1Du
         UsbuKaVDhWMuxeCQ/SAU2/Jth5nLKLBHATyV5Pd73oH0nrGXrzz9Krn4D5bU3a8f/7Hj
         Ac4VUkDzqq/zVTWgL7Uk1/tUld0w9YtFMJV6y22i0A9y1TXQm54q69PtgemfXtAVDWUV
         Hm/A==
X-Forwarded-Encrypted: i=1; AFNElJ8J3rGUUmGvBiUc7/7ggYbf4nZm/NHi09s7MIF4C6HBcLnnzBQFDl0AFzQAmt412xMdelED8//hHh5zL4+MXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/dfY5HhqSreD/Ffpm81uzIDCa/fx0drbnjAZ/e89TyXbzzAkx
	Xw9CiQQH9X/E0+lfGfs6xp5PY8NI7V4aj/nFpapgDM9zX1ILITPEXz7GIYWV64jk+J+fbyT5waJ
	dnE7fERmrdmi6uNpN+dpqi7Qbb8pCsLZi/j0vhHXK
X-Gm-Gg: Acq92OHn7VoUyhxyQt37Zw4ctL88nJE7j+v9GJM5mCO0kSUGPncaKkGuYqZ8XybHtwG
	EYd5Q8EH0V/qGkPHErcLtI37kpO1/X5z3VKKkNroNBAc39P0myyH3sw/4tIr3WnxH8gD/f0Pu4D
	hmw7SmFqxOTEn8fajNHouc+Rfk5pG9GDDkwfs2k11F77uD8xxECcyrw9rTeZpKnK9P6V95aHmLz
	cnH9fjbLMiovzbM65IxjVFS3eJ6fai5+VK/nW7FnF8RndG1Cq8MlEvE/ssiEXdWGNXhlXN/pMl/
	ylC2abR7RPuPI70bRw==
X-Received: by 2002:a05:6512:2204:b0:5aa:b6a:9257 with SMTP id
 2adb3069b0e04-5aa32393ff6mr7614476e87.44.1779898874134; Wed, 27 May 2026
 09:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com> <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
In-Reply-To: <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 27 May 2026 18:21:00 +0200
X-Gm-Features: AVHnY4LzsI5n_9iqirzC_of7SGIfiJw_kQ6vIsCvh5Qe5puVB03Deb7QvAn9uiw
Message-ID: <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_092116_981987_2B562674 
X-CRM114-Status: GOOD (  35.80  )
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

On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > > >
> > > > I expect some discussion on this patch, because a) it adds some
> > > > OF-specific code into an otherwise generic (core) driver, and
> > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up pow=
ering
> > > > on the port twice, which negates the port reset part.
> > > >
> > >
> > > I understand that you do this because the port device has no OF node
> > > assigned. If we wanted to call pwrseq_get() for the port device, is
> > > there really no other way to associate it with the correct pwrseq
> > > provider?
> >
> > I suppose we could tie the "port@X" node to the usb port device, but
> > AFAIK no other subsystem does this so we would be introducing a new
> > pattern.
> >
> > In the M.2 pwrseq driver, we would have to match by port node instead
> > of its parent device node. We may end up with different behavior for
> > the USB target vs the other targets.
> >
>
> I imagine, we can check the bus type of the parent device to know if
> this is USB?

The "bus type" type is probably not exported. However since the DT binding
explicitly says which port on the M.2 slot is for which connection type,
I think the matching can do a special case check for the USB port.
The next obstacle is that the target string is not given to the provider
match function.

> > Also, the "port@X" nodes only exist for the OF graph connections to
> > connectors and/or muxes (this series doesn't deal with the latter).
> > For directly connected devices, there is a "device@X" child node
> > directly under the USB hub node. That node is what gets tied to the
> > the USB device.
> >
>
> Is this a problem? I don't think I understand what you're saying here.

It shouldn't be. I'm just saying there would be different behavior on
the USB side for connectors vs onboard devices (like hubs) device nodes.

I talked to Greg earlier, and he said not to touch the hub driver; the
hub driver should only deal with features from the USB spec. The
"onboard USB devices" driver is what should be used. And this would
be a proper case of adding an auxiliary device to the M.2 slot driver.

However this seems to completely decouple the power sequencing from the
USB core. Take the USB A connector for example, it was recently added to
the onboard USB devices driver. However the connector has a device node
that is not a child node of any USB host controller or hub; it is connected
through OF graph. At the same time, since it typically sits at the top
level of the device tree, a platform device is directly created and the
driver subsequently binds to that device. This is totally different from
how the hub and other directly connected onboard USB devices work. In
the onboard device case, the device node is a child node of the USB hub
or controller, and the corresponding platform device only gets created
when the USB hub driver probes, thereby sort of tying it into the USB
device topology.

If the power sequencing ends up not connected to the USB subsystem, then
maybe the M.2 slot driver could just check if the USB port (port@3) was
used, and just enable the USB / BT pwrseq target at probe time? That
would mean less changes needed.


Thanks
ChenYu

