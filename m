Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20622C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 07:35:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB32E206BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 07:35:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pDyqg/te";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bg9Pgjd9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB32E206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aj+n+FpcupuY6WElI1q2AAquy1pEf/bWqR4mMUBwjME=; b=pDyqg/teyXD6Zf
	WHuwAWwg7DWrMgCu8HuxFjgGtq0PSVjjrUjNDbTLCW+9SbwyURU1PTqO5i8r15BGx5zJF1O3AehEE
	xaOe7WM+MTsK+dCXq20B4aweQWiATrcjs/GdNwcKHOTlxPFDFTfu+d86yxSHGXH+vhdtxP3PZ1//O
	1An8WtlkXOCDf4K976MgDdFcP4VOO1KGaWYduCAttAZW419mcuMJ6J9Sr9ecvExALpFT2Q5MoX6h5
	r6cqU/AavESN0eN37+JXzeTxi9UrtBEg9DndfVq73kmlcPJZf+pdxCm4t4Des2sHFaXubR+P4Q5hO
	xtk5gvGnXDcdH/Nly56w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8OQ-0007Iv-Kc; Thu, 14 May 2020 07:34:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8ON-0007I1-Pv; Thu, 14 May 2020 07:34:57 +0000
X-UUID: b17acf61df3048af9143edd2974d90aa-20200513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/nREqLi1Ldl8sd0riITmmpWJKuTNyeKnEZWI4u7Mg0Y=; 
 b=bg9Pgjd9KHnY+znNILPTWZKAHNkxlugL4jlyX1guMYRskgMMgE8jl+Z+r8xM7pRv1NEVrIcjRn4BqJf2uQJ1Au8l+So/+zDkV+X5uR+UqUo8X1Kc3UcAJ/01yUKgXKWHE887B4wOsDD4XISz7fjLG+OXJ+Kekile5fcawNQIdZk=;
X-UUID: b17acf61df3048af9143edd2974d90aa-20200513
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <min.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2071330438; Wed, 13 May 2020 23:34:51 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 00:34:46 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 May 2020 15:34:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 15:34:44 +0800
Message-ID: <1589441605.28160.27.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: musb: mediatek: add reset FADDR to zero in reset
 interrupt handle
From: Min Guo <min.guo@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Date: Thu, 14 May 2020 15:33:25 +0800
In-Reply-To: <1589428872-29282-1-git-send-email-macpaul.lin@mediatek.com>
References: <1589428872-29282-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3929ED25672ED9116AC7BC7CCB30D4C22ADBA5D38237F4E1188FC580E959644C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_003455_846515_6D66EAA0 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Macpaul Lin <macpaul.lin@gmail.com>, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-14 at 12:01 +0800, Macpaul Lin wrote:
> When receiving reset interrupt, FADDR need to be reset to zero in
> periphearl mode. Otherwise ep0 cannot do enumeration when re-pluging USB
> cable.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/usb/musb/mediatek.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
> index 6196b0e..eebeadd 100644
> --- a/drivers/usb/musb/mediatek.c
> +++ b/drivers/usb/musb/mediatek.c
> @@ -208,6 +208,12 @@ static irqreturn_t generic_interrupt(int irq, void *__hci)
>  	musb->int_rx = musb_clearw(musb->mregs, MUSB_INTRRX);
>  	musb->int_tx = musb_clearw(musb->mregs, MUSB_INTRTX);
>  
> +	if ((musb->int_usb & MUSB_INTR_RESET) && !is_host_active(musb)) {
> +		/* ep0 FADDR must be 0 when (re)entering peripheral mode */
> +		musb_ep_select(musb->mregs, 0);
> +		musb_writeb(musb->mregs, MUSB_FADDR, 0);
> +	}
> +
>  	if (musb->int_usb || musb->int_tx || musb->int_rx)
>  		retval = musb_interrupt(musb);
>  

Acked-by:Min Guo <min.guo@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
