Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7083CF532EA
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8c4/lD6+gPBY+GoPrKo9K062nXeyLptOwQuAizNcRbI=; b=CmHnPIHjov53Cpk63FYzNJje9U
	finEhGo9TNEfYjPOJexw/Z/m6IQk97wRpVUfNHLZiY4BtaHctr3qn9T3HERhfXAeJTI3fJA0SH34p
	lbg5sJeCGFf91/WJc9kHkE+ZaJwkSM3bYT3+zoEnIU196M6rxDZGTMX7vMrpn1/B1n/m3o9B09HCB
	8YVvFWElcFAM6zo/dPXDxHjFOZdvlqV61Z5153K/oKxMIZ7oPbeJsa3rrAVZSajSBwvh0DK5HdMZK
	yBgBBSNLZs46xjuuh2VXEBJGpalzgok2Tn+ZaESnzFmyk3bJoLE1nMZ63cubwpKq2aXL4DCBeSgSg
	1srxd+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wR8-00000000uiq-0hXs;
	Tue, 24 Mar 2026 07:44:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wR5-00000000uiL-0Buz
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 07:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D2D744564;
	Tue, 24 Mar 2026 07:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAEDC19424;
	Tue, 24 Mar 2026 07:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774338262;
	bh=4NRIUmJ4xpw27AQzrCmHr/wAs/OANfKNRnMbLAUb0TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=au9bOSB+SLsZmMM6OVSr/QVh3IkzUGwUrSoTV7nxfWWkh74oIFv5svhfAppaJdaI9
	 n6nTvgYqooAOsIgCb7M4YievOQCyngrmIWqJipO5ZWo0f8Jzx05PagiTFWQ6bMdS8H
	 +FaM/4q00PMU4lf+Mq2cR3tc7hApfNrDn+kYsu634EcYsKQ5k+9gPewKkhx28n4v5I
	 BEiibJnTyViUf1rB5+nj7ZgV7ZRJnclkbkGZtRrVrP/Z/6af9Tmp34sZlt78TqCTm5
	 TOryM5+N7+TUMHXgSurdUd800aqmu2CHgwLw0aZjz7T/EhUo0irVBJxtunuCrQp5Rb
	 y1AK4kDt+KqoQ==
Date: Tue, 24 Mar 2026 13:14:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/7] PCI: mediatek-gen3: add power control support
Message-ID: <ojgwqrosft5x75y3yxdawrb72k4z3chc3m6uh4mkdv7dhta3ef@qcvotm36w3ly>
References: <20260324052002.4072430-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_004423_130664_CEAEF550 
X-CRM114-Status: GOOD (  26.46  )
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

On Tue, Mar 24, 2026 at 01:19:52PM +0800, Chen-Yu Tsai wrote:
> Hi folks,
> 
> This is v6 of my MediaTek PCIe gen3 controller driver power control
> support series. This series is based on next-20260323, with the
> commit a2b2ca0c2477 ("Merge branch 'pci/controller/mediatek-gen3'")
> reverted to drop the older version.
> 
> This series is ready to be merged. Please drop the older version and use
> this one instead.
> 
> Changes since v5:
> - Link to v5: https://lore.kernel.org/all/20260311075223.3303497-1-wenst@chromium.org/
> - Adapt to PCI_PWRCTRL_SLOT -> PCI_PWRCTRL_GENERIC Kconfig symbol name change
> 
> Changes since v4:
> - Link to v4: https://lore.kernel.org/all/20260310091947.2742004-1-wenst@chromium.org/
> - Patch 1
>   - Expanded tabs in commit message
> - Patch 5
>   - s/mtk_pcie_device_power_(up|down)/mtk_pcie_devices_power_(up|down)/
> - Patch 6
>   - Adapted to mtk_pcie_devices_power_down() name change
> - Patch 7
>   - Fixed label typo causing build break
>   - Replaced "exploded" with "populated" in commit message, and added
>     more explanation about what "populated onto the mainboard" means.
> 
> Changes since v3:
> - Link to v3: https://lore.kernel.org/all/20260302053109.1117091-1-wenst@chromium.org/
> - Added two patches to move kernel setup code before controller setup
>   code, and controller setup code before device setup code, as requested
>   by Bjorn
> - Dropped dts patches as they are already merged
> 
> I kept all the existing reviewed-by tags, since the changes to the
> existing patches aren't that big.
> 
> Changes since v2:
> - Link to v2: https://lore.kernel.org/all/20260226092234.3859740-1-wenst@chromium.org/
> - Made PCIE_MEDIATEK_GEN3 select PCI_PWRCTRL_SLOT, following existing
>   examples
> 
> I do wonder why the existing ones don't select PCI_PWRCTRL instead.
> As there are multiple providers, and now even the M.2 power sequencing
> driver, I think either we enable the common ones by default, or let
> the user pick and choose.
> 

I agree with you. I've sent a patch [1] to select these drivers in defconfig to
make the users life easier. But in the meantime, let's have this dependency
as-is, otherwise, until my defconfig patch lands, there is no guarantee that
these drivers will get selected by default.

I'll change these dependencies after v7.1-rc1.

- Mani

[1] https://lore.kernel.org/linux-arm-msm/20260324073931.23739-1-manivannan.sadhasivam@oss.qualcomm.com

> Changes since v1:
> - Link to v1: https://lore.kernel.org/all/20260224071258.2654521-1-wenst@chromium.org/
> - commit message for patch 3 was rewritten
> Jianjun Wang was dropped from the recipients as the email was
> bouncing.
> 
> This series adds power control support to the MediaTek PCIe gen3
> controller driver. This allows proper modeling of WiFi and NVMe
> adapters in the device tree and control over their power supplies.
> 
> Patch 1 through 6 are cleanups and minor improvements to the driver.
> 
> Patch 7 adds power control support using the new pwrctrl API to the
> PCIe controller driver.
> 
> 
> Thanks
> ChenYu
> 
> [1] https://lore.kernel.org/linux-pci/20260224-pci-m2-e-v5-0-dd9b9501d33c@oss.qualcomm.com/
> 
> Chen-Yu Tsai (7):
>   PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with
>     dev_err_probe()
>   PCI: mediatek-gen3: Move mtk_pcie_setup_irq() out of mtk_pcie_setup()
>   PCI: mediatek-gen3: Move controller setup steps before PERST# control
>   PCI: mediatek-gen3: Add error path for resume driver callbacks
>   PCI: mediatek-gen3: Split out device power helpers
>   PCI: mediatek-gen3: Disable device if further setup fails
>   PCI: mediatek-gen3: Integrate new pwrctrl API
> 
>  drivers/pci/controller/Kconfig              |   1 +
>  drivers/pci/controller/pcie-mediatek-gen3.c | 223 +++++++++++---------
>  2 files changed, 129 insertions(+), 95 deletions(-)
> 
> -- 
> 2.53.0.983.g0bb29b3bc5-goog
> 

-- 
மணிவண்ணன் சதாசிவம்

