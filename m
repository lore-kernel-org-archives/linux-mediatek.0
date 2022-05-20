Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B18C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 01:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhdgOktrYXC8btLWbbv4oCLnwHmrgZ/kr/RZhIWCWME=; b=XfCQRs4yNwz5DH
	p9CFBXQAp1hQVGi7Za2hwHe+oVlaKL7+lbh6UBeTMEG2xgrhLUDE/57ybRBkRTPBtYdaj3rsSUJ+h
	zUuCIk/fwigeyJc77J3N3QYFzyeu2+DzD4jMZtkpTXQ5Xm0cL1Q9RqT+6jo9JUTo9r2aHI1KF+RSs
	B3UGtFKOL77gw6pJX/APRAvcthAzAN1PlkUPpMXgJ6ewsvTLxUGuspv/kUq6DCYJNgHB1fXeFYWrB
	RDTyTwcuek8A7e/skmsGsjKHvwUtTuAzKh3n+SzmNGiQU8EwilrGRaf3ZwrYYqinF4mp2MaWmjcTw
	JutoAPMvceys7wXfeYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrrJc-009wAb-Li; Fri, 20 May 2022 01:20:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrrJR-009w8p-Uv; Fri, 20 May 2022 01:20:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7647CB829B8;
 Fri, 20 May 2022 01:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E394C34114;
 Fri, 20 May 2022 01:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653009614;
 bh=6L9CqSKX6VWY4LurBhFqahVRnv4+eVItjVSEjLf4Jhw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=txMQLsn1wTkzsH5xvl4Xh4UVJrgXNrBpu5AvchCo/6wDAMtNIto6H/weAiyZVNjHq
 Y5+56GS/TWFHwjiiEaDiVaTEZ7aOaB+AgsvgE7zO69nQEAX/UlgGfJobc2PHy9gIlE
 pEb7rzlMiEfPYI/3zK+UatJJkPE7BeCueEHHUdrmPvK74nDPudjwe2KNyzNZIHDicE
 /QoLOGwJ77ILZ6IDokzdFO8frwrMA3gkPEi1IL8rTMaG1XptfvDItczf0Z2YHGmavu
 TqQUGZKZvHKozYm97tykWrU0pgKNTaI0OkkW9VVF/MzijcXN7DlBrJBykeRFMkavWq
 TJshXph0o6JbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1360AF03935; Fri, 20 May 2022 01:20:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next 00/12] mtk_eth_soc phylink updates
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165300961407.24775.3678775138075397311.git-patchwork-notify@kernel.org>
Date: Fri, 20 May 2022 01:20:14 +0000
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: davem@davemloft.net, kuba@kernel.org, kabel@kernel.org, nbd@nbd.name,
 john@phrozen.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mark-MC.Lee@mediatek.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 sean.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_182018_337522_BE20D736 
X-CRM114-Status: GOOD (  14.22  )
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

On Wed, 18 May 2022 15:53:19 +0100 you wrote:
> Hi,
> 
> This series ultimately updates mtk_eth_soc to use phylink_pcs, with some
> fixes along the way.
> 
> Previous attempts to update this driver (which is now marked as legacy)
> have failed due to lack of testing. I am hoping that this time will be
> different; Marek can test RGMII modes, but not SGMII. So all that we
> know is that this patch series probably doesn't break RGMII.
> 
> [...]

Here is the summary with links:
  - [net-next,01/12] net: mtk_eth_soc: remove unused mac->mode
    https://git.kernel.org/netdev/net-next/c/0600bdde1fae
  - [net-next,02/12] net: mtk_eth_soc: remove unused sgmii flags
    https://git.kernel.org/netdev/net-next/c/5a7a2f4b29d7
  - [net-next,03/12] net: mtk_eth_soc: add mask and update PCS speed definitions
    https://git.kernel.org/netdev/net-next/c/bc5e93e0cd22
  - [net-next,04/12] net: mtk_eth_soc: correct 802.3z speed setting
    https://git.kernel.org/netdev/net-next/c/7da3f901f8ec
  - [net-next,05/12] net: mtk_eth_soc: correct 802.3z duplex setting
    https://git.kernel.org/netdev/net-next/c/a459187390bb
  - [net-next,06/12] net: mtk_eth_soc: stop passing phylink state to sgmii setup
    https://git.kernel.org/netdev/net-next/c/4ce5a0bd3958
  - [net-next,07/12] net: mtk_eth_soc: provide mtk_sgmii_config()
    https://git.kernel.org/netdev/net-next/c/1ec619ee4a05
  - [net-next,08/12] net: mtk_eth_soc: add fixme comment for state->speed use
    https://git.kernel.org/netdev/net-next/c/650a49bc65df
  - [net-next,09/12] net: mtk_eth_soc: move MAC_MCR setting to mac_finish()
    https://git.kernel.org/netdev/net-next/c/0e37ad71b2ff
  - [net-next,10/12] net: mtk_eth_soc: move restoration of SYSCFG0 to mac_finish()
    https://git.kernel.org/netdev/net-next/c/21089867278d
  - [net-next,11/12] net: mtk_eth_soc: convert code structure to suit split PCS support
    https://git.kernel.org/netdev/net-next/c/901f3fbe13c3
  - [net-next,12/12] net: mtk_eth_soc: partially convert to phylink_pcs
    https://git.kernel.org/netdev/net-next/c/14a44ab0330d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
