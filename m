Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C39DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLNEgk6dEQGsW/m9nUYoR4D+VIOt3BvpX+kFUb+EouU=; b=wotIme8vJ3qf5J
	4aTS6/JKx1WlPqUrb3Z/1UY7dgnzA1vR/RJ/3qyo6f4yM0veRZt6ky4cwQO82gZNYhfREJssmT63b
	AqnnXa13hzs51yiv/n/oVNod2TxGKlP/WQ6c4IEEaY52nemqkbWB92m/NnmRk685VkEgKKmD93J9k
	9Zz+mT+SlPCAVJTN1wp6MY49d8uEUw4Hxkb2mVFNNQhdIsWfQeVDRApCaiCxMYhrgsWXcZUm8Dqe1
	4OHnekEa4ULJVtecfNVM/Ue8JZb1yRzDCbbPEladICPkrp3ZYF+U2jWJSu/pZboUdPj80RNQBQK9M
	LKR/94FTGlnLMrNqKi1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n57cU-00F2Uk-3f; Wed, 05 Jan 2022 14:50:30 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n57cI-00F2Pp-G0; Wed, 05 Jan 2022 14:50:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C831211D4;
 Wed,  5 Jan 2022 06:50:13 -0800 (PST)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 774873F774;
 Wed,  5 Jan 2022 06:50:12 -0800 (PST)
Date: Wed, 5 Jan 2022 14:50:06 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, john@phrozen.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 10/14] PCI: mediatek: Allow building for ARCH_AIROHA
Message-ID: <20220105145006.GA7465@lpieralisi>
References: <20211220211854.89452-1-nbd@nbd.name>
 <20211220211854.89452-11-nbd@nbd.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220211854.89452-11-nbd@nbd.name>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_065018_621364_42EA1FB4 
X-CRM114-Status: GOOD (  16.05  )
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

On Mon, Dec 20, 2021 at 10:18:50PM +0100, Felix Fietkau wrote:
> Allow selecting the pcie-mediatek driver if ARCH_AIROHA is set, because the
> Airoha EN7523 SoC uses the same controller as MT7622.
> The driver itself is not modified. The PCIe controller DT node should use
> mediatek,mt7622-pcie after airoha,en7523-pcie.
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/pci/controller/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 93b141110537..f1342059c2a3 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -233,7 +233,7 @@ config PCIE_ROCKCHIP_EP
>  
>  config PCIE_MEDIATEK
>  	tristate "MediaTek PCIe controller"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
>  	depends on OF
>  	depends on PCI_MSI_IRQ_DOMAIN
>  	help
> -- 
> 2.34.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
