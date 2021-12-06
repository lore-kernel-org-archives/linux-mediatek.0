Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 20:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=sua5lWYmfJOFJd2eaxK76mYGzSElWGkRAIzRD/sEZeI=; b=ibkPxb1T2o4763
	3DRrFQ2OL5JNCFBmvTkEjij1WxnM/M5jWKVnUW1W8pK51jOWNvWhH+JESqgh1lxfep+q/WrNQ7k03
	3SjtyX06AZMyrKb3O025V74LdLKmzpnKmkdAVn3ORKpkuapMkygR85c+BHH+++pqnU5oY0dURs1gv
	Z/8kOnMQFPK0FVpy3Uxa024mZkUc91485Q2Cc389KpPTcWNxJKHmmPjUIJ2ABLDpF8sDh0gw9WQKY
	+bZUlpaREOCj6A3l3U9/rRMh32oCwGXuY7538Icg524ol7isMOJUefZN3NQVJkWrewDR55GZ1pnlD
	JRfpERt5teNHmfPAdoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muKKd-005cDT-Qd; Mon, 06 Dec 2021 20:11:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muKKR-005cA6-9V; Mon, 06 Dec 2021 20:11:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9F424CE180D;
 Mon,  6 Dec 2021 20:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E91C341C1;
 Mon,  6 Dec 2021 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638821471;
 bh=sk7m/9ChjeTsUjA1qk7j5ctQRQdk4uoA60tUGbHHSbY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Ijqw3kx78+LoGUnZpNWhLrf6RJGhHPXcRbeTgQpFuaMUVRTUTWI8XhpfU07JhYiF6
 5DEgw+7DXFREt8rqlLdP05XBl37ZYamSIRws3GbozwvAdDznYkF/eTrhwsrvuNvsw4
 kP997oKmoV2ltKht/7ZgM4FStAZ3TGzwmR5rJMsuy1j/hjV3bvreo8ubXb1O/nUpdc
 0ZuuNv62ge7uND2fceBU1CmJoWxCV/QAdsnKHgDl3Dv7iwOu+EOHYM/XtqNNlyBmGk
 U4fo439hFDcGJlkk3uYOG4rCwSbX5oN2g3G9i++wbM4d8lo1jT3NQiDve8zHXgz8li
 yTsyLZMLn7nZQ==
Date: Mon, 6 Dec 2021 14:11:10 -0600
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
Subject: Re: [PATCH v6 10/14] PCI: mediatek: allow selecting controller
 driver for airoha arch
Message-ID: <20211206201110.GA7319@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211203113331.20510-11-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_121115_535985_19AB4072 
X-CRM114-Status: GOOD (  15.76  )
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

On Fri, Dec 03, 2021 at 12:33:27PM +0100, Felix Fietkau wrote:
> The EN7523 SoC uses the same controller as MT7622

See https://lore.kernel.org/r/20211206200601.GA7175@bhelgaas

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
> 2.30.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
