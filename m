Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF175C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:00:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0E56113E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E0E56113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRBLLH+qPOvl5iUBvk7jeYDsRyh3k5cT/BgCQzjP6Eo=; b=em8TZue5jOdIEl
	bxoKkZVHKStCpiFOEDDZFhQ4mAM2mT60aPt4/c8OMP2TpuU9baogKeobFMUTfJRVf7VKwyRksaXna
	wBVTm+lVy1QfX75czTGNHuqHva2ZA7lqr24jWHTqB7fZn7SDvVA2HwvojMiQvhFy9yt/HclaEatd3
	qDlbQt/JsXZb4KBN0Y7jfeVkOEOilu9o3dgY6xRt6LF0wa6Yi/1jof2/GaVgqqORWhqFNPAWxzv5O
	3SpLrYJztFxFawJTHsh4U4EAc56Nbd7Bj+b4y3KTwvnb9m7VZBBFSKAxKeomSlIOt5SisMOnEho/o
	jwacl9+G/PcvIAcmpTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkgf3-004XBg-E6; Wed, 10 Nov 2021 06:00:41 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkgep-004X7S-RH; Wed, 10 Nov 2021 06:00:29 +0000
Received: by mail-ua1-x92e.google.com with SMTP id p37so847710uae.8;
 Tue, 09 Nov 2021 22:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/fK2AOU0X0RUmqPwzAJ1ENwkX2oJHV5Jwzo0RGKYEQ=;
 b=AQHU2VtN7dZASiUkHWLL8lRWvX3lR1DRfX7NS92GwJYDHAjrahqhvbghm6Z7/58yjy
 9/yG0pZK7WuAWT8r3Ah6Ux53Z/N94UMIMJaIOKeT1gPhyVfBowBEB+iOPCHYi8rBWmxK
 oEnHGBfnLZNQ2zsn/6dGZ5XZnY/w8wwIahWtUXCp0IOyEUUZe0haN92PykgYejbxpixJ
 KOIapnagORpyj++OLtCB5QJKGPGq773U64l9RHDBKFk7DxLkPsAeC8zCx/dsovrpen+5
 1SRsyE7LW7rGbdxjjAkZ92lE2mq9pM425nCt1BnzvLE4dMYRwPbeHDz3hQFcMUS31jtU
 lm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/fK2AOU0X0RUmqPwzAJ1ENwkX2oJHV5Jwzo0RGKYEQ=;
 b=X/9U9OXP7tJOBefkK3kSZXLt4T2I3MjO/Ywzl4+7QydeQTz6VdJgRaV7qJov7L7JJt
 K+sSk7CI/tFsbjsc4exySopdkXG4Mk8uZSbYEGhZpxkMgPPxLfdhgg2ddJCNboDlp4BF
 pbt+laBHJ+zz1DK3lTFXSm/XGRDSMx8QD6ZFTW5qbqQOLu00PuWMmW/sw8ZmYhGM9Nxe
 3VJG9YFGrZWrVPYc4L/bBYhZiSOFafd5CZFweUr/+xXEceWisIoYGv/2Dtc59bKjfDI/
 H7dLZ/eZaefhV5ETgxkSqrbCL1FM+TT3tYj8hRwcJK4UPqTKEfX/5n53r6fjyoILjltw
 7mxA==
X-Gm-Message-State: AOAM530dgv6+GYtfpRzXz9/IxHgg6dGznqhysnWiU+7VnKZx+TNehUWD
 Kt6BkYPvedgY3sVZsCTHocoJraUPUJqzXk5Fs7U=
X-Google-Smtp-Source: ABdhPJxMFcQZUh7Yu8K7DxRldAM2JjVMVVcYL3NG2VGklnhT55CYQrDXqBV8Jahfh441EEbGYdYVBn+3V/Db4NSgMn4=
X-Received: by 2002:a05:6102:3ec3:: with SMTP id
 n3mr125056035vsv.48.1636524021528; 
 Tue, 09 Nov 2021 22:00:21 -0800 (PST)
MIME-Version: 1.0
References: <CAMhs-H8ShoaYiFOOzJaGC68nZz=V365RXN_Kjuj=fPFENGJiiw@mail.gmail.com>
 <20211109224138.GA1180875@bhelgaas>
In-Reply-To: <20211109224138.GA1180875@bhelgaas>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 10 Nov 2021 07:00:09 +0100
Message-ID: <CAMhs-H9zpjg64Y-VAdM16FXwwzObB1+npDcGXD484hXzyEPtdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MIPS: cm/cpc: export some missing symbols to be
 able to use them from driver code
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yanteng Si <siyanteng01@gmail.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Yanteng Si <siyanteng@loongson.cn>, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>,
 kw@linux.com, 
 Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-pci <linux-pci@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>, chenhuacai@kernel.org,
 sterlingteng@gmail.com, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_220027_918059_A6E7EEB2 
X-CRM114-Status: GOOD (  74.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 9, 2021 at 11:41 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Arnd]
>
> On Sun, Nov 07, 2021 at 08:00:56AM +0100, Sergio Paracuellos wrote:
> > On Sat, Oct 30, 2021 at 7:38 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > > On Sat, Oct 30, 2021 at 7:21 AM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > > On Fri, Oct 29, 2021 at 10:27 PM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > On Fri, Oct 29, 2021 at 9:47 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > > On Fri, Oct 29, 2021 at 09:37:53PM +0200, Sergio Paracuellos wrote:
> > > > > > > On Fri, Oct 29, 2021 at 8:49 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> > > > > > > > One way might be to implement a
> > > > > > > > pcibios_root_bridge_prepare() for mips and put the
> > > > > > > > setup_cm_memory_region() stuff in there.  It's not
> > > > > > > > *ideal* because that's a strong/weak function
> > > > > > > > arrangement that doesn't allow for multiple host
> > > > > > > > bridges, but that's probably not an issue here.
> > > > > > > >
> > > > > > > > If we can't do that, I think making it bool is probably
> > > > > > > > the right answer, but it would be worth a brief comment
> > > > > > > > in the commit log to explain the issue.
> > > > > > >
> > > > > > > Do you mean to implement 'pcibios_root_bridge_prepare()'
> > > > > > > for MIPS ralink? I guess this means to parse device tree
> > > > > > > and so on only to get memory range addresses to be added
> > > > > > > to the MIPS I/O coherence regions to make things work and
> > > > > > > then re-parse it again in the driver to do the proper PCI
> > > > > > > setup... We end up in an arch generic driver but at the
> > > > > > > end this controller is only present in ralink MIPS, so I
> > > > > > > am not sure that implementing
> > > > > > > 'pcibios_root_bridge_prepare()' is worthy here... I can
> > > > > > > explore and try to implement it if you think that it
> > > > > > > really makes sense... but, IMHO if this is the case, just
> > > > > > > making it bool looks like the correct thing to do.
> > > > > >
> > > > > > It should be trivial to put the contents of
> > > > > > setup_cm_memory_region() into a ralink function called
> > > > > > pcibios_root_bridge_prepare().
> > > > > >
> > > > > > pcibios_root_bridge_prepare() is called with the same
> > > > > > "struct pci_host_bridge *" argument as
> > > > > > setup_cm_memory_region(), and it's called slightly later, so
> > > > > > the window resources are already set up, so no DT parsing is
> > > > > > required.  It looks like a simple move and rename to me.
> > > > >
> > > > > I see. Thanks Bjorn. I will try the approach during the
> > > > > weekend and report if it works.
> > > >
> > > > I have tested the change from 'setup_cm_memory_region()' code
> > > > into 'pcibios_root_bridge_prepare()' just by moving and renaming
> > > > it from the PCIe controller code. The function is properly being
> > > > called.  However, it looks like at that point, windows are not
> > > > setup yet (no windows present at all in bridge->windows) so the
> > > > system is not able to get the IORESOURCE_MEM resource to set up
> > > > the IO coherency unit and the PCI failed to start:
> > > >
> > > > [   16.785359] mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> > > > [   16.798719] mt7621-pci 1e140000.pcie:   No bus range found for
> > > > /pcie@1e140000, using [bus 00-ff]
> > > > [   16.816248] mt7621-pci 1e140000.pcie:      MEM
> > > > 0x0060000000..0x006fffffff -> 0x0060000000
> > > > [   16.861310] mt7621-pci 1e140000.pcie:       IO
> > > > 0x001e160000..0x001e16ffff -> 0x0000000000
> > > > [   17.179230] mt7621-pci 1e140000.pcie: PCIE0 enabled
> > > > [   17.188954] mt7621-pci 1e140000.pcie: PCIE1 enabled
> > > > [   17.198678] mt7621-pci 1e140000.pcie: PCIE2 enabled
> > > > [   17.208415] Cannot get memory resource
> > > > [   17.215884] mt7621-pci 1e140000.pcie: Scanning root bridge failed
> > > > [   17.228454] mt7621-pci: probe of 1e140000.pcie failed with error -22
> > > >
> > > > FWIW, when the function is called, I have also tried to set up
> > > > hardcoded addresses. Doing that the IO coherency unit was
> > > > properly set up and PCI properly worked (expected). So, using
> > > > this 'pcibios_root_bridge_prepare()' funcion looks like a
> > > > possible way to go but we need the addresses properly being
> > > > passed into the function.  I've also tried to list
> > > > 'bridge->dma_ranges' and get resources from there instead of
> > > > using the not already setup 'bridge->windows'. There is nothing
> > > > inside that list also. 'bridge->bus->resources' is also empty...
> > > > Am I missing something? I was expecting the bridge passed around
> > > > to be the same that was in PCIe controller code, and it seems it
> > > > is (I printed the bridge pointer itself in driver code before
> > > > calling 'mt7621_pcie_register_host()' and in
> > > > 'pcibios_root_bridge_prepare()' at the begging of the function
> > > > and the pointer is the same) but windows and other stuff are not
> > > > already present there...
> > >
> > > Looking into [0] it looks like resources are temporarily removed
> > > from the list just before call 'pcibios_root_bridge_prepare()'.
> > > Hence the behaviour I am seeing when trying to get them...
> > >
> > > [0]:
> > > https://elixir.bootlin.com/linux/latest/source/drivers/pci/probe.c#L915
> >
> > Can you explain to me, why are resources temporarily removed from
> > the 'bridge->windows' list?
> >
> > Would moving that list split to be done after
> > 'pcibios_root_bridge_prepare()' is called a possibility?
>
> I don't know why the windows are managed that way.  That was added by
> 37d6a0a6f470 ("PCI: Add pci_register_host_bridge() interface").   I
> cc'd Arnd just in case he remembers, but that was a long time ago.

Thanks, 2016 is not so far to already remember why things were done :)).

>
> I don't see any use of bridge->windows in any of the
> pcibios_root_bridge_prepare() functions.  It doesn't *look* like it
> should be used until the coalesce/add code near the end.

I checked them also, and nobody uses 'bridge->windows' there but all the
information is already there from dt parsing process when the
'pci_register_host_bridge()'
is called and we are putting temporally in a 'resources' list to add
again all of them at the end.
All the calls before 'pcibios_root_bridge_prepare()' don't do anything
related with windows
either, that's why I asked to move the split after calling it since,
at a first glance, it does not
look harmful. Let's wait for Arnd explanation about why things are
being doing in this way
and if is this a possible way to proceed.

Best regards,
     Sergio Paracuellos

>
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 4289030b0fff..2132df91ad8b 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -891,8 +891,6 @@ static int pci_register_host_bridge(struct
> > pci_host_bridge *bridge)
> >
> >         bridge->bus = bus;
> >
> > -       /* Temporarily move resources off the list */
> > -       list_splice_init(&bridge->windows, &resources);
> >         bus->sysdata = bridge->sysdata;
> >         bus->msi = bridge->msi;
> >         bus->ops = bridge->ops;
> > @@ -916,6 +914,8 @@ static int pci_register_host_bridge(struct
> > pci_host_bridge *bridge)
> >         if (err)
> >                 goto free;
> >
> > +       /* Temporarily move resources off the list */
> > +       list_splice_init(&bridge->windows, &resources);
> >         err = device_add(&bridge->dev);
> >         if (err) {
> >                 put_device(&bridge->dev);
> >
> > Obviously doing this works and windows are passed into mips ralink
> > specific 'pcibios_root_bridge_prepare()' and the PCIe subsystem is
> > properly working.
> >
> > The advantages I see to this approach are that doing in this way lets us to:
> > - Remove specific mips code from the driver controller.
> > - Allow the driver to be compile tested for any architecture.
> >
> > And the changes would be the following patches:
> > 1) Small 'drivers/pci/probe.c' change.
> > 2) Move mips specific code into 'arch/mips/ralink/mt76721.c' (since
> > other mips ralink stuff haven't got IO coherency units) to be inside
> > 'pcibios_root_bridge_prepare()'.
> > 3) Add MODULE_LICENSE macro to the PCIe controller driver to avoid
> > complaints when the driver is compiled as a module .
> > 4) Update PCIe controller driver's Kconfig to avoid MIPS COMPILE_TEST
> > conditional and completely enable it for COMPILE_TEST.
> >
> > When you have time, please, let me know your thoughts about this.
> >
> > Thanks in advance for your time.
> >
> > Best regards,
> >     Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
