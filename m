Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0799C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DBGqdSzjllo0Rs4ppSVIqyB7RYR71PJdwUXcNcFDcg=; b=MgfZyGvICZGOM+9aLM7Eu0xvgG
	TrLyGmFsNnKCRqdneYV+1sHKG1wLpWE7cYqq7k88IAmMXm+WUmeXpc95FyL1y1yMXtopbyKi5xvFc
	vb8gkCdRPoBX3JfVKtYyMzPCRH1L20r8bDauvv2STZbD60saIX/hxCRWvN6AHIuHTraWsQwFHnHq7
	S0y/jXXKVnslgASmbMCpQRGv1KXPJgqvldYnJ4NOC/xn82Xx9xgemunrWzPH/DaxjXqrx9WwoyRcd
	X/+ZB7LXi8JQAZmxGwvEE60E3L0cYXYSXDvwLH8odk/SSUo6JDIaNq+dN5iHPJVOTLRiO8bjxTwY6
	R0Sy+new==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNgh6-00HCWA-Ly; Thu, 02 Feb 2023 21:00:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNggw-00HCTq-3u; Thu, 02 Feb 2023 21:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22F3D61C0A;
	Thu,  2 Feb 2023 21:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80966C4339B;
	Thu,  2 Feb 2023 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675371618;
	bh=GKyRb/OSr7qk+73H0dw82Jo80xmQ59n36CiaFi8Yko4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RkZRIZqw7+QnrWQkR5RztulQAcFRdPmCVZAi8Mx3mY7q8QMFOyOym1RSgIP3Q1QwY
	 RRZeEZ8018XqxTnUR2Y7evyVEOcpu50eNIQCEQW/6Fc3TMQPYMaQJpXKfAygZa6lGf
	 +ivjVSTKJjcjjeGTjeh+a+8qlpqm7/271y++e1P0USS+UWkNejumgNQQ2eZDDrmCaN
	 4cOFTNXImIfFAqp8AjcyKM0ZQ6AabaWMViIKPKNgdAkIa08BATALIPbx7LBWw0BKNb
	 5mvPDpSLWhJwyWmd8OIq4YlvInkS/P720omv3KbVgcKFH1SV5wL9IqwE02HJv1M4oj
	 1D+x7ldz10nQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E69FE50D67;
	Thu,  2 Feb 2023 21:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 net 0/3] fixes for mtk_eth_soc
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167537161838.31793.11989786394773759034.git-patchwork-notify@kernel.org>
Date: Thu, 02 Feb 2023 21:00:18 +0000
References: <20230201182331.943411-1-bjorn@mork.no>
In-Reply-To: <20230201182331.943411-1-bjorn@mork.no>
To: =?utf-8?b?QmrDuHJuIE1vcmsgPGJqb3JuQG1vcmsubm8+?=@ci.codeaurora.org
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
 linux@armlinux.org.uk, daniel@makrotopia.org, lynxis@fe80.eu,
 simon.horman@corigine.com, pabeni@redhat.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, matthias.bgg@gmail.com,
 opensource@vdorst.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_130022_212514_BD81E453 
X-CRM114-Status: GOOD (  10.57  )
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

This series was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  1 Feb 2023 19:23:28 +0100 you wrote:
> Changes since v4:
>  - use same field order for kernel-doc and code in patch 1
>  - cc'ing full maintainer list from get_maintainer.pl
> 
> Changes since v3:
>  - fill hole in struct mtk_pcs with new interface field
>  - improved patch 2 commit message
>  - added fixes tags
>  - updated review tags
> 
> [...]

Here is the summary with links:
  - [v5,net,1/3] net: mediatek: sgmii: ensure the SGMII PHY is powered down on configuration
    https://git.kernel.org/netdev/net/c/7ff82416de82
  - [v5,net,2/3] net: mediatek: sgmii: fix duplex configuration
    https://git.kernel.org/netdev/net/c/9d32637122de
  - [v5,net,3/3] mtk_sgmii: enable PCS polling to allow SFP work
    https://git.kernel.org/netdev/net/c/3337a6e04ddf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



