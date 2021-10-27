Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949D5C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 07:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E7A610FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 07:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54E7A610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rdavqF6a41YwODIccdYdkz2XpfsCXHpcVYemFPE0k2g=; b=W04u44lEJixt2HsRJ9v9ig0k3J
	D8rHhVS7MvpOTDRvqLisPyVUa4pSGTAdBE0MyD5OJXEPmh0SaNnsKsH5K0GSUjGzXmAoVwQ75nJnG
	Ru5q7BPoJnc9n6ozVprLJg0WxamyRPnjGIz7QEo+GRBHB/oWqnH+L9WEengFIIA6+wU/2SFYbAyht
	FabT6JNbDHjQTiB/xcFHO8/yDqll2WpxHR7PknlwR87K9favfn8xSfDBG/1zicdPi1Nq6FybCkdxz
	d2oYAmMvRsDK9nwsatXhJ32QK0EDb6j8N2OTIaYQfl/vClzfb6+PES2gpyn1N3STLt6+qdWHnfO2Y
	oGyPxPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlnHS-00CHcf-I6; Sat, 13 Nov 2021 07:16:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlnHA-00CHYY-Ru; Sat, 13 Nov 2021 07:16:38 +0000
X-UUID: 9937e24dc8624d529b5284fc4f7526b2-20211113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Date:MIME-Version:Content-Type:References:In-Reply-To:CC:To:From:Subject:Message-ID;
 bh=tz4dMpoGwAHrKtvwXNl0qRY/8R7GtbkOSsZHPQmwR0M=; 
 b=OumaVR2Da8crvl4ZuBHCC1FjO2LIHkGslSwkI6cqoD3faoCW5jX66XpqXX0HeRxLHgR+gH7Rke0tM8oasSy+W7ec/XxHSVsSnnfrirdSIVysGETIaaHxrbrHEjfwHfdMN8nQuHwy8+rOV2DGb6OWECdQO4uv7KsNkm6rj4agnrs=;
X-UUID: 9937e24dc8624d529b5284fc4f7526b2-20211113
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 259811578; Sat, 13 Nov 2021 00:16:32 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Nov 2021 23:16:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 13 Nov 2021 15:16:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Nov 2021 15:16:16 +0800
Message-ID: <7d5da62b58cd51c08e4e4f9e23069f122c1a5cb4.camel@mediatek.com>
Subject: Re: [PATCH v2 20/22] usb: host: xhci-mtk: deny IRQ0
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>, "Mathias
 Nyman" <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
In-Reply-To: <20211026173943.6829-21-s.shtylyov@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-21-s.shtylyov@omp.ru>
MIME-Version: 1.0
Date: Wed, 27 Oct 2021 16:54:48 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_231636_932590_F167E9EB 
X-CRM114-Status: GOOD (  16.14  )
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

On Tue, 2021-10-26 at 20:39 +0300, Sergey Shtylyov wrote:
> If platform_get_irq() returns IRQ0 (considered invalid according to
> Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no
> IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe()
> method...
> 
> Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host
> controller")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>  drivers/usb/host/xhci-mtk.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
> mtk.c
> index c53f6f276d5c..d2dc8d9863ee 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -495,7 +495,7 @@ static int xhci_mtk_probe(struct platform_device
> *pdev)
>  		return ret;
>  
>  	irq = platform_get_irq_byname_optional(pdev, "host");
> -	if (irq < 0) {
> +	if (irq <= 0) {
>  		if (irq == -EPROBE_DEFER)
>  			return irq;
>  
> @@ -503,6 +503,8 @@ static int xhci_mtk_probe(struct platform_device
> *pdev)
>  		irq = platform_get_irq(pdev, 0);
>  		if (irq < 0)
>  			return irq;
> +		if (!irq)
It is "if (irq <= 0)"?


> +			return -EINVAL;
>  	}
>  
>  	wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
