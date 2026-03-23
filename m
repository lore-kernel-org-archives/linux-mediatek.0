Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A73EF483E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=H8QT6aEh1CMlnE5HhaZT9Onj3MgjLGGR5r0rlEhvm+g=; b=vJzw9v/u4lwuW+68gPsXV9STxs
	GG0vdmYxrajlNNZkJlNhgqMuGyjN5EvS5eNKOE9eiYzGtH03SCzQj9qhEWw0Hc2wa9m+mD6DFRWMx
	MbbNOsdbq+PxrhwosMP+cRokqOZ9e5yjPPYP2/2g2vRgXEk0B7TNZeHTVpL+9H8QPqJgzHW89kPnu
	bYL6V8dqqz2sEGCgPbyTRa/VwzsBoUJuM6e2yAun4Hz6FnVvqbcjN6932ciV60hw1grqtXTCLEb8u
	t7+mKybetLRaSlZJnhqr0YFJSRazta3TxzLjSdQWIuZxdLCi+difYRjLXXJIQbjQxQDT0PdDJAsig
	aXWmlP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kde-0000000HQIZ-0DPz;
	Mon, 23 Mar 2026 19:08:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kdc-0000000HQID-42Kc
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 19:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13ED360120;
	Mon, 23 Mar 2026 19:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64655C4CEF7;
	Mon, 23 Mar 2026 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774292911;
	bh=fND1i7XSRwnwhGWZNoGm4912eAP+A3jaUuMXaH7yais=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=hjHGSjH/Df10AQ25qwMPHhoyEddqmLCmbp4E4vSpccSPngmG8wk7aQxJAnhGeCpLl
	 fMkhlDlE+isU7No5v8/2rA131VikVJzx7sx/yZ8lubQj5AKwvKKJzQT/UdKcBo3ye3
	 6/eWOqrqz9l4ggc1/StbVso5NYr9G7TM+oVQcqePRQ5zyxumthpeNk0Z9VlA6gjD4Q
	 ortLHJBJ0znwLCqHs0UzAN21JQvPN5b91E0MMekW4DX/hnVKJfYWl74Ol0fIlGnx2I
	 fRlBfJt1tM5dwhu4ewEblXXmB68bamns6P87rCTAjJi1JY8xV6XNVYkG2gKm3BuCIO
	 aHkmEEz4NcABQ==
Date: Mon, 23 Mar 2026 14:08:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Message-ID: <20260323190829.GA887140@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HQY9nTCacUbNZL1XggiHqomhgiQH_gdFtXLra+_ut4fQ@mail.gmail.com>
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

On Fri, Mar 20, 2026 at 02:10:03PM +0800, Chen-Yu Tsai wrote:
> On Tue, Mar 10, 2026 at 12:49 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Tue, Mar 10, 2026 at 5:50 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Mon, Mar 09, 2026 at 01:24:34PM +0800, Chen-Yu Tsai wrote:
> > > > On Sat, Mar 7, 2026 at 4:59 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > On Mon, Mar 02, 2026 at 01:31:05PM +0800, Chen-Yu Tsai wrote:
> > > > > > With the new PCI pwrctrl API and PCI slot binding and power drivers, we
> > > > > > now have a way to describe and power up WiFi/BT adapters connected
> > > > > > through a PCIe or M.2 slot, or exploded onto the mainboard itself.
> > > > ...
> > >
> > > > > So now we have:
> > > > >
> > > > >   mtk_pcie_probe
> > > > >     mtk_pcie_setup
> > > > >       mtk_pcie_startup_port
> > > > >         mtk_pcie_device_power_up      <-- power up
> > > > >         mtk_pcie_device_power_down    # error path
> > > > >       mtk_pcie_setup_irq              # set up controller IRQ
> > > > >       mtk_pcie_device_power_down      # if mtk_pcie_setup_irq() failed
> > > > >     pci_host_probe                    # enumerate downstream devices
> > > > >     mtk_pcie_device_power_down        # if pci_host_probe() failed
> > > > >
> > > > > I think this is kind of a mess because mtk_pcie_device_power_down() is
> > > > > called from so many places, and some of them aren't connected to the
> > > > > mtk_pcie_device_power_up().
> > > > >
> > > > > In mtk_pcie_setup(), mtk_pcie_setup_irq() only deals with the
> > > > > *controller* IRQ and has nothing to do with the downstream devices.  I
> > > > > think mtk_pcie_setup_irq() should be done before
> > > > > mtk_pcie_startup_port() so we can abort before even powering up those
> > > > > devices.
> > > >
> > > > Makes sense to me. I think it can even be moved outside of mtk_pcie_setup()?
> > > > That way we don't have mtk_pcie_irq_teardown() in two error paths?
> > > >
> > > > I can send a follow up patch for that.
> > >
> > > What if we do those cleanups first?  That would make this patch quite
> > > a bit simpler and we wouldn't have to undo things.  It would be a
> > > shame to have a complicated patch to add this stuff, then another
> > > complicated patch to clean it up.
> >
> > Sure.
> >
> > > > > In mtk_pcie_startup_port(), mtk_pcie_enable_msi() and the PCIe
> > > > > translation window setup also don't have anything to do with the
> > > > > downstream devices, so I think they should be done before
> > > > > calling mtk_pcie_device_power_up().  The only thing there that needs
> > > > > the downstream devices powered up is waiting for the link to come up.
> > > >
> > > > My guess is that if the link up fails, then mtk_pcie_startup_port() is
> > > > going to error out anyway, so it maybe made sense to make sure a device
> > > > is actually present before doing any more work.
> > >
> > > Doesn't sound very convincing to me.  mtk_pcie_set_trans_table() and
> > > the window setup are local things with no timeouts or anything.  I
> > > think the logical structure is way more important than some kind of
> > > hand-crafted work avoidance.
> >
> > I understand. I merely meant that I have no actual knowledge of why it
> > happened, or if there are any concerns from the hardware side.
> >
> > > Separating the PCIe controller setup from things related to the link
> > > and downstream devices is pretty high on my list.
> >
> > Makes sense to me.
> >
> > I'll send an updated version.
> 
> I'm confused. I see this version in -next with the minor fixups from
> Bjorn. Do you want me to do the cleanups on top of them?

I had intended to defer merging pci/controller/mediatek-gen3 to
pci/next and wait for your updated version.  But I see that I forgot
about that and included the original version.  I rebuilt pci/next
without pci/controller/mediatek-gen3.

Bjorn

