Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7242AE7717D
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Dec 2024 02:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDjcta2qfx8Ux0Yv9mb+R7xPpsVsRCQFJ8h261SU9YM=; b=IYvYcQ184ywO6eWXm1ZfoiVbB4
	VoQaj0sHqULJH5LJn56Z78YpHu/LYGkKlayyRs2eX0el3uGnAxpfvzMkAYbL7SMLXPzejAjgDA8W1
	wnZteb0ejL3CVWCIpft0s2NIyYn/KK0aNjTEAGso5Tb91mwm0HeVqw6f0w1nFdWe6g8lxheYVRK/T
	24FrOuFLSySXJow01EKfB5MMHmV6Ge3NW8yvP2mJVPagm4gJFNYaJu8Q1nMtvbr+8gxpRNdol7HlP
	8qxz6eDM4b8O5/3NlFgWFoFXtvWk2Dr/Tt20RaNoyogVFoKAfFftGniG6pklu7W19v4HceOI9ZonC
	/iiy3LDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6bt-00000004h81-2EWL;
	Sun, 08 Dec 2024 02:01:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6ap-00000004h10-49vA;
	Sun, 08 Dec 2024 02:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D5E35C53F4;
	Sun,  8 Dec 2024 01:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D87C4CECD;
	Sun,  8 Dec 2024 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733623218;
	bh=FDvzHK5dr0tpZ+L52+096tJtxhwp4GWAM+rvod2xda4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RD8dCPQ5J1odGjPGgls5DBu+hsGTgAfj5IvKyNU7169S/rjTU72WfPpFb4oraxCo1
	 AtgjfXM4lAL3rbuzmrAu/wQaKfKAcGJYu9VCb1rurXpVRLO2g/InqFIBNXNRiHGXtR
	 4lI2Lgq1fKW+KhAWBXYW9DYk/7BNgrDnXQ4Tce8i2lpCNA5i7DoNNNBIdaUteqbg5j
	 L2rWXAaTsYTXpHFZ1W+8yf7ENC2oFcMZddyXf6avQEXyGpjmGEvguOhuWkLaOQ88gQ
	 C+hNUjTMe8df0uCC3mSs2tl4/8bUA4ONBPKb/fdPhFnhYxBc4MXZda/XLkKtqEU4K6
	 /jXtFz9xuK+uA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F6E380A95D;
	Sun,  8 Dec 2024 02:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: net: add negotiation of in-band
 capabilities (remainder)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173362323373.3131871.16932382585953200042.git-patchwork-notify@kernel.org>
Date: Sun, 08 Dec 2024 02:00:33 +0000
References: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
In-Reply-To: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, lynxis@fe80.eu,
 angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
 davem@davemloft.net, edumazet@google.com, ioana.ciornei@nxp.com,
 kuba@kernel.org, Jose.Abreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_180020_135332_2D105D1C 
X-CRM114-Status: GOOD (  10.31  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 5 Dec 2024 09:42:07 +0000 you wrote:
> Hi,
> 
> Here are the last three patches which were not included in the non-RFC
> posting, but were in the RFC posting. These add the .pcs_inband()
> method to the Lynx, MTK Lynx and XPCS drivers.
> 
>  drivers/net/pcs/pcs-lynx.c      | 22 ++++++++++++++++++++++
>  drivers/net/pcs/pcs-mtk-lynxi.c | 16 ++++++++++++++++
>  drivers/net/pcs/pcs-xpcs.c      | 28 ++++++++++++++++++++++++++++
>  3 files changed, 66 insertions(+)

Here is the summary with links:
  - [net-next,1/3] net: pcs: pcs-lynx: implement pcs_inband_caps() method
    https://git.kernel.org/netdev/net-next/c/6561f0e547be
  - [net-next,2/3] net: pcs: pcs-mtk-lynxi: implement pcs_inband_caps() method
    https://git.kernel.org/netdev/net-next/c/520d29bdda86
  - [net-next,3/3] net: pcs: xpcs: implement pcs_inband_caps() method
    https://git.kernel.org/netdev/net-next/c/484d0170d6c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



