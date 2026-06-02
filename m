Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C2CD6E4A
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2026 07:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnHlV7MCTn9bw9xJxluLtxJpmyxU7LZpuXHn1Oyo8MM=; b=MCTsE4gmJAlK6T+R2p9S2Y7tIj
	GkppjThcPKX7a3DkQCRXdCYf9WwjiuNdDhSPOBwGIw8a7UG7kK4yueBHzPWzg1P9YuSTxWmXY0wfi
	Acd5L3mhnFg55hgOLEeJWX20re6wyPPbx/JpgeJYQupqinQ5b9LAIYO94E+2gs/aVe+S2u/jZvz/z
	HHtajSM+YIzfPNimUrnxFkBwhsZcNbyQIVFpNXv7s2a26irVMxXM+lNlPjK9D12Hq5ssXQ1fuz5K7
	Yzo11z7b2o0zcX1w2+Fie76a/3N53uYJsWR8uvCffmh8rL0IEcQbqrV8x2KA+dUd5FsC9ebY+5QLP
	Zn9uSAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJ9D-0000000CQH8-28WO;
	Tue, 02 Jun 2026 07:02:47 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUJ9A-0000000CQGJ-2FnD
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jun 2026 07:02:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso15226445e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jun 2026 00:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780383762; cv=none;
        d=google.com; s=arc-20240605;
        b=EMF/uUQAxoz0Rqyw2qxj6jfsKBpbg5mx7n6KX0g17pMWkWSKWnz6q7II5vB63Tl/5y
         ib2iDWcWdqIBL2koQe9icjcrvo3L5wDRHHfEssBCBE8f24OtxKK0U0wOpIzGvZA7Tqow
         C6lqqQQHbBD4n45H7uwK3Dna0uFknxtrwlHTdH6CoOMu3eBOXxZ+1OTI8/Y8ZXuA/nHT
         YDPbcwyaxtknOi7ArXHvTFDu6kkB1/qS1lfnYZa4lOgplIVMFtgMep4hSx6dJ0n8fYyA
         /Cno7ukzWKipYUQcPScXosM/XuNjSaRS0tEgWNvfhbML7NtMkfEj0PSwuZ2jaEP1Rh7O
         da2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WnHlV7MCTn9bw9xJxluLtxJpmyxU7LZpuXHn1Oyo8MM=;
        fh=mUpZnIER58fYmAd4UMGjLqSrkPfUqzwU3XSnTWwR+fg=;
        b=Yz0j+j61iRsvrir/fg608VuZWnSol7iiGCbdg0MiVcvDEpsrYjevTOKC7ESsdEIWwU
         cueAfoaoeu5ceDY+DMDLE9T2+m5K1SzHAvI6V7qJZNrxrIpqDbFSutsbRNkT+/6nRpSn
         xSqQQLh8gJpEIA9IfsqDQBSK5LPEkluW9uTZ4aCF/7aBxV8ltfRGtXYBJNuSASF/d1aw
         AG3sFB5tlXS+Omp/icJqwieJ61mAp7zuFz6mjag9GLCJP6amhFHtqUUZOJRhByC9GL9n
         Fzz8O7EESK4h6FFOKSDfAjt0IBuw8pBy6D8QifYgBBxDnP16vOAHEiQVW3uLpkYHJEXU
         zTQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780383762; x=1780988562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnHlV7MCTn9bw9xJxluLtxJpmyxU7LZpuXHn1Oyo8MM=;
        b=nWnV2JznCByIJIEJ7+rxNywT6AgTpYLMYErKvyk2ol2tSYv3TU+HAuM5f6gwwE822j
         8k4ZqjkjfbwFZsIeDrc9RXfGx10flNyDjGRc100pVPvPBPZaphKvL8cGN9v6NJnZ0Dp9
         /A8uuXBmo/VBGbVCdd5T/f4nl1Pn/UDOUoKs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383762; x=1780988562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WnHlV7MCTn9bw9xJxluLtxJpmyxU7LZpuXHn1Oyo8MM=;
        b=sALz1HeI/UjxVk+UlohJVlQREsKxpEOoGjZYonbY6TYwJkz7ODDugycKTQJogiBJVf
         LxSJGuSsQVsdznjFfXjl+dOHhHAognDnrGz56XcKzy6cV00yDCr1esSYQp7EfKr3pY2V
         tXWesEkHzxfOhukVWbw461BkBp15O2Py5AzWXPblTrKE6OZVVv4cAnOaVyhhd/gOsmts
         z4MCddOYKiK30qVWYxkR9kE/GUGnTE5A3oVc1THkFAG5W8+3p4IcPU512kW3htw+Tyfw
         xqnPO64OeVw+GL/K7XW7nvlUfvHyVVIY4IFsu41wlcQkr7B3hskQaf/OF+1AOyZK2WNm
         RF5w==
X-Forwarded-Encrypted: i=1; AFNElJ+QwFhVmNWXc9LGnGS3iXES3SRaMunSnuEcK9NLIekxS3jlXl2EKzhT2Cr2E38nEVjnhXX8/L8u9WmRUdpxgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCzWtJNRxYy2H1a3IHZsS0Et7vbFxbS8a6ngyz4gHJq0PN4AQ2
	NessUwBPMrJNNkMrcZg2/lF5/1JO/R1BElKt7Cz4kDm+pPFx5zSuarFi4XFTTvUBmPDuXbgBFAR
	XPmjY3oeNQSACPlq6chWQkSjhzaz9wtlfrTioVtDY
X-Gm-Gg: Acq92OF44qEDk/QuxqXDH3PLI7G1MJ7OTY2PdIdK7K7vA1wTBWbHm6T3yFcEYq4KHR7
	irgPrB+ubvfS/E0WEO/zp1/1AGRwxbnIZhAFNOGDY9HdBkkQRI6DDN8YSCh13x6vzsQRvE5dpra
	6IgZw16YafGG/ldUig9S3l2hlzVOZMzkOWUPyd2Yeu+3Nu9aYvHc0+vb5Oo2IgWDCPKPhNSWJnG
	qahGLQo+xCIbXpg30HSVlMCVvZ3PVWrqkZ8go03z7Cy73fRX6KY2TffpT4hys+MqqYMn2E/eMOU
	QLy+bDIL1Fty9nJdr5D+ungttfMXZ1Yl/SDyrEQXecpg2okAd0E4vZCLAw==
X-Received: by 2002:a05:6512:1149:b0:5aa:6c90:283f with SMTP id
 2adb3069b0e04-5aa6c902a77mr2153865e87.20.1780383761782; Tue, 02 Jun 2026
 00:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
 <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
 <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com>
 <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz> <20260601214836.GA37779-robh@kernel.org>
In-Reply-To: <20260601214836.GA37779-robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 2 Jun 2026 15:02:28 +0800
X-Gm-Features: AVHnY4JxBAhKzuOj5WlSWhMTG9y7geprKoaK3gn9MaHW8gIuPbxvEk-tzLbY0lY
Message-ID: <CAGXv+5GK6+X3-eY8PbrLTsSwK2Uk2URiQti_Gd_9C=RwRaJ44Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
To: Rob Herring <robh@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_000244_703805_BFD31C25 
X-CRM114-Status: GOOD (  40.61  )
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

On Tue, Jun 2, 2026 at 5:48=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, May 19, 2026 at 12:51:49PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, May 18, 2026 at 05:02:11PM +0800, Chen-Yu Tsai wrote:
> > > On Fri, May 15, 2026 at 8:34=E2=80=AFPM Manivannan Sadhasivam <mani@k=
ernel.org> wrote:
> > > >
> > > > On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > > > > On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <ma=
ni@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > > > > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam=
 <mani@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrot=
e:
> > > > > > > > > On some SoCs without an IOMMU behind the PCIe controller,=
 the PCIe
> > > > > > > > > controller memory access could be limited to a small regi=
on by the
> > > > > > > > > firmware configuring a memory protection unit. This memor=
y region
> > > > > > > > > must be assigned to the PCIe controller so that the OS kn=
ows to
> > > > > > > > > use that region. Otherwise PCIe devices would not work pr=
operly.
> > > > > > > > >
> > > > > > > >
> > > > > > > > So this means, the PCIe devices can only access a specific =
carveout memory
> > > > > > > > configured by MPU for DMA? If so, you should use 'dma-range=
s' as suggested by
> > > > > > > > Rob.
> > > > > > > >
> > > > > > > > 'memory-region' also serves the purpose, but for PCI, we ha=
ve the dedicated
> > > > > > > > 'dma-ranges' property.
> > > > > > >
> > > > > > > I think I need some sort of guide on writing the 'dma-ranges'=
 property,
> > > > > > > because it is not working for me.
> > > > > > >
> > > > > > > I'm adding
> > > > > > >
> > > > > > >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x=
4000000>;
> > > > > > >
> > > > > >
> > > > > > So the device DMA address start from 0x0? Isn't it a 1:1 mappin=
g?
> > > > >
> > > > > I actually don't know. But
> > > > >
> > > > > >         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 0 =
0x4000000>;
> > > > >
> > > > > this didn't work either.
> > > >
> > > >
> > > > Hmm. Can you print the DMA address programmed to the device? i.e., =
the address
> > > > returned by dma_map_single() in the driver.
> > >
> > > On a working system still using the restricted-dma-pool memory region=
,
> > > it gives something like 0x00000000c0009000, so indeed it is 1:1 mappi=
ng?
> >
> > It has to be 1:1 mapping.
> >
> > > These are for the RX/TX descriptors [1][2].
> > >
> > > When using dma-ranges, the failure is from dma_alloc_coherent() [3][4=
],
> > > which is the descriptor ring. On a working system, this is something
> > > like 0x00000000c0c9d000, so again 1:1.
> > >
> > > [1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wirele=
ss/realtek/rtw88/pci.c#L221
> > > [2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wirele=
ss/realtek/rtw88/pci.c#L829
> > > [3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wirele=
ss/realtek/rtw88/pci.c#L192
> > > [4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wirele=
ss/realtek/rtw88/pci.c#L265
> > >
> > > > Also, using prefetchable flag is not correct for DMA memory. You sh=
ould use:
> > > >
> > > >         dma-ranges =3D <0x02000000 0 0xc0000000 0 0xc0000000 0 0x40=
00000>;
> > >
> > > This didn't work either. What exactly is supposed to handle dma-range=
s?
> > > I see some code parsing it in the PCI core, but it just saves it to a=
 list.
> > >
> >
> > I think the failure is due to marking the memory as 'reserved' in DT. W=
ith
> > 'dma-ranges', the allocator will only ensure that the allocated memory =
stays
> > within this limit. But the allocator itself will not use this property =
to
> > allocate from the reserved region.
>
> So the region should not be reserved. Reserved generally means the OS
> shouldn't use the region (though maybe a specific driver/device can). It
> should just be a CMA area I think.

No. The whole reason for this is that we want an isolated piece of memory
for PCIe so that PCIe transfers cannot corrupt memory used by other parts
of the system. Normally the IOMMU provides the isolation. On this platform
there is no IOMMU for the PCIe controller.

System memory isolation as setup by the firmware already restricts the
PCIe controller to only be able to use this region. And we absolutely do
not want any other part of the system, be it kernel, DMA buffers, or
userspace, to use it.

And also, if it is not reserved, the kernel is free to put "other" reserved
regions, such as the default CMA region or the software IO TLB region in
this piece of memory.

So I believe using memory-region is the way to go. The memory needs to be
reserved, and assigned to just the PCIe controller.


Thanks
ChenYu

