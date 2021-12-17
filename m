Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gMHi29QFkBJc5Gya2H7gdBLiuZ5I42uFo4fShYJN1aE=; b=oHLJniZE7hXgvJ
	GDoc8qS+/yYaGTJJZ2rA3vzsxOlkoco26FAWkniguAGnjlmLMc9201Q81WOIgif1vzBjfYl+OobUQ
	GReVzOKGq7J0jN15FZkltJ6iXDh26lw1IOEAiTDJQtOC7A4OuTm8qy2L3ntyrkKfhgCKJN7fc9A2m
	CK5dRV1TAwI/lMQ2O2y0sGcsv3VyUkoEgB7KnMXelUpf1iCZVl72/s7Fu7skOL4y+zCBzHgM2kUnY
	4WEODrnHqDZbq88u6Y6aRFXzfno5hTJ9D70I71wCQb5e+UGHlhFDi+h0iWi/Eo2a84ozIuL1khCbW
	M+CUxyqRBIOHc4OSz4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myHQH-00Ba2X-UG; Fri, 17 Dec 2021 17:53:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myG31-00B9nE-T5; Fri, 17 Dec 2021 16:25:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 742CEB8292E;
 Fri, 17 Dec 2021 16:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51AEC36AE8;
 Fri, 17 Dec 2021 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639758329;
 bh=K2+x1WBF60nqGDXE3hSHxTF/9S7av35S8BbzdwS/bII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=l8hwWpJtkqVosVL1Kl9DrJR9eNeTjGsOabJ1jmqTyRBnOdLlGFscPuQAyytPGUMMW
 2fmAkkhuPt4g5lEQJlqW/8B+8zyfLPpzInlCtXQ0SV2ZNwCV9FoHzgVPXRmJfv6x9A
 BdxclGi+welPPl4Y+1Ns2caPVXlnfbmURx8QDbMThG/ant8ydu07RMYr9REQFpIHMd
 C+vf0gZGuJ07uEnz6Bi2jkwNLhbE7b/clp/fVKVjOhADCpHEaUyLhPni4D++wWGFX7
 8VUiu/sYaWCWz2N8UeGQR0bhxbm6eRP4WHy2nti+di5Z91/eJnIy4XjbSNO5e0342r
 05TvmL0xbe+Lw==
Date: Fri, 17 Dec 2021 10:25:27 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, john@phrozen.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 10/14] PCI: mediatek: Allow selecting controller
 driver for airoha arch
Message-ID: <20211217162527.GA895301@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217112345.14029-11-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_082532_127430_9658DD42 
X-CRM114-Status: GOOD (  18.96  )
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

On Fri, Dec 17, 2021 at 12:23:40PM +0100, Felix Fietkau wrote:
> This patch allows selecting the pcie-mediatek driver if ARCH_AIROHA is set,
> because the Airoha EN7523 SoC uses the same controller as MT7622.
> The driver itself is not modified. The PCIe controller DT node should use
> mediatek,mt7622-pcie after airoha,en7523-pcie.

s/This patch allows/Allow/ ("This patch" is redundant)

For the subject:

  PCI: mediatek: Allow building for ARCH_AIROHA

since "controller driver" is similarly redundant and this earlier patch
does essentially the same for a different case:

  70060ee313be ("PCI: brcmstb: Allow building for BMIPS_GENERIC")

> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/pci/controller/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
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
