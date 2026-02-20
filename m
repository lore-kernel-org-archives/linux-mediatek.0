Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EBEC5AD57
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Feb 2026 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9wAYpUkNDggm+xpUXS46dSTi4ek7gG5ZohcgKwDyZ4=; b=ttTQcHHvdZdc8QJ4XLy+PhCJP2
	F4YdNlJHn4ZCuCSXHQRZ3e//n6OXA8y7MW9mkdgANijR4tKhxKs3KZToej7UjAMSvQIvAy0W0MFlQ
	lZqGA6nmUb2mISsk7BTgUW3Gt7oa3/kdGrXOQDvvic/FCKxh8NYilMjLjTm2XF2ol/zCzXRVUsGMB
	XFYf3/CUbsJ5dNCq4aR4s1SU4u/9/ddds8PyTpw2LwNtpm+LaYIMqbftjY+KOdwfBnaZrM41l3p9y
	tE9zYU2e9m0kDEc0RPfA5crJLKjb6O9kw/1ECzBk1b0JA+AdIrvYmmkA15ssq8aVzT9EQT8v3DvQ0
	DuvQWGSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVPt-0000000FSeB-0j72;
	Fri, 20 Feb 2026 18:39:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVPr-0000000FSdu-36wd
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Feb 2026 18:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B03E060134
	for <linux-mediatek@lists.infradead.org>; Fri, 20 Feb 2026 18:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6652FC4AF09
	for <linux-mediatek@lists.infradead.org>; Fri, 20 Feb 2026 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771612790;
	bh=5381ncl+i3DeRJNXMHjSIVGfU1Cn20+SK2GkcZCssO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lBGabEWWsd4EIsekD8MaDuPKqwdyX+HEKywI+7kv+weBVA8spFSUlRTM6SrLqpbRm
	 y0ZaXQ7ms9KM1kiRqOyeby/rQCfKLE1yxQtARi7h4bdNLE4WNSeLIbfOI5JFGb8YZj
	 Xu8b/pnEGXKKvJS4hD+mYOMC2pRVDtxiHSA9aSYM1IMiPjJzrLuh3Kc8+LSemZdWQ6
	 wDuzZE4XskIUyc2EfNp4tiEN69z2968GhDxrzVrwK5RJ6nYvf7Egt9CWbQPRDHAtJV
	 /s+gb/IbLOh7u7Nhxp0P0HOjcAY+VFAMDi0tJtwCqOOgXCDtWB/3FrhToeKqOXEJPc
	 kOsg5xCXdumFQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-385e7cafef9so20165101fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Feb 2026 10:39:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1e1qcqbSZehgvpwpxplZxblyKGEYqlQA9cIljm6EDo2wP1WFn17aZhDaOVqm2wBYuMKyuQeaLUfLLx/o0NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrTWdNRg9cvQjZnsiZ9njwqbnKCpu3+eJzJ9bxL6ifYtMxvPbC
	/P+UIsqqAgvxfUf36rlE9PgCHENUy/zFdGQxZNWQ+t53UyisA7SbbK1O7KkrGf6ceZwY3FQnHV2
	P1t+676P11ZvXAEy2pgtTZFjzlOKSkTI=
X-Received: by 2002:a2e:be1a:0:b0:37f:b6a4:f5df with SMTP id
 38308e7fff4ca-389a58a072bmr2575741fa.0.1771612788762; Fri, 20 Feb 2026
 10:39:48 -0800 (PST)
MIME-Version: 1.0
References: <20260219004007.19733-1-sean.wang@kernel.org> <20260219004007.19733-3-sean.wang@kernel.org>
 <39e814ff-2ea2-4984-9e8a-2902fef7c4bc@manjaro.org>
In-Reply-To: <39e814ff-2ea2-4984-9e8a-2902fef7c4bc@manjaro.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 20 Feb 2026 12:39:37 -0600
X-Gmail-Original-Message-ID: <CAGp9Lzos_u7pQQtvmFMzcnJ3JxyFwf6h=ZH=zGwp5pmrNsbR4A@mail.gmail.com>
X-Gm-Features: AaiRm53lLKBAKXycbad-w8DaS1gdC-crDm_9Fe1tUWIv13Okh2y4_fIeyrE4Y68
Message-ID: <CAGp9Lzos_u7pQQtvmFMzcnJ3JxyFwf6h=ZH=zGwp5pmrNsbR4A@mail.gmail.com>
Subject: Re: [PATCH 03/11] wifi: mt76: mt7921: handle MT7902 irq_map quirk
 with mutable copy
To: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, 
	Xiong Huang <xiong.huang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Philip,

On Fri, Feb 20, 2026 at 4:09=E2=80=AFAM Philip M=C3=BCller <philm@manjaro.o=
rg> wrote:
>
> Hi Sean,
>
> on Linus master tree we still have 'mt76_mmio_init(&dev->mt76,
> pcim_iomap_table(pdev)[0]);', hence your patch currently won't apply.

The patchset is based on the latest mt76 tree.
If needed, please apply the following commit first so the series
applies cleanly:
https://github.com/nbd168/wireless/commit/4eefc435c985f4dfdba9afb1c705f0e17=
377c084
That patch will go to Linus=E2=80=99 master first, then this series.

>
> On 2/19/26 01:39, sean.wang@kernel.org wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > MT7902 PCIe requires a different wm2_complete_mask value, so introduce =
a
> > mutable per-device copy of the default irq_map and override the field
> > only for this chip. Other devices continue using the shared const
> > template.
> >
> > This is a prerequisite patch before enabling MT7902 PCIe support.
> >
> > Co-developed-by: Xiong Huang <xiong.huang@mediatek.com>
> > Signed-off-by: Xiong Huang <xiong.huang@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >   drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/=
net/wireless/mediatek/mt76/mt7921/pci.c
> > index 65c7fe671137..5f857a21f362 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> > @@ -327,6 +327,20 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
> >       dev->hif_ops =3D &mt7921_pcie_ops;
> >       dev->irq_map =3D &irq_map;
> >       mt76_mmio_init(&dev->mt76, regs);
> > +
> > +     if (id->device =3D=3D 0x7902) {
> > +             struct mt792x_irq_map *map;
> > +
> > +             /* MT7902 needs a mutable copy because wm2_complete_mask =
differs */
> > +             map =3D devm_kmemdup(&pdev->dev, &irq_map,
> > +                                sizeof(irq_map), GFP_KERNEL);
> > +             if (!map)
> > +                     return -ENOMEM;
> > +
> > +             map->rx.wm2_complete_mask =3D 0;
> > +             dev->irq_map =3D map;
> > +     }
> > +
> >       tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned lo=
ng)dev);
> >
> >       dev->phy.dev =3D dev;
>
>
> --
> Best, Philip
>

