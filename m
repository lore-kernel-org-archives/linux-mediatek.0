Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758ECC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 08:18:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DC4461407
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 08:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DC4461407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sai/cHOAMVGsQUoKSCFygI7VvywBqll5Yc8OfnXePc=; b=BCNyhiL2dbXxZl
	YJpGppWT6GHMLeZTcw0Ob8cl9DCvyEyggQ/MXGWFXYtuWDx2/nujxPLqHLi0zhtYBMup5nrXW8viG
	TjhuXNYjxQp6kyI/d3XwLhXnrNNHAzF4N42G/tZcMiElI1iM0yGuP4aq1H9CNXqtP+UgSbndGeWxe
	E6G0DUdL6QogJYEgppcgSDINUZJRstXgCcUiPCV2ull3prw58Z88v29/xFB0q3iHXcQt+GZFqDlr9
	LfxLktVh9xtv8QuFOgBvc+DGf/9c2EX3Hdr5/UpEZ9fQdkS+QlXzBVAB+j24nnw6J/Bip4mIAFgkj
	LZFwLp5ZnBn8FVOC0Cjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmXBa-00Ef0W-3j; Mon, 15 Nov 2021 08:17:54 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmXBL-00Eez8-MJ; Mon, 15 Nov 2021 08:17:41 +0000
Received: by mail-ua1-x92a.google.com with SMTP id v3so33012984uam.10;
 Mon, 15 Nov 2021 00:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=By5p3l+jvofWAWLaVcfc5GGtkfLeIUKs4HOwKe1fAbQ=;
 b=o+MwRDcIniziU8P5DIs8Mw1EpQFSmOrSRj2SdSxBx5nQIGrDhxE1WpelTOIpA4NJss
 ScK3MoCOrKp8mCmC/njdlOqnsYHZ7fpWf22jksyERImZrD2j82UQnZ8tH/FW30fT9bEw
 pQj5TaLwbrlSUsc6l7PI9btf6SS8tiMnPGPQGzV4FTJ+TaW8WWr8OAZnM9pSxVuHxRZS
 6LNJ5UCzjtcUvxWAQ0PsM+CoZWgQN69C9LjLv+E0U+EYcQqusXZqEBpabYlUFXFJsuc7
 2SfZ/K96GYc1R8nrGXiC3atiCSlvpUtfk+3/AHDexrAzOpPrjS3Ts7kM5zIq9p3elSxG
 yTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=By5p3l+jvofWAWLaVcfc5GGtkfLeIUKs4HOwKe1fAbQ=;
 b=O+j2Z73d8Pv8CvBz55GghTwIdGH7FyiZ0oHaE+jZhK/U4/qNYpEZ7nfUc14xplhoG3
 wmpe6x/orC6gDdBaGSqkmCRslNiDpwbWmUO2sUEfpT7t7pnvlufd5MuMmR5p3ZGV24y7
 QjE7LCerWf99bHrnKN4qAfMmNEBo9Xi/4Kw0TUi22VNz7aN4nUueQb2uVpjZIZgKzvSj
 UAiwKB3Z0fdKA3lvYx88lFlN1R/zStW2OlN5Hfl8FscJKutIwreJA1yHXAmIsJrkfkN6
 JD4QmEpSWivUddXf4Z53NidJGfbfEim/SyoajK8k1TEaw5R2LC8CRrnjNUQj2dlDuXID
 LDaA==
X-Gm-Message-State: AOAM532YSLwGoUMGCifT8V22EYr8RMbBzq2c8jrc20L7UXJPMoQGxQy7
 D7YOwv4AEUpQnlrJ1ox6AzKKPjAgyxKUQpdrWf0=
X-Google-Smtp-Source: ABdhPJwFUsFJGu/gCVF5SWWbPfhqhjOI0GwyDbuiYTOf/NdNTyxvnsUkr/Up3XP+GRhPN+hr/fRC9qHFdnrMwANqQZE=
X-Received: by 2002:ab0:39cf:: with SMTP id g15mr57149296uaw.0.1636964257513; 
 Mon, 15 Nov 2021 00:17:37 -0800 (PST)
MIME-Version: 1.0
References: <CAMhs-H8ShoaYiFOOzJaGC68nZz=V365RXN_Kjuj=fPFENGJiiw@mail.gmail.com>
 <20211109224138.GA1180875@bhelgaas>
 <CAMhs-H9zpjg64Y-VAdM16FXwwzObB1+npDcGXD484hXzyEPtdg@mail.gmail.com>
In-Reply-To: <CAMhs-H9zpjg64Y-VAdM16FXwwzObB1+npDcGXD484hXzyEPtdg@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 15 Nov 2021 09:17:26 +0100
Message-ID: <CAMhs-H8C5i5RFiMw49ukmNaAeDQzzBd3SK+4TGi9z39_81TrOA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211115_001739_795252_2048B543 
X-CRM114-Status: GOOD (  77.42  )
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

On Wed, Nov 10, 2021 at 7:00 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Tue, Nov 9, 2021 at 11:41 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > [+cc Arnd]
> >
> > On Sun, Nov 07, 2021 at 08:00:56AM +0100, Sergio Paracuellos wrote:
> > > On Sat, Oct 30, 2021 at 7:38 AM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > > On Sat, Oct 30, 2021 at 7:21 AM Sergio Paracuellos
> > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > On Fri, Oct 29, 2021 at 10:27 PM Sergio Paracuellos
> > > > > <sergio.paracuellos@gmail.com> wrote:
> > > > > > On Fri, Oct 29, 2021 at 9:47 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > > > On Fri, Oct 29, 2021 at 09:37:53PM +0200, Sergio Paracuellos wrote:
> > > > > > > > On Fri, Oct 29, 2021 at 8:49 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > > > > > > > > One way might be to implement a
> > > > > > > > > pcibios_root_bridge_prepare() for mips and put the
> > > > > > > > > setup_cm_memory_region() stuff in there.  It's not
> > > > > > > > > *ideal* because that's a strong/weak function
> > > > > > > > > arrangement that doesn't allow for multiple host
> > > > > > > > > bridges, but that's probably not an issue here.
> > > > > > > > >
> > > > > > > > > If we can't do that, I think making it bool is probably
> > > > > > > > > the right answer, but it would be worth a brief comment
> > > > > > > > > in the commit log to explain the issue.
> > > > > > > >
> > > > > > > > Do you mean to implement 'pcibios_root_bridge_prepare()'
> > > > > > > > for MIPS ralink? I guess this means to parse device tree
> > > > > > > > and so on only to get memory range addresses to be added
> > > > > > > > to the MIPS I/O coherence regions to make things work and
> > > > > > > > then re-parse it again in the driver to do the proper PCI
> > > > > > > > setup... We end up in an arch generic driver but at the
> > > > > > > > end this controller is only present in ralink MIPS, so I
> > > > > > > > am not sure that implementing
> > > > > > > > 'pcibios_root_bridge_prepare()' is worthy here... I can
> > > > > > > > explore and try to implement it if you think that it
> > > > > > > > really makes sense... but, IMHO if this is the case, just
> > > > > > > > making it bool looks like the correct thing to do.
> > > > > > >
> > > > > > > It should be trivial to put the contents of
> > > > > > > setup_cm_memory_region() into a ralink function called
> > > > > > > pcibios_root_bridge_prepare().
> > > > > > >
> > > > > > > pcibios_root_bridge_prepare() is called with the same
> > > > > > > "struct pci_host_bridge *" argument as
> > > > > > > setup_cm_memory_region(), and it's called slightly later, so
> > > > > > > the window resources are already set up, so no DT parsing is
> > > > > > > required.  It looks like a simple move and rename to me.
> > > > > >
> > > > > > I see. Thanks Bjorn. I will try the approach during the
> > > > > > weekend and report if it works.
> > > > >
> > > > > I have tested the change from 'setup_cm_memory_region()' code
> > > > > into 'pcibios_root_bridge_prepare()' just by moving and renaming
> > > > > it from the PCIe controller code. The function is properly being
> > > > > called.  However, it looks like at that point, windows are not
> > > > > setup yet (no windows present at all in bridge->windows) so the
> > > > > system is not able to get the IORESOURCE_MEM resource to set up
> > > > > the IO coherency unit and the PCI failed to start:
> > > > >
> > > > > [   16.785359] mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> > > > > [   16.798719] mt7621-pci 1e140000.pcie:   No bus range found for
> > > > > /pcie@1e140000, using [bus 00-ff]
> > > > > [   16.816248] mt7621-pci 1e140000.pcie:      MEM
> > > > > 0x0060000000..0x006fffffff -> 0x0060000000
> > > > > [   16.861310] mt7621-pci 1e140000.pcie:       IO
> > > > > 0x001e160000..0x001e16ffff -> 0x0000000000
> > > > > [   17.179230] mt7621-pci 1e140000.pcie: PCIE0 enabled
> > > > > [   17.188954] mt7621-pci 1e140000.pcie: PCIE1 enabled
> > > > > [   17.198678] mt7621-pci 1e140000.pcie: PCIE2 enabled
> > > > > [   17.208415] Cannot get memory resource
> > > > > [   17.215884] mt7621-pci 1e140000.pcie: Scanning root bridge failed
> > > > > [   17.228454] mt7621-pci: probe of 1e140000.pcie failed with error -22
> > > > >
> > > > > FWIW, when the function is called, I have also tried to set up
> > > > > hardcoded addresses. Doing that the IO coherency unit was
> > > > > properly set up and PCI properly worked (expected). So, using
> > > > > this 'pcibios_root_bridge_prepare()' funcion looks like a
> > > > > possible way to go but we need the addresses properly being
> > > > > passed into the function.  I've also tried to list
> > > > > 'bridge->dma_ranges' and get resources from there instead of
> > > > > using the not already setup 'bridge->windows'. There is nothing
> > > > > inside that list also. 'bridge->bus->resources' is also empty...
> > > > > Am I missing something? I was expecting the bridge passed around
> > > > > to be the same that was in PCIe controller code, and it seems it
> > > > > is (I printed the bridge pointer itself in driver code before
> > > > > calling 'mt7621_pcie_register_host()' and in
> > > > > 'pcibios_root_bridge_prepare()' at the begging of the function
> > > > > and the pointer is the same) but windows and other stuff are not
> > > > > already present there...
> > > >
> > > > Looking into [0] it looks like resources are temporarily removed
> > > > from the list just before call 'pcibios_root_bridge_prepare()'.
> > > > Hence the behaviour I am seeing when trying to get them...
> > > >
> > > > [0]:
> > > > https://elixir.bootlin.com/linux/latest/source/drivers/pci/probe.c#L915
> > >
> > > Can you explain to me, why are resources temporarily removed from
> > > the 'bridge->windows' list?
> > >
> > > Would moving that list split to be done after
> > > 'pcibios_root_bridge_prepare()' is called a possibility?
> >
> > I don't know why the windows are managed that way.  That was added by
> > 37d6a0a6f470 ("PCI: Add pci_register_host_bridge() interface").   I
> > cc'd Arnd just in case he remembers, but that was a long time ago.
>
> Thanks, 2016 is not so far to already remember why things were done :)).
>
> >
> > I don't see any use of bridge->windows in any of the
> > pcibios_root_bridge_prepare() functions.  It doesn't *look* like it
> > should be used until the coalesce/add code near the end.
>
> I checked them also, and nobody uses 'bridge->windows' there but all the
> information is already there from dt parsing process when the
> 'pci_register_host_bridge()'
> is called and we are putting temporally in a 'resources' list to add
> again all of them at the end.
> All the calls before 'pcibios_root_bridge_prepare()' don't do anything
> related with windows
> either, that's why I asked to move the split after calling it since,
> at a first glance, it does not
> look harmful. Let's wait for Arnd explanation about why things are
> being doing in this way
> and if is this a possible way to proceed.
>
> Best regards,
>      Sergio Paracuellos
>
> >
> > > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > > index 4289030b0fff..2132df91ad8b 100644
> > > --- a/drivers/pci/probe.c
> > > +++ b/drivers/pci/probe.c
> > > @@ -891,8 +891,6 @@ static int pci_register_host_bridge(struct
> > > pci_host_bridge *bridge)
> > >
> > >         bridge->bus = bus;
> > >
> > > -       /* Temporarily move resources off the list */
> > > -       list_splice_init(&bridge->windows, &resources);
> > >         bus->sysdata = bridge->sysdata;
> > >         bus->msi = bridge->msi;
> > >         bus->ops = bridge->ops;
> > > @@ -916,6 +914,8 @@ static int pci_register_host_bridge(struct
> > > pci_host_bridge *bridge)
> > >         if (err)
> > >                 goto free;
> > >
> > > +       /* Temporarily move resources off the list */
> > > +       list_splice_init(&bridge->windows, &resources);
> > >         err = device_add(&bridge->dev);
> > >         if (err) {
> > >                 put_device(&bridge->dev);
> > >
> > > Obviously doing this works and windows are passed into mips ralink
> > > specific 'pcibios_root_bridge_prepare()' and the PCIe subsystem is
> > > properly working.
> > >
> > > The advantages I see to this approach are that doing in this way lets us to:
> > > - Remove specific mips code from the driver controller.
> > > - Allow the driver to be compile tested for any architecture.
> > >
> > > And the changes would be the following patches:
> > > 1) Small 'drivers/pci/probe.c' change.
> > > 2) Move mips specific code into 'arch/mips/ralink/mt76721.c' (since
> > > other mips ralink stuff haven't got IO coherency units) to be inside
> > > 'pcibios_root_bridge_prepare()'.
> > > 3) Add MODULE_LICENSE macro to the PCIe controller driver to avoid
> > > complaints when the driver is compiled as a module .
> > > 4) Update PCIe controller driver's Kconfig to avoid MIPS COMPILE_TEST
> > > conditional and completely enable it for COMPILE_TEST.

I have sent this just to a clear image of a possible way to go:

https://lkml.org/lkml/2021/11/15/48

Thanks,
    Sergio Paracuellos

> > >
> > > When you have time, please, let me know your thoughts about this.
> > >
> > > Thanks in advance for your time.
> > >
> > > Best regards,
> > >     Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
