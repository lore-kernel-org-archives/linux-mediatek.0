Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8915C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:35:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9FA66115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 07:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9FA66115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMy8d5SRj/RB+64bMNaPYON6gw1dvcdWGQCsZpMEg7A=; b=CyCrD8xvoEZ7ZJ
	JLSs0i6TDWH0Zj0LLYzkFBfzM4fe4BjwI/bLjj9J4whKcbZlXf1rdlC3pQn323pxuiPbkYvo1YZ/b
	uG5o0fR84pAupISEQLadm1YGJD23OVziBkoVi10XwWaZIiEY0oGeqTX5LI5SblVvfG8+UedWxdqra
	n9C4uhNN8QLzBGWU02CXwPpgRCuD1Zcaz5bcAfmCpYsXxCLId3WBKsU5trvAhzm65KN3kiB031gwj
	2LmO/yc0gfjcdimwvixh17Ld2R/ZIz5OAVxTbTBh1aQ7RltiaG/V5ZjwyY3TR1/I6n+2gfdPnnkzf
	+pBRuuW3+xXMtd7U1q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md68O-003fyX-1l; Wed, 20 Oct 2021 07:35:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md688-003fv4-TX; Wed, 20 Oct 2021 07:35:22 +0000
X-UUID: f14af0f55b7e4b13909c9ce7729b389f-20211020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9ZbN+7hN+eyKKRyTdSPLXJGA+qopiKwuP/HmfE3Ecm0=; 
 b=WGTI3RKWcoQv6AzM4LuWuxSX+QAi3U87hZy5X3vec2471bxktGQJ1GgmgJqrRpttMFQLR9U2G2nONFY+o7ALutYtzdf6XJw71tN9Hfiw2cI+3WPuha8D88QYu1B5AtaAMv7UOzxdM7m2jiUW48rsqYzedDJqZGU8SUNAKw4wKY8=;
X-UUID: f14af0f55b7e4b13909c9ce7729b389f-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 463689819; Wed, 20 Oct 2021 00:35:16 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 00:32:29 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Oct 2021 15:32:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Oct 2021 15:32:21 +0800
Message-ID: <0ace973fda20c26d87d64849ce9bd2691101bca6.camel@mediatek.com>
Subject: Re: [PATCH 20/22] usb: host: xhci-mtk: deny IRQ0
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>, "Mathias
 Nyman" <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 20 Oct 2021 15:32:20 +0800
In-Reply-To: <20211018183930.8448-21-s.shtylyov@omp.ru>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <20211018183930.8448-21-s.shtylyov@omp.ru>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 542E1F1BB22D87C9F4CD9FF8CEE9F626407C749C398635E80743AFD0C0E561782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_003520_986498_7CC4B128 
X-CRM114-Status: GOOD (  18.79  )
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

On Mon, 2021-10-18 at 21:39 +0300, Sergey Shtylyov wrote:
> If platform_get_irq() returns IRQ0 (considered invalid according to
> Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no
> IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe()
> method...
> 
> Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host
> controller")
Fixes the following patch:

04284eb74e0c usb: xhci-mtk: add support runtime PM

It introduced the 'host' irq

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
if (irq <= 0) ?

Thanks

> +			return -EINVAL;
>  	}
>  
>  	wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
