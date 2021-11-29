Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA60DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=JAZiWpbriKT1C2ljROQSLliSM624sAtFJCbj6G9PjY4=; b=YyNkaGbQk/askR
	MDoN4PP+wfr99vV0XDDHbVxB1caDX1cPpHh3sHajr6QZoYLn2N5dh0UyCZDbYUrLhQ2tzFd9nQ9H9
	jaYfA7as6wV4HhhAHevj6JK1OmmrlO3pKIahjhipd/FXsmcjzSokPUCaIdQNiLYCQAJx8epPV+uyc
	51DBAZ7xO470YvI2yd95HQYA5X7hXM3C9Dl4bJl1oj4UxX1gpTvoDIUFPQaqueaPC+a5UufPzodU/
	kkz6jQkUiY8+j3MeXRbBMcJritnanr1V39j5UBnZtuDfLvmCMtBr/WvSvEMtTK+LMDWUkLtTwzCet
	fFIYmkEchq8hcPxFtxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrqVP-0039Rc-Ig; Mon, 29 Nov 2021 23:56:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrqV0-0039OE-Cp; Mon, 29 Nov 2021 23:55:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ECF6FB80CB6;
 Mon, 29 Nov 2021 23:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73232C53FC7;
 Mon, 29 Nov 2021 23:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638230150;
 bh=caJLxRnOOUvs9NbsXGU86f6l73oZPp0ipg5BxTi8yTg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=fmeSjSHHGScKJXlcmE/ndq14LzGZSuFX8Sxs+8n0pNZJY7sEG3sQ9m49RyHUPQiTW
 CTKhX9Lr/KlUCDxlFzkXs3/kH8NLQqSIfPEOf6jWuiY34CGfziRTm8sak6y2RrzFaA
 3su3/M1YKKUnzhbQTL4va/EEvGObulo1GyKNMl1vW+V30uHIOZskAIl0LqETp5jv4b
 dMLXqWZ8hHp6tYcuS3W+8hyV4zXCAysMkQXz1e6EXpZlSvSk49ScCNdOkCsrSVdsCh
 XH6M06v8L724cZHK2aZrkpq+d0II5ajVozGKj26vadw7tS3VVIDARTvSfUAYJXWB9B
 3CsufW9IFPr6g==
Date: Mon, 29 Nov 2021 17:55:49 -0600
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
Message-ID: <20211129235549.GA2704502@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129153330.37719-10-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_155554_617842_88C1A4BE 
X-CRM114-Status: GOOD (  20.03  )
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

On Mon, Nov 29, 2021 at 04:33:25PM +0100, Felix Fietkau wrote:
> The EN7523 SoC uses the same controller as MT7622

If you have occasion to post a v6, please:

  - Update the subject line so it starts with a capital letter,
    capitalizes "Airoha" appropriately, and includes "EN7523" as your
    DT patch does, and moves those close to the beginning, e.g.,

      PCI: mediatek: Allow selection for Airoha EN7532

  - Update the commit log so it says what this patch does.  It's OK to
    repeat the subject line.  Add a period at end.

I expected a patch to add "airoha,en7523-pcie" to
drivers/pci/controller/pcie-mediatek.c.  Did I miss it?

Oh, I see your arch/arm/boot/dts/en7523.dtsi has:

  +       pcie0: pcie@1fa91000 {
  +               compatible = "airoha,en7523-pcie", "mediatek,mt7622-pcie";

so I guess you just rely on the existing "mediatek,mt7622-pcie" string
in the driver?

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
