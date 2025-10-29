Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1489FCCF9E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UygssEPwtyV4QTrYeX1AiLSpA4gBFv6ObS7fU3X7V2U=; b=WBjdKsn0GdWsNHiWQlRbrCv26N
	dKwdAwKqqCfFcfjRqdpvDm4UAytia6QCgkhbqNZ0OYIrhQn+K6xV0dUnxxhTjUH7MN7IbHV8aDkRv
	11FKIEMMFJK5/z72XP/dVFYQdUrgxmbAQ65inXw/2z1ISoOPW8WPSJOXcIhTVMpiUifoRIBd7FgHN
	/Kq+M5LMliezYJ5vkjXDqsbkScnzJdeApm7NYPvINaB7HEgj8tEJ6BADM18b/ag4H+ZvNLIvkIht+
	p8yN55iYJ/lkvvl9GkZndQmI9NkksgEmrI9U6fn+uiX/fUEZTFbvgLN4PPCkgZUO1535KrlHUbXjF
	qy+r/uKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2HL-00000000SFK-3bW5;
	Wed, 29 Oct 2025 09:15:39 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2HJ-00000000SEN-2Ljd
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Oct 2025 09:15:38 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d71bcac45so72899217b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Oct 2025 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761729336; x=1762334136; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UygssEPwtyV4QTrYeX1AiLSpA4gBFv6ObS7fU3X7V2U=;
        b=fHlUy30SletqkYbtyuSgx9/uxXCm2TqddLZ3u5H1kvuz+nIvInut1fLmG7cYYx/dfs
         ySdxKy6nnCOawdT03dXI5GkWc8lNwJ4wgZ1VGcwqeDsI79wlOg6spZIflZKVp18R0wwI
         7my6UvLSRmfix4SdjDOVPDzm4mK++iCfirgDMgFNVF8iGiT17gvAI8CMIDWoTd8+qmP7
         odBQt2RqOTam8z6VT3dbpCsUk/cbGMpYgqdEbMcQO9hygE7X8fsAbf0BEcYIKsAiIcM8
         s6J/c3bDzuGl4ms5/009kbAxMW0WbovNxSPfBbYmL2lbzFrNj3cBdmkOIcqriiDRSgJz
         nw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761729336; x=1762334136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UygssEPwtyV4QTrYeX1AiLSpA4gBFv6ObS7fU3X7V2U=;
        b=ZVfuEqQxkd/X+xmSgXdFTXH29pItd3VZQLJCrqT6M+Zgs4tgNewI+lPPelv85FQX76
         gas6Th2CYIv1L9zZov2IsPrflOpv8j89tj5oHgDX1uFAyRG6NeDQPZG7WY4aXcrHSqZG
         QtsAgNqwtQU77eek/HLJEVaYbP6VLQBSAMTEwQT1KYHO6iFylITovfNlDucIiVt2XZpi
         PdHANrY+HshB1Lbog/x/WuxjmPXOWfSbqnhQJWpQDTeStDJioGrihovRLYZpYYFCACv3
         orO/0M7Df+QA7uVW69Jf6zwl8LdAkZXHOwIzvDtR6zKsPMCpeR3BOf4RstBMWRgGJJ11
         YfcA==
X-Forwarded-Encrypted: i=1; AJvYcCXM9kv4PepMnGISWTHQxFO4cgfDMNpfV18YKqKuZgec0Cbo19RcmS+aJe8cKYzZ1Z9LVkfCLwTx946Q2u4ePg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsNJesgZq6WNDi2I/fh1XW0A/36A9phIurLc+N9J7AzIr/Xoyt
	5L2LQlxgh1fFr8IIpUjNtfgBCabHyr+8XHnNEGKW5NQz6QK0wEVrmZ5UM1BbeJ6rWqNoutst4I9
	SvjZsdTXM8rzK07+s4ia76KNJOWjBFQk=
X-Gm-Gg: ASbGncs+aBUwWFl13gUxdIvBk2XX3JPeo1MEr4YRR6BtAn8VP1J3miE3oCA1Rgg0k80
	LLb9IGV0B3ks2wmO9qgAKhYtoedXxV4+xDaaGSym4B+fHRbRZCE3nj7FPqP8LpY+G5cyANZl0Qw
	vpx8EDl4875ZTR3vL99J5zuiD7zdnIJ9QqYCHnxDGx6o1IPjB4sMjpYeo3li0e/dfV3kfaJ6JgF
	OOjX2cjAWJHLpW8YSeB+iOkNRkrYthHzvD9c9icN2RFuFpKxi5nPckAcVc=
X-Google-Smtp-Source: AGHT+IEQDyFSthCYxiKEqlJv14a8jhCmiZaL70iGNaUt1WzUGm5AZRwZxAZ/eefAJU3mVt3LlAEv2c8FlDqRddjvGN8=
X-Received: by 2002:a05:690c:74c2:b0:781:1c9e:fc82 with SMTP id
 00721157ae682-7862903d263mr21137247b3.48.1761729336254; Wed, 29 Oct 2025
 02:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251027171759.1484844-1-cjd@cjdns.fr> <CAOiHx=nSEP=4s2xZuPtLEO43YDbkNEYzw6V11JbXG0H2iPn7Ag@mail.gmail.com>
 <096509d1-4af8-4abc-8068-ca27d8ef601e@cjdns.fr>
In-Reply-To: <096509d1-4af8-4abc-8068-ca27d8ef601e@cjdns.fr>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 29 Oct 2025 10:15:24 +0100
X-Gm-Features: AWmQ_bmyo1Vk5GBvVeX6G5wl6wdQm6iXyIxD4JsyZ1GGxh0xGeFFX2edoLr2NHM
Message-ID: <CAOiHx=nqWEdHEMf5immXO0VwyzDakDV9AMsoDETcJ0F4FqUt=w@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mmio_(read|write)_copy byte swap when on Big Endian
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_021537_629577_37C3E7A0 
X-CRM114-Status: GOOD (  33.14  )
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

On Tue, Oct 28, 2025 at 10:42=E2=80=AFPM Caleb James DeLisle <cjd@cjdns.fr>=
 wrote:
>
>
> On 28/10/2025 21:19, Jonas Gorski wrote:
> > Hi,
> >
> > On Mon, Oct 27, 2025 at 6:19=E2=80=AFPM Caleb James DeLisle <cjd@cjdns.=
fr> wrote:
> >> When on a Big Endian machine, PCI swaps words to/from LE when
> >> reading/writing them. This presents a problem when we're trying
> >> to copy an opaque byte array such as firmware or encryption key.
> >>
> >> Byte-swapping during copy results in two swaps, but solves the
> >> problem.
> >>
> >> Fixes:
> >> mt76x2e 0000:02:00.0: ROM patch build: 20141115060606a
> >> mt76x2e 0000:02:00.0: Firmware Version: 0.0.00
> >> mt76x2e 0000:02:00.0: Build: 1
> >> mt76x2e 0000:02:00.0: Build Time: 201607111443____
> >> mt76x2e 0000:02:00.0: Firmware failed to start
> >> mt76x2e 0000:02:00.0: probe with driver mt76x2e failed with error -145
> >>
> >> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> >> ---
> >>   drivers/net/wireless/mediatek/mt76/mmio.c | 34 +++++++++++++++++++++=
++
> >>   1 file changed, 34 insertions(+)
> >>
> >> diff --git a/drivers/net/wireless/mediatek/mt76/mmio.c b/drivers/net/w=
ireless/mediatek/mt76/mmio.c
> >> index cd2e9737c3bf..776dbaacc8a3 100644
> >> --- a/drivers/net/wireless/mediatek/mt76/mmio.c
> >> +++ b/drivers/net/wireless/mediatek/mt76/mmio.c
> >> @@ -30,15 +30,49 @@ static u32 mt76_mmio_rmw(struct mt76_dev *dev, u32=
 offset, u32 mask, u32 val)
> >>          return val;
> >>   }
> >>
> >> +static void mt76_mmio_write_copy_portable(void __iomem *dst,
> >> +                                         const u8 *src, int len)
> >> +{
> >> +       __le32 val;
> >> +       int i =3D 0;
> >> +
> >> +       for (i =3D 0; i < ALIGN(len, 4); i +=3D 4) {
> >> +               memcpy(&val, src + i, sizeof(val));
> >> +               writel(cpu_to_le32(val), dst + i);
> >> +       }
> >> +}
> >> +
> >>   static void mt76_mmio_write_copy(struct mt76_dev *dev, u32 offset,
> >>                                   const void *data, int len)
> >>   {
> >> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
> >> +               mt76_mmio_write_copy_portable(dev->mmio.regs + offset,=
 data,
> >> +                                             len);
> >> +               return;
> >> +       }
> >>          __iowrite32_copy(dev->mmio.regs + offset, data, DIV_ROUND_UP(=
len, 4));
> > Maybe just replace this with memcpy_toio() which does no swapping at
> > all instead of double swapping on BE?
>
>
> I'm not that informed about how PCI works so I had to test to confirm
> my understanding, but I can confirm that memcpy_toio() does not solve
> the problem.

Ah, right, I misread _iowrite32_copy() to do conversion to LE, but it doesn=
't.

What architecture is this you have? PowerPC? ARM? MIPS? 32 bit? 64 bit?

So the differences I see are:

1. __iowrite32_copy() uses __raw_writel(), which has different memory
semantics than writel()
2. __iowrite32_copy() assumed src is aligned to 32 bit, while you
explicitly align it
3. memcpy_toio() will handle unaligned src properly, but does 64 bit
accesses on 64 bit systems (and uses __raw* again).

Is src aligned? If not, then the issue might be 2. And if your system
is 64 bit, it would explain why 3 didn't help.

As a first step you could try to replace the writel(cpu_to_le32(val)
with a iowrite32be(val, ...) which should do the same except avoiding
the doubled byte swapping. If that works, you can try to replace it
with __raw_writel(), which then would make this the same as
__iowrite32_copy, except making sure that src is aligned.

Also you could replace your memcpy() with get_unaligned((u32 *)(src +
i)); Should do the same but inline.

>
> The issue as I understand it is that rather than making every driver
> carefully call cpu_to_le*() every MMIO write, someone decided to make
> the PCI host bridge itself transparently byte-swap all MMIO on the
> wire. Since most MMIO is hitting registers and most buffers are
> transferred by DMA, for the most part everything works and nobody
> notices.
>
> But in the rare case that we need to write a blob to MMIO, it gets
> transparently swapped in hardware so you need to use cpu_to_le in that
> case. Doing a search of ./drivers for write.*cpu_to_le I can see this
> issue comes up a bit.

Every (PCI) driver does conversion to LE implicitly by using
writel/readl (or iowrite32/ioread32) etc do the conversion to/from LE.
So writel(foo, dst )is a __raw_writel(cpu_to_le32(foo), dst) etc. PCI
memory is assumed to be in LE. If you are on a little endian system,
then no byte swapping happens, and on BE it will do byte swapping
before writing the value.

Best regards,
Jonas

