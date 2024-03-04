Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC40C54E4A
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAJU10U8B3InhZuEy6qYZCmOmzZyJA4v9LJUbKuqJmE=; b=eq9qVNLSNMiIhJzapXOM1vPx96
	Be5Px3RlLx1+ND53sPswFTe+VHItqX6zXmdU3tSSDIiPugmIc5uA6SyfYlcCghIpzbQiOfoOjHTWO
	YalC7w9rn/S9iAB8fDnayowNFYEUSJEuGw4xYVnHAx24p3K2OBkqhGUQUemfTgWNIpUnqGZ92JmZi
	pgxQeUmKINVzbQZKIhfK+gIfBy81o/gy6FgGrb0eWUhx/73W3tOlslQBalqjw5e+PAZJJFUq8Yi/+
	Z/ACt04gvKXkPNlIaXux22Smv5LmvUySnEGpYhxT6IZC0e5rA8+2vXqI9kEt/mH7YOnSdUnQF3M+H
	YAMlYfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA5x-00000009YSx-1NjV;
	Mon, 04 Mar 2024 15:19:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA5t-00000009YQp-04WF;
	Mon, 04 Mar 2024 15:19:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0C422CE1393;
	Mon,  4 Mar 2024 15:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A508C433C7;
	Mon,  4 Mar 2024 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709565546;
	bh=QR5PaUloC2glE+RawDBmkFXBJ+lOR6RPDaFaRyQRbV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MA+XVt8bw4FeD+KfDJ6Gb8c1VkRZlvxZ95p7aFH1YyRpPYlCDdexNW6rHwG+cLsw4
	 UWwG/OwbkC4K4xFL7eylA0Jyg9tdoN4OvrJL0z6GUncK5M4fAbR5picEBJvwWmKA8F
	 fvQedPfnkSU6GKqp0QgBgH+S+ecLFl0GexCrnWRC/Hb2rgGtZLQWVp8/oVs9U9wtnM
	 5Jq/sCf4hW8H36C/0LXkMU7ZPOEP3sqiC7vIXuDz1MtdatmCDhEegbFA98U8GAIFaL
	 Bu1RZ7QpF7g/2ur3CH1cDYligyLpg+9/HoUXdCkCdW1uo0gT+0dX5JRjzbnmLxEwv+
	 LKqmHv4f64bEQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rhA5y-000000001Jq-1OB2;
	Mon, 04 Mar 2024 16:19:14 +0100
Date: Mon, 4 Mar 2024 16:19:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Qingliang Li <qingliang.li@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Len Brown <len.brown@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v2] PM: sleep: wakeirq: fix wake irq warning in system
 suspend
Message-ID: <ZeXmcl4ngEm1RccW@hovoldconsulting.com>
References: <20240301092657.15528-1-qingliang.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301092657.15528-1-qingliang.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_071909_265535_19463D26 
X-CRM114-Status: GOOD (  12.73  )
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

On Fri, Mar 01, 2024 at 05:26:57PM +0800, Qingliang Li wrote:
> When driver uses pm_runtime_force_suspend() as the system suspend callback
> function and registers the wake irq with reverse enable ordering, the wake
> irq will be re-enabled when entering system suspend, triggering an
> 'Unbalanced enable for IRQ xxx' warning. In this scenario, the call
> sequence during system suspend is as follows:
>   suspend_devices_and_enter()
>     -> dpm_suspend_start()
>       -> dpm_run_callback()
>         -> pm_runtime_force_suspend()
>           -> dev_pm_enable_wake_irq_check()
>           -> dev_pm_enable_wake_irq_complete()
> 
>     -> suspend_enter()
>       -> dpm_suspend_noirq()
>         -> device_wakeup_arm_wake_irqs()
>           -> dev_pm_arm_wake_irq()
> 
> To fix this issue, complete the setting of WAKE_IRQ_DEDICATED_ENABLED flag
> in dev_pm_enable_wake_irq_complete() to avoid redundant irq enablement.
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Thanks for the fix. Looks correct to me:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

I think you should add back the Fixes tag from v1 and CC stable as well:

Fixes: 8527beb12087 ("PM: sleep: wakeirq: fix wake irq arming")
Cc: stable@vger.kernel.org      # 5.16

Note that WAKE_IRQ_DEDICATED_REVERSE was added in 5.16 by commit
259714100d98 ("PM / wakeirq: support enabling wake-up irq after
runtime_suspend called") so no need to try to backport any further than
that.

Johan

