Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C07C2A06C
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jan 2026 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNhnPWPphu+I4t9H5XuMrO/46QkiDHIIBXPeXwdimwk=; b=ylvhDO3ZxLXcFW+X4Hr6mfgKjS
	1piJMrPjeZ2laOGrAWyD9vqTuv5z9vFZsiWGnR5mNa5BsOqZEUpbtbr49RwSbIGX2qSxiJ6La67eF
	mw3XokHXGu6qHqaoHpt66DY5AS30/daTEtJT7GYDrKxrVVoveb2qM79J1oifNbcNbzGkKWf6YojrC
	lzSVBDXNFhTrFABFxl/kpaUhxyaVFI6lG6JUeQEZtOnZm+PhnYaNAg8koXxmn98tgQyKkjkQim/Y/
	hArgaTcQY8ZFvzw013033+zEzQVPp+BICfwHHflOzoxjXwuiY23RcK7DUYQvaMI/L4mjU/m4rMeK5
	fF8wE3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcJL1-0000000A6zx-0GDO;
	Sun, 04 Jan 2026 08:19:47 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcJKy-0000000A6zW-1pBh
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Jan 2026 08:19:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so7768206f8f.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 00:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767514782; x=1768119582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNhnPWPphu+I4t9H5XuMrO/46QkiDHIIBXPeXwdimwk=;
        b=OVPaC8SgeXgbDe0YJLh63U7zberVzIfMhBBCu3SSWKCNoa31uRCM6uiftTgAbgHFxu
         vf8Pijhhu1SdvVsnhBb5oP0BCuX6TAtMjkm9QNSa1GVN33sF/dkIaNsxcjjVbXqF+bcS
         ORyrmrbGMtU/rfZ5kDvtvPNqPOM399gEvji34iPlUxmxXpz2AyfCt8m+I3Q4viKwXku5
         1UvoAR5vsfQKyU/y04tw8wQIBmnh1iu3u+0MwcQPcHmrmwgZ+9igNtF9LO/g7ZbJ/3Ts
         A4/4t0yNICgfg+i6BV0GjMJFaorPGR2HByYVBwHqBp6pVy/2IzmxDQ7SdpQ0U1aeyeD9
         NTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767514782; x=1768119582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VNhnPWPphu+I4t9H5XuMrO/46QkiDHIIBXPeXwdimwk=;
        b=Nbe9BP3RX8kobabM5iCeHaPsDGayM0yA6/q2K4YvqI9saQQB89h7tgJ40eBa6wgo3n
         /2VKm7x6llkKK27jEr5wUNNEdFmfn/lSS5M1sV/z+BMnegVnSrjfkSyNm+LVE7hMupM6
         cS2ZnTpjdPw5Ew5uDsf8YvIRs9+OWU+eCQ94Yr3hQV1rj3UQQrDqzDuYqap6TA2S5pNh
         2UNfDQr+XM+gnJRHYNZZpcM2TDgKN469CeMFdA0vOtyGeNsWBPEM0A8Sfp1TyZI0yDiJ
         PHbb8/MaWsaKXxh1k6NYRgFQrF9dmKl1jJVNmPa17LshiSspHtDvm/ML9c1Xsfjc3GXK
         OChw==
X-Forwarded-Encrypted: i=1; AJvYcCVFTpxyMbt04RyZ7M7DFFO9EyQ3BYVviOSuYDKztZ9cuRievRSw4MfnGxCZ30uJ6WXrEfdhqIWcxU5VdC8Deg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/UtNpVSqUjwv/rzXCOIeXePmHZcgvvpjkP9w8w1Xw2JJpS6wI
	UM7R9YwKXksOgRKfG6yOyx8eC7DraQw1qpTTF6UDrF6ijjpT8H1cMG6Y
X-Gm-Gg: AY/fxX5WN9pw5uNuXurVDt70tgXWc+XgaOq6Kju3nYsYuvMCBPT1DIWYQOD7cDj8vBv
	VqfStKooYSfuZVcuAlBeHc7LtjmMacHbGCLM8EUlbHW9xqF1XZMZnn2Ies6eOQZIDomaqfQUvT/
	nHKIyFyS8wujZ64D6CEEZw4nP1vpM0L9xkcPJXDYZDv2pngSCK0ck2aTa/PLjjZUJHscJYVdZKG
	7a4C2Rjm3W4iRkWiOWeFp/cfdHDRjdWIQW7mpvajQZWBGChJ42PWXZWhJQaJD6cWETDc4X0O07N
	jWuUNT5R2Kef9it+BeZx+J98YV66uc3LFjhiwkP4dRTz8PoipVK318AmQFiXuFnWhLUVHOZWJxG
	yJgelgjMWd4nKZgstnVgvTW3D75SXGV6BmJ7gyB0G7HhHRnVGRxGyqPSBXlZpS1HFnGwQT7zwrY
	6JJehaW3BhMiDkP6w438rbZXcsNVKgWod1aB8eEH5vwC7Yb0eiakp0l3F+mafZGIO2aTi9HA==
X-Google-Smtp-Source: AGHT+IGVE35w/mIgbVKF7jo1kXk2fItEl+1AN6nAuaTpOUbgrAhK9/MHCuZ5Z8ur0F6HzR9C5wPA4w==
X-Received: by 2002:a05:6000:2907:b0:432:8504:f67a with SMTP id ffacd0b85a97d-4328504f681mr35577584f8f.20.1767514781753;
        Sun, 04 Jan 2026 00:19:41 -0800 (PST)
Received: from fedora.fritz.box (dynamic-adsl-84-220-246-20.clienti.tiscali.it. [84.220.246.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2278dsm95843304f8f.18.2026.01.04.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 00:19:41 -0800 (PST)
From: moosager90 <moosager90@gmail.com>
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject: Re: mt7921e: repeated driver own failures cause hanging
Date: Sun, 04 Jan 2026 09:19:39 +0100
Message-ID: <2715401.vYhyI6sBWr@fedora.fritz.box>
In-Reply-To: <CAGp9Lzp8NjVwkn2atNqT9x9-QTkWMLxK+Ntkb=3Z1fWcM6N=7A@mail.gmail.com>
References: <4870974.vXUDI8C0e8@fedora.fritz.box>
 <CAGp9Lzp8NjVwkn2atNqT9x9-QTkWMLxK+Ntkb=3Z1fWcM6N=7A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_001944_519023_8E6F4395 
X-CRM114-Status: GOOD (  44.58  )
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

Hi Sean,

I'm resending this because I forgot to Cc the mailing lists.

On Sat, Jan 3, 2026 at 7:24 PM moosager90 <moosager90@gmail.com> wrote:
> Hi Sean,
>
> I have updated the firmware using the files you recommended (and I will w=
ait
> for the issue to occur again), but I believe my distro's (Fedora 43) pack=
ages
> were already up to date, as the files already present on my system had the
> same hash as the newly downloaded ones; so the issue has been happening on
> the latest firmware (it was also happening on earlier ones, but I don't
> know since when).
>
> > Could you please share more details on how this issue can be
> > reproduced? For example, does it occur after suspend/resume, under
> > heavy traffic, or during normal runtime?
>
> There are no specific circumstances for it, it just happens during normal
> runtime: no heavy load is required to trigger it. I haven't ever seen the=
 issue
> happen immediately after suspend/resume either; I don't believe that's re=
lated.
> I have a feeling that it has happened more often when connected to a
> public, password-less Wi-Fi network, though I'm not sure; it also
> happens any other network.
>
> > Also, please confirm which firmware version you are using.
>
> The dmesg output given by my distro's firmware files was:
> [   16.313264] mt7921e 0000:62:00.0: enabling device (0000 -> 0002)
> [   16.329376] mt7921e 0000:62:00.0: ASIC revision: 79220010
> [   16.405931] mt7921e 0000:62:00.0: HW/SW Version: 0x8a108a10, Build Tim=
e: 20251118163143a
> [   16.790050] mt7921e 0000:62:00.0: WM Firmware Version: ____000000, Bui=
ld Time: 20251118163234
> which is identical to that given by the latest firmware files from git.
>
> More precisely, the firmware from my distro is that at [1]
> (mt7xxx-firmware-20251125-1.fc43.noarch.rpm is relevant), which I believe
> corresponds to branch [2] of linux-firmware, which is the latest one.
>
> > As a debugging step, could you also try disabling PCIe ASPM and check
> > whether the issue still occurs?
>
> I have now added pcie_aspm=3Doff to my boot options; however, I had alrea=
dy done
> that in the past and the issue still happened. Here is an excerpt of the =
log
> from that time:
>
> kernel: Linux version 6.17.8-wifibuild+ ... (gcc (GCC) 15.2.1 20251022 (R=
ed Hat 15.2.1-3), GNU ld version 2.45-1.fc43) #1 SMP > PREEMPT_DYNAMIC Fri =
Nov 14 12:24:21 CET 2025
> kernel: Command line: ... BOOT_IMAGE, root, ro, rootflags and rd.luks.uui=
d options ... quiet loglevel=3D3 udev.log-priority=3D3 > pcie_aspm=3Doff
> ... messages ...
> kernel: mt7921e 0000:62:00.0: enabling device (0000 -> 0002)
> kernel: mt7921e 0000:62:00.0: ASIC revision: 79220010
> kernel: mt7921e 0000:62:00.0: HW/SW Version: 0x8a108a10, Build Time: 2025=
0523103150a
> kernel: mt7921e 0000:62:00.0: WM Firmware Version: ____000000, Build Time=
: 20250523103234
> ... messages ...
> ... repeated sequences of driver own failures ...
> kernel: mt7921e 0000:62:00.0: Message 00020003 (seq 6) timeout
> kernel: mt7921e 0000:62:00.0: Message 00020003 (seq 7) timeout
> kernel: mt7921e 0000:62:00.0: driver own failed
> kernel: mt7921e 0000:62:00.0: Timeout for driver own
> kernel: mt7921e 0000:62:00.0: driver own failed
> kernel: mt7921e 0000:62:00.0: Timeout for driver own
> kernel: mt7921e 0000:62:00.0: Message 00020003 (seq 8) timeout
> kernel: mt7921e 0000:62:00.0: driver own failed
>
> I had built the vanilla kernel myself at that time, hence the tag. That w=
as
> before November 25, but I believe I might have been running the same firm=
ware
> as today as it was provided by Fedora's testing packages at that time.
>
> [1] https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2865762
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa=
re.git/commit/?> h=3D20251125&id=3D4ee5122b3f58e4c07951746c4425e2f4f42e860f
>
> On Sat, Jan 3, 2026 at 8:10 AM Sean Wang <sean.wang@kernel.org> wrote:
> > Hi moosager90,
> >
> > Could you please share more details on how this issue can be
> > reproduced? For example, does it occur after suspend/resume, under
> > heavy traffic, or during normal runtime? Also, please confirm which
> > firmware version you are using.
> >
> > It would be helpful to test with the latest linux-firmware version:
> > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
=2Egit/commit/mediatek?> id=3D5cf85776762a544ad27c4447b61eaabb0d4716e7
> >
> > As a debugging step, could you also try disabling PCIe ASPM and check
> > whether the issue still occurs?
> >
> >                Sean
> >
> > On Fri, Jan 2, 2026 at 4:35=E2=80=AFAM moosager90 <moosager90@gmail.com=
> wrote:
> > >
> > > Hello,
> > >
> > > There is an issue with mt7921e which causes repeated failures in chip=
 resets,
> > > bringing the network down and causing hanging on every command or act=
ion on the
> > > system; the only workaround is to reboot. This is what the kernel out=
put looks
> > > like at those times:
> > >
> > > mt7921e 0000:62:00.0: driver own failed
> > > kernel: mt7921e 0000:62:00.0: Timeout for driver own
> > > kernel: mt7921e 0000:62:00.0: driver own failed
> > > kernel: mt7921e 0000:62:00.0: Timeout for driver own
> > > kernel: mt7921e 0000:62:00.0: driver own failed
> > > kernel: mt7921e 0000:62:00.0: Timeout for driver own
> > > kernel: mt7921e 0000:62:00.0: driver own failed
> > > kernel: mt7921e 0000:62:00.0: chip reset failed
> > > kernel: mt7921e 0000:62:00.0: Timeout for driver own
> > > kernel: Console: switching to colour frame buffer device 360x112
> > > kernel: fbcon: Taking over console
> > > kernel: mt7921e 0000:62:00.0: Message 00020001 (seq 1) timeout
> > >
> > > I have observed the issue on many untainted kernels, and I have had i=
t happen on
> > > vanilla kernels not provided by my distro as well.
> > >
> > > Mine and some other people's reports are available at [1]. More logs =
of the
> > > issue on my system are in the attachments of my original report on th=
e Red Hat
> > > Bugzilla [2].
> > >
> > > In the past, the issue was reported at [3], which resulted in a patch=
 [4] that
> > > only keeps the system running instead of panicking. This means the dr=
iver still
> > > causes system hangs.
> > >
> > > I still don't know the root cause of the issue and I would like to ge=
t to the
> > > bottom of this; any help or guidance is appreciated. Crucially, I hav=
e not found
> > > a way to reproduce the issue at will.
> > >
> > > Best regards.
> > >
> > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220353
> > > [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2411854
> > > [3] https://lore.kernel.org/linux-wireless/VE1PR04MB64945C660A81D38F2=
90E4A4BE59F9@VE1PR04MB6494.eurprd04.prod.outlook.com/> T/#u
> > > [4] https://patchwork.kernel.org/project/linux-wireless/patch/> 727eb=
5ffd3c7c805245e512da150ecf0a7154020.1659452909.git.deren.wu@mediatek.com/
> > >
> > >
> > >
> > >
> >




