Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558CDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONql9mpnbbbdi74IXVllA3Ms8Ihtp2qu428wq8jZmxk=; b=heo6vIOz/s4Gdq
	ERm/KaEGtE7WoMJllaYX9p+Ix1c2Xd/ZB4QMgjmJEZ/xXKowTLizQIusCQOWtfvSsklyu3GdjcSYM
	JzedlJo1+HWNxHgKSzXwPEqh43BF8ZmYcgJDPghC6tPK9sogR3fQCCJ93r27gZCxY1jMlmqe8qyFH
	o33CAh/KHyfvbxta6Du/yWWpjfMDiRvN/+7oxEs+6AyhgFmGAgRSobYzctZRSuVf875mmZyzM3lfq
	1ZZQ9ep4HYeWalf8UJJmCNArj2MiJHSHAJJ0tiUAKHqow/Ks0lsECYDzRjGpn8rBGLfnR5uLCQOQ9
	2RhK9L3YJxVqyzZha3ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myHcm-00BfPX-OE; Fri, 17 Dec 2021 18:06:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myGVX-00BIIR-8J; Fri, 17 Dec 2021 16:55:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ADF2262309;
 Fri, 17 Dec 2021 16:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89721C36AE7;
 Fri, 17 Dec 2021 16:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1639760098;
 bh=35R/DOnfqARo0hvx3JTyLxO4xZ9BgeHF7T8etQNvDHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hWMpmgB68DIatvPYkqYjULgyZgpZm/WMp4eE8rqINzZ9/bAyqsTC1Jl9h7QmBDiEk
 Bx5OBzIg5HSwgc9C4DkLm/LrO2pg18GadbSWqiO8QSR5tfTr6PfiY9NXHhXoqBgT2T
 grrlMhwcyRuarrxfW0fDVXPEpigZiFUYtU2L3ZBg=
Date: Fri, 17 Dec 2021 17:54:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] serial: 8520_mtk: Prepare for
 platform_get_irq_optional() changes
Message-ID: <YbzA3y5jp5K5zL/+@kroah.com>
References: <20211217151034.62046-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217151034.62046-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_085459_398323_10698F5A 
X-CRM114-Status: GOOD (  22.34  )
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

On Fri, Dec 17, 2021 at 05:10:34PM +0200, Andy Shevchenko wrote:
> The platform_get_irq_optional() is going to be changed in a way
> that the result of it:
>    = 0 means no IRQ is provided
>    < 0 means the error which needs to be propagated to the upper layers
>    > 0 valid vIRQ is allocated

What about 0 being a valid irq?

> In this case, drop check for 0. Note, the 0 is not valid vIRQ and
> platform_get_irq_optional() issues a big WARN() in such case,

But it still is a valid irq, so why did you just break things?  Yes, a
warning will happen, but the driver and platform will still work.

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/tty/serial/8250/8250_mtk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index fb65dc601b23..8d3e16d7bf63 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -641,7 +641,7 @@ static int __maybe_unused mtk8250_resume(struct device *dev)
>  	struct mtk8250_data *data = dev_get_drvdata(dev);
>  	int irq = data->rx_wakeup_irq;
>  
> -	if (irq >= 0)
> +	if (irq > 0)
>  		disable_irq_wake(irq);

Why change this now?  What does this solve at this point in time?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
