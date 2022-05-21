Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B87C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 00:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQhZAFze8fNrzmeBsNlIYJ+l8AONblPMEsf+lmcjE7Y=; b=uSFD1j1fWZSJFe
	n3Z8ZKAe8BuKVyXW02JfXlmFcUTiHaQMxL7SpCMD2rUDhHoO9PyZW/GueIuX9VHMqzaZpQhuAuScw
	fJkHoQBG5jn93ngpe3BAApAvcEmPrqRcNofVC9Jpd2WSacIzR0rF+h0o+WGJaA3qIQBxs4ycGmzbv
	wxj9L9wYyPVgKB0DsddWvvLl3N3DptBeYSRtiZ9nl2MEoEf0AYF5Mdw7hj/0EMaufp22Wlmd0TW0L
	QuKIlB/JQxiSP9G0OIzOVQW/2A3WqKgf/YAePErUogEHqF4EoWACptbJZyKkmkPLPkVfp+7WJfh22
	qCkJXTuOHPMkQ40ut1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsD0l-00F2Rm-NS; Sat, 21 May 2022 00:30:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsD0a-00F2O6-Jh; Sat, 21 May 2022 00:30:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24FF7B82EBF;
 Sat, 21 May 2022 00:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A29B6C34119;
 Sat, 21 May 2022 00:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653093012;
 bh=romPb1m7BCaZKliDlGaR9szxJOdOcNEB+jJBTqlaxZM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Iaj2Smbi2urjtd4iTA6wKfARRCKtlZujdu7lKCLPtJVKhGBpvYDCQaeNUhXo7HuPS
 eGR/ZncPbvcLm7DAwJkyLmpydxG/S1h89mFotZ8Gmmq8ZoJ4Db3pVZ7eoR7XW3Nxhw
 J5gvXmHABvRsC/WtWm9QVH+RGoUPY1P5hl/HB3bflf94Hf2Xr0lH8uFAsmezDfK8Ya
 LEPp5vR/nUPutiXz0KCS4xtRo4hgBGQevbdjkiJpLiNUv1XNz/jEQn17QPChrgkN82
 DRbQp2qkJI2DR0yCb4bMZhBqxLb6rkV8H2yZJKlazYA0XMZejJW4lurrs6olrssVZv
 lzqtEKlce0yCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8CDD4F03935; Sat, 21 May 2022 00:30:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next v2] net: wwan: t7xx: use GFP_ATOMIC under spin lock
 in t7xx_cldma_gpd_set_next_ptr()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165309301257.22995.9619477553610888846.git-patchwork-notify@kernel.org>
Date: Sat, 21 May 2022 00:30:12 +0000
References: <20220519032108.2996400-1-yangyingliang@huawei.com>
In-Reply-To: <20220519032108.2996400-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 haijun.liu@mediatek.com, chandrashekar.devegowda@intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 davem@davemloft.net, kuba@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_173016_852708_6DF9AF29 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 May 2022 11:21:08 +0800 you wrote:
> Sometimes t7xx_cldma_gpd_set_next_ptr() is called under spin lock,
> so add 'gfp_mask' parameter in t7xx_cldma_gpd_set_next_ptr() to pass
> the flag.
> 
> Fixes: 39d439047f1d ("net: wwan: t7xx: Add control DMA interface")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next,v2] net: wwan: t7xx: use GFP_ATOMIC under spin lock in t7xx_cldma_gpd_set_next_ptr()
    https://git.kernel.org/netdev/net-next/c/9ee152ee3ee3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
