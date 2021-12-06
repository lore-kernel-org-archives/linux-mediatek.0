Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 20:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=qrSUyGGV6kMVN2FWBLXe5vwwGFDIwq+g5XFRinyenpI=; b=lbSIdvhDcb7Tew
	FoG66a5yTllSW7lgdAx1fOpBLpTG5BjOi24cwhcYYWNMYJNLDDiF+233bDU8JkTRx7g00A/Yy4uHm
	qT3ObF5rpaYAzBXsUIYvjcOHaf3/tCt6Rem+s+/pYf0jEqoK4C6flPwSgAbjRXTEXTdDN5KETAgkH
	yBnj40t0XAwqKoC6obfcQjXLh6HYAnVBKwauGg7jGFmlaa9Uw1XBTlNGMYT0TQOV8jkVAtcXcvQri
	rJxwgS9SZph/cEUToto0K8a7k7UZext3C6fHerZWfuWwwgnYGV9xO98EPVbINAeGs/uRLrZ+1Iam0
	e4C4Ikp9HB9KdzIS6nrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muKFf-005bTd-B2; Mon, 06 Dec 2021 20:06:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muKFS-005bRY-E1; Mon, 06 Dec 2021 20:06:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C9362CE1693;
 Mon,  6 Dec 2021 20:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AD3C341C2;
 Mon,  6 Dec 2021 20:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638821163;
 bh=nud5wfy7ReLgTznOxedJgGkAf5LlFhrRveJvOB4LORs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=gs9hXQhyP/9a2KawaeNHh18Gk9uaYVdoJL06MtQ0TnJikMDdtw3J8s+9RvY1fSu+M
 2av8Su6WXNxkPwWitrwezBNBzsKoAW0upwtjP/NSMKBl7pO4QJQHF+0sBXrj1w4j86
 doj0eA7e2Q8dlqkguLyUnrZM3Z49976l4pRfReufsmTnHjleXgn8LovoFWmSqu7nkC
 p9nyXbNQGnS8sZJCRdH5DDCS5sgnYIXlpmpG08qACFBcJZ2AOU3wIcCc7pSEMcBXpa
 MqOmeFDAcTERBMSUEaYyHArD/jMCVvU17f/FYYpuN+GuWZHM5TrIethw23EPt+dlng
 rbsLlMm1TOZ0Q==
Date: Mon, 6 Dec 2021 14:06:01 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, john@phrozen.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 09/13] PCI: mediatek: allow selecting controller
 driver for airoha arch
Message-ID: <20211206200601.GA7175@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129235549.GA2704502@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_120606_676906_34BB58B5 
X-CRM114-Status: GOOD (  21.18  )
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

On Mon, Nov 29, 2021 at 05:55:50PM -0600, Bjorn Helgaas wrote:
> On Mon, Nov 29, 2021 at 04:33:25PM +0100, Felix Fietkau wrote:
> > The EN7523 SoC uses the same controller as MT7622
> 
> If you have occasion to post a v6, please:
> 
>   - Update the subject line so it starts with a capital letter,
>     capitalizes "Airoha" appropriately, and includes "EN7523" as your
>     DT patch does, and moves those close to the beginning, e.g.,
> 
>       PCI: mediatek: Allow selection for Airoha EN7532
> 
>   - Update the commit log so it says what this patch does.  It's OK to
>     repeat the subject line.  Add a period at end.

Sending again since you posted a v6 without doing any of the above.

> > Signed-off-by: Felix Fietkau <nbd@nbd.name>
> > ---
> >  drivers/pci/controller/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > index 93b141110537..f1342059c2a3 100644
> > --- a/drivers/pci/controller/Kconfig
> > +++ b/drivers/pci/controller/Kconfig
> > @@ -233,7 +233,7 @@ config PCIE_ROCKCHIP_EP
> >  
> >  config PCIE_MEDIATEK
> >  	tristate "MediaTek PCIe controller"
> > -	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
> >  	depends on OF
> >  	depends on PCI_MSI_IRQ_DOMAIN
> >  	help
> > -- 
> > 2.30.1
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
