Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8028BCCF9EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 20:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OC8sv5nVVI5JjZAVR+hifwSr8nAzhJqQduX4ujCZR7I=; b=FYM479qhRpEFG/llC+XpXJ6aim
	QpmScH97fPLyyFIm7IE06Up7GqVQhisIGbtSgIFC6b9lfVHg1gjeZ6ONE2bI1rvkcLp2sKSnfj/ph
	jmXdUl2M6lnKQ41+16NAXtowzqFIorUNqLcFlYHDASlRxAeNWZyjaomfLTam4dCKB/eOiWSxFdIX0
	kLrlU+4tKvN1KdZalv2DtcvOT9PeAa2iVQtn8c9dgpuDH1BSbN1my3X77QIbJu3I63Z0IKTAmMq/3
	TzI4N1QymcWOg1/8R0T/ayxwMvtOYXuaFjGo7EZnELGJGEt+tWPyuTePyxN+IzyMPJq4p0WYuG0cZ
	DOnJIBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECWx-00000002kRN-1Avy;
	Wed, 29 Oct 2025 20:12:27 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vECWu-00000002kQ8-1TvW
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Oct 2025 20:12:25 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-63e1c0fd7ddso409940d50.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Oct 2025 13:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761768743; x=1762373543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OC8sv5nVVI5JjZAVR+hifwSr8nAzhJqQduX4ujCZR7I=;
        b=D7xIOVgBvb67xPIlBSfnLF/iwPusXjw7kbwOoZrKJ9NgYvISEbVh91X7adyDfx7MCw
         8BnWir6WnvN3STN7r0RFxV6P/upVo3t6JTZSH7Xa/LX9u1De0Z/ULLx0cYRj667K+hjy
         cKVotKzkjeO1kqipC7ECnzAm+ww8YjGQHvNBG2ZZm/pVNA72P8u7ZXR7cKmz8ZoX56cT
         pasNh4+b3eBf90P/A3oQ4BE5P36nfl07lFZ/J+5oDAxDXdfj6qetqiZ03FetqeP7hItL
         HgpAYcD+bo9dnj0mWaxJ33kAM/SFznmP8IkOZFmolh8OKSrbU8aRhVEHtfjxD+80UPkR
         NdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761768743; x=1762373543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OC8sv5nVVI5JjZAVR+hifwSr8nAzhJqQduX4ujCZR7I=;
        b=GUAPa9tWkHeMCwRqViz1RaHHPMQ17c24Kaamt91HbuDMbUyuM0VbWKKEEFbZrBp2Hl
         08wqHZUe2pQZ8R7LKLZoLVQDIflFaPM48zOEv6XVkHLhz3F2zZH5NYvAk0228gP6kIy0
         O7Ot+KqrjtC1yHMMl6n1I/5B9EuC+eAjP2zxRFwioKId0yLQxK743kvoFgqZnP2HgmUH
         IRp8IKl991mqUbJ20CU+iWummnFq/mxl+Do2GTkO1fRAoGhtG4OfSa7cu7TSE+OTW7Vo
         8HcaT0kBXdX+NORbCfgRY2k/CPgL8UDz+A05aBaUopQW1pjb0CtPfW/7DVKWRBo/cMZP
         v9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWb1BTlPmlRmbHBYzfrSEz8l5TxjgCbciJ8ZFzUJkLxfMMFp/D9p57k0JeG2YPa1SfeGF35VACa5MZCOnbfzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiYQvK/AXcIZLBcEnukt/I4J6tXl6thtu1r5N9Vm8+PDg/oJFs
	3WKmUDBkk8it9F9RHQ29bNTSiy5BowbQ8CjOf931lJROv4lPQZBCywj5h4LKnus+0mQWj/OEz9i
	kY93u/TH60V76RxeP0k+5KrIU8Buv1w8=
X-Gm-Gg: ASbGncuvpvNU4koea7kfzkSTCivPILpYHJNyKvSPg474GpGSqK6iVAVKA4tjZM5Pt9T
	PfHO7P4zuSDK5Sol/QPX+pCej9U+z3lzeUrq+yXlK7zl/wzAZm7SRkJ8XtegMf652pTn178st3E
	rz9HqbDYN0ue2eNjBWsJXmafq5IurrjCnsfbSqpoT56j60/L6iRLu3fXbvP3ieGW2lWvHNDVn31
	3Jp8bxwZxnR5faJ8yFnQjmM6/Q7Abt8eqL3YBghkLG8PN6RDpEcvsOoi7k=
X-Google-Smtp-Source: AGHT+IHlC2vJ9MOy5SMuyr39csRGDgW2ebq4sozUhofv3qG694XVnBM5XEojvBZU5ygeiuDc1oaYIAG7PDq9K61FKLk=
X-Received: by 2002:a05:690e:dc2:b0:63e:2204:9416 with SMTP id
 956f58d0204a3-63f76d91439mr3487993d50.31.1761768742872; Wed, 29 Oct 2025
 13:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251027171759.1484844-1-cjd@cjdns.fr> <CAOiHx=nSEP=4s2xZuPtLEO43YDbkNEYzw6V11JbXG0H2iPn7Ag@mail.gmail.com>
 <096509d1-4af8-4abc-8068-ca27d8ef601e@cjdns.fr> <CAOiHx=nqWEdHEMf5immXO0VwyzDakDV9AMsoDETcJ0F4FqUt=w@mail.gmail.com>
 <4d5fe35f-6841-4b73-9c8c-a1f3bce886c8@cjdns.fr>
In-Reply-To: <4d5fe35f-6841-4b73-9c8c-a1f3bce886c8@cjdns.fr>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 29 Oct 2025 21:12:10 +0100
X-Gm-Features: AWmQ_bnMO20yjsceLB8hiFSFJ1UyPWeJK08ZHhht06brEKUVc81COenzYsB_XPk
Message-ID: <CAOiHx=kfAwLzuoP2Y-AnGz4GysmszXq-f_et0rgd1j0thYv4Ew@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big Endian
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_131224_413916_0C436A56 
X-CRM114-Status: GOOD (  66.48  )
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

On Wed, Oct 29, 2025 at 4:24=E2=80=AFPM Caleb James DeLisle <cjd@cjdns.fr> =
wrote:
>
>
> On 29/10/2025 10:15, Jonas Gorski wrote:
> > On Tue, Oct 28, 2025 at 10:42=E2=80=AFPM Caleb James DeLisle <cjd@cjdns=
.fr> wrote:
> >>
> >> On 28/10/2025 21:19, Jonas Gorski wrote:
> >>> Hi,
> >>>
> >>> On Mon, Oct 27, 2025 at 6:19=E2=80=AFPM Caleb James DeLisle <cjd@cjdn=
s.fr> wrote:
> >>>> When on a Big Endian machine, PCI swaps words to/from LE when
> >>>> reading/writing them. This presents a problem when we're trying
> >>>> to copy an opaque byte array such as firmware or encryption key.
> >>>>
> >>>> Byte-swapping during copy results in two swaps, but solves the
> >>>> problem.
> >>>>
> >>>> Fixes:
> >>>> mt76x2e 0000:02:00.0: ROM patch build: 20141115060606a
> >>>> mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
> >>>> mt76x2e 0000:02:00.0: Build: 1
> >>>> mt76x2e 0000:02:00.0: Build Time: 201607111443____
> >>>> mt76x2e 0000:02:00.0: Firmware failed to start
> >>>> mt76x2e 0000:02:00.0: probe with driver mt76x2e failed with error -1=
45
> >>>>
> >>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> >>>> ---
> >>>>    drivers/net/wireless/mediatek/mt76/mmio.c | 34 ++++++++++++++++++=
+++++
> >>>>    1 file changed, 34 insertions(+)
> >>>>
> >>>> diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net=
/wireless/mediatek/mt76/mmio.c
> >>>> index cd2e9737c3bf..776dbaacc8a3 100644
> >>>> --- a/drivers/net/wireless/mediatek/mt76/mmio.c
> >>>> +++ b/drivers/net/wireless/mediatek/mt76/mmio.c
> >>>> @@ -30,15 +30,49 @@ static u32 mt76_mmio_rmw(struct mt76_dev *dev, u=
32 offset, u32 mask, u32 val)
> >>>>           return val;
> >>>>    }
> >>>>
> >>>> +static void mt76_mmio_write_copy_portable(void __iomem *dst,
> >>>> +                                         const u8 *src, int len)
> >>>> +{
> >>>> +       __le32 val;
> >>>> +       int i =3D 0;
> >>>> +
> >>>> +       for (i =3D 0; i < ALIGN(len, 4); i +=3D 4) {
> >>>> +               memcpy(&val, src + i, sizeof(val));
> >>>> +               writel(cpu_to_le32(val), dst + i);
> >>>> +       }
> >>>> +}
> >>>> +
> >>>>    static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset=
,
> >>>>                                    const void *data, int len)
> >>>>    {
> >>>> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> >>>> +               mt76_mmio_write_copy_portable(dev->mmio.regs + offse=
t, data,
> >>>> +                                             len);
> >>>> +               return;
> >>>> +       }
> >>>>           __iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_=
UP(len, 4));
> >>> Maybe just replace this with memcpy_toio() which does no swapping at
> >>> all instead of double swapping on BE?
> >>
> >> I'm not that informed about how PCI works so I had to test to confirm
> >> my understanding, but I can confirm that memcpy_toio() does not solve
> >> the problem.
> > Ah, right, I misread _iowrite32_copy() to do conversion to LE, but it d=
oesn't.
> >
> > What architecture is this you have? PowerPC? ARM? MIPS? 32 bit? 64 bit?
>
>
> MIPS32 (EcoNet EN751221 34Kc)
>
>
> >
> > So the differences I see are:
> >
> > 1. __iowrite32_copy() uses __raw_writel(), which has different memory
> > semantics than writel()
> > 2. __iowrite32_copy() assumed src is aligned to 32 bit, while you
> > explicitly align it
> > 3. memcpy_toio() will handle unaligned src properly, but does 64 bit
> > accesses on 64 bit systems (and uses __raw* again).
> >
> > Is src aligned? If not, then the issue might be 2. And if your system
> > is 64 bit, it would explain why 3 didn't help.
>
>
> I'm not a regular developer of mt76 so I wasn't sure if that was
> guaranteed and I just wanted to code for safety.
>
> After reviewing the code, I see that there are a few places where
> mt76_mmio_write_copy is being called with stack-allocated u8 arrays
> so it's pretty clear to me that this is being treated as a memcpy-like
> function and we should be handling unaligned inputs.
>
>
> >
> > As a first step you could try to replace the writel(cpu_to_le32(val)
> > with a iowrite32be(val, ...) which should do the same except avoiding
> > the doubled byte swapping. If that works, you can try to replace it
>
> This works.
>
> These symbols are a bit of a nightmare to trace, so I ended up making
> an .i file so I could confirm what's happening.
>
> iowrite32be() uses the version in iomap.c so I understand that's using
> writel(swab32(val),port), so a writel with an unconditional byte swap.

>
> writel() is more complicated, it's an inline function that is generated
> in a rat's nest of preprocessor macros in mips/include/asm/io.h
>
> The preprocessed is this:
>
> __mem =3D (void *)((unsigned long)(mem)); __val =3D (val); if (sizeof(u32=
)
> !=3D sizeof(u64) || sizeof(u64) =3D=3D sizeof(long)) { *__mem =3D __val;
>
> The source is this:
>
>      __mem =3D (void *)__swizzle_addr_##bwlq((unsigned long)(mem));    \
>      __val =3D pfx##ioswab##bwlq(__mem, val);                \
>      if (sizeof(type) !=3D sizeof(u64) || sizeof(u64) =3D=3D sizeof(long)=
) \
>          *__mem =3D __val;                        \
>
> The line "pfx##ioswab##bwlq(__mem, val);" is ioswabl() and the source
> of that explains the issue:
>
>   * Sane hardware offers swapping of PCI/ISA I/O space accesses in hardwa=
re;
>   * less sane hardware forces software to fiddle with this...
>
> So this confirms my initial understanding, the PCI hardware is doing the
> byte swapping unconditionally.
>
>
> > with __raw_writel(), which then would make this the same as
> > __iowrite32_copy, except making sure that src is aligned.
>
>
> This fails.
>
> Since I'm the maintainer of this SoC and it's still fairly new, I wrote
> a trivial kmod to verify that unaligned access is not just silently
> returning trash, it works as though it were aligned so alignment is
> not the issue.
>
>
> >
> > Also you could replace your memcpy() with get_unaligned((u32 *)(src +
> > i)); Should do the same but inline.
> Good idea, I will do this.
> >> The issue as I understand it is that rather than making every driver
> >> carefully call cpu_to_le*() every MMIO write, someone decided to make
> >> the PCI host bridge itself transparently byte-swap all MMIO on the
> >> wire. Since most MMIO is hitting registers and most buffers are
> >> transferred by DMA, for the most part everything works and nobody
> >> notices.
> >>
> >> But in the rare case that we need to write a blob to MMIO, it gets
> >> transparently swapped in hardware so you need to use cpu_to_le in that
> >> case. Doing a search of ./drivers for write.*cpu_to_le I can see this
> >> issue comes up a bit.
> > Every (PCI) driver does conversion to LE implicitly by using
> > writel/readl (or iowrite32/ioread32) etc do the conversion to/from LE.
> > So writel(foo, dst )is a __raw_writel(cpu_to_le32(foo), dst) etc. PCI
> > memory is assumed to be in LE. If you are on a little endian system,
> > then no byte swapping happens, and on BE it will do byte swapping
> > before writing the value.
>
> Okay so it seems that in the case of MIPS, that's not always how it
> works.
>
> https://github.com/torvalds/linux/blob/e53642b87a4f4b03a8d7e5f8507fc3cd0c=
595ea6/arch/mips/include/asm/mach-generic/mangle-port.h#L17
>
> Since we don't know if the swap will happen in hardware or software
> and (AFAIK) this is not a hot enough path that double-swapping will
> have a notable performance penalty, I think the most sane thing to
> do is use writel(cpu_to_le32()) and not care if it's swapped back
> in the kernel or hardware.

Oh, I think I see what it happening here. ECONET is a Big Endian MIPS
platform, but does not select SWAP_IO_SPACE (most other BE platforms
do).

Does that mean the PCI space is swapped in hardware there?

I guess that means that anything that uses __raw accessors to PCI
space directly or indirectly is broken, as the raw data is now
actually in the wrong order and needs to be swab'd.

I don't know if it is a good idea to change this in __iowrite32_copy()
/ __ioread32_copy() (and other helpers), or if there are drivers that
use it on non-PCI spaces and would be broken by that.

If there is a way, I would suggest disabling hardware conversion and
selecting SWAP_IO_SPACE, but that will affect a lot of your code that
assumes that writel() etc don't convert to/from little endian.

Best regards,
Jonas

