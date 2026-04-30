Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF35FF8875
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 01:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L31XZijdm8/CpLQjhyDooI3X/o2dKty09m+rp3Ms8g=; b=IzI45M/2gXVIlK6lh66FJe/DIM
	qaUNb7KX4/aEL4oGhhw15nhGwaEdLwjlXex2j/mN/PHplILw+eAUNaO3C4MMeSsp80NwBKs+Y2lKM
	TBmO24w+CCqBU193enDzxlHMyGHt2nkI7cukdUQZd/EuQuTZ5CBRr2tk4xSfeOv91E+paham9ZdvU
	0vL0EG8vNWqxhRvj3+EzzYhN7HJx1qopPAHqaqfONycMUcijodb7FodiCo3fBblRvMhJvJR9W3pd/
	lPdabVIwQrmrXF7Vv0C68nAYHl958zwYM/gnlriDn9QE8eFsztHD3UMDUItK4sw39Q9ihHLOES4Q5
	z87e00dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGOd-00000004O0Q-2qM8;
	Thu, 30 Apr 2026 01:40:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGOZ-00000004O00-1cyv;
	Thu, 30 Apr 2026 01:40:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AE7541A97;
	Thu, 30 Apr 2026 01:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165D8C19425;
	Thu, 30 Apr 2026 01:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777513250;
	bh=pADFW97s8ZAWiuq7aYrAylX+v7UiOD00KyYmiR8D28Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j8GGDnc2gQWvGdulSV0ssXIDv7sRTO/JReua58HqR2+xHmsKcLy+it/P8HMhtJ/sd
	 leSgJ9pdKTiyLgePIEk9PgCw9uDZlx6ZLxDh+5maD2tYJxmCU3j9aBnvFwN9ZjP0aX
	 mw3siJjChRI44qEMuXWzjs4TRzAyevZWsIWa3dvsxION2Ln1z83+av0EToJ7Yswwyt
	 XpJHhvxmZIptbvypf9z85WdYhb/h1maYlE0BPJvy3RAMMslo9nDofT2VOvrJx+NBnR
	 tpDAYe9X+BWA0tGJR8aSEAggVNxQsWxQRxrPO+oCbVzcSb/GBHwsnzbI3I9v89AytZ
	 /UIiz1QjRnZLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D0B63809A33;
	Thu, 30 Apr 2026 01:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Do not return err in ndo_stop() callback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177751320505.2255030.5166228559357523797.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 01:40:05 +0000
References: <20260428-airoha-ndo-stop-not-err-v1-1-674506d29a91@kernel.org>
In-Reply-To: <20260428-airoha-ndo-stop-not-err-v1-1-674506d29a91@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_184051_448332_726003BD 
X-CRM114-Status: UNSURE (   9.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 28 Apr 2026 08:53:16 +0200 you wrote:
> Always complete the airoha_dev_stop() routine regardless of the
> airoha_set_vip_for_gdm_port() return value, since errors from
> ndo_stop() are ignored by the networking stack and the interface is
> always considered down after the call.
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Do not return err in ndo_stop() callback
    https://git.kernel.org/netdev/net/c/4ca01292ea2f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



