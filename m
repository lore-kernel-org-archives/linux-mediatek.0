Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B03CD5BA2
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQ50/fWgtu5qyLt6MBkaon6b+fBegEvbVgDEsW5QyH8=; b=qn3cTlJip0M1dsr1s2syYavO21
	yxdi6/r88+sX3nXev6xby1m3QzuYrfdj+W6O66aRv0S775cOJUiiiKX2ogMbbs4vlkvmKb3mcfWKN
	BjeONzY48k2RxXr8tXLVmgUCp1IP2mo75z8Z7My4qlRQdKjQmFtRh9QQbJs9pnQVavLR582HR89wn
	q/AFbVgHnyb4hsdxdsHu8yM5vor/pMOEvrpPuJaUEbT4AptVm3+d5tG1XmUl+KEousguh/G7A++D8
	rtxIceqNwnLLpJjbU59hrVQYneDmR6wL2BX95DH2pmgfXzpptBTPqd39Y1sJq3AZXAa9ZABlabWxR
	zSxXnyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8xo-00000007nvg-1oVJ;
	Thu, 05 Sep 2024 09:39:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8wp-00000007nqt-23cA;
	Thu, 05 Sep 2024 09:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9784EA44185;
	Thu,  5 Sep 2024 09:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB646C4CEC3;
	Thu,  5 Sep 2024 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725529117;
	bh=05nyWH3zDvfgm6No8VHxM0pYql7MSg6Js/yn8Qs8Bsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fP77nZHLAPM6ZraNGGjZbGuTz5aW+cgt66qS0Q97+Ej12U+wAZHbDWQYMZwKtfHvT
	 CIAqs3MPtvBPjjyoCNWsruuB5ObjjLnHBvK4K84jXwVoWnO7h5ie3pslleb36+JKaq
	 uBnTa+1sCNpgiFe7AJ63t2kq53dlraXadpB2ASMo=
Date: Thu, 5 Sep 2024 11:38:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yenchia Chen <yenchia.chen@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, len.brown@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	matthias.bgg@gmail.com, pavel@ucw.cz, rafael.j.wysocki@intel.com,
	rafael@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 6.6 1/1] PM: sleep: Restore asynchronous device resume
 optimization
Message-ID: <2024090534-footage-player-10e5@gregkh>
References: <2024090420-protozoan-clench-cca7@gregkh>
 <20240905093433.4798-1-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905093433.4798-1-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_023839_635414_42C33EEE 
X-CRM114-Status: GOOD (  27.95  )
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

On Thu, Sep 05, 2024 at 05:34:33PM +0800, Yenchia Chen wrote:
> >> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> >> 
> >> commit 3e999770ac1c7c31a70685dd5b88e89473509e9c upstream.
> >> 
> >> Before commit 7839d0078e0d ("PM: sleep: Fix possible deadlocks in core
> >> system-wide PM code"), the resume of devices that were allowed to resume
> >> asynchronously was scheduled before starting the resume of the other
> >> devices, so the former did not have to wait for the latter unless
> >> functional dependencies were present.
> >> 
> >> Commit 7839d0078e0d removed that optimization in order to address a
> >> correctness issue, but it can be restored with the help of a new device
> >> power management flag, so do that now.
> >> 
> >> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> >> Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
> >> ---
> >>  drivers/base/power/main.c | 117 +++++++++++++++++++++-----------------
> >>  include/linux/pm.h        |   1 +
> >>  2 files changed, 65 insertions(+), 53 deletions(-)
> 
> >Why does this need to be backported?  What bug is it fixing?
> 
> >confused,
> 
> >greg k-h
> 
> Below is the scenario we met the issue:
> 1) use command 'echo 3 > /proc/sys/vm/drop_caches'
>    and enter suspending stage immediately.
> 2) power on device, our driver try to read mmc after leaving resume callback
>    and got stucked.
> 
> We found if we did not drop caches, mmc_blk_resume will be called and
> system works fine.
> 
> If we drop caches before suspending, there is a high possibility that
> mmc_blk_resume not be called and our driver stucked at filp_open.
> 
> We still try to find the root casue is but with this patch, it works.

I think you are getting lucky as this is just changing the order in
which things are suspending.  Please find and fix the root problem.

> Since it has been merged in mainline, we'd like to know it is ok to merge to stable.

It changes the behavior of the system overall, and doesn't really fix a
bug on its own, so I don't want to, sorry.

Please find the real problem in your driver, or the mmc subsystem.

thanks,

greg k-h

