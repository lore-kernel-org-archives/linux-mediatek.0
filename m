Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40D7C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEOwRF5C9UELlZWfzUs2zHMWHnAILLKme6peDZHOrvg=; b=LrgeILABW9nEQHA1Jk2xGUsPb2
	HtXTS2QLr54ElY3Vx+zSMrWOB+lTDZM6xPStT1X/PatD1TLAM8GSwBiumV5WC+H/sI+k4BMy7xMrz
	zXrtGu873mMvz0bh31GEnguT8fPNk4Vpip7MOIhprSZ9Z23uwRzNgHJOcJ5LM/VhCUTY/LS3v2FZd
	6T9uk6HgNdr2vPr0GptDQPDSadYuj1OeQ6tWuQu9DblPWRY4R9KAINcQ6SQUVzYb9DgySsekS6fi6
	eCQ86c3mFGui1A61QRzIKCFqSkBhopGxPU3Jl2cAN05oYi+wS4ECqYMAcWaTas1BNI+Xj1Rs41lxI
	3VG0zOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYb0-00FK3V-1B;
	Fri, 08 Dec 2023 11:00:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYav-00FJzz-31;
	Fri, 08 Dec 2023 11:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 28E11CE26CE;
	Fri,  8 Dec 2023 11:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54E74C433C8;
	Fri,  8 Dec 2023 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702033225;
	bh=1L3W0Olv+R+kHzOLiJnr1tgIjD7V5hrXUJRJcLy2Pb8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VEzPH/rCT0ANk+4UUjvCU1rO1UprgeFQBr0nGUZP1RWomNYrfR8kgoFGuq04gfnqW
	 0ydoitXLAhaANSZQQhMEpVgvAj0n9PFVJ27TXSw6o0bxn980ZNTbu8PdD8ZguRFSXh
	 O47aTfET1burDw4ZGz9Fu9f32nVVNGoY7vyFXl7YChbkCPFlSeOXmUW2wQEE29xXbw
	 NyAMkTsXQVCRNum1prPdPUDNkEZu6tSU7YY50aS7XfiTa3goiime8PYZ40zhjUUmTf
	 6qVTycbXIuTvn8oghp4WgPu6nz1XSp4ElOvhqdpP0Xep7yVbPjeIHGY7Bb49tmMaUo
	 tyqWXix93P1VA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30F8DDD4F1E;
	Fri,  8 Dec 2023 11:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/3] ethtool: Add ethtool_puts()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170203322519.25632.13162024419836426102.git-patchwork-notify@kernel.org>
Date: Fri, 08 Dec 2023 11:00:25 +0000
References: <20231206-ethtool_puts_impl-v5-0-5a2528e17bf8@google.com>
In-Reply-To: <20231206-ethtool_puts_impl-v5-0-5a2528e17bf8@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shayagr@amazon.com, akiyano@amazon.com,
 darinzon@amazon.com, ndagan@amazon.com, saeedb@amazon.com, rmody@marvell.com,
 skalluru@marvell.com, GR-Linux-NIC-Dev@marvell.com, dmichail@fungible.com,
 yisen.zhuang@huawei.com, salil.mehta@huawei.com, jesse.brandeburg@intel.com,
 anthony.l.nguyen@intel.com, louis.peens@corigine.com, shannon.nelson@amd.com,
 brett.creeley@amd.com, drivers@pensando.io, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 doshir@vmware.com, pv-drivers@vmware.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, hauke@hauke-m.de,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 arinc.unal@arinc9.com, daniel@makrotopia.org, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linus.walleij@linaro.org,
 alsi@bang-olufsen.dk, wei.fang@nxp.com, shenwei.wang@nxp.com,
 xiaoning.wang@nxp.com, linux-imx@nxp.com, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, jiawenwu@trustnetic.com,
 mengyuanlou@net-swift.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, ndesaulniers@google.com, nathan@kernel.org,
 keescook@chromium.org, intel-wired-lan@lists.osuosl.org,
 oss-drivers@corigine.com, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_030034_332484_0F98A467 
X-CRM114-Status: UNSURE (   8.29  )
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

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 06 Dec 2023 23:16:09 +0000 you wrote:
> Hi,
> 
> This series aims to implement ethtool_puts() and send out a wave 1 of
> conversions from ethtool_sprintf(). There's also a checkpatch patch
> included to check for the cases listed below.
> 
> This was sparked from recent discussion here [1]
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/3] ethtool: Implement ethtool_puts()
    https://git.kernel.org/netdev/net-next/c/2a48c635fd9a
  - [net-next,v5,2/3] checkpatch: add ethtool_sprintf rules
    https://git.kernel.org/netdev/net-next/c/9b5f621cea6e
  - [net-next,v5,3/3] net: Convert some ethtool_sprintf() to ethtool_puts()
    https://git.kernel.org/netdev/net-next/c/e403cffff1a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



