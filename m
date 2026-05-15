Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B536CD4851
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOPcS/H8/U6wPcyzeNn2Tnxkz+5P1nEugos5oRv4JHk=; b=D86QPAw6XK9ugOejBgLwjuoTQ1
	5R//y58fnAiKg2xcp8ldPTlBbLlOAunHhIGFI50bELBIA+Ls6DEwNF+QAogN9GEcLOmjPSnSGL6+A
	tZ2ewifgRvxzKu7wX0nOUmoTm26wWDsvs1Y8syxpJx51/zBDAwfaZiGxkT7IiQ/LPXBsGjsFXG7vw
	DpwQztjEv5ing4jhni2jJDQMDhyApwAMFzZn/xly15b6cAZwhccTNK6DUuoCTYFCutYfybRp78zid
	MYTTKm8FIw9uTZnBsBPlSnzcSjU8hhbQLEqJc466Nk5/MWu5YoJ//8fOj1vQxvBva4DgFITMqyRfM
	AN4V0xbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoeq-00000007rT0-0Ose;
	Fri, 15 May 2026 09:16:36 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoen-00000007rSK-0iCm
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:16:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so2301409e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778836591; cv=none;
        d=google.com; s=arc-20240605;
        b=UtVubKuNndZ3ckGozHbCPhTdBhllvhmN0PlBb30ahKNR2G4/yPHFPaZ7ixSuirVJbp
         Wp3WqUwPQEcE02O12dwuKVDIDzusP4mX5ie9h8uyXLtdHZGqSsjxWv36nfEhBT0VV975
         BgQ7xQK75/5I/rrdoZiZ9Yz+t7qRIbMBykCQhVNu1tklqtzcehMOC0SZRa7LJd+bFjb3
         P0CrWqt7Yt7GkYYx/HZoLxI0E+OFDmrry6W734VxP1uwb6XNovs92kHxN0vytvIrblVL
         z3hFW7Vcj3dIv2lUKiSSQYXFlFG+XFyJm5QPilozS//EBmgXnPDDKHfM+TMal6AZtVAl
         WwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GOPcS/H8/U6wPcyzeNn2Tnxkz+5P1nEugos5oRv4JHk=;
        fh=kTkHy/HvwotXSBm1s6NBtVVjuqW48MIj/JP3lzm7Kz0=;
        b=bWHZKRsoFyVBClP0lxW46RCuED/FXtiW6d2GUZ3W6W9cpnovsrw+9Hmifz/mHe0g0a
         Csh1gu4mX5qIXle4HYRyDT7RK6dQdsGjY+Zn79E3aJHCbpwOvf6emlIgpFwmKdAOh4g6
         Uk8glsZ/r+uGXtw4WmP6gmfVtdY7NUOAQr4KFyCPcsX7omkjh+SzzQd+MrQe76S+0F6h
         Nnb+Wbyb7KYrK/YP7GkOJbT+2wXbPfbZenKo087z6dS1rQp/cdQJIPCTVQHm/HAruzEE
         SnUCx4shCa84EltakIrDHR/c9F7IS3o1pzUJTVR2nYaPT3kjFcFG40QjoaSoUOE774Si
         QISg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778836591; x=1779441391; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOPcS/H8/U6wPcyzeNn2Tnxkz+5P1nEugos5oRv4JHk=;
        b=CE/GaW4dcVoBDusQWrnk+5pb75x0CTrCTQAxYa6pxIzBZM4E6/oqCAaew7zKuWn9Bo
         mrfehiNoWMMQyWRxSuliCtKpLSKvmhcTAvJO7Rx2NySR8nEy0CL02qSA1lGQJM4vPB8r
         VJlKB2GwZhCtauoAWlu9cn7FrWAUNByDG9wE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836591; x=1779441391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOPcS/H8/U6wPcyzeNn2Tnxkz+5P1nEugos5oRv4JHk=;
        b=ctvPkBrxnldmcCz97pQsAvmokw7xkZU8iJ/+B7fPYoauNeGFzPdb08aCFFdcBIyzcH
         D4iRv7gv7fH0EbxbN1BxwU9g2zoNhTpU2PipIo4+8bs7IObHdnOZgMjFuGQicXero5gf
         6S9USFupE1uUrvK88dSnZ29AFmhvkmLHffTyvE1OVEq9/EBWH4SDvfQlvXFV+Nbft4Ec
         bPaQIZDTOs1ZPi36jECbokcGG5xPnfMfr4M9awpahnpHN8cZfVTutBP9bO2LPheyfxgV
         a+3UJFBz9/R1v26OwvFKdGIosUmhf82kNT1HT9JKVjtgfL2Shesvedv4URFKaA7xGw6V
         wy+A==
X-Forwarded-Encrypted: i=1; AFNElJ+Ecmsipj4PyPnNXjcaL5fkHryh59jIQdj+O35YjAzFNZzzlAkApK9JPUHtcWiTk86ZvEJfit9jlcTC83617A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuSfjwB5PVP7wC7ezkCj31riJopkH0Hjm3olOyRCvGTlzPlSgF
	J0+Ylms31IF3flnbsFViXJJezw8Q3HTwqbIP6Ne9MN6Y45SdDb0SRK1XoG2trthc9O/QcTpqPsp
	K5I6my6OJIA5h6u4tzH2jf+1h5UdZSoluGlhBAUZ7
X-Gm-Gg: Acq92OGNinUYwKvmPDrm5XUljmTkLfChFsQLt54wJA3qiEMC32Riki/cSHQNYdxOynU
	owYdpZWRGWAxHeYDR1ODOlgPH2m0Bntbfmwr/VUV8nX4h2v+nClN9Ps536f4Zwt0KgHB5JyVbla
	y4j48ucZf3Hb9CJxrg3u3qHcM4igIt/rJn/1CSqWUYBXRePJpQQVq8g53j7yU8pmr2EDC/gveAd
	nDKEL4sw/cDwQe5zE9uGiRP62G2/yHABI7dHDBsfpWSfrn5arB7C4cVyxtmSKTvgow5mrc8X9MT
	t2y1Y9hEHPup0l2uJjbeJ6Gyn5RTnP7EfKBGeA==
X-Received: by 2002:a05:6512:3a87:b0:5a8:9d61:d89b with SMTP id
 2adb3069b0e04-5aa0e74cb3dmr743386e87.37.1778836591069; Fri, 15 May 2026
 02:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260508063633.3894348-1-wenst@chromium.org> <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com> <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
In-Reply-To: <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 May 2026 17:16:19 +0800
X-Gm-Features: AVHnY4IdOj2VyhMXhY8fbMZzGCWoX3mgZBp9t_yv23cB0YsfCPC7Ce9B5m4dook
Message-ID: <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260515_021633_255234_80E5CEA1 
X-CRM114-Status: GOOD (  19.72  )
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

On Thu, May 14, 2026 at 7:48=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > On Thu, May 14, 2026 at 1:23=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > > > controller memory access could be limited to a small region by the
> > > > firmware configuring a memory protection unit. This memory region
> > > > must be assigned to the PCIe controller so that the OS knows to
> > > > use that region. Otherwise PCIe devices would not work properly.
> > > >
> > >
> > > So this means, the PCIe devices can only access a specific carveout m=
emory
> > > configured by MPU for DMA? If so, you should use 'dma-ranges' as sugg=
ested by
> > > Rob.
> > >
> > > 'memory-region' also serves the purpose, but for PCI, we have the ded=
icated
> > > 'dma-ranges' property.
> >
> > I think I need some sort of guide on writing the 'dma-ranges' property,
> > because it is not working for me.
> >
> > I'm adding
> >
> >     dma-ranges =3D <0x42000000 0 0x00000000 0 0xc0000000 0 0x4000000>;
> >
>
> So the device DMA address start from 0x0? Isn't it a 1:1 mapping?

I actually don't know. But

>         dma-ranges =3D <0x42000000 0 0xc0000000 0 0xc0000000 0 0x4000000>=
;

this didn't work either.

