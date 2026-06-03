Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07B8CD6E4A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=; b=tS2XPTMtJu1pOdVZeTqxHhshL7
	eLkAK2iED8bD2crG2Fco+pw8G4tnk17yUQX2QZ91fGF/EXciT0a7mLfM/qTE51mCkcg/X4APNnsPK
	1oeWjuEAe9RVOXiItQX/Ueqg6XNJxKlua3+tNMD4LgdsD99pPW4CeLS9pgBpE82MFT44WK47rvVET
	t7ys7Ni6swslnEU2tJt6vXdiFkUOdgwQfH/mZ0nqFE2MKq7qeKJr5zDK5pODPNvBuj9bx772SMKdQ
	ZPnmLKhzlqaQmGMTBDsBaIP6ISdEqtfid2c3XxXbVW1mJlvBT0cbezep1QhmH/PsPwqV7uXpVFMeG
	iqZpd7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfVq-0000000EPvq-2mIX;
	Wed, 03 Jun 2026 06:55:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfVp-0000000EPv1-1m6K
	for linux-mediatek@bombadil.infradead.org;
	Wed, 03 Jun 2026 06:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=; b=lxqkxv5T3tUw1TxANVI1eqoREB
	kbgVhsoFSCHBkX6YUQfMsEplMshJCi1KDtOMmxe7htbEvVtIDxx2ABUnvBb9XfbMtnqWTpCXdDVhO
	niS0Kz3dR8yGwOYIFnonNNTw+H2EFqzeIRdWGlIRhUTTOiy4L5dXrYw8M1iVJXbsZ2GPXH42OobXH
	JA2CLQ9IMbbjB8/sGQQleteMZFkTc/rtJpeYYOxfbv70vS68L0Ttc+gJYtMLIy8QF1xsFqwpSt8sx
	DYCTy5OJcmZlrp4hsuuXFcRjKGdsqbE2hQK8C5GLeuVWuJ7yE5fUDHQsULVolAgqywScLgbrWqYjH
	x9QBNFQA==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUfVm-0000000BLAr-1enB
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 06:55:36 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aa2c25c632so13460159e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jun 2026 23:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780469732; cv=none;
        d=google.com; s=arc-20240605;
        b=apyQhp/qFy9hZhaiXHtNnE7XngaTS/e+8uvSbqnJVX8Wt8pbix8cpNVdI8TCCK5O6B
         l/O3zlmO14rnfgCNKuEJvBhzXaxU9Ipbn2N0eT7l/N6/MfLjlB/jCG9ukV9txELigIwo
         S1BuXdphBGVK0nAJBYIU8WFeL9OCM3E8/BZduvIsaq/SMDQdBE+m+NHwPiHSEQ7S13qe
         FX+YFUpZMduqzXsJ1wjeHkY657ehawR6q3QungND0YXFk293I6A8L8l8JO+jtJ2DlXud
         xP29aNGl7pkvHl9HkNFrLvKdtrIB6xh/n8G0wr8W/BD4mc7aQIpwuZB2gqvNb/jaX/U0
         P0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=;
        fh=CvvJWCAwyNrhyQRql63WrpPqyPgF9zi6LedVZUgiuDU=;
        b=b3iDyDvYfpJeYQGy5NEiZe3hEZ46oT2no4mNEr6Mx3B9hIUZAvrIPBqj8i2Hi+tR/V
         wKjX+lHikhnASlXugrLQrg08FEbFftQKzkkd6OcPiCvRrtIwZfRy+yfPaz735iViclhv
         EzAoQDrYz2CN0wm90Nhg3oQb1Phn64Ga88EGMZQhRt9fppuC49NcrWhP5A7Henh5SDst
         lYQ+haEpUogkpz4eRmR/QEgk7h6CkFtnnr4X/DzRmktlx1+Xb2C1yvUHKWBXDXDw+gxb
         CBCoNjynMlktR+55Xi8YpN1t1wRea9RGAPyUcunjqD9YB6YLES//d4LZn/CZExe6Y7bA
         POQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780469732; x=1781074532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=;
        b=dcNMSGOpqkKjO/1dCoFJfcOHDEd5UOF3TobjATFOvtgDz4H4GC/Xhrc2awScCMvzYt
         e6cFQncJA5yDg+0QRaYcPvmg0Da3cG8qcNDV4kDK6roRXn8TrXAAQZfC4JZTM66Xq+sL
         zxC7T2723I2M7flNA1i8+b4501j3hpzB6RpqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469732; x=1781074532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eMVHxMtbHCbUYEX8FNbdji2LBuN1ycDKpUMu2gGLVv0=;
        b=EoZPr5zjbP3AcGa3D2kpVfl9AIginAm0T6QybTm3mdO5bT+O0lFM+ixAnUPSN5hhZQ
         W6QbkGoBZDmF1RWNpbgxe7c0D2YutXWc0xeONb786PJ8WVkRNrF/Q1I2DHYGXPVAoYVY
         0AfWCMOSOol3mbtUwkQgICOcPXi+JYncDLjVaKjVPTl66JIlObzplnHrLGKaP2IokaZf
         97uqr2SMppnzltVCKLAkqqg07wNjIm0cn5MDyJVTIYmKcha7rqaFh6g4GcLwZlUFIZM6
         XxI0Zu3EpuhEbY+vCF/zIHQgpCze75+Oy7mygWgNsxyCNBVLDb3mk84iqGIQUkv2ihFs
         LxWw==
X-Forwarded-Encrypted: i=1; AFNElJ9594fiG1cSydKjKfJ7sj82EXqgWLiLggEvVMC0W7/WtBqrZFLbz1nAfymF7KSstHn9GG1JCs6n0KvPL7198Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4TMvI+koHWB8yJK75hJj6cBTTADNWLw/0Kyicqz57K2DIr2hz
	0rK9Tt1roldZ5S7+3V6Yk05dMTcSdQbN6Grdl/OKxj1JIWfauPAePH5WKnQ08ey/IagphlCepKn
	A4fCX3scWUZ4Dv2EKC+egoTMaMW+SXk2V5TdI3rN6
X-Gm-Gg: Acq92OGFj2dVqzuzM3c8aMaEBb9YwL02U4+e8ac6X+Gdw28JzcP7xNn/c3LXsz+Z39A
	G0MIxDIYhg9GRLYqNPUeUZQ2/JVgpEV5B6VsXiyW1qr86yP/TQ6nZYiMnuNztqtfFQuA82CnI1X
	kySh4KHTaZIr/mkTr0M4YkpdhAmXvujMs3Miik6Up4V4WUYBPCW4X3tl+4F3J/L5+X9yF6kAPcA
	CCCiNI/I24+tFCXerPo64WAGl8FWcmoeXIEVhuZEHh6Ifuk/UbDosrx1gO5p/Iq2IkrQAk1/qFl
	1n9JQP6iV6MXtCBFpx9lNZAkzUPAikl6HtGU6TREAa2CC5O8
X-Received: by 2002:a05:6512:2310:b0:5aa:5f81:51cc with SMTP id
 2adb3069b0e04-5aa7bfd939emr598153e87.0.1780469731666; Tue, 02 Jun 2026
 23:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com> <CAMRc=McADm0F4bwhj5qoigfUT-AV6CVpo+FAaqoBnZ3PrjBc7Q@mail.gmail.com>
In-Reply-To: <CAMRc=McADm0F4bwhj5qoigfUT-AV6CVpo+FAaqoBnZ3PrjBc7Q@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 3 Jun 2026 14:55:20 +0800
X-Gm-Features: AVHnY4LlLDHphsEQE3sATrymTCUnapNz7ZFd_5P8UcLWbDeGGfHP5mUv-LY1yqE
Message-ID: <CAGXv+5FhUuV_0fdOMDowffA-1jtUoNOcxZSZE-pd_T4V5Qg3Jg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_075534_791630_F497B5A1 
X-CRM114-Status: GOOD (  48.81  )
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

On Thu, May 28, 2026 at 4:33=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 27 May 2026 18:21:00 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > On Tue, May 26, 2026 at 11:48=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> >>
> >> On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> >> >
> >> > > >
> >> > > > I expect some discussion on this patch, because a) it adds some
> >> > > > OF-specific code into an otherwise generic (core) driver, and
> >> > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up =
powering
> >> > > > on the port twice, which negates the port reset part.
> >> > > >
> >> > >
> >> > > I understand that you do this because the port device has no OF no=
de
> >> > > assigned. If we wanted to call pwrseq_get() for the port device, i=
s
> >> > > there really no other way to associate it with the correct pwrseq
> >> > > provider?
> >> >
> >> > I suppose we could tie the "port@X" node to the usb port device, but
> >> > AFAIK no other subsystem does this so we would be introducing a new
> >> > pattern.
> >> >
> >> > In the M.2 pwrseq driver, we would have to match by port node instea=
d
> >> > of its parent device node. We may end up with different behavior for
> >> > the USB target vs the other targets.
> >> >
> >>
> >> I imagine, we can check the bus type of the parent device to know if
> >> this is USB?
> >
> > The "bus type" type is probably not exported. However since the DT bind=
ing
> > explicitly says which port on the M.2 slot is for which connection type=
,
> > I think the matching can do a special case check for the USB port.
> > The next obstacle is that the target string is not given to the provide=
r
> > match function.
> >
> >> > Also, the "port@X" nodes only exist for the OF graph connections to
> >> > connectors and/or muxes (this series doesn't deal with the latter).
> >> > For directly connected devices, there is a "device@X" child node
> >> > directly under the USB hub node. That node is what gets tied to the
> >> > the USB device.
> >> >
> >>
> >> Is this a problem? I don't think I understand what you're saying here.
> >
> > It shouldn't be. I'm just saying there would be different behavior on
> > the USB side for connectors vs onboard devices (like hubs) device nodes=
.
> >
> > I talked to Greg earlier, and he said not to touch the hub driver; the
> > hub driver should only deal with features from the USB spec. The
> > "onboard USB devices" driver is what should be used. And this would
> > be a proper case of adding an auxiliary device to the M.2 slot driver.
> >
>
> The onboard USB device is what initially inspired the PCI pwrctl code so =
it
> doesn't surprise me we circle back to it.
>
> > However this seems to completely decouple the power sequencing from the
> > USB core. Take the USB A connector for example, it was recently added t=
o
> > the onboard USB devices driver. However the connector has a device node
> > that is not a child node of any USB host controller or hub; it is conne=
cted
> > through OF graph. At the same time, since it typically sits at the top
> > level of the device tree, a platform device is directly created and the
> > driver subsequently binds to that device. This is totally different fro=
m
> > how the hub and other directly connected onboard USB devices work. In
> > the onboard device case, the device node is a child node of the USB hub
> > or controller, and the corresponding platform device only gets created
> > when the USB hub driver probes, thereby sort of tying it into the USB
> > device topology.
> >
>
> Which is precisely what we do for PCI pwrctl. Though I'm not sure how we =
could
> replicate this behavior without touching the hub driver.
>
> > If the power sequencing ends up not connected to the USB subsystem, the=
n
> > maybe the M.2 slot driver could just check if the USB port (port@3) was
> > used, and just enable the USB / BT pwrseq target at probe time? That
> > would mean less changes needed.
> >
>
> That sounds sane to me.

Mani seems to be against this idea though, since as I mentioned it decouple=
s
the timing of the power sequencing from the USB subsystem completely.

Ideally we want them to be linked.

So I will take a stab at option one for now, incorporating changes you
requested:

- Drop the pwrseq API change
- Use the firmware node API instead of the OF API
- Tie the usb_port device to the "port@N" node

And we'll see how the USB folks like or dislike it.


Thanks
ChenYu

