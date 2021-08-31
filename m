Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AF5C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 18:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C69160FC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 18:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C69160FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=i3Uz3KClKJMWBQ3+fEbG1NjRgy2T3WvJJWjeAyhrkOM=; b=1UEGoLA3TVBKBT
	+z1IFMNdgOQEoZ5/IuKKiRR+wLJ2PxWp1iQSF5k5gmqU0K9xYZnKWv0+iFfVEQSW2qpDLTbSj6LA7
	7DZQcc04mMDOQaVaViH6RzDmfNAkW7PO86Tk1RoRgufxZ1a+EMdfsdJyp3n4/9iV5kZU7FHEJfJaC
	EOFGCmcLo0oCu9EY1kl+0ASgLnFTHPR4uPHr79Tq9NsctRKnVb3pqq9EGEu/TYUpcMjSG3Jd31XWl
	aQGFYNFjBSV1z8QTz0Dga8sbsOAuEwsJeoHwtMqu9hliXetXcypU+bSTSbzvUX+ih3Rht/AtVrOiw
	R3vD3z8nsCD5C/fE20dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL8Ws-002vHZ-2R; Tue, 31 Aug 2021 18:30:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL8We-002vFg-HC; Tue, 31 Aug 2021 18:30:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B68AD6103D;
 Tue, 31 Aug 2021 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630434624;
 bh=SkqXMQamgRCoEPdaEMQczTpsfjKyfyqiZUqYd3pqmGg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=daeKtIgxioFFhmdkjNA44T638KaBT0Kq+nyUwmpWbxBJ9Kk/VpSDFjHoPupul7CEK
 lpTdFs7BTTzy6uh0bJQBQLQ48tA68LgZS3k/79Zd5kl1WM+KnbcDj04GbRnIpsnkfq
 7GRZosccxUpc/dsyaK5q3fFhMkIzJpA4Xq0a92vpm3asIfV5dOjz0mYhrtZwLl/mRZ
 C67hvJoqeA/ejWyYgVQTank50vM3QBayLrYptzdGL822M6iLzmMkGjNRgDd1RWSblc
 2XEbj9de7t7DxnD0WEqYPLJQYQfwkwqKoKiQGwX2JBgVVqwpd/bkC1IKP45hqXUHY9
 O3sXvUR5lhJRQ==
Date: Tue, 31 Aug 2021 13:30:22 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: robh+dt@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
 lorenzo.pieralisi@arm.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, yong.wu@mediatek.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/6] PCI: mediatek: Add new method to get irq number
Message-ID: <20210831183022.GA120514@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210823032800.1660-4-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_113024_647472_B8198309 
X-CRM114-Status: GOOD (  20.81  )
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

On Mon, Aug 23, 2021 at 11:27:57AM +0800, Chuanjia Liu wrote:
> Use platform_get_irq_byname() to get the irq number
> if the property of "interrupt-names" is defined.

From patch 1/6, I have the impression that this patch is part of
fixing an MSI issue.  If so, this commit log should mention that as
well.

> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 4296d9e04240..19e35ac62d43 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -654,7 +654,11 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
>  		return err;
>  	}
>  
> -	port->irq = platform_get_irq(pdev, port->slot);
> +	if (of_find_property(dev->of_node, "interrupt-names", NULL))
> +		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
> +	else
> +		port->irq = platform_get_irq(pdev, port->slot);

This would be the only instance of this pattern, where we look for a
property and use the result to decide how to look for the IRQ.

dw_pcie_host_init() does something like this:

  port->irq = platform_get_irq_byname_optional(pdev, "pcie_irq");
  if (port->irq < 0) {
    port->irq = platform_get_irq(pdev, port->slot);
    if (port->irq < 0)
      return port->irq;
  }

Would that work for you?  If not, the commit log should explain why
you can't use the standard pattern.

If you do things differently than other drivers, it makes things
harder to review and slows things down.  If you *have* to do something
differently and it adds real value to be different, that's fine.  But
we should avoid unnecessary differences.

>  	if (port->irq < 0)
>  		return port->irq;
>  
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
