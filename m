Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1633CD343F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 21:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lm/7gIzsXHp+NFpsQj5+tpVoJNOyI5TFBCPv5UKpT94=; b=r9V5qbsExHQTlw7ywY8QpN2tLD
	l4mZFyMTOGsckRERVkXfCBDk81JTZgN5kxX5I40csD0GGDRd/0LDaMPZ+6dkUCiqxgvMlgBawluQx
	7ON3kK9p2D8viQJEljEwCrrahmsKlyt6KwIBtQDc9kBqXcKWHPjObQwR/yxpSqUVsiUSV2dBe2Ueo
	7oXm5bEAKSzzv4lQadez8l/PyolFOsLb24oVgpRCDsAvFNIY8ANy82dW+4BQIzUHiRUSP0GJ5fsBy
	ZKV4JzHTK1Ov3sbm7DOq26FLDhyshBGYNy+pMB/UB4u66ox8nLbr6HGepZD3GaWwDEY+lt5LeHWPu
	KwonjtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMubo-00000000Twy-03RU;
	Tue, 12 May 2026 21:25:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMubm-00000000TwS-2USL;
	Tue, 12 May 2026 21:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97A59600CB;
	Tue, 12 May 2026 21:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208D5C2BCB0;
	Tue, 12 May 2026 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778621141;
	bh=EJnWDfRo+uPbHrOqa3qgWqMaN3gN4wh4Fsfhj1nSvLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Avt+EHCVMfTlk+wRz1p7d5iQ9oECUodk6IeA/e2U+soWUXY8AjlhsEDpTMMnR3Q09
	 5NfG8l208seCxH/fqWx/SbhOPY4X375jr4U/+gR/wKrrZquUgQocXIOoZeYIY+z4e/
	 YEJdarFRN4W+2E/gPLS6wJ8wjP7cgClBzWhi5f9U939wrj9lCpEVjHqK9pztnX7eB7
	 5VGlzvJNRvs0vqpV558tHFtUlJDFhQuLvx5lofEmQ04MkPAPyElARm0O6CyQGwrn7l
	 wG2lfhs2tRHwdjh+xGSxKLD6rRP9KVGLstZp9y9DYzdzyXn8F1xn/cceXiYRzWNNkq
	 sQ/u3r0OL3DeA==
Received: by pali.im (Postfix)
	id 0526AB57; Tue, 12 May 2026 23:25:31 +0200 (CEST)
Date: Tue, 12 May 2026 23:25:31 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] PCI: aardvark: Add 100 ms delay after link
 training
Message-ID: <20260512212531.jupoocz7acv22qyg@pali>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-7-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506152346.166056-7-18255117159@163.com>
User-Agent: NeoMutt/20180716
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

On Wednesday 06 May 2026 23:23:44 Hans Zhang wrote:
> The Aardvark PCIe controller driver waits for the link to come up but
> does not implement the mandatory 100 ms delay after link training
> completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).
> 
> The driver already maintains a 'link_gen' field that holds the negotiated
> link speed. Use it together with pcie_wait_after_link_train() to insert
> the required delay immediately after confirming that the link is up.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/pci-aardvark.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index e34bea1ff0ac..526351c21c49 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -350,8 +350,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
>  
>  	/* check if the link is up or not */
>  	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
> -		if (advk_pcie_link_up(pcie))
> +		if (advk_pcie_link_up(pcie)) {
> +			pcie_wait_after_link_train(pcie->link_gen);
>  			return 0;
> +		}
>  
>  		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
>  	}
> -- 
> 2.34.1
> 

Are you sure that this is correct to do? Have you checked the A3720
Functional Specification which describes how to bring PCIe link up?

A3720 PCIe controller is buggy and needs more timing hacks to make it
behave. Playing with random sleeps can break its internal logic.
I'm not sure if it could be safe without proper testing.

And IIRC A3720 PCIe controller is just PCIe2.0 with 5 GT/s.

