Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1A8C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 21:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3uA9JmoHaKFlWjXORH+Tr5K9M/WCaEUasVn/wVi/1Bs=; b=AImC9d6+7svKdk8e907xd4+w01
	94XtqZyi/N9QT0/CWXl9I5tV6uYGl7yAzBapAjQlhQzmmzQ90T8ysNzS4m9tP8GbF6kRkXPRQrOex
	/obzsDAjFBVBd9iQ7P0VNGu3zjP8lsRSsX1J6Mv5NFoNPWJQI6Y8KlQLOlXmJfEVfVIHD/W07gHGN
	QXBpbTy/JQXUJOuZp3edBA/L1Yx8alzMInHoykfvV9fwmgtv2S6Z7Jp93+MfB8cGisX2LSKgsh1qO
	wA7MZtDaryKsnbABB3Dyh1gBSEFd6cGAHBFb33MIkeNSaACWpmedEx0/lrHM4FN4Wq+JQ+NxfSKgi
	5BnQnGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvOWb-00000001PBx-1mKL;
	Fri, 12 Apr 2024 21:33:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvOWZ-00000001PBB-00w6
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 21:33:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53D0D61BB8;
	Fri, 12 Apr 2024 21:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BF3C113CC;
	Fri, 12 Apr 2024 21:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712957610;
	bh=CtC3I2fZQ9mZwBg/TkYlfnfS9MFN0gpK2lQ696PJfG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HhSTbhDx+UWURLfC7hyj8yyHFrTuSDmbdVUCnommqoKxlUxohFWXZfu8zZy4uL+oO
	 bNexmE9vPvhh3q/VdkYgk2zTi8NtvrRth2hbv4WSvNwDnvWnHiL6HQHAqzOScatefn
	 noUtbdiM9PKpxBqMmC54oC5bUgu6mS6n7Nymk9BuYWJpVfJA8IVYmXtfTf6K5TOMhY
	 CgM5RxS+q4mYVevj/nkmA1h/yhdDDT8DLjh5RwT08wbD4zgEjI7UpoFsTEAdUX6jwg
	 n2GnhytXq2vfNm19rt+JkfOe4dU4zR3CEpSCIRp/oXtCfaN3RNJrF/rv2x8tS4Tyc6
	 1tWYqreRv2HUw==
Date: Fri, 12 Apr 2024 16:33:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-pci@vger.kernel.org, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mt7621: Fix possible string truncation in snprintf
Message-ID: <20240412213328.GA19361@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111082704.2259450-1-sergio.paracuellos@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_143331_136312_2B30E063 
X-CRM114-Status: GOOD (  17.65  )
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

On Thu, Jan 11, 2024 at 09:27:04AM +0100, Sergio Paracuellos wrote:
> The following warning appears when driver is compiled with W=1.
> 
> CC      drivers/pci/controller/pcie-mt7621.o
> drivers/pci/controller/pcie-mt7621.c: In function ‘mt7621_pcie_probe’:
> drivers/pci/controller/pcie-mt7621.c:228:49: error: ‘snprintf’ output may
> be truncated before the last format character [-Werror=format-truncation=]
> 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>     |                                                 ^
> drivers/pci/controller/pcie-mt7621.c:228:9: note: ‘snprintf’ output between
> 10 and 11 bytes into a destination of size 10
> 228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
>     |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Clean this up increasing destination buffer one byte.
> 
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/linux-pci/20240110212302.GA2123146@bhelgaas/T/#t
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Krzysztof applied this to pci/controller/mt7621 for v6.10, thanks!  I
just pulled that branch into "next", so it should appear in the next
linux-next.

> ---
>  drivers/pci/controller/pcie-mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> index 79e225edb42a..d97b956e6e57 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -202,7 +202,7 @@ static int mt7621_pcie_parse_port(struct mt7621_pcie *pcie,
>  	struct mt7621_pcie_port *port;
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
> -	char name[10];
> +	char name[11];
>  	int err;
>  
>  	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> -- 
> 2.25.1
> 

