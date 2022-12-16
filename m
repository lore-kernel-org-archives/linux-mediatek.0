Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7B4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 04:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAi5p4mZGTJnayPK9a01IprSXkVFF94HdeRqgIvHQ7I=; b=FI/LhSb1wnRF3vW+nzTmtd4LKR
	nxGZ8ohJ5zKFGyXbBAy5sGwtrMlZLsEI9e0MLDvH39cr7cQwJFDsb5RVGX7v5a9d3qOwS9swUzf0R
	JqOH3AboJBnuteePihrnh27TuW9uM0OsjXkqvhr50Dqfcelphek/dToC/+8bSAXblPgU6ZnhzZuiN
	GNODD2141YPtyxTkTxhI98HhqyQ8eYtfwsB0DsjR2/iN//PNb/8WxBOYoi+oxQOeJvMJAmNKvHzZy
	DMwLxnFW30Kl5q4H0A7TcWIKOSnmEPJqaK069SCMJCVFAZ71Iwc9omXHvGEbNx0q68hYu5yNFIoHI
	ofWtyNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p62Mf-00ClhM-Mi; Fri, 16 Dec 2022 04:30:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p62MU-00ClgO-UA; Fri, 16 Dec 2022 04:30:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3F7261F33;
	Fri, 16 Dec 2022 04:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C2C8C433D2;
	Fri, 16 Dec 2022 04:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671165017;
	bh=Y8PpQegsT0Jaj/iyXfDRZJcPjMsrLgQHSLOjtoL0Fw8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CyO4tvc/PRvjJjDUWHR3yVK4QpoXw7MFwLARRqm52vty0w/+4uFvi3QOuTUSv7nzZ
	 Oa+YffDmRav8ynhcx4NmigfJy983ZeppyVvAh0F8ZNVrMO7Wk0gnXM+f7OarVo1xqm
	 rIhewckUfS38bIuwIsLx4tbJnkfRjWF8ICrCDGBqmbGgd9sdxKMhmvWKjY5rdf3F+F
	 x8E8DsQzzWCNNyGZum/2ziclWVx5mnTVr5hRknLMLnFIvzqWyNSo8qpGkyycQLJ1aU
	 YQI0JV6SEdnipZHfSjcMhMLy76LZJvq3U5CyrB1tf88LtSuYaT01GgIygdgVFeeB4k
	 P0hPF3u9A3JHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D946FE21EFC;
	Fri, 16 Dec 2022 04:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: dsa: mt7530: remove redundant assignment
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167116501688.3301.2964506948018173523.git-patchwork-notify@kernel.org>
Date: Fri, 16 Dec 2022 04:30:16 +0000
References: <Y5qY7x6la5TxZxzX@makrotopia.org>
In-Reply-To: <Y5qY7x6la5TxZxzX@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, sean.wang@mediatek.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 matthias.bgg@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_203019_034733_73E4C276 
X-CRM114-Status: GOOD (  10.91  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 15 Dec 2022 03:47:59 +0000 you wrote:
> Russell King correctly pointed out that the MAC_2500FD capability is
> already added for port 5 (if not in RGMII mode) and port 6 (which only
> supports SGMII) by mt7531_mac_port_get_caps. Remove the reduntant
> setting of this capability flag which was added by a previous commit.
> 
> Fixes: e19de30d2080 ("net: dsa: mt7530: add support for in-band link status")
> Reported-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> 
> [...]

Here is the summary with links:
  - [net,v3] net: dsa: mt7530: remove redundant assignment
    https://git.kernel.org/netdev/net/c/32f1002ed485

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



