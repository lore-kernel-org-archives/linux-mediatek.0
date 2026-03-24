Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C73E9A76E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 11:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bm9bZF0Z0sgikGsHGLZmadNIUTYjP6p3TK/06/VKkM=; b=Raclw5gm+iW/eHoxYG26FRRmVF
	hj9h0WSzKkl5JG1DEQHjJ9pWOhr0rzEuRvFk/5m2LHMD//qNwncmPx46jrn1zArH/yWZrF9uVTT7H
	n7woR5n8PtFAPw595PCaoFVRIfwmB6qyzf5L7WQItIXBac4xDl+ow5IaSdDVgbDPdUbxhhlP04aah
	BpdNkyvs7tKGeqXIYOf24/xetKBD7rYIfiEukJn1w8taa+vaZMvx68CChLDVmg+7WwnknuQ0JVtBg
	H+9JhXKCygS5Q9kcP75kCr1XL3ZJ8cdUyA+fkOjGZ1m5X1wsHTop11p7aADaSoc2yQXyDLrnNBsQG
	8WEcUvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zqa-00000001HKD-2rKf;
	Tue, 24 Mar 2026 11:22:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zqY-00000001HK6-47Fq
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 11:22:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FB596012B;
	Tue, 24 Mar 2026 11:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364CAC19424;
	Tue, 24 Mar 2026 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774351374;
	bh=lgyctI8mPXT5BmzcI4K3XyS8EA03Fib895/wcgnTScM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+umHwGjdtgUc1bvNI1Opk0K5EmJuRQoqE6hdzXSC9vHI+CbuE7IdCGH6U/oBl2bh
	 fGv2hX20rIha46ldXHQSayshS6/U2urP8EQqxxOG5MrB5psI4EufbEkzp8mPvoUg0E
	 P43MF3iJ45XZrPLvwzegLZzZNmUEVEX1pfzu3a75aRR9nsk0MKE2YsMwxFcHq1fC+T
	 NXy8URWY7I43KLsr0FzO/rD0rp0HT59kZjp/cvxNhEn8KDQNiC+20HvaCwftDnbJbd
	 FffSHxvUt76qv2Lr7/Pbq4RNxd8CAbmTobesiPcg71ctONu9zkeKs+idW2IOjHsFyl
	 89CSwNHLj1qag==
Date: Tue, 24 Mar 2026 16:52:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/7] PCI: mediatek-gen3: add power control support
Message-ID: <iaiiccyorgdhw2giejcl4dwigy2gqj4vdnw35kiekcuvwhaayo@j7m4ttrdli7j>
References: <20260324052002.4072430-1-wenst@chromium.org>
 <ojgwqrosft5x75y3yxdawrb72k4z3chc3m6uh4mkdv7dhta3ef@qcvotm36w3ly>
 <CAGXv+5E4V-zC8hfzZgXLL+Wbnw4jFfs0pvovU0xKeDmN17mwUw@mail.gmail.com>
 <jduc7ozg27bvrfxwpmswhxg4savnrkjcj5tqlluvmq5s6qiqnd@nrq6b36g25wq>
 <CAGXv+5ExO7h9VpXC=oV=bnb6k+vRA_OJH3tmPWVpxqs_hy=QJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5ExO7h9VpXC=oV=bnb6k+vRA_OJH3tmPWVpxqs_hy=QJg@mail.gmail.com>
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

On Tue, Mar 24, 2026 at 04:26:22PM +0800, Chen-Yu Tsai wrote:
> On Tue, Mar 24, 2026 at 4:01 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Tue, Mar 24, 2026 at 03:52:33PM +0800, Chen-Yu Tsai wrote:
> > > On Tue, Mar 24, 2026 at 3:44 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > >
> > > > On Tue, Mar 24, 2026 at 01:19:52PM +0800, Chen-Yu Tsai wrote:
> > > > > Hi folks,
> > > > >
> > > > > This is v6 of my MediaTek PCIe gen3 controller driver power control
> > > > > support series. This series is based on next-20260323, with the
> > > > > commit a2b2ca0c2477 ("Merge branch 'pci/controller/mediatek-gen3'")
> > > > > reverted to drop the older version.
> > > > >
> > > > > This series is ready to be merged. Please drop the older version and use
> > > > > this one instead.
> > > > >
> > > > > Changes since v5:
> > > > > - Link to v5: https://lore.kernel.org/all/20260311075223.3303497-1-wenst@chromium.org/
> > > > > - Adapt to PCI_PWRCTRL_SLOT -> PCI_PWRCTRL_GENERIC Kconfig symbol name change
> > > > >
> > > > > Changes since v4:
> > > > > - Link to v4: https://lore.kernel.org/all/20260310091947.2742004-1-wenst@chromium.org/
> > > > > - Patch 1
> > > > >   - Expanded tabs in commit message
> > > > > - Patch 5
> > > > >   - s/mtk_pcie_device_power_(up|down)/mtk_pcie_devices_power_(up|down)/
> > > > > - Patch 6
> > > > >   - Adapted to mtk_pcie_devices_power_down() name change
> > > > > - Patch 7
> > > > >   - Fixed label typo causing build break
> > > > >   - Replaced "exploded" with "populated" in commit message, and added
> > > > >     more explanation about what "populated onto the mainboard" means.
> > > > >
> > > > > Changes since v3:
> > > > > - Link to v3: https://lore.kernel.org/all/20260302053109.1117091-1-wenst@chromium.org/
> > > > > - Added two patches to move kernel setup code before controller setup
> > > > >   code, and controller setup code before device setup code, as requested
> > > > >   by Bjorn
> > > > > - Dropped dts patches as they are already merged
> > > > >
> > > > > I kept all the existing reviewed-by tags, since the changes to the
> > > > > existing patches aren't that big.
> > > > >
> > > > > Changes since v2:
> > > > > - Link to v2: https://lore.kernel.org/all/20260226092234.3859740-1-wenst@chromium.org/
> > > > > - Made PCIE_MEDIATEK_GEN3 select PCI_PWRCTRL_SLOT, following existing
> > > > >   examples
> > > > >
> > > > > I do wonder why the existing ones don't select PCI_PWRCTRL instead.
> > > > > As there are multiple providers, and now even the M.2 power sequencing
> > > > > driver, I think either we enable the common ones by default, or let
> > > > > the user pick and choose.
> > > > >
> > > >
> > > > I agree with you. I've sent a patch [1] to select these drivers in defconfig to
> > > > make the users life easier. But in the meantime, let's have this dependency
> > > > as-is, otherwise, until my defconfig patch lands, there is no guarantee that
> > > > these drivers will get selected by default.
> > >
> > > I would probably just make PCI_PWRCTRL_GENERIC default m or y.
> > >
> > > Or make CONFIG_PCI (and probably CONFIG_USB later on) imply
> > > CONFIG_POWER_SEQUENCING_PCIE_M2.
> > >
> >
> > The problem is, these drivers are mostly targeted for DT systems as of now. If
> > we select it by default for all archs, it will bloat the image size for other
> > archs that don't need these drivers. That's why I wanted to enable these in arch
> > defconfig.
> 
> How about
> 
>     imply CONFIG_POWER_SEQUENCING_PCIE_M2 if OF

I'm not sure if PCI Kconfig is the right place to put it. We don't select any
drivers using 'imply' as of now and OF conditional also means that this driver
could be selected for PowerPC archs which don't use this driver at all.

Same argument could be used for ARM defconfig as well as we have server based
ARM64 SoCs, but I don't have a better choice atm.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

