Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219B5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 18:35:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CF960F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8CF960F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=nWWrwp9Qc5d562GPaRj37u8TSD1P/DTgPHZFijYrIz4=; b=D1rqJ/DCIPPBzo
	5jHtWr4ARZMkKGSRdb1eIu0S+6NQm6uj245QI+JCsobqB8z1IYqna9wjxdptZLDPLnvSvK+7mFQsh
	iDRfxW1u0+BArndLY+U3A/VgfkHJ4Vq16hpzDs46PJtJCgrjiUz4bsszlJrNSCaHRqSFG1dXSOgVL
	z3TCjXMGZtbMXsS3K5BooUZA46fUO/w+C/E0zUov9vKnILpZLmNmOS0Y7D/mRPsusrS2+eZxt02bX
	IrmwIK5tu2mOKO1gS/WoA5ZchuXGwRTSBrnq+uxK/5XVW93T7EDA7XbRYM8y1hPMQ7eeo88F3/VOm
	MKoFeBwgcTZn5HpKrsHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maj6A-000IpV-FV; Wed, 13 Oct 2021 18:35:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maj5x-000InX-R5; Wed, 13 Oct 2021 18:35:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D17E560F21;
 Wed, 13 Oct 2021 18:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634150117;
 bh=9Otllm2GC3gVjaVzNTWWyjCLCOdkUBQMvbyes4AWr7A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=TZ1hgMEieNxKVh5cK/xTkyTn161II9RBtSuwzvap2XAIWDC5IRQ+XIIj9OXuRjXU1
 kOw8PX0y7ksY77hGOZHf4CvA4YMAYkbrw5Bm6fBs6hEJim5geLBFf0HqfiM5XGVC87
 5gcaLEKynNJ9osbadNfjvDFDOJJWcxxepQY/jKygG7kBFHwdXqaxLdIPL21fmy3ew4
 WEdeJ+DfeDfyGJSvznhCur9Mlnmhwcvtv8d5PF8oQ+1dW+1ljZlSJDBVQq321AXfVX
 DRbYBQKSXydmYylkx3ZKuEurnwWnm9bTC8Ghh2DVZkU650OWxEDcoIZlPJVKH8Wtoi
 M3SeiMcHbty4g==
Date: Wed, 13 Oct 2021 13:35:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 qizhong.cheng@mediatek.com, Ryan-JH.Yu@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Disable DVFSRC voltage request
Message-ID: <20211013183515.GA1907868@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013075328.12273-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_113517_924838_C46AAB48 
X-CRM114-Status: GOOD (  19.81  )
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

On Wed, Oct 13, 2021 at 03:53:28PM +0800, Jianjun Wang wrote:
> When the DVFSRC feature is not implemented, the MAC layer will
> assert a voltage request signal when exit from the L1ss state,
> but cannot receive the voltage ready signal, which will cause
> the link to fail to exit the L1ss state correctly.
> 
> Disable DVFSRC voltage request by default, we need to find
> a common way to enable it in the future.

Rewrap commit log to fill 75 columns.

Does "L1ss" above refer to L1.1 and L1.2?  If so, please say that
explicitly or say something like "L1 PM Substates" (the term used in
the PCIe spec) so it's clear.

This seems on the boundary of PCIe-specified things and Mediatek
implementation details, so I'm not sure what "DVFSRC," "MAC," and
"voltage request signal" mean.  Since I don't recognize those terms,
I'm guessing they are Mediatek-specific things.

But if they are things specified by the PCIe spec, please use the
exact names used in the spec.

> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Tested-by: Qizhong Cheng <qizhong.cheng@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index f3aeb8d4eaca..79fb12fca6a9 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -79,6 +79,9 @@
>  #define PCIE_ICMD_PM_REG		0x198
>  #define PCIE_TURN_OFF_LINK		BIT(4)
>  
> +#define PCIE_MISC_CTRL_REG		0x348
> +#define PCIE_DISABLE_DVFSRC_VLT_REQ	BIT(1)
> +
>  #define PCIE_TRANS_TABLE_BASE_REG	0x800
>  #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
>  #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
> @@ -297,6 +300,11 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
>  	val &= ~PCIE_INTX_ENABLE;
>  	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
>  
> +	/* Disable DVFSRC voltage request */
> +	val = readl_relaxed(port->base + PCIE_MISC_CTRL_REG);
> +	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
> +	writel_relaxed(val, port->base + PCIE_MISC_CTRL_REG);
> +
>  	/* Assert all reset signals */
>  	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
>  	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
