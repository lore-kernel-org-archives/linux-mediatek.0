Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF081CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1QyVBBy2NYd9YmCiR8B33Ktaal8632/eUsbO1iGJ1A=; b=ycPK8taq+7VpWwgHU6YyY7PHAO
	9I90Jzc59ALDKuhT/YDqWHbl85mOjGpHvoj6BcASk/AVyoqWaIrmt6uQFbaEszKmqMmHMD4Ztrfwu
	b7XklcO6zODG0xlxjc0xBdlN7jaTuz1v/T1QVH+oCfFT2+lMtItWHLKU7TgQFr9pbgMqEDcNSzwZK
	nOeyZyLUEELxYzNNNtmrcrsPTTUtxFGeCJ798BQNhtVvU6OuHxTHjo6S40DT9ZSVRyCB8vp3lHvwq
	pUcYJEjw7jRBi1rYmWqOOJ99AqXiVwk3HsFMAKfFIUFoJVouNW6GYiGIK1kgbSHFfaJlKRRcBaF6D
	uCyguBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtrp-0000000EvmZ-3MDF;
	Mon, 18 May 2026 09:02:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtrp-0000000EvmF-0rKF
	for linux-mediatek@bombadil.infradead.org;
	Mon, 18 May 2026 09:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c1QyVBBy2NYd9YmCiR8B33Ktaal8632/eUsbO1iGJ1A=; b=O4EK6RhtXzj7PSkzrd7POjYc6E
	meoKx5Y6vBa/AkVfNzIVjOBhz+0sE+cvP8hWLVF+G8arIinoZFL0zSlY+ksZdza28WvMCpbbgFx/C
	KS7aRVHjhQof61buhW/cFqKLX4viHMnrEDAvMCpuFLz/Bev38GoOoJJnJCX73lGQF5kuGtg31+9e/
	Sq12ENQHKdVShsrYRI8vAJZ1yULFlcpqrjtzK2MTeKfaRrqHhh3GOMwMFqLyljZWSL/BBRipWXeZf
	BKzqCsLvdN94B3/7xtMRT9HAQCeJZUIz0OX63vb8RvAxZ5PZP9URkaSS4C41RQEYgJkPlo1SmTNSk
	NwF9jsKQ==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtrl-0000000AUcp-3YOb
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 09:02:28 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-393d6025f99so28917801fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 02:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779094944; cv=none;
        d=google.com; s=arc-20240605;
        b=UAhxgc4RFg4biwS/adc9H6YT6Mt5sW2h5lKETHNPV3hWvF0JZANFhdw0GIcEM7Z4/l
         vPzPIpwssqdXzkc5S3Ueov7lUKf6UBlO4CArqr/b0x44HXM+X6pZBgoqXfpVYmJhq72S
         MYNweXO1VFvMLBKamisjghDbt4BrnsoMl62XllM80mhYz+gFo4yMKM1YhtXEdmTm/Bj0
         IdcvPFxOtGbyTHt0YDjs0ual8IGOe+T3wOYtr/tsQpKjXwfxLNTeoVvm3ns05iFJRqZQ
         nkG0AtfYCOQqcCE1Z8plA9C1+5nZTutOTy3ufU+cz53ogvMpDTnNI0KEWf8M2iGfC0u2
         v8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c1QyVBBy2NYd9YmCiR8B33Ktaal8632/eUsbO1iGJ1A=;
        fh=4smGpWQK8M+Zp2eYd3Bl+LnQQ7hMUd4v7JfvyUSKag0=;
        b=IC9zqscsTkBqyWXgUk33Ao5lwO3lzJ+5nwiWSOm9ckxLTG1RwyLRIuWfiYSSWxzY7v
         yscW/EEsdzt+tLfoBr2GA8Mqhz79AOSmmRXPR8ztMNBmY9zv5w2gaS7U7mATe2U2MPqj
         icuX2ldCq6jeelWhRUlZDhMdvIr9g41016W5n3Br1BH0bScMmqs02/N1x8x5CHDj5Iea
         nDXhVcjkU65WeOMfU46cV6zbBB8lJy093F3hWuT3BcS2HjmdhhxweZns39F7nnSRzcci
         KIf9RIhvRreIveSpMTn4i3hLwW2aFo3TpY5emIPkvs4uWxFPxRnDpCUH6++YUkn5fDq8
         Hs0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779094944; x=1779699744; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1QyVBBy2NYd9YmCiR8B33Ktaal8632/eUsbO1iGJ1A=;
        b=ibFCFvpK/8hYS0Jc2MOeTNn15IsfqdDu8Nw77ddo8UFJjMhl7dDZmbWh76EVULQrO7
         daa0Oj8lO2fCzIxKGwpr6oUNqhGC+BiiCYokpBuUCx9OsFkIz0reqmt6mlLxFaDi1RvB
         QCHvr3MVNVT2eLPMGiVPrbuZvJDpRS0oHsIew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779094944; x=1779699744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c1QyVBBy2NYd9YmCiR8B33Ktaal8632/eUsbO1iGJ1A=;
        b=hshHbHabI0ZJ5ZuUDHcU5kr3HTn8p3wqQJIqOq7lawyEW0KtcjuoeTiU7gq3VpJTww
         xY0GnLcGiKsxwQT+BriKwwwyKf/JmfDMUkitcWql49O46P4HFMWRBFhqRV37hpgKddjZ
         RbdNCYEXiWHu9Eg+fk/QcHKOFxZj+wT24MqzOhlDZIHDOfXXrliWclEo+CFOSpTFB80U
         q0OaPZVAZY4rVw4u2GTyX7/PghS/UQ+k4kgHCd3ab6ssC5G0XGLN9pNy4eMAvBIlF7LC
         cp1vAfesp6Nn9eJKep5ImRlLd0LM9KoYCI3EgBspuJ5ZPrpbzt7oP2yLtU1t3CkwVU/S
         WG2g==
X-Forwarded-Encrypted: i=1; AFNElJ9raJLCCUQoBghzxq/c7ibXZInXp/UhgAtDlAhWchOSHZxkD+WctVsPWKBDhGfI3GfTOR9pRMbDuU9jYLA9vg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1yFFiGM4m7CcFfUDQGpPZAWIa1IaiVWvwMGC6W0slzJnpb4m6
	MgKGAgi0R4ea/DQk6rXH6Bgm7Gfga01BBzSLtDthmBu1eeKjXdyrHuHnhUTuMwdPXfx0Ej0SHJC
	8/BPBKpXK90punlg/LUEC/a4cxZFAbz+pPuuy2vLL
X-Gm-Gg: Acq92OEEF5qu+nl7U9l14rFNJzWp87MkgEBvUrd6LPCOXUeCueqbwSFUakPWc3l+k+T
	nPcVKBC+UkJwXItzVAN033G/fWJY+p1hoYoTo08JPMCKWTf4FYMBtUN8UAT9Iq4Zfi0yu1V4SLL
	wSBvEGoj1pJiZ8gLOx6Qd2rHzxnDrTsE00zFIEBhvdL7v7UcQY1Z+lT0gQQab9VzVK6A92tPxz8
	r/pHySHRaqVDfe+tzzQRncVeRkcYo+gvOhpJ91IZOPdGyWXoPU2b7AwSh2zc8HWBOVqGuUIxlcV
	rltzzetnIUhEcSDpBKGC+CVjEBS/MrJzsIqN1NS2dmrOeMix
X-Received: by 2002:ac2:55a2:0:b0:5aa:e35:2270 with SMTP id
 2adb3069b0e04-5aa0e35232fmr2660585e87.0.1779094943454; Mon, 18 May 2026
 02:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com> <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
In-Reply-To: <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 May 2026 17:02:11 +0800
X-Gm-Features: AVHnY4JIsiwOadahU_wI7dsAovNkMx3scRvxNCSxVAoQqeyJFwBSe39bN7su8rY
Message-ID: <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_100226_286729_763DD277 
X-CRM114-Status: GOOD (  29.23  )
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

On Fri, May 15, 2026 at 8:34=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > > > >
> > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > > > On some SoCs without an IOMMU behind the PCIe controller, the P=
CIe
> > > > > > controller memory access could be limited to a small region by =
the
> > > > > > firmware configuring a memory protection unit. This memory regi=
on
> > > > > > must be assigned to the PCIe controller so that the OS knows to
> > > > > > use that region. Otherwise PCIe devices would not work properly=
.
> > > > > >
> > > > >
> > > > > So this means, the PCIe devices can only access a specific carveo=
ut memory
> > > > > configured by MPU for DMA? If so, you should use 'dma-ranges' as =
suggested by
> > > > > Rob.
> > > > >
> > > > > 'memory-region' also serves the purpose, but for PCI, we have the=
 dedicated
> > > > > 'dma-ranges' property.
> > > >
> > > > I think I need some sort of guide on writing the 'dma-ranges' prope=
rty,
> > > > because it is not working for me.
> > > >
> > > > I'm adding
> > > >
> > > >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x400000=
0>;
> > > >
> > >
> > > So the device DMA address start from 0x0? Isn't it a 1:1 mapping?
> >
> > I actually don't know. But
> >
> > >         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 0 0x4000=
000>;
> >
> > this didn't work either.
>
>
> Hmm. Can you print the DMA address programmed to the device? i.e., the ad=
dress
> returned by dma_map_single() in the driver.

On a working system still using the restricted-dma-pool memory region,
it gives something like 0x00000000c0009000, so indeed it is 1:1 mapping?
These are for the RX/TX descriptors [1][2].

When using dma-ranges, the failure is from dma_alloc_coherent() [3][4],
which is the descriptor ring. On a working system, this is something
like 0x00000000c0c9d000, so again 1:1.

[1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/rea=
ltek/rtw88/pci.c#L221
[2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/rea=
ltek/rtw88/pci.c#L829
[3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/rea=
ltek/rtw88/pci.c#L192
[4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/rea=
ltek/rtw88/pci.c#L265

> Also, using prefetchable flag is not correct for DMA memory. You should u=
se:
>
>         dma-ranges =3D <0x02000000 0 0xc0000000 0 0xc0000000 0 0x4000000>=
;

This didn't work either. What exactly is supposed to handle dma-ranges?
I see some code parsing it in the PCI core, but it just saves it to a list.


Here's a function graph trace for the dma_alloc_coherent() call:

funcgraph_entry:                   |  dma_alloc_attrs() {
funcgraph_entry:        6.538 us   |    dma_alloc_from_dev_coherent(); (ret=
=3D0x0)
funcgraph_entry:                   |    dma_direct_alloc() {
funcgraph_entry:                   |      __dma_direct_alloc_pages.isra.0()=
 {
funcgraph_entry:        4.846 us   |        dma_alloc_contiguous(); (ret=3D=
0x0)
funcgraph_entry:                   |        __alloc_pages_noprof() {
funcgraph_entry:                   |          __alloc_frozen_pages_noprof()=
 {
funcgraph_entry:        5.539 us   |            fs_reclaim_acquire();
(ret=3D0xffffff80c7dcd580)
funcgraph_entry:        5.077 us   |            fs_reclaim_release();
(ret=3D0xffffff80c7dcd580)
funcgraph_entry:                   |            __might_sleep() {
funcgraph_entry:        5.153 us   |              __might_resched(); (ret=
=3D0x0)
funcgraph_exit:       + 16.230 us  |            } (ret=3D0x0)
funcgraph_entry:        5.077 us   |
__next_zones_zonelist(); (ret=3D0xffffffd055d598e0)
funcgraph_entry:                   |            get_page_from_freelist() {
funcgraph_entry:                   |              _raw_spin_trylock() {
funcgraph_entry:        5.385 us   |
do_raw_spin_trylock(); (ret=3D0x1)
funcgraph_exit:       + 16.923 us  |              } (ret=3D0x1)
funcgraph_entry:                   |              _raw_spin_unlock() {
funcgraph_entry:        5.077 us   |
do_raw_spin_unlock(); (ret=3D0x1)
funcgraph_exit:       + 16.538 us  |              } (ret=3D0x100000001)
funcgraph_exit:       + 54.231 us  |            } (ret=3D0xfffffffec051c540=
)
funcgraph_exit:       ! 123.462 us |          } (ret=3D0xfffffffec051c540)
funcgraph_exit:       ! 134.692 us |        } (ret=3D0xfffffffec051c540)
funcgraph_entry:                   |        __free_pages() {
funcgraph_entry:                   |          ___free_pages() {
funcgraph_entry:                   |            __free_frozen_pages() {
funcgraph_entry:        5.538 us   |
__get_pfnblock_flags_mask.isra.0(); (ret=3D0x0)
funcgraph_entry:                   |              _raw_spin_trylock() {
funcgraph_entry:        5.077 us   |
do_raw_spin_trylock(); (ret=3D0x1)
funcgraph_exit:       + 16.538 us  |              } (ret=3D0x1)
funcgraph_entry:        5.385 us   |
free_frozen_page_commit(); (ret=3D0x1)
funcgraph_entry:                   |              _raw_spin_unlock() {
funcgraph_entry:        5.077 us   |
do_raw_spin_unlock(); (ret=3D0x1)
funcgraph_exit:       + 16.385 us  |              } (ret=3D0x100000001)
funcgraph_exit:       + 75.000 us  |            } (ret=3D0x0)
funcgraph_exit:       + 86.230 us  |          } (ret=3D0x0)
funcgraph_exit:       + 97.384 us  |        } (ret=3D0x0)
funcgraph_exit:       ! 262.846 us |      } (ret=3D0x0)
funcgraph_exit:       ! 274.538 us |    } (ret=3D0x0)
funcgraph_exit:       ! 309.077 us |  } (ret=3D0x0)


And here are kernel logs for all the system's memory regions:

Reserved memory: created DMA memory pool at 0x000000013ff00000, size 1 MiB
OF: reserved mem: initialized node audio-dma-pool, compatible id shared-dma=
-pool
OF: reserved mem: 0x000000013ff00000..0x000000013fffffff (1024 KiB)
nomap non-reusable audio-dma-pool
OF: reserved mem: 0x00000000ffe65000..0x00000000fff64fff (1024 KiB)
map non-reusable ramoops
Reserved memory: created DMA memory pool at 0x0000000050000000, size 41 MiB
OF: reserved mem: initialized node scp@50000000, compatible id shared-dma-p=
ool
OF: reserved mem: 0x0000000050000000..0x00000000528fffff (41984 KiB)
nomap non-reusable scp@50000000
cma: Reserved 16 MiB at 0x00000000c3000000

Zone ranges:
  DMA      [mem 0x0000000040000000-0x00000000c3ffffff]
  DMA32    [mem 0x00000000c4000000-0x00000000ffffffff]
  Normal   [mem 0x0000000100000000-0x000000013fffffff]

Early memory node ranges
  node   0: [mem 0x0000000040000000-0x000000004fffffff]
  node   0: [mem 0x0000000050000000-0x00000000528fffff]
  node   0: [mem 0x0000000052900000-0x00000000545fffff]
  node   0: [mem 0x0000000054700000-0x00000000ffdfffff]
  node   0: [mem 0x0000000100000000-0x000000013fefffff]
  node   0: [mem 0x000000013ff00000-0x000000013fffffff]

software IO TLB: area num 8.
software IO TLB: mapped [mem 0x00000000bf000000-0x00000000c3000000] (64MB)


So I think it could be that the usable memory has all been given away to
other bits? But then dma_alloc_contiguous() returned NULL.


ChenYu

