Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5848DE9A769
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfBH7H3A0gxe/2nGukWco3RTvUz1vD+MNOxeGFOpO3Q=; b=InF/OrCnVDZ7tTu6KYdarfkk3j
	vldSEVWMqz9bUIzSNUP4NWqiHaOglEP8RmfG51nVBplIQyU22eF+5Gn1aIUHFdyejT7bCh1ysnzgz
	qu7kSSYjNq3opl21cALpyPGu90qbJFjSkinMCMMNFGt8OMDXipVInKssPfbx7BVMUcW18SV+uTq/Q
	AaMg/jlodh3o4qJAra/Yhypse209ZKiho3UOkZ39+TwjOhgdChKbeIr+X+3YU0kbPOqDao/pUzK1q
	Qa79157PMoBKt1DZIVqoFgiEUPaENk+7RVbWnlVIxUGnsqocklfWzdmwMLDT09rPcIiEjj3f4L2CK
	hrS0jbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zQ9-00000001F2N-22rq;
	Tue, 24 Mar 2026 10:55:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zQ7-00000001F1b-2JqD
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 10:55:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6861844356;
	Tue, 24 Mar 2026 10:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BECEC19424;
	Tue, 24 Mar 2026 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774349734;
	bh=vRpOiSyC6phYOwno04oAnBLQc2n2HqMG6w4tao+mkU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHTC0A7B3O4knEDL+NkN7G1ZdxqUmEOFjjYS6EXLAq3i34tKErZxvazrG/pLMvXzO
	 URnDWB2hXDWZxht01dpYtsfR7bYZZQP/P0P1TqkD+5bPyOe72xskKs9gKPTu8IuDPQ
	 EXxkM3fwLycuur/i9KZL4OPCR36eoJ/DEZBrgITbeEwCPydgQvgOeXwwSCGg5wwZlE
	 iAD0nolZ4nfIoGaWtdiUoV3IPfwGrDZh9mrizwlc64BFLqfyauSpoXLlRTX7fYaalx
	 5Ex1MK/LgJDI/CgnscTM5eU3X8yPlBEQLBhEt5YlHsscM5vL7KSY8BEv1Eb/btRfWs
	 bPbhFvCBYM5DQ==
Date: Tue, 24 Mar 2026 16:25:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/7] PCI: mediatek-gen3: Split out device power helpers
Message-ID: <v544j33upuqwadnxvunnhpac7cctyffaclk3jadgpyvb2yuvrf@ci45anamvgjf>
References: <20260324052002.4072430-1-wenst@chromium.org>
 <20260324052002.4072430-6-wenst@chromium.org>
 <CAGXv+5Gg90cDAV5ntBet9QTnyxrpzoMSNTvJJs0da2C32AFE1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Gg90cDAV5ntBet9QTnyxrpzoMSNTvJJs0da2C32AFE1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_035535_617070_F55B9A2E 
X-CRM114-Status: GOOD (  19.14  )
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

On Tue, Mar 24, 2026 at 04:55:47PM +0800, Chen-Yu Tsai wrote:
> On Tue, Mar 24, 2026 at 1:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > In preparation for adding full power on/off control with the pwrctrl
> > API, split out the existing code that only partially deals with device
> > power sequencing into separate helper functions. The existing code only
> > handles PERST#.
> >
> > This is purely moving code around, and brings no functional changes.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 87 ++++++++++++---------
> >  1 file changed, 52 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index 22a16e4ebc76..526db8815401 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -403,6 +403,54 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie *pcie)
> >         writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
> >  }
> >
> > +static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
> > +{
> > +       int err;
> 
> Sashiko pointed out that this addition would cause an unused variable
> warning. This line should be added in the last patch instead.
> 
> Do you want me to respin? Or is it fine since the end result is the same?
> 

I fixed it in the branch as we try not to introduce any warning even between the
commits.

> Sorry about this.
> 

Np!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

