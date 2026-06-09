Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D21ACD8C85
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2026 03:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hixbBeN+LnFZDqMAJQTmddcBbOURIwdsQKHtq7EqZas=; b=4EO3L28lyRQ9TaPzTQ2m/wC9+I
	3bLXE12otQv/+f8WmM2aKBI+4AaTSKtCBzaz53/WIc4LLLWfy6+QN5vdxvaDpE53605mgsr/WRM9T
	oISSEoeSk0SQQ6nRIgmihw+BTaZEdRTkiADBspUlyaxaQCJBV640aM3AVvjC7MHjvOPovbrdshM9M
	ak1L89fu0JSCVphvCAy8pAz3mxVn156JpFS4yLqbVyf0VdHYkPqO98t7EiYiCwiyCNKjhLBV5aetE
	C6ERJQWjF2EO2EQHExj6YAUSdrm9d+jXbOSFJjMhbYNGJmAK2quZqVtrOCPltBunPay3R4qZW8cqz
	F9J7clQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWnDg-00000004gZo-3Oqh;
	Tue, 09 Jun 2026 03:33:40 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWnDd-00000004gZT-2P0D
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jun 2026 03:33:39 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-7dfceeaf168so47438387b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 20:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780976015; cv=none;
        d=google.com; s=arc-20240605;
        b=EbYVAtgFoDd8bxdtfyLRCXomvyiiH5/p3rB47dkBqjKSvARoFS7r/hsAN3m6qlmh3Y
         JZnYTyw16GQxWrV3Dpap16h+T3lH8rRHWRCGK3U3D4rh43iioFVVCrQkCoHYCVWeH9sk
         VOKP/RQUhbckjsdJW/ZJSFtKdK4wRaoE9jaRW4BAQ1skpNcAKe5MDGO1EbebheYqstyl
         8yOogwsEpKY0zYZMlIQtjxT/oJRARBz3vVlwj8my5jRYxVyp057LO1rkQ2bYJMccGGQw
         /ByW9KOob6N8c+y5QIIJQdZl7P/2euSkhbi0BoVUYlTK1v6cejzdnAwAZHyEJ4YAG5Ti
         0kAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hixbBeN+LnFZDqMAJQTmddcBbOURIwdsQKHtq7EqZas=;
        fh=45Pw3JCAUYsCtTNn+uU5VXh82cU8hVY8MZVDHq2FYTk=;
        b=cVKo14kaRzw6HXvkIVXt+vxKsWW+4tkll/8DahjlQ1Qh6HTp/99g4Lg0ru/eHldogT
         /HZ7UcBgqX3S2PBaU5b09nB4QQMCHhdXa7XjTLI/y1Ivq+q/Gj//Pgvf/tQ2Y4EVBHCk
         9OKjpe64aAWNVe3zvjzks2D2pB16F3yUn0G3XjsD9gP9l0KV3DAGj6iYmaLTxoPjlnzE
         aGqpfIm0BAWbvLCMT4BJZvJlnudc7ikDYh+/MtNT3kZ2l446wHcTI01zZx80HZhbfp4g
         9AzQl28fQD/VpXqz/buS95Fq0swVY/sVTrEF160nSKKjll/d1g1Ka4903U3akbe56KAD
         Vfdg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780976015; x=1781580815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hixbBeN+LnFZDqMAJQTmddcBbOURIwdsQKHtq7EqZas=;
        b=RAcXMHAJ9oHw1vaMQh+NokgRd6YDviPQ3jVRZtHeScf5ioYJfpgmOmffweahMM8+KX
         882A3jjm6wf5R5oI/CzTCPfbNYdfF0x6JcWM273+0DKwU7j1xf31mcbafDBTVnY/OVCS
         J4N25nzESy45jrYQYvZnVzARoM9smbeDJMC+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780976015; x=1781580815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hixbBeN+LnFZDqMAJQTmddcBbOURIwdsQKHtq7EqZas=;
        b=jrL31a43NLkzxAGiIHO/drOqLaS8sZNowD+7jE6SvXixzWe5vwALq2LDjv3hh5cO4T
         KJq3xogH2R+x9FQpNRAHiY8prFWVY8j8yXOWgggMYfM1ZrUQOT1IuN6OmVXbi2dyoTLu
         FwzUE/YelGd4IDRIWh6ETV/7dIwdZSSEJEHLStSKAaEre8vLi0KqWVn5n6odC1c5v/lz
         R2g6ynNAIrV87w+jKDn0w3HyjBg3qGFH3lxIx2jnkAvW7s8hua3La0/saBiXMlGUJ4As
         BFnjE/8j6xlhzFWKGnMMwfpRN9kSgDmh8Op4ozmrzGy7ae6sy/jflKySNFdWlWsB+Slc
         Elfw==
X-Forwarded-Encrypted: i=1; AFNElJ8i8Akwmk3h9zr/v0e9NR2y8/V0NOquTPFgsp5l4RersoRYwZzDYb7NWI2cagnCgSDitV5BHJf/NDGy3b2/6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMViow0H/S+y5+62L1EwUcKtHEqFLQQfR1Gg9wvj9ngVh8YZRO
	qtaehPVyD9GnWteroUHf21So+y/uwWKklL4U1Y0/Xj+kEtMzGZqA/EnutlM06Lf2FzWLlVjMZY7
	8wpt6RN5cgWQ/r7L+oZeQEaZf255WqvSvIoXD/h4C
X-Gm-Gg: Acq92OF+QwkukaRTgvDphlML1g6iIWtFBC3pB+za/ZSUt1ePi6G45hHqovddwSqbp/0
	6F9UKz9LHAJUBRzxyWqRzENvFRDB23Dv23TKCwOtZliMrAuVmRx48b5g3A5oWYSHjngGPdPgdN9
	bwRma7PMBcdRwRu8byXaAY4CCtXs+XFRTokkoMHx35w41pkSPssVAbgkstYQe2kxbMWBx3EjX9Q
	M9y+Hv2biEbOQREXtlAsUs5KzpGrmAC1WfyIjnzhsBa+Bl1MXxBIXCK9hcf0L6UwPXn6kvKhxTy
	2C23xddou2YsMB9JlGc=
X-Received: by 2002:a05:690c:4991:b0:7dc:61c7:5919 with SMTP id
 00721157ae682-7ed11384e09mr179186077b3.37.1780976015575; Mon, 08 Jun 2026
 20:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
 <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
 <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com>
 <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
 <20260601214836.GA37779-robh@kernel.org> <CAGXv+5GK6+X3-eY8PbrLTsSwK2Uk2URiQti_Gd_9C=RwRaJ44Q@mail.gmail.com>
In-Reply-To: <CAGXv+5GK6+X3-eY8PbrLTsSwK2Uk2URiQti_Gd_9C=RwRaJ44Q@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Jun 2026 12:33:24 +0900
X-Gm-Features: AVVi8CcLvfu3nmY0FgYyZD975IyBRElgoOX6HGLOEh9gnunhRFWsfhBJHTEFs2Q
Message-ID: <CAGXv+5F94K7JJz9pMg5=7-YoXjT_ux8SvBKP17BA36mXYTYo6w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_203337_671223_E7EEF06F 
X-CRM114-Status: GOOD (  42.82  )
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

On Tue, Jun 2, 2026 at 4:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Tue, Jun 2, 2026 at 5:48=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
> >
> > On Tue, May 19, 2026 at 12:51:49PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, May 18, 2026 at 05:02:11PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, May 15, 2026 at 8:34=E2=80=AFPM Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > > > >
> > > > > On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <=
mani@kernel.org> wrote:
> > > > > > >
> > > > > > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasiv=
am <mani@kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wr=
ote:
> > > > > > > > > > On some SoCs without an IOMMU behind the PCIe controlle=
r, the PCIe
> > > > > > > > > > controller memory access could be limited to a small re=
gion by the
> > > > > > > > > > firmware configuring a memory protection unit. This mem=
ory region
> > > > > > > > > > must be assigned to the PCIe controller so that the OS =
knows to
> > > > > > > > > > use that region. Otherwise PCIe devices would not work =
properly.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > So this means, the PCIe devices can only access a specifi=
c carveout memory
> > > > > > > > > configured by MPU for DMA? If so, you should use 'dma-ran=
ges' as suggested by
> > > > > > > > > Rob.
> > > > > > > > >
> > > > > > > > > 'memory-region' also serves the purpose, but for PCI, we =
have the dedicated
> > > > > > > > > 'dma-ranges' property.
> > > > > > > >
> > > > > > > > I think I need some sort of guide on writing the 'dma-range=
s' property,
> > > > > > > > because it is not working for me.
> > > > > > > >
> > > > > > > > I'm adding
> > > > > > > >
> > > > > > > >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 =
0x4000000>;
> > > > > > > >
> > > > > > >
> > > > > > > So the device DMA address start from 0x0? Isn't it a 1:1 mapp=
ing?
> > > > > >
> > > > > > I actually don't know. But
> > > > > >
> > > > > > >         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 =
0 0x4000000>;
> > > > > >
> > > > > > this didn't work either.
> > > > >
> > > > >
> > > > > Hmm. Can you print the DMA address programmed to the device? i.e.=
, the address
> > > > > returned by dma_map_single() in the driver.
> > > >
> > > > On a working system still using the restricted-dma-pool memory regi=
on,
> > > > it gives something like 0x00000000c0009000, so indeed it is 1:1 map=
ping?
> > >
> > > It has to be 1:1 mapping.
> > >
> > > > These are for the RX/TX descriptors [1][2].
> > > >
> > > > When using dma-ranges, the failure is from dma_alloc_coherent() [3]=
[4],
> > > > which is the descriptor ring. On a working system, this is somethin=
g
> > > > like 0x00000000c0c9d000, so again 1:1.
> > > >
> > > > [1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wire=
less/realtek/rtw88/pci.c#L221
> > > > [2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wire=
less/realtek/rtw88/pci.c#L829
> > > > [3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wire=
less/realtek/rtw88/pci.c#L192
> > > > [4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wire=
less/realtek/rtw88/pci.c#L265
> > > >
> > > > > Also, using prefetchable flag is not correct for DMA memory. You =
should use:
> > > > >
> > > > >         dma-ranges =3D <0x02000000 0 0xc0000000 0 0xc0000000 0 0x=
4000000>;
> > > >
> > > > This didn't work either. What exactly is supposed to handle dma-ran=
ges?
> > > > I see some code parsing it in the PCI core, but it just saves it to=
 a list.
> > > >
> > >
> > > I think the failure is due to marking the memory as 'reserved' in DT.=
 With
> > > 'dma-ranges', the allocator will only ensure that the allocated memor=
y stays
> > > within this limit. But the allocator itself will not use this propert=
y to
> > > allocate from the reserved region.
> >
> > So the region should not be reserved. Reserved generally means the OS
> > shouldn't use the region (though maybe a specific driver/device can). I=
t
> > should just be a CMA area I think.
>
> No. The whole reason for this is that we want an isolated piece of memory
> for PCIe so that PCIe transfers cannot corrupt memory used by other parts
> of the system. Normally the IOMMU provides the isolation. On this platfor=
m
> there is no IOMMU for the PCIe controller.
>
> System memory isolation as setup by the firmware already restricts the
> PCIe controller to only be able to use this region. And we absolutely do
> not want any other part of the system, be it kernel, DMA buffers, or
> userspace, to use it.
>
> And also, if it is not reserved, the kernel is free to put "other" reserv=
ed
> regions, such as the default CMA region or the software IO TLB region in
> this piece of memory.
>
> So I believe using memory-region is the way to go. The memory needs to be
> reserved, and assigned to just the PCIe controller.

Ping? We need this merged for the coming cycle.

