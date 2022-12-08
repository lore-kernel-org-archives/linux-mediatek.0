Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD769C3A5A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JObJ2+xpg2tdJAF9J2x/Khvs7Pwq6QVfcYAFf9fRHjY=; b=ob44CbA+jCapyCwiXBkh54f7tt
	44p6ZrGTajcqzbL/RT2SgZkapZZiifIseHERO6+8ruwgcjcqb01NKOS9OPyylVysCOe0gQfyqdMkh
	Ra/Yb4oaEZ7LIAIaC69UqKhNYXdMEhn7pwRsNnx2R/3VjwvGSOLNQIl86vy8258WdrMc2wMKCFkF8
	JTVIXpDCK3AFJVNaLXcpRf1Ivs+NHpexHzFdfmjO1rLMdlTstrYToSefjcjRB25r+eUVN3UfamMj4
	1M2iKqFs2C9KO0G9A22h90AjI21DtaRuLIWEwk/o9fEBE9FGIX/wSlxWI4STH06CKUKa77AGaUAow
	3DpDEhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ixw-003jiX-1D; Thu, 08 Dec 2022 15:37:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ixc-003j8K-PT; Thu, 08 Dec 2022 15:37:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 84896B822E6;
	Thu,  8 Dec 2022 15:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8589C433D6;
	Thu,  8 Dec 2022 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670513837;
	bh=fT0IjqTMxFzX+YMMLQ3B66lyktKJPjkCFM8yEgHLOZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y80fjk7U86gQudJDLL4Camf9NNuasvyzkLzvARJKN8g7HO+KwKAWwPM0tfw4Gzisp
	 BBB9M2Wshrw9/I4xV8PCgRWVFoY0OX94CokjvRS49TgNKmTkCDhcXBhEkZp288ptq+
	 swCIN1t3tZluJcMwrz3Qajhlqy5DcLv/CUcVJww4=
Date: Thu, 8 Dec 2022 16:37:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] usb: mtu3: fix sleep-in-atomic-context bug caused by
 usleep_range()
Message-ID: <Y5IEqo8EeDiBnzwM@kroah.com>
References: <20221128063207.100596-1-duoming@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128063207.100596-1-duoming@zju.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_073721_015008_63222B94 
X-CRM114-Status: GOOD (  21.71  )
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

On Mon, Nov 28, 2022 at 02:32:07PM +0800, Duoming Zhou wrote:
> The function zero_autoresume() is a timer handler that runs in
> atomic context. It is used to wake up the host connected to the
> gadget. when used by usb mtu3, the zero_autoresume() calls
> usleep_range() that can sleep. As a result, the sleep-in-atomic-
> context bug will happen. The process is shown below.
> 
>     (atomic context)
> zero_autoresume()
>   usb_gadget_wakeup()
>     mtu3_gadget_wakeup()
>       usleep_range() //sleep
> 
> This patch changes usleep_range(10000, 11000) to mdelay(10)
> in order to mitigate the bug.
> 
> Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>  drivers/usb/mtu3/mtu3_gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
> index 80236e7b089..e366c4a97d7 100644
> --- a/drivers/usb/mtu3/mtu3_gadget.c
> +++ b/drivers/usb/mtu3/mtu3_gadget.c
> @@ -468,7 +468,7 @@ static int mtu3_gadget_wakeup(struct usb_gadget *gadget)
>  	} else {
>  		mtu3_setbits(mtu->mac_base, U3D_POWER_MANAGEMENT, RESUME);
>  		spin_unlock_irqrestore(&mtu->lock, flags);
> -		usleep_range(10000, 11000);
> +		mdelay(10);
>  		spin_lock_irqsave(&mtu->lock, flags);
>  		mtu3_clrbits(mtu->mac_base, U3D_POWER_MANAGEMENT, RESUME);
>  	}
> -- 
> 2.17.1
> 

Have you tested this on real hardware?  How come the original code does
not trigger any run-time warnings?  Does your change solve the runtime
issue?

thanks,

greg k-h

