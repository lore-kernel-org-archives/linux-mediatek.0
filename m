Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DABC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xTW+eyENQ7YDXCeSx2gVM8Vu/OWCO2/7Yrb9PAJsSiQ=; b=VUzJzKdFS+ZOKb
	8GByhqfJhGs6kyioxbjrT23Yc/crHhQuS2gHftuKB8Rz4HM1wpUYgTW/YBujNL3nXv2o7sS5cwxFS
	z/Fj2eVS9GdTKd8fUbBS6Y/dHyAgWsrPDscPlYHibuwJINLR2tIF4RIQkEl0tAA9cLRCZOuN/ZrN3
	bA4YkaYc4XBAEvau2eeIWqUBIizd4NZ3QPa/xmb9aT1Flq97wyxjiu/sgbbSqA7y9uaMSYD8P5X4v
	Rcc+Cu1oxLNj+9PsdqvuGcfGKGfwPb8W4RF7KBW+gtRZt72Lg40ya+Qc/tVfmxtnFcxjhtu1zI0P+
	sls5M/BmMWnngELu5JXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhw2Z-001Oc8-KE; Fri, 22 Apr 2022 16:21:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhw2G-001OW8-AR; Fri, 22 Apr 2022 16:21:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFAE462070;
 Fri, 22 Apr 2022 16:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94321C385A4;
 Fri, 22 Apr 2022 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650644490;
 bh=etqmrdOWo9ppgctMHAaKf/sfoIrdAB76WJWQZwxQ2Gg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=A+6/RqeaXjNWl8zQqLBCX3hXYA+0YsyIWRltY82UNGQpLHI8QHudEkEJ4XjKigLSF
 Oi/fcCZ3cniW0P4EcokdUA3CxbxJ5boJcItodWn6KARz+JfiY1aU79zTWcL7X2TfGh
 r44U/1clREJMGFahvXWw/rriH9wO4EOWMwIhtnSLPBBFV8BdRUAswPqd0mUlRqA3P+
 Vt5+MxosXyI8KqZkA3HbiIUk1a/3DuJ5RVue0DrFTbcEb9zbpEDWb52plrSqA1FVH2
 /J8QcMM95G60eo+X7+Y8fBmu33+GCGmG8qKTmkNnTfwc52Q+hqrLLUY95qgc/0TDLn
 EQBXZpjTn4iJQ==
Date: Fri, 22 Apr 2022 11:21:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Update entries to distinguish
 MediaTek PCIe controller
Message-ID: <20220422162126.GA1458908@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422070908.14043-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_092132_488461_F0672F66 
X-CRM114-Status: GOOD (  26.17  )
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

On Fri, Apr 22, 2022 at 03:09:08PM +0800, Jianjun Wang wrote:
> Update driver entries in pcie-mediatek-gen3.c to distinguish the
> MediaTek PCIe controllers.

What's the reason for doing this?  I *think* it has something to do
with the fact that we currently have two "mtk_pcie_driver"
definitions: one in pcie-mediatek.c and the other in
pcie-mediatek-gen3.c, and apparently we want to make them different.

I can buy that.  But there are many other symbols with the same names
in the two drivers, e.g., mtk_pcie_probe(), mtk_pcie_remove().  Why is
mtk_pcie_driver special?

Maybe it's important that the of_device_id[] names be different?

This change is fine; I'd just like the commit log to have a little
more explanation of *why* it is useful.

Nit: I don't think this distinguishes the *controllers*.  It looks
like it distinguishes the *drivers*.

> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
> Changes in v2:
> Remove the changes in Kconfig description and update the commit message.
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 7705d61fba4c..6745076a02b9 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1011,21 +1011,21 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
>  				      mtk_pcie_resume_noirq)
>  };
>  
> -static const struct of_device_id mtk_pcie_of_match[] = {
> +static const struct of_device_id mtk_pcie_gen3_of_match[] = {
>  	{ .compatible = "mediatek,mt8192-pcie" },
>  	{},
>  };
> -MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
> +MODULE_DEVICE_TABLE(of, mtk_pcie_gen3_of_match);
>  
> -static struct platform_driver mtk_pcie_driver = {
> +static struct platform_driver mtk_pcie_driver_gen3 = {
>  	.probe = mtk_pcie_probe,
>  	.remove = mtk_pcie_remove,
>  	.driver = {
> -		.name = "mtk-pcie",
> -		.of_match_table = mtk_pcie_of_match,
> +		.name = "mtk-pcie-gen3",
> +		.of_match_table = mtk_pcie_gen3_of_match,
>  		.pm = &mtk_pcie_pm_ops,
>  	},
>  };
>  
> -module_platform_driver(mtk_pcie_driver);
> +module_platform_driver(mtk_pcie_driver_gen3);
>  MODULE_LICENSE("GPL v2");
> -- 
> 2.18.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
