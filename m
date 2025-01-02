Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36A4E77188
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 23:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NO3iKQzFyP5XYivKNlt2p7JsAu2xVzI2cDrFzD/Dd2o=; b=vonSukdT5DbFil
	r/F3+OvZbOZDLuMNtRsu6mq0FgIXln3zOaJZK4CaPl6kIznZ2Xj8eUCdhfwVFVNu4GXSk4DE1l+R/
	pdx1D98scXCoSb7H+nws/vYf+vo5unkFXlLQAc2VC/uBaPbRTr6zz3Tq9jCYPpb/MmaIJWlt2Arha
	o/VjL4NN2TvybEiJj47UKfVhwn+g2+vdAdyaFYFVK9vRX7HTC8lbGa7qyaPd+t+UC2XJap6+Cl5J+
	vAGrldRGnhm538ZuJHS9L0PNay7FdFUhiEpl865VcgzvtM4OdZTqp2TDh7ynJidgaIWsUqRJEFJTQ
	OsAmtzQ7y0KJm4zEcTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTUdD-0000000Bh2n-2hql;
	Thu, 02 Jan 2025 23:29:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTUc2-0000000Bgmf-0CQH;
	Thu, 02 Jan 2025 23:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEE055C32B5;
	Thu,  2 Jan 2025 23:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8304DC4CED7;
	Thu,  2 Jan 2025 23:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735860500;
	bh=o8Evq/Jq7VTHs84rjitCUFOTChZzkwzLSgAyMnDD4CA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Zh5XVJyAyIKPbBdYNw8zG8iHqib2Doua4b1soxpN4u91DBRCvDqe0t+ef1BcRPmoa
	 y6EXojfQCmXuS6sJ0Jp4/SWvy/+nnpNDQTxc9GoSMW30T9rqTu5/MKdHVnKOH7sXPY
	 6yCXakKSOntzIKxnFtwGhH4raj67Ond3HtwPRpbeJsY3C4WoyRzLLbbi+TlaEGgkEL
	 Q4WvYR//5ibRXe07gWFZ5y6kX53IGw0t9sx9NybbjYZFQhZ7zHMCHSpCNKX5nMIrpX
	 2IBg+mCPOecgO1WYHOB+0VIJhn5HVgBdSjcKUXa2Nf1C+hXlS+xdMI2f+tC3XbogwU
	 DAZ208w3zAc0g==
Date: Thu, 2 Jan 2025 17:28:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Avoid PCIe resetting via
 PCIE_RSTB for Airoha EN7581 SoC
Message-ID: <20250102232817.GA4147111@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3Z4jcwtgcXk9Zo6@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_152822_134540_51ACB4F4 
X-CRM114-Status: GOOD (  15.71  )
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

On Thu, Jan 02, 2025 at 12:29:17PM +0100, Lorenzo Bianconi wrote:
> > On Wed, Nov 13, 2024 at 02:58:08PM +0100, Lorenzo Bianconi wrote:
> > > Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> > > causing occasional PCIe link down issues. In order to overcome the
> > > problem, PCIE_RSTB signals are not asserted/released during device probe or
> > > suspend/resume phase and the PCIe block is reset using REG_PCI_CONTROL
> > > (0x88) and REG_RESET_CONTROL (0x834) registers available in the clock
> > > module running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
> > > 
> > > Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> > > specify per-SoC capabilities.
> 
> Hi Bjorn,
> 
> similar to the other series, this patch is already in Krzysztof's branch.
> Do you prefer to resend it or just incremental changes?

If it's not too much trouble, I think a new v4 would be simplest so
the Link: in the lore archives is more correct.

