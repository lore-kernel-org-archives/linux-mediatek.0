Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38EECD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU6FJfQ/76+9tMzcnc5nPEzKVK7hTRt2Hbmts6N3fto=; b=gbuYu80nvlJ9F/IE+0BWkzerxt
	GNAzeGG1IxFu7yNLku/9PFj8T9FBMqZXsPJGk608MGNYLBSzBcQxoj9m1sXptZQgP/s+iuW60Pzr3
	S1jyA9REUiKgFj6nrwDTuowDHxNCsNX239cxMl8khj+dWQEc6rTvjtuBIeAXEHBh7MzVx0ppzIc2q
	B9ZcZ547ey+eWf0oU82m+jYB3NVrmLX6M6jei91dPN6lC/YtlSQFlz5Z1Yca0NZyozw0u+d1QWS/k
	xhtOKSpCgDNqIfYh1tglQb5OuGgg/woifjejnSVyJEstxpaBQT4ESCVZklbhRU2AnrYV1p4NY4wuj
	Khtl1C4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG2j-00000000iYq-41L8;
	Tue, 19 May 2026 08:43:13 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG2h-00000000iXe-3NRn
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 08:43:13 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-38e97e73234so30129401fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 01:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779180190; cv=none;
        d=google.com; s=arc-20240605;
        b=amjspT/Au/APSWYLFO5m1MdJ8qJbXK+ENv4viOVHf1m+sKQBbg0Q5nvihjzBsfc233
         MUUzKN0oahtdKLKU/57X52RcntSbnsEhi0WSHjz5QyP0DRPtb22tFEtzvAPApTUHMj9P
         De2nMGJZoWfUIycHop8sp1zPBK9UK4iLjzDIDZeCb3Iy0/e0Hm40xuHKJ1RkZpaUPXEr
         z76FnzfvRkGfLnCvLYad17Y2u8dSfPl4C9aRKRwC3NMkoPdYskFiOqzFUl77V793+NeV
         X/L/l4hiRFNdj0epxE6enNhrv0yNmTyfFIDvWY5WSHyIhyFLIOFUCAjjDlyXHxmXEpBa
         xtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fU6FJfQ/76+9tMzcnc5nPEzKVK7hTRt2Hbmts6N3fto=;
        fh=VHV62GdJSC7uny614M3oN2YUK/vntccLLRXslEf9kNs=;
        b=SB0u64/xRaofWks+35j42rI3yp+1mVzsppwDw3oHu+b8tZyIfjkfwrJCwhihsFGp2m
         +OryzbhjgQV0H/raLelzlNutgO8NVf8iwyiFjFEbeCKW8ubFF2+5tO8EJbDQw+JMU1FS
         6fZrT1yi3uzJZNYqTA9pe2vFzcSZ3ExT75exLciypKSZYgi57gRD4+Hr8gUGqDp4Hn/M
         Ov6YxNKWG2PvsR9QcAbiBRv/MJHzRoVS7ACCAuuCXuiL70SzNuZ34R0TPBWWu/22khmo
         /fWeEbMSykz/eXYy8HMoLFDsamcr1TWoTvhiyeW8mLa8BW6tCGuHFNRAcDBxybcRavTH
         4SIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779180190; x=1779784990; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU6FJfQ/76+9tMzcnc5nPEzKVK7hTRt2Hbmts6N3fto=;
        b=Qp6d7V5KYzyTOJkAOBYZl2JhsdbQjAcCcApevgeNrr3u2do9JTfsCds2bOAS7MogMW
         ptTrOvXLxng7TwW37PQo3e56SnW2h9pZ2i2Uawp9o2O8b4wkCteG8hlnc9esqTQcVWCb
         7ttBfD8FQhMBfCuAjXw5fdGL9G7xKyhSD5b/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180190; x=1779784990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fU6FJfQ/76+9tMzcnc5nPEzKVK7hTRt2Hbmts6N3fto=;
        b=YH4pABN+3HDWv9FP9UMEAsiEjuwzdSs6wu6T+1b5OregtDzDEfPS9qPigfIv1PmxKE
         H/hg/xQO26PPcP5QnL289tEt7SPwMVHBIw1ZOTsJn39FchCu1o9swW+ncNd3YCJ1rMpX
         XHJXe8oYZJ0dqtOYkpHy3NTSZJNgw7FOSQC+uMldXVJBXOfyyOvataM9TasAzb5nPSNS
         EHzwS/H2eoOHVKSXx6eTm+UtY5Twkudg/3oI9dgXN2YvDaj39IcjSCPcJCTR1QS8fRVD
         tQvrrOBx5JDqA7DbhpWXeMKHLIf1GCXyJBAm5OF+LIOriiRmPfNdxuI+kVhuyQH+Ndg1
         2qVg==
X-Forwarded-Encrypted: i=1; AFNElJ/yUO7R8qhvamyQ/frj6OgyjYMPEgAg1r/xTOeT/zGihCmXNktIk947P99jJ+v3M8XBvuL4Z6bjbsdqtU85eg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh88GV30Hg717L/p4kHMa017oDeyarbFYw0A0bHu0Wbsrpz9Ni
	dIVMiTaeDM5cBLcl4e26P4xiH5PR1fNznz7Mna9IgmgXnKjS9vc5YEaFF8jmNjPqh4OyJlWJCkD
	Bt6k0TjPYa+vkyc7ltGgJLeDehbF0l3j+Y5cQKXv0
X-Gm-Gg: Acq92OFwsP5h46fXRt8CpnubdxVnpdMaa0iW3SP6VaTAevAWvQhCMxoYF3nB7l+eP0k
	U8gkfmkmuv3/O7mw1uSQxJl1OeWRz13nFzUFQ00uwa5Prut/QFcnWjNV1CsWJST/l7w9MXB6h5u
	qy5NMada1P8tzQdX+4bU9uvHtu5NGqxiSNQDda3JYFY6QPMKbKCpND+Xa6PpT5Qwfl/zpw792l7
	cHuh+7bBc/ygz1z5h82wRqFHd5lzu3sgtsmE3JxTBgQho14cdfe4p9ME+hqZV9kSYwB5sMEjlfP
	jXk+6uB2o+euHaOeZW/MOe3Mxv9cPW0932buKMwMCF2oKUeR
X-Received: by 2002:a05:6512:1291:b0:5a8:64fd:142 with SMTP id
 2adb3069b0e04-5aa0e60aebdmr5661162e87.15.1779180189498; Tue, 19 May 2026
 01:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
 <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
 <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com> <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
In-Reply-To: <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 May 2026 16:42:56 +0800
X-Gm-Features: AVHnY4LLo4eF_VaQ6YS2FYY5drqx5D71hzS5a123cTm8zGoSSsL-Aobf3coFKV4
Message-ID: <CAGXv+5Hd91gS=j4x8rEPVSaU8ET-W0qygLTbCLVe6uGC-tQBrg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260519_014311_950713_891545AB 
X-CRM114-Status: GOOD (  43.12  )
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

On Tue, May 19, 2026 at 3:21=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Mon, May 18, 2026 at 05:02:11PM +0800, Chen-Yu Tsai wrote:
> > On Fri, May 15, 2026 at 8:34=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <mani=
@kernel.org> wrote:
> > > > >
> > > > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam <=
mani@kernel.org> wrote:
> > > > > > >
> > > > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On some SoCs without an IOMMU behind the PCIe controller, t=
he PCIe
> > > > > > > > controller memory access could be limited to a small region=
 by the
> > > > > > > > firmware configuring a memory protection unit. This memory =
region
> > > > > > > > must be assigned to the PCIe controller so that the OS know=
s to
> > > > > > > > use that region. Otherwise PCIe devices would not work prop=
erly.
> > > > > > > >
> > > > > > >
> > > > > > > So this means, the PCIe devices can only access a specific ca=
rveout memory
> > > > > > > configured by MPU for DMA? If so, you should use 'dma-ranges'=
 as suggested by
> > > > > > > Rob.
> > > > > > >
> > > > > > > 'memory-region' also serves the purpose, but for PCI, we have=
 the dedicated
> > > > > > > 'dma-ranges' property.
> > > > > >
> > > > > > I think I need some sort of guide on writing the 'dma-ranges' p=
roperty,
> > > > > > because it is not working for me.
> > > > > >
> > > > > > I'm adding
> > > > > >
> > > > > >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x40=
00000>;
> > > > > >
> > > > >
> > > > > So the device DMA address start from 0x0? Isn't it a 1:1 mapping?
> > > >
> > > > I actually don't know. But
> > > >
> > > > >         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 0 0x=
4000000>;
> > > >
> > > > this didn't work either.
> > >
> > >
> > > Hmm. Can you print the DMA address programmed to the device? i.e., th=
e address
> > > returned by dma_map_single() in the driver.
> >
> > On a working system still using the restricted-dma-pool memory region,
> > it gives something like 0x00000000c0009000, so indeed it is 1:1 mapping=
?
>
> It has to be 1:1 mapping.
>
> > These are for the RX/TX descriptors [1][2].
> >
> > When using dma-ranges, the failure is from dma_alloc_coherent() [3][4],
> > which is the descriptor ring. On a working system, this is something
> > like 0x00000000c0c9d000, so again 1:1.
> >
> > [1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless=
/realtek/rtw88/pci.c#L221
> > [2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless=
/realtek/rtw88/pci.c#L829
> > [3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless=
/realtek/rtw88/pci.c#L192
> > [4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless=
/realtek/rtw88/pci.c#L265
> >
> > > Also, using prefetchable flag is not correct for DMA memory. You shou=
ld use:
> > >
> > >         dma-ranges =3D <0x02000000 0 0xc0000000 0 0xc0000000 0 0x4000=
000>;
> >
> > This didn't work either. What exactly is supposed to handle dma-ranges?
> > I see some code parsing it in the PCI core, but it just saves it to a l=
ist.
> >
>
> I think the failure is due to marking the memory as 'reserved' in DT. Wit=
h
> 'dma-ranges', the allocator will only ensure that the allocated memory st=
ays
> within this limit. But the allocator itself will not use this property to
> allocate from the reserved region.

It didn't work with the reserved regions removed either, since CMA and
SWIOTLB take up the space by coincidence.

> Now, I'm not sure if you can reliably get dma-ranges to work for this use=
case
> of forcing the dma_alloc_coherent() to use the reserved memory.

Well I think that would be a bit sketchy. But we do want the reserved
memory, as the whole point of limiting PCIe DMA to that region is to
isolate the DMA, so we don't want the system using it for something
else and potentially getting overriden by some rogue PCIe device.

> So looks like 'memory-region' is your only option here.

Thanks. Hopefully Rob understands and gives an ack for the DT binding
change.


ChenYu

> - Mani
>
> >
> > Here's a function graph trace for the dma_alloc_coherent() call:
> >
> > funcgraph_entry:                   |  dma_alloc_attrs() {
> > funcgraph_entry:        6.538 us   |    dma_alloc_from_dev_coherent(); =
(ret=3D0x0)
> > funcgraph_entry:                   |    dma_direct_alloc() {
> > funcgraph_entry:                   |      __dma_direct_alloc_pages.isra=
.0() {
> > funcgraph_entry:        4.846 us   |        dma_alloc_contiguous(); (re=
t=3D0x0)
> > funcgraph_entry:                   |        __alloc_pages_noprof() {
> > funcgraph_entry:                   |          __alloc_frozen_pages_nopr=
of() {
> > funcgraph_entry:        5.539 us   |            fs_reclaim_acquire();
> > (ret=3D0xffffff80c7dcd580)
> > funcgraph_entry:        5.077 us   |            fs_reclaim_release();
> > (ret=3D0xffffff80c7dcd580)
> > funcgraph_entry:                   |            __might_sleep() {
> > funcgraph_entry:        5.153 us   |              __might_resched(); (r=
et=3D0x0)
> > funcgraph_exit:       + 16.230 us  |            } (ret=3D0x0)
> > funcgraph_entry:        5.077 us   |
> > __next_zones_zonelist(); (ret=3D0xffffffd055d598e0)
> > funcgraph_entry:                   |            get_page_from_freelist(=
) {
> > funcgraph_entry:                   |              _raw_spin_trylock() {
> > funcgraph_entry:        5.385 us   |
> > do_raw_spin_trylock(); (ret=3D0x1)
> > funcgraph_exit:       + 16.923 us  |              } (ret=3D0x1)
> > funcgraph_entry:                   |              _raw_spin_unlock() {
> > funcgraph_entry:        5.077 us   |
> > do_raw_spin_unlock(); (ret=3D0x1)
> > funcgraph_exit:       + 16.538 us  |              } (ret=3D0x100000001)
> > funcgraph_exit:       + 54.231 us  |            } (ret=3D0xfffffffec051=
c540)
> > funcgraph_exit:       ! 123.462 us |          } (ret=3D0xfffffffec051c5=
40)
> > funcgraph_exit:       ! 134.692 us |        } (ret=3D0xfffffffec051c540=
)
> > funcgraph_entry:                   |        __free_pages() {
> > funcgraph_entry:                   |          ___free_pages() {
> > funcgraph_entry:                   |            __free_frozen_pages() {
> > funcgraph_entry:        5.538 us   |
> > __get_pfnblock_flags_mask.isra.0(); (ret=3D0x0)
> > funcgraph_entry:                   |              _raw_spin_trylock() {
> > funcgraph_entry:        5.077 us   |
> > do_raw_spin_trylock(); (ret=3D0x1)
> > funcgraph_exit:       + 16.538 us  |              } (ret=3D0x1)
> > funcgraph_entry:        5.385 us   |
> > free_frozen_page_commit(); (ret=3D0x1)
> > funcgraph_entry:                   |              _raw_spin_unlock() {
> > funcgraph_entry:        5.077 us   |
> > do_raw_spin_unlock(); (ret=3D0x1)
> > funcgraph_exit:       + 16.385 us  |              } (ret=3D0x100000001)
> > funcgraph_exit:       + 75.000 us  |            } (ret=3D0x0)
> > funcgraph_exit:       + 86.230 us  |          } (ret=3D0x0)
> > funcgraph_exit:       + 97.384 us  |        } (ret=3D0x0)
> > funcgraph_exit:       ! 262.846 us |      } (ret=3D0x0)
> > funcgraph_exit:       ! 274.538 us |    } (ret=3D0x0)
> > funcgraph_exit:       ! 309.077 us |  } (ret=3D0x0)
> >
> >
> > And here are kernel logs for all the system's memory regions:
> >
> > Reserved memory: created DMA memory pool at 0x000000013ff00000, size 1 =
MiB
> > OF: reserved mem: initialized node audio-dma-pool, compatible id shared=
-dma-pool
> > OF: reserved mem: 0x000000013ff00000..0x000000013fffffff (1024 KiB)
> > nomap non-reusable audio-dma-pool
> > OF: reserved mem: 0x00000000ffe65000..0x00000000fff64fff (1024 KiB)
> > map non-reusable ramoops
> > Reserved memory: created DMA memory pool at 0x0000000050000000, size 41=
 MiB
> > OF: reserved mem: initialized node scp@50000000, compatible id shared-d=
ma-pool
> > OF: reserved mem: 0x0000000050000000..0x00000000528fffff (41984 KiB)
> > nomap non-reusable scp@50000000
> > cma: Reserved 16 MiB at 0x00000000c3000000
> >
> > Zone ranges:
> >   DMA      [mem 0x0000000040000000-0x00000000c3ffffff]
> >   DMA32    [mem 0x00000000c4000000-0x00000000ffffffff]
> >   Normal   [mem 0x0000000100000000-0x000000013fffffff]
> >
> > Early memory node ranges
> >   node   0: [mem 0x0000000040000000-0x000000004fffffff]
> >   node   0: [mem 0x0000000050000000-0x00000000528fffff]
> >   node   0: [mem 0x0000000052900000-0x00000000545fffff]
> >   node   0: [mem 0x0000000054700000-0x00000000ffdfffff]
> >   node   0: [mem 0x0000000100000000-0x000000013fefffff]
> >   node   0: [mem 0x000000013ff00000-0x000000013fffffff]
> >
> > software IO TLB: area num 8.
> > software IO TLB: mapped [mem 0x00000000bf000000-0x00000000c3000000] (64=
MB)
> >
> >
> > So I think it could be that the usable memory has all been given away t=
o
> > other bits? But then dma_alloc_contiguous() returned NULL.
> >
> >
> > ChenYu
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

