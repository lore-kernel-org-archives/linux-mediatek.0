Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652DBCA5FE3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 23:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2F9PM14gbO/JmqJbFmB0qxBlVb6KOCBrfWS4oqVBhpU=; b=oLYyZLrwnE7MP9jsAuwaTOTSB+
	q/a3tshsKSLNk3uN0ETkY+oOHr04Iqq9h+gCiGxRPTa8/DeAUHD+IQvcrwV7gOnLJ4X6iW2WxK1Cn
	Zg3Zn3P5qLA/L9jPG7fhfDteUiwfmEGzRIdxaw0UbzUqJp30Kvqk49Czb+32GCI5PnzUmXQiHc189
	1j4hzK/shGP8UgXlHLoVmrccm6FxuxKAhvjVkqWipz3qPBSv+l+4/hNrt74pxUtx/4PsNA3w9UbYZ
	eu6YyNtKdYnLrBhcsAji2aiuncVghZ6BC6URJdoB+lMam/XXnhWyt94FECxMV0HvoouzeDds+bO2b
	yp4d7HFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmqz-0000000CjzS-1LIM;
	Fri, 02 Oct 2026 23:39:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCmqy-0000000Cjz4-196K
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 23:39:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C7976022E;
	Fri,  2 Oct 2026 23:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58841F00893;
	Fri,  2 Oct 2026 23:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790984387;
	bh=2F9PM14gbO/JmqJbFmB0qxBlVb6KOCBrfWS4oqVBhpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=CEOYXd9ydMm151azfENtOP96RpUuf/G8x/7YY7LRbScsOU9/xEXGFx8ltpG8F/3fY
	 wQ3wUC6WnkD9XutfhcG31IEBYM7FCUf3kfUErfW+rKSYkWTnkpFpVO+JSu1iDTKMVe
	 6E2likWy2SrsgPjYVFOSBOhbOzz2RPK4ecoY71G+HhzERWlHcOWavefP+B0bpy1xkT
	 WD2WguvFougIbwkoPTU6/vGip5qDJhnspOF/LO5b5xjIkXed9lP/SvvShx571aOu/K
	 8XdQ5e+agFkD7dBYU81dkjiPaKLt8l0OUAuKlhIFF1mhcT4WbXQG5KDtxkJduOVFLp
	 qipXMH6MDi60g==
Date: Fri, 2 Oct 2026 18:39:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: mediatek: fix W=1 snpringf warnings
Message-ID: <20261002233945.GA406594@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b835e360b42c5e0994f9301a34dbdf140a8d3ef5.1772493898.git.ryder.lee@mediatek.com>
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

On Mon, Mar 02, 2026 at 05:46:48PM -0800, Ryder Lee wrote:
> Fix the following errors in W=1 builds.
> 
>   $ make W=1 drivers/pci/controller/pcie-mediatek.o
>     CALL    scripts/checksyscalls.sh
>     DESCEND objtool
>     INSTALL libsubcmd_headers
>     CC      drivers/pci/controller/pcie-mediatek.o
>   drivers/pci/controller/pcie-mediatek.c: In function ‘mtk_pcie_parse_port’:
>   drivers/pci/controller/pcie-mediatek.c:963:43: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Werror=format-truncation=]
>     963 |         snprintf(name, sizeof(name), "port%d", slot);
> 	|                                           ^~
>   drivers/pci/controller/pcie-mediatek.c:963:38: note: directive argument in the range [0, 2147483647]
>     963 |         snprintf(name, sizeof(name), "port%d", slot);
> 	|                                      ^~~~~~~~
>   drivers/pci/controller/pcie-mediatek.c:963:9: note: ‘snprintf’ output between 6 and 15 bytes into a destination of size 10
>     963 |         snprintf(name, sizeof(name), "port%d", slot);
> 	|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ...

> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -953,7 +953,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
>  	struct mtk_pcie_port *port;
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
> -	char name[10];
> +	char name[20];
>  	int err;

FYI, from internal Sashiko review while backporting this:

[Severity: High]
This is a pre-existing issue, but looking at the error paths around port
parsing, is there a missing IRQ teardown that could lead to a use-after-free
or resource leak?

When mtk_pcie_parse_port() successfully parses a port, mtk_pcie_setup_irq()
allocates an IRQ domain and registers a chained IRQ handler that keeps a
pointer to the port struct.

If a subsequent initialization step fails, such as parsing another port in
mtk_pcie_setup() or pci_host_probe() failing in mtk_pcie_probe(), the probe
function aborts and returns an error:

mtk_pcie_setup() {
    ...
    err = mtk_pcie_parse_port(pcie, child, slot);
    if (err)
        return err;
    ...
}

The error paths, such as the put_resources label in mtk_pcie_probe() which
calls mtk_pcie_put_resources(), will free the memory of the port struct but
fail to unregister the chained IRQ handler or remove the IRQ domain.

Because of this, a freed port pointer remains registered as the handler data.
If the shared interrupt fires, could mtk_pcie_intr_handler() dereference this
freed pointer and crash?

Additionally, if platform_get_irq() fails in mtk_pcie_setup_irq(), it looks
like the function returns an error without destroying the just-created
port->irq_domain:

mtk_pcie_setup_irq() {
    ...
    if (port->irq < 0)
        return port->irq;
    ...
}

Would it be appropriate to add proper teardown functions to these error paths
to unregister the handlers and clean up the domains?

