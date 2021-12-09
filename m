Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474ACC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PpNdu3Rq7c6kD+rR4iRpnvEfHKFAgNkSYCwoRClW3M=; b=RJ4sgNMbhbAlkL
	h92slPQ+NcgyWGgDdS1mTZ5WXL9VWkLv86LGrixu4eswk02UlM8khsQwJ/l+ZLjmhAR6foD5WWCs8
	XP86QcppkkrQoMILIeby8ZOMm2pAMdGovcwlZi5HkEL7OXK2zMGDmei/7t6ZOratKOV2IAkVX1RSh
	Zj7ExjfjPl6kdlVKqe8LRDccg8wkeU3ioaK7oc0nfwQvrJ9pOYejXKgLJbuUonxHCEdkFZihXQP7/
	EkEUw8UWlx4XHyARyCT3GLFLQOwXOlwPBpuHH8x7tZjzSp9CwtOyTnUjkuAfGE0VX3gSbFy4gDMis
	EJjtZHSwZ1KN9frVOMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvPas-00HPip-AE; Thu, 09 Dec 2021 20:00:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvPaR-00HPTx-UL; Thu, 09 Dec 2021 20:00:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0AB6B82649;
 Thu,  9 Dec 2021 20:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B9C3C341C6;
 Thu,  9 Dec 2021 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639080011;
 bh=YnNs7az/qTTbTLdtsHA8c/HDbey3m6k2oXgBT+NTBFw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oEA35apeb4ygwrav4LktCYXYpdLrcRQuszi7HvgSlZdrgPdftOEJ5lJsGsd68cWz9
 ofWOMOv9qLH7AllRNig+azGSa9oeNMy8rNk8H+922MbbkQvT7m//GtGRF3VV1VdPDb
 gjZClzsfppPYtkfOoiuXdAjduGbFp1YZK+MBaCYnyPXaD05BS4YiV2o7XrTYbkQDlE
 0otExP+lEsis0qap8T++LseXMRVDLyQxqQL3qIb+jK6Y2ngx2GvV2m6MvjfzVJ8wxN
 pymkW82fut+HUW/nk04JfF34pnZeJjys/Qe5WIHiZ9lZ2qMGEaiZyc6FN9yJYm09yR
 l8QG9bC9jj5jA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 466E960A37;
 Thu,  9 Dec 2021 20:00:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/5] net: phylink: add legacy_pre_march2020
 indicator
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163908001128.24516.3335515439099109879.git-patchwork-notify@kernel.org>
Date: Thu, 09 Dec 2021 20:00:11 +0000
References: <E1mucmf-00EyCl-KA@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1mucmf-00EyCl-KA@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: chris.snook@gmail.com, nbd@nbd.name, f.fainelli@gmail.com,
 john@phrozen.org, Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_120016_160593_89702302 
X-CRM114-Status: GOOD (  13.09  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 07 Dec 2021 15:53:37 +0000 you wrote:
> Add a boolean to phylink_config to indicate whether a driver has not
> been updated for the changes in commit 7cceb599d15d ("net: phylink:
> avoid mac_config calls"), and thus are reliant on the old behaviour.
> 
> We were currently keying the phylink behaviour on the presence of a
> PCS, but this is sub-optimal for modern drivers that may not have a
> PCS.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: phylink: add legacy_pre_march2020 indicator
    https://git.kernel.org/netdev/net-next/c/3e5b1feccea7
  - [net-next,2/5] net: dsa: mark DSA phylink as legacy_pre_march2020
    https://git.kernel.org/netdev/net-next/c/0a9f0794d9bd
  - [net-next,3/5] net: mtk_eth_soc: mark as a legacy_pre_march2020 driver
    https://git.kernel.org/netdev/net-next/c/b06515367fac
  - [net-next,4/5] net: phylink: use legacy_pre_march2020
    https://git.kernel.org/netdev/net-next/c/001f4261fe4d
  - [net-next,5/5] net: ag71xx: remove unnecessary legacy methods
    https://git.kernel.org/netdev/net-next/c/11053047a4af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
