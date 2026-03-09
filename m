Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959F1FCA195
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZntSHXqEo3ImxNaMQiKGSIFbusn63yMLDARVeTc62Ro=; b=A8lpAQ3nHqLHOESbNepNhDgNlL
	fFOzJeBxqc9Qr/S4tmighAFId6yLUt+s4H7RuabRbwViwvt5/w1KMc/eF6UQembJ61LTnHTrP3Pnu
	tK1nQwyWKPB2sV/dD7PdZdcsTzQAzdsqEw/j+z1ylQrWYZBQZEzgxCQ8wR4Jf638CegZLazrP6cjT
	Yo9S5jiDzKHu9YZulamqSrqoBTlm/FKf59fRxl4Brrd09gn/sEcRCrbxaOO3/gtj+xDo6YoXc5mH0
	eFP9ytAoppbvMY0JsNv5kh2zxsaZzKax3sDYeDGYI5ORi1HVe+/KtZxTrQlvAsYbfy71ZK78HEAnl
	HCNEsnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vziVB-00000008CCr-0Ez5;
	Mon, 09 Mar 2026 21:51:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vziV9-00000008CCk-2WBO
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 21:50:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2D80600B0;
	Mon,  9 Mar 2026 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5B1C4CEF7;
	Mon,  9 Mar 2026 21:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773093058;
	bh=0rHU4vVj5DDN/y+/1giPCET0LnAzh1NaHD6e8qPrZF8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Di/baXmPPmn9o5zJbG+i9e25kyn30G17bL9443J73Kz+v0d8NxBGDc3oCZ8sV4Hny
	 D9ITb6dvSmFe9BPbHLACOYV6uMFVH8yYfmrp9kqEEIWhIKZsM97emJdjh92aopZCyc
	 WImntTK9htQXu/d/xYkv9hcKr/uxARPuoRruK8VglYx60Kdf3l+ou9TmxqhvvdpEOG
	 DUoeFilZCg1wElf2OOe9Oc+QTxWZjT9xXPZlD0FnTH1lEjgW9x7mjeBrYz7wRsker8
	 SzYbZuUXdiuYaay3m8U3ENxME82NgcoTbhPquL4sEztt8mpZpJ6eigeBicumSkzzIv
	 55rYQoGM4eofA==
Date: Mon, 9 Mar 2026 16:50:56 -0500
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
Message-ID: <20260309215056.GA603013@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FhSO=+AUaeDSXgM9Je9uTVYq-EW43z9PAuvVKumK6oMg@mail.gmail.com>
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

On Mon, Mar 09, 2026 at 01:24:34PM +0800, Chen-Yu Tsai wrote:
> On Sat, Mar 7, 2026 at 4:59 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Mon, Mar 02, 2026 at 01:31:05PM +0800, Chen-Yu Tsai wrote:
> > > With the new PCI pwrctrl API and PCI slot binding and power drivers, we
> > > now have a way to describe and power up WiFi/BT adapters connected
> > > through a PCIe or M.2 slot, or exploded onto the mainboard itself.
> ...

> > So now we have:
> >
> >   mtk_pcie_probe
> >     mtk_pcie_setup
> >       mtk_pcie_startup_port
> >         mtk_pcie_device_power_up      <-- power up
> >         mtk_pcie_device_power_down    # error path
> >       mtk_pcie_setup_irq              # set up controller IRQ
> >       mtk_pcie_device_power_down      # if mtk_pcie_setup_irq() failed
> >     pci_host_probe                    # enumerate downstream devices
> >     mtk_pcie_device_power_down        # if pci_host_probe() failed
> >
> > I think this is kind of a mess because mtk_pcie_device_power_down() is
> > called from so many places, and some of them aren't connected to the
> > mtk_pcie_device_power_up().
> >
> > In mtk_pcie_setup(), mtk_pcie_setup_irq() only deals with the
> > *controller* IRQ and has nothing to do with the downstream devices.  I
> > think mtk_pcie_setup_irq() should be done before
> > mtk_pcie_startup_port() so we can abort before even powering up those
> > devices.
> 
> Makes sense to me. I think it can even be moved outside of mtk_pcie_setup()?
> That way we don't have mtk_pcie_irq_teardown() in two error paths?
> 
> I can send a follow up patch for that.

What if we do those cleanups first?  That would make this patch quite
a bit simpler and we wouldn't have to undo things.  It would be a
shame to have a complicated patch to add this stuff, then another
complicated patch to clean it up.

> > In mtk_pcie_startup_port(), mtk_pcie_enable_msi() and the PCIe
> > translation window setup also don't have anything to do with the
> > downstream devices, so I think they should be done before
> > calling mtk_pcie_device_power_up().  The only thing there that needs
> > the downstream devices powered up is waiting for the link to come up.
> 
> My guess is that if the link up fails, then mtk_pcie_startup_port() is
> going to error out anyway, so it maybe made sense to make sure a device
> is actually present before doing any more work.

Doesn't sound very convincing to me.  mtk_pcie_set_trans_table() and
the window setup are local things with no timeouts or anything.  I
think the logical structure is way more important than some kind of
hand-crafted work avoidance.

Separating the PCIe controller setup from things related to the link
and downstream devices is pretty high on my list.

Bjorn

