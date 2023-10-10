Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D32CD8CA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 16:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JV+Uu1LoFQRsCStaIIS0J4VY6weWPjkOPR7A/EokHVw=; b=vnfD7dcjkRLEO8
	oahoilDVf943LWx7VqeXVl2yeWo0tC2J4VgfOJkKj/z6lp7D+Iyw9lQ+ysCJy4IjJQDTDDGqYNuNw
	x/XzDjdGqdNO1yJ6sfBJ6sOGVpJ+4lg9fIOUL4RRjLRcnm6AtLKOrodQ2xE6oz0rl3Kl8nXQrqfHL
	06/bTh4QD3d/Ivv18wX/0VgKJKjgwq784jJZrxwrf4PB4NNQiS2MzMHbydqCaiZSQtpNwK/qfBeuO
	dhtgrejE4r3FkmMKgsa32oYHsWQ/xMaf0JHaeGBAHbYOEyK9itU3jg+wG4xbx17MjjSqStZRIfFTl
	nLiGwbT4sk8Rgt7lnm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFDl-00Dk4T-23;
	Tue, 10 Oct 2023 16:04:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFDg-00Dk3S-1S;
	Tue, 10 Oct 2023 16:04:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4B66EB81CD9;
	Tue, 10 Oct 2023 16:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66636C433C9;
	Tue, 10 Oct 2023 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696953865;
	bh=CPjakDH/b/NnLZYhG6qAlFTOBENXy2ZPobzsoGHhlUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oKoB9O5WH9REfKO57RoBNap5FlOCwlHa5tWCMjXkqpZGOdyHCWTAd/nvxQGrRbScf
	 RmwSZew+Hu9gAxh/XrnU6Gya5EylyR2BhX5LJfw9MiSoYPYbFPfmQJRa4vmK1LIcK4
	 fxKkbPA6DLOwewexCElKjkUTlw9mGdpspzauxvuSpU6QPr1TyBnR/bahgwJ5YaHJ1j
	 hNeS5F5I498tCazwxNI4y89y8FYggplvKSaAf7OHXnl3X7QF1pUA7Bd+o2pXlPMrZr
	 fXQlXzmmPEzoenCDb3Mtcx8FCJTO8Ouz8pa8WSGpx3WZqQ7uI1YNZfUMsnC82m26/x
	 +zK+IfiHqRekg==
Date: Tue, 10 Oct 2023 11:04:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Frank Wunderlich <linux@fw-web.de>, John Crispin <john@phrozen.org>
Subject: Re: [PATCH] PCI: mediatek-gen3: fix PCIe #PERST being de-asserted
 too early
Message-ID: <20231010160423.GA977719@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR-7Nm2c5s4kuOp0@pidgin.makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_090428_788862_77E5D879 
X-CRM114-Status: GOOD (  23.45  )
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

On Fri, Oct 06, 2023 at 09:45:58AM +0200, Daniel Golle wrote:
> The driver for MediaTek gen3 PCIe hosts de-asserts all reset
> signals at the same time using a single register write operation.
> Delay the de-assertion of the #PERST signal by 100ms as required by
> PCIe CEM clause 2.2, some PCIe devices fail to come up otherwise.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index e0e27645fdf4..ba8cfce03aad 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -350,7 +350,13 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)

I feel like I'm missing something because this patch seems to be
adding a delay for T_PVPERL, but the comment before the existing
msleep() claims *it* is the T_PVPERL delay:

         * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
         * and 2.2.1 (Initial Power-Up (G3 to S0)).
         * The deassertion of PERST# should be delayed 100ms (TPVPERL)
         * for the power and clock to become stable.

>  	msleep(100);
>  
>  	/* De-assert reset signals */
> -	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
> +	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
> +	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
> +
> +	msleep(100);

So I'm confused about these two sleeps.  Are they for different
parameters?

T_PVPERL is defined from "Power stable to PERST# inactive".  Do we
have any actual indication of when to start that delay, i.e., do we
have a clue about when power became stable?

> +	/* De-assert PERST# signals */
> +	val &= ~(PCIE_PE_RSTB);
>  	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
>  
>  	/* Check if the link is up or not */
> -- 
> 2.42.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

