Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F9BC10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 09:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F342720736
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 09:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sv0M7gn/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F342720736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQsWpKOWNSt0U9trNRfk2daD9dvLv9biiPot7rcfHP8=; b=sv0M7gn/wKEroS
	IkBwL+NQo2UWuby9aSBpNyYe/G9hJwJTbfjy5Y45uSL7z2eIlH60UoBHi5Xp/LUm/8XwvKZAQaw4Y
	YoEWaeMdhjrTu/CjahDf+Q65Q9d56/9njCl9DxoblCfWenGXMaOSxg2ShYqShteqQps+nBDYRi4wF
	t5kJpvb0qIhs37V6BoSrEJFsCx1jm1vI1EA4oTXIbNnLnT1mXgttAD99bdWWMu3PpgENvAcRxeXcw
	qdvHzhm9m95+aBIemYr/dImPgqbXCXZOJTP4JB9BQeC+QlEDdyqSeYCB11nZvXX4D/raZOLKdpTQD
	v8iYGnTMmiyn8cydBPBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCKWo-0001lw-Vm; Thu, 12 Mar 2020 09:53:23 +0000
Received: from ns.iliad.fr ([212.27.33.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCKWg-0001d0-61; Thu, 12 Mar 2020 09:53:16 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 33704204CB;
 Thu, 12 Mar 2020 10:53:07 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id 045E820046;
 Thu, 12 Mar 2020 10:53:07 +0100 (CET)
Subject: Re: [PATCH 4/5] pci: handled return value of platform_get_irq
 correctly
To: Aman Sharma <amanharitsh123@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <cover.1583952275.git.amanharitsh123@gmail.com>
 <b773b3b1ed25a0e6d5d826b6c43293473cbd24e7.1583952276.git.amanharitsh123@gmail.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <6e413f63-06e3-9613-97dc-ff5968a4f759@free.fr>
Date: Thu, 12 Mar 2020 10:53:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b773b3b1ed25a0e6d5d826b6c43293473cbd24e7.1583952276.git.amanharitsh123@gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Thu Mar 12 10:53:07 2020 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_025314_375515_8DB0E352 
X-CRM114-Status: GOOD (  11.31  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Mans Rullgard <mans@mansr.com>, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/03/2020 20:19, Aman Sharma wrote:

> diff --git a/drivers/pci/controller/pcie-tango.c b/drivers/pci/controller/pcie-tango.c
> index 21a208da3f59..18c2c4313eb5 100644
> --- a/drivers/pci/controller/pcie-tango.c
> +++ b/drivers/pci/controller/pcie-tango.c
> @@ -273,9 +273,9 @@ static int tango_pcie_probe(struct platform_device *pdev)
>  		writel_relaxed(0, pcie->base + SMP8759_ENABLE + offset);
>  
>  	virq = platform_get_irq(pdev, 1);
> -	if (virq <= 0) {
> +	if (virq < 0) {
>  		dev_err(dev, "Failed to map IRQ\n");
> -		return -ENXIO;
> +		return virq;
>  	}
>  
>  	irq_dom = irq_domain_create_linear(fwnode, MSI_MAX, &dom_ops, pcie);


Weee, here we go again :-)

https://patchwork.kernel.org/patch/11066455/
https://patchwork.kernel.org/patch/10006651/

Last time around, my understanding was that, going forward,
the best solution was:

	virq = platform_get_irq(...)
	if (virq <= 0)
		return virq ? : -ENODEV;

i.e. map 0 to -ENODEV, pass other errors as-is, remove the dev_err

@Bjorn/Lorenzo did you have a change of heart?

Regards.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
