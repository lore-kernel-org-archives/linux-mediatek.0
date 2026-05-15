Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADE2CD343F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9WZ/ovh3rFmX54flVF7CQGVCOoJoTUt+595pXKNpL+E=; b=i9cG0KzGutzccj
	SdxsNzBDGXR3TLFi80UQeRnZAhYdsMDnCvPUHbKAugON3BIgZQtw2TcGISNwlMgfCJ2+3Lqnffut8
	+l2kWcyTUuw4gjoal6SRUOXl/qc7E6aQL+t5scBThszipqjU41CXGQxvEoUYROTWp+hlRwGyk5s8f
	Po+rWkC8NJnbsgrltC9vvb+oLHYZeB2/GpemlM8WcO5Nc+u5KEaEBU+f6paTxugiUD0yOW1Ovebid
	kE5pLuVHf7Irjl9etxqdvtmqBdbuQs17sHck+GhCLAfJ+yQPOHfhGJNfevD+OWLgNFmsaqJ/PFEsv
	C2aRZs0usfkGzTXLS9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvY4-00000008t6C-1r0d;
	Fri, 15 May 2026 16:38:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNvY3-00000008t5s-2GQK
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 16:38:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B81D760098;
	Fri, 15 May 2026 16:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B703C2BCB0;
	Fri, 15 May 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863082;
	bh=4LdAuosZ3gLl5ldnT6Wb/iOVobL7IjhwJIw+0NReLzw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EKUGFPeeXzM+hWW25sMm100kXslkLAjij398t8UroQn5KZ/+FMzZe+dyt4V8goWNO
	 2CfgbHYliW47Ya5OZwlW7DCuumZYj7URS6bjx7OeSOb2vhdXt9ylPk2gGRXzgYI4Tv
	 MECp1cbidiVSsRR2I4Y7nx/OnnGE9ValkQXzK1wJAGfek02ZTGkK3o7z0y9YIllWuB
	 F5tmwZS7NJ/1IJ8K2pIDPAbpVCijJ4osK30quXhJKn4Co6VOBRzOua6kKpGEBgimAy
	 eDlGWEdNm48NfO1INQ6ePFp+Fk1GRYXIVvjT+KnbjWjshv47giMR468NT07dugx2h2
	 Qr5vCrbVKDHwQ==
Date: Fri, 15 May 2026 11:38:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, mani@kernel.org, ryder.lee@mediatek.com,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [PATCH] MAINTAINERS: Remove invalid email for Jianjun Wang
Message-ID: <20260515163801.GA496866@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515153635.136054-1-18255117159@163.com>
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

[+cc Jianjun]

On Fri, May 15, 2026 at 11:36:35PM +0800, Hans Zhang wrote:
> Email to Jianjun Wang <jianjun.wang@mediatek.com> bounces with error:
> "550 Relaying mail to jianjun.wang@mediatek.com is not allowed".
> Remove the address to avoid sending future kernel maintenance queries
> to an unreachable destination.
> 
> The MediaTek PCIe driver remains supported by Ryder Lee.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>

Applied to pci/for-linus for v7.1, thanks!

The most recent traffic I see from Jianjun in lore was from January
2025.

> ---
> Hi Bjorn and Mani,
> 
> Recently, when replying to emails in the Linux community, I kept
> encountering that Jianjun Wang's emails were being returned. The
> detailed information is as follows:
> 
> """
> Dear user 18255117159@163.com:
> Sorry to inform you that your email (send to jianjun.wang@mediatek.com) has been returned. The details are as follows: 
> 
>  ------- Original Mail Information -------
> Time:2026-05-15 23:04:39
> Subject:Re: [PATCH v2 6/8] PCI: aardvark: Add 100 ms delay after link training
> To:jianjun.wang@mediatek.com
> Relpy Code:
> SMTP error, RCPT TO: Host mediatek.com(1.203.163.78) RCPT TO said 550 Relaying mail to jianjun.wang@mediatek.com is not allowed 
> """
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6aa3fe2ee1bb..b2609dc33c62 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20745,7 +20745,6 @@ F:	drivers/pci/controller/dwc/pcie-intel-gw.c
>  
>  PCIE DRIVER FOR MEDIATEK
>  M:	Ryder Lee <ryder.lee@mediatek.com>
> -M:	Jianjun Wang <jianjun.wang@mediatek.com>
>  L:	linux-pci@vger.kernel.org
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
> -- 
> 2.34.1
> 

