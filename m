Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AB5C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:00:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 381AF206FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 15:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bUkV/yYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 381AF206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0tU0HKBsZYGk3V3NuK5rRz3EDB2tpZt/slbwyCwPjQw=; b=bUkV/yYcKJA3n503gAV2G1K7H
	6aMPrPZJzs13vVhobv6gTJBDPPNiImzRCMMvMXRzMziI6KJDmv18fA3S8xMRnmwjA4Jm86k84AHF3
	7EKbhSN7JtBG3pa0eet9/EFFPtmlIjlKQ7euXgFLSteIfdgm+tosO70OgR2SfPUnFO564Q1WwaXoz
	/FeL/p2xVOsvbr6sGyn3qKDSQdAxBdEI6+3FSiA+Uuzuld5yniyPk8PeG7mKP0ecKnIpR/6n05N/l
	ydDLHnBGaJSe3yoC8HeZO6wAjpe6GFV/HVucSG61fQBMtf3IdS/rbZ77Wk98/CabErzqt8kCpDXN4
	9C+ZPU1Qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8PZZ-0001H3-0j; Wed, 19 Aug 2020 15:00:17 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by merlin.infradead.org with smtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8PZJ-00019L-6Z
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 15:00:08 +0000
Received: (qmail 183296 invoked by uid 1000); 19 Aug 2020 10:59:57 -0400
Date: Wed, 19 Aug 2020 10:59:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 10/10] usb: udc: net2280: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200819145957.GA183103@rowland.harvard.edu>
References: <1597840865-26631-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597840865-26631-10-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597840865-26631-10-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_110001_503028_8C29A7BE 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 08:41:05PM +0800, Chunfeng Yun wrote:
> Use readl_poll_timeout_atomic() to simplify code
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/gadget/udc/net2280.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
> index 7530bd9..f1a21f4 100644
> --- a/drivers/usb/gadget/udc/net2280.c
> +++ b/drivers/usb/gadget/udc/net2280.c
> @@ -52,6 +52,7 @@
>  #include <linux/usb/gadget.h>
>  #include <linux/prefetch.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  
>  #include <asm/byteorder.h>
>  #include <asm/irq.h>
> @@ -360,18 +361,16 @@ static inline void enable_pciirqenb(struct net2280_ep *ep)
>  static int handshake(u32 __iomem *ptr, u32 mask, u32 done, int usec)
>  {
>  	u32	result;
> +	int	ret;
>  
> -	do {
> -		result = readl(ptr);
> -		if (result == ~(u32)0)		/* "device unplugged" */
> -			return -ENODEV;
> -		result &= mask;
> -		if (result == done)
> -			return 0;
> -		udelay(1);
> -		usec--;
> -	} while (usec > 0);
> -	return -ETIMEDOUT;
> +	ret = readl_poll_timeout_atomic(ptr, result,
> +					((result & mask) == done ||
> +					 result == U32_MAX),
> +					1, usec);
> +	if (result == U32_MAX)		/* device unplugged */
> +		return -ENODEV;
> +
> +	return ret;
>  }
>  
>  static const struct usb_ep_ops net2280_ep_ops;
> -- 

Acked-by: Alan Stern <stern@rowland.harvard.edu>

However, I noticed that the kerneldoc for readl_poll_timeout_atomic() is 
out of date.  Can you fix it up?

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
