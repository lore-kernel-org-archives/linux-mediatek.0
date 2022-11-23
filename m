Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1351C3A59F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mh9pfAJNDjjPFtFWAhVTAyBHmQ4tYAbZKfwiZdqYM9c=; b=ie9mOmQEutV0VncxgnIRKyXTrK
	h3OUqhGZ+QFlaa3W90uKvvx9HjLvn5/rRsNa1Gc65YaPSkD7mXSy8X9R/V+fvK0ZPYglnKCEJ42WV
	8g4BZckcsQSo/T0k27jnBqe4Cz+dQ3XOtUhd1IUXQxrl8eKF1fUnFPcTJlGSOzBnjPz8Vpbqny/3j
	ui0ZkX+Qt1n7oGDG2YoZgNQgkezzHqudk9zmyn2AIGkf3rAHWGlGbxePkaAYdJjX8FfmZIZaj9Co/
	nBjJG7JB7Uc3kCfNslS9953x1NA8gB4p9IoR6jJzFnnFknDsVE3r2BDYImgERn/hLWQ4EW28P0IRq
	co8MdlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxncb-00GY4L-Ii; Wed, 23 Nov 2022 11:08:53 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxncL-00GXvB-0m; Wed, 23 Nov 2022 11:08:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669201717; x=1700737717;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=nEqvAW5e5WrGa/oW+eUTBhZKa268bM9z28Wl13BAzN8=;
  b=oAOKg5NaXnouLhXEr9uFEYaxDsGyMMr8I/eBuk+ybQI1dTlIsJkCDSwp
   Q1Gff3cmeIFinzyJ9EOdB9Ozev60FGB2J/9I1sivZaK7FKYMlRc0wleON
   ErDw75T1+YBCCgN7GS6nPh/uCb+bH8yFKgKeuBjpvAgsdSIR7Ud7sUHj+
   j8IxHygdJwbCxjFzeB3lJ3pUnwsYJ14DJF4P+G5PAyd95H0kqpNx0HmRJ
   PipG2MLB2G8IeAe/hGZ86Mx4nOdMbedvOVfCRv+hJx/2H+68pyuYP2aBv
   A6gGjxPakFT2CFI4hfVm4gGWV46NtxihMOK7HjulHSeCkCXcl3FSc5/IP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="376187057"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="376187057"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 03:08:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="766683403"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="766683403"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 23 Nov 2022 03:08:30 -0800
Message-ID: <a384d15d-c1df-160c-030b-fddd5d965996@linux.intel.com>
Date: Wed, 23 Nov 2022 13:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20221118110116.20165-1-chunfeng.yun@mediatek.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: host: xhci-mtk: omit shared hcd if either root hub
 has no ports
In-Reply-To: <20221118110116.20165-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_030837_207174_6CB181B6 
X-CRM114-Status: GOOD (  19.49  )
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

On 18.11.2022 13.01, Chunfeng Yun wrote:
> There is error log when add a usb3 root hub without ports:
> "hub 4-0:1.0: config failed, hub doesn't have any ports! (err -19)"
> 
> so omit the shared hcd if either of the root hubs has no ports, but
> usually there is no usb3 port.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c | 72 +++++++++++++++++++++++--------------
>   1 file changed, 46 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 01705e559c42..cff3c4aea036 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -485,6 +485,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>   	const struct hc_driver *driver;
>   	struct xhci_hcd *xhci;
>   	struct resource *res;
> +	struct usb_hcd *usb3_hcd;
>   	struct usb_hcd *hcd;
>   	int ret = -ENODEV;
>   	int wakeup_irq;
> @@ -593,6 +594,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>   
>   	xhci = hcd_to_xhci(hcd);
>   	xhci->main_hcd = hcd;
> +	xhci->allow_single_roothub = 1;
>   
>   	/*
>   	 * imod_interval is the interrupt moderation value in nanoseconds.
> @@ -602,24 +604,29 @@ static int xhci_mtk_probe(struct platform_device *pdev)
>   	xhci->imod_interval = 5000;
>   	device_property_read_u32(dev, "imod-interval-ns", &xhci->imod_interval);
>   
> -	xhci->shared_hcd = usb_create_shared_hcd(driver, dev,
> -			dev_name(dev), hcd);
> -	if (!xhci->shared_hcd) {
> -		ret = -ENOMEM;
> -		goto disable_device_wakeup;
> -	}
> -
>   	ret = usb_add_hcd(hcd, irq, IRQF_SHARED);
>   	if (ret)
> -		goto put_usb3_hcd;
> +		goto disable_device_wakeup;
>   
> -	if (HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
> +	if (!xhci_has_one_roothub(xhci)) {
> +		xhci->shared_hcd = usb_create_shared_hcd(driver, dev,
> +							 dev_name(dev), hcd);
> +		if (!xhci->shared_hcd) {
> +			ret = -ENOMEM;
> +			goto dealloc_usb2_hcd;
> +		}
> +	}
> +
> +	usb3_hcd = xhci_get_usb3_hcd(xhci);
> +	if (usb3_hcd && HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
>   	    !(xhci->quirks & XHCI_BROKEN_STREAMS))
> -		xhci->shared_hcd->can_do_streams = 1;
> +		usb3_hcd->can_do_streams = 1;
>   
> -	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> -	if (ret)
> -		goto dealloc_usb2_hcd;
> +	if (xhci->shared_hcd) {
> +		ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
> +		if (ret)
> +			goto put_usb3_hcd;
> +	}
>   
>   	if (wakeup_irq > 0) {
>   		ret = dev_pm_set_dedicated_wake_irq_reverse(dev, wakeup_irq);
	
dev_pm_set_dedicated_wake_irq_reverse() can be called with just one hcd, if it fails
it will goto dealloc_usb3_hcd:

dealloc_usb3_hcd:
	usb_remove_hcd(xhci->shared_hcd);   // xhci->shared_hcd may be null
	xhci->shared_hcd = NULL; // causes usb_put_hcd() issues if shared_hcd exists

put_usb3_hcd:
         usb_put_hcd(xhci->shared_hcd); // shared_hcd may be set NULL above

-Mathias
  

