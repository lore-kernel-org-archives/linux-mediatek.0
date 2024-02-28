Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B21C54E41
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 06:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HD0zE4WwXV05zQWxxZfx6jxbFthQaLxgUABnptEJEeA=; b=oB0dcg7p/D3cp75+ckVb836TLT
	in2+u38Vuxr0L5P5xLGDRC2cJsLAJrBiX+1MlWUWmKMeU8jppQSgM9iTkqheuNTyyShsua5kpzP1R
	qgSrZpFEQsjcaePPwxg5DrSKpzNBYCMyjzWV6lB1VCmFC5WV/HR14Y/JuS7Zx97JY1GSU3xYKrH/Z
	u6sf2jyW7EWu2wgyvT/odX6dqlGrXMG83karF0PjPxbT5CSbQqj44twzlHtkCGXz8vo54Ho1oKJpt
	xJvp8+cq6hznUJCDZanIelf5T+5PyMJTWlF5vKhz4nvkiKvI3CYXtuDTCz6fMc7Gs7DnAScBerrg/
	QUeisl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfD6f-0000000899H-0JL6;
	Wed, 28 Feb 2024 06:07:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfD6Z-0000000896T-31R8;
	Wed, 28 Feb 2024 06:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2FE6CE1F39;
	Wed, 28 Feb 2024 06:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA456C433F1;
	Wed, 28 Feb 2024 06:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709100461;
	bh=pxc2ZZ/jk0gXN4weRBL2NBBmdZRdQq6VWS7o4nzzuj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cEThuSc4bNSWeaQNmhTxul4sBIUSAjOLhwLIVZQ8rDxznqlEh7qxDnkWdPuHKXjX3
	 IzSDFNUcOLoqHSTBWL+gKNhteNEdU+KP/9Kz96z730FiC25sRVPDxac7huK+zXSFAb
	 cZfZ9xC+hPN94H+ZZGzItK60eCzrPL+m17Kv7Bgg=
Date: Wed, 28 Feb 2024 07:07:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Qingliang Li <qingliang.li@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Len Brown <len.brown@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] PM: wakeirq: fix wake irq warning in system suspend stage
Message-ID: <2024022829-ripple-quintet-a097@gregkh>
References: <20240228020040.25815-1-qingliang.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228020040.25815-1-qingliang.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_220748_188823_2C3CEEAF 
X-CRM114-Status: GOOD (  27.34  )
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

On Wed, Feb 28, 2024 at 10:00:40AM +0800, Qingliang Li wrote:
> When driver registers the wake irq with reverse enable ordering,
> the wake irq will be re-enabled when entering system suspend, triggering
> an 'Unbalanced enable for IRQ xxx' warning. The wake irq will be
> enabled in both dev_pm_enable_wake_irq_complete() and dev_pm_arm_wake_irq()
> 
> To fix this issue, complete the setting of WAKE_IRQ_DEDICATED_ENABLED flag
> in dev_pm_enable_wake_irq_complete() to avoid redundant irq enablement.
> 
> Fixes: 8527beb12087 ("PM: sleep: wakeirq: fix wake irq arming")
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
> ---
>  drivers/base/power/wakeirq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/power/wakeirq.c b/drivers/base/power/wakeirq.c
> index 42171f766dcb..5a5a9e978e85 100644
> --- a/drivers/base/power/wakeirq.c
> +++ b/drivers/base/power/wakeirq.c
> @@ -313,8 +313,10 @@ void dev_pm_enable_wake_irq_complete(struct device *dev)
>  		return;
>  
>  	if (wirq->status & WAKE_IRQ_DEDICATED_MANAGED &&
> -	    wirq->status & WAKE_IRQ_DEDICATED_REVERSE)
> +	    wirq->status & WAKE_IRQ_DEDICATED_REVERSE) {
>  		enable_irq(wirq->irq);
> +		wirq->status |= WAKE_IRQ_DEDICATED_ENABLED;
> +	}
>  }
>  
>  /**
> -- 
> 2.25.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:


- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

