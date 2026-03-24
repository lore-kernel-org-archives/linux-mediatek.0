Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298C9F532E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 08:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hinreoOkUaVxJz3+vMyEbLqNkx6kSL9leKXYWOGDBqU=; b=TP2T57ho5/tlYTnVsEThI8inLB
	jkVYt8hi5wTlamGGKQ75R6T2/SMDH7bY28JplxZ96K+kYEqxHfUxBakUDennotR1pX4DA5WEPPObN
	GQaSHVwxZMC4kiN1/4p04TUu+RFwKZYndpE0xKgi5232bd0M9Hxny6e14SxhmG/0qRmcMdlL2Y9dZ
	8o9Pyvvjk23LgVyq2e/ttuFjQCvwWnA4bUJcVs5pw08qEuVWfCYm/uQqKgKYNQrlipZzkChU2DL3Q
	2Uj+LMyRoJMAyCUw0ItJJe3r11gOIYYLk7n0EcKlMRlt1rzacyq+0s2FseJiZoejSOL8EDqx0R6rE
	iXlGX0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wht-00000000wdI-2fqP;
	Tue, 24 Mar 2026 08:01:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4whq-00000000wc2-3WhM
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 08:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EA82400F8;
	Tue, 24 Mar 2026 08:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E7AC2BC9E;
	Tue, 24 Mar 2026 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774339302;
	bh=+5PFd+6nhI6w7qM52rYZjXdeN2EQJ2cOII3jCQe3W4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CA5NLdDPbCj40+wPCsMAD0aaLHva7r8mrYoxDoy9Dk1Kfd7N9n8cj8MccTpiRtCeu
	 OfqV390pSIszS9uCYly4SO9kDamgu9goHwIoT9HRLbSklTE/UsPponnmbtvNvAW9Mh
	 2EE/69AEkazoRQsPdnER025WIv+Q8O1WjnKdo2WoTe2abHXu558LpNeNXCslRSXzoi
	 wfISq/jlMZsu5S8J2HmlnPEDmzT296tlmm5UD90x+5ZqbwvRXwOYqOQSdYXugZXJgf
	 fuWVhXugm++o2t+DDrPLAXX6Oc6gJwCGOZvSbj2ufnHdpMILe/Y33rtzTvZL93LdgO
	 GodnvdvSo49Cg==
Date: Tue, 24 Mar 2026 13:31:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/7] PCI: mediatek-gen3: add power control support
Message-ID: <jduc7ozg27bvrfxwpmswhxg4savnrkjcj5tqlluvmq5s6qiqnd@nrq6b36g25wq>
References: <20260324052002.4072430-1-wenst@chromium.org>
 <ojgwqrosft5x75y3yxdawrb72k4z3chc3m6uh4mkdv7dhta3ef@qcvotm36w3ly>
 <CAGXv+5E4V-zC8hfzZgXLL+Wbnw4jFfs0pvovU0xKeDmN17mwUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5E4V-zC8hfzZgXLL+Wbnw4jFfs0pvovU0xKeDmN17mwUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010142_926337_CF2DBCBF 
X-CRM114-Status: GOOD (  27.91  )
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

On Tue, Mar 24, 2026 at 03:52:33PM +0800, Chen-Yu Tsai wrote:
> On Tue, Mar 24, 2026 at 3:44 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Tue, Mar 24, 2026 at 01:19:52PM +0800, Chen-Yu Tsai wrote:
> > > Hi folks,
> > >
> > > This is v6 of my MediaTek PCIe gen3 controller driver power control
> > > support series. This series is based on next-20260323, with the
> > > commit a2b2ca0c2477 ("Merge branch 'pci/controller/mediatek-gen3'")
> > > reverted to drop the older version.
> > >
> > > This series is ready to be merged. Please drop the older version and use
> > > this one instead.
> > >
> > > Changes since v5:
> > > - Link to v5: https://lore.kernel.org/all/20260311075223.3303497-1-wenst@chromium.org/
> > > - Adapt to PCI_PWRCTRL_SLOT -> PCI_PWRCTRL_GENERIC Kconfig symbol name change
> > >
> > > Changes since v4:
> > > - Link to v4: https://lore.kernel.org/all/20260310091947.2742004-1-wenst@chromium.org/
> > > - Patch 1
> > >   - Expanded tabs in commit message
> > > - Patch 5
> > >   - s/mtk_pcie_device_power_(up|down)/mtk_pcie_devices_power_(up|down)/
> > > - Patch 6
> > >   - Adapted to mtk_pcie_devices_power_down() name change
> > > - Patch 7
> > >   - Fixed label typo causing build break
> > >   - Replaced "exploded" with "populated" in commit message, and added
> > >     more explanation about what "populated onto the mainboard" means.
> > >
> > > Changes since v3:
> > > - Link to v3: https://lore.kernel.org/all/20260302053109.1117091-1-wenst@chromium.org/
> > > - Added two patches to move kernel setup code before controller setup
> > >   code, and controller setup code before device setup code, as requested
> > >   by Bjorn
> > > - Dropped dts patches as they are already merged
> > >
> > > I kept all the existing reviewed-by tags, since the changes to the
> > > existing patches aren't that big.
> > >
> > > Changes since v2:
> > > - Link to v2: https://lore.kernel.org/all/20260226092234.3859740-1-wenst@chromium.org/
> > > - Made PCIE_MEDIATEK_GEN3 select PCI_PWRCTRL_SLOT, following existing
> > >   examples
> > >
> > > I do wonder why the existing ones don't select PCI_PWRCTRL instead.
> > > As there are multiple providers, and now even the M.2 power sequencing
> > > driver, I think either we enable the common ones by default, or let
> > > the user pick and choose.
> > >
> >
> > I agree with you. I've sent a patch [1] to select these drivers in defconfig to
> > make the users life easier. But in the meantime, let's have this dependency
> > as-is, otherwise, until my defconfig patch lands, there is no guarantee that
> > these drivers will get selected by default.
> 
> I would probably just make PCI_PWRCTRL_GENERIC default m or y.
> 
> Or make CONFIG_PCI (and probably CONFIG_USB later on) imply
> CONFIG_POWER_SEQUENCING_PCIE_M2.
> 

The problem is, these drivers are mostly targeted for DT systems as of now. If
we select it by default for all archs, it will bloat the image size for other
archs that don't need these drivers. That's why I wanted to enable these in arch
defconfig.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

