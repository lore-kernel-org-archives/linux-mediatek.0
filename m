Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5872C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 20:10:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997B76121E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 20:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 997B76121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFj40ATter8JM9B14jGnmRO8J8ZDotcwchIkfr20gwk=; b=M9Vx8rkEkjX+muqce91l6XPKhv
	ACfN5nLCNf4fO//ZDNEs/OIxT2cXe16L837U02RWbKYM1SsVba6iuP9SxDZ1BCK6i3DE7/tTczPtf
	CJY6rKBwrO8N7HKwrhWPRBjG+V6eXTHgDS/JdxN4lO5VIyONqKw39N0XuMJXXB6SsG7uBdMDYGeNZ
	f/5YrUV98B4TbS/tdpOPRSY/tvpaEZireddjyilbfVcoSnA+6mKbqMUd1iFYRqiD3i9i69/LnECW3
	wMoxF1we5jKn2pcLuxdLgFA4WO3Uhh2b4dIszaovRepdgSksUpWWk0XB6IsVv7+CBDbXIZ7J9eZQh
	1WFluJWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljozr-002bj2-EJ; Thu, 20 May 2021 20:10:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljozo-002bie-6y
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 20:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:In-Reply-To:References:Date:
 Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=g33qxIaUR3IIJoMV6pYZa7XgiiLpkYrc3Y6xgNjaDeU=; b=ExJs2J8CZLyBdQNgyjygov/kta
 LsD4yv0I1oEwCQxyyPcRYNvQERoV9cW+XmiE/p/WAcKM/Cf/gyW6Gc55Bxbfqt6bI9lWkdr4YV7/j
 YlMHnWeHysPjBGyv8H6eTa/j230KxhR/6iyaKGNbbSRLBT3IKj7LeR00J2hJDVt6mrlDpIqkMXCn4
 BKRVzMo4hROpvukLWuVvun2kj8f+XeqYP6apOYmqAMF3MRk5WLoiV+lVKKsd+ysCaky4MMpKCourt
 XP8Wv49UZ/LnXfB/+dT9MZsUv8TlBcPpOIFSrS1klDrJGrrQXGTLF/IP34YWIJufW5YGW7H/t5gra
 Q8bcEaVw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljozl-00Gdg7-G9
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 20:10:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B3B66128A;
 Thu, 20 May 2021 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621541410;
 bh=WaCgMvfXBR2gKyUZwzBouYnqALdTwOxZMFC0C16Yfqo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=r0GmfvCV5y8lZ1sXAGwxJgaOTV/M4QhbiaiKN+TtKmof1O7GuR4saIdXK9oMsDOUT
 h4bnvm5ioDd9Ba9CzavQtpGqFApB79cCbYez0aijCSlJw12MtPWPF9xc3dwCn51o+M
 GlLOc6KxBkz3LQ9vfzP0tzI/T/9oFOYePrhKkSSz9/ahMZUI+mQHY1CSOf/dpX6Sq6
 KhLRnNVmb1lQXOzb8fJegJIXpRnHJhTPe5yO+OxhMxcsbEdNlKFp77AiBP2OH2bt6o
 PmRjGvtWhQ0bA+u+KXT58eE20yjF2tcCKHK5yisYhyrtltoug4ktSzG2LfalvngXZ5
 vX67EJIavZ63A==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 0/4] MT7530 interrupt support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162154141030.20508.8664926088973694353.git-patchwork-notify@kernel.org>
Date: Thu, 20 May 2021 20:10:10 +0000
References: <20210519033202.3245667-1-dqfext@gmail.com>
In-Reply-To: <20210519033202.3245667-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com,
 hkallweit1@gmail.com, kuba@kernel.org, Landen.Chao@mediatek.com,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, sean.wang@mediatek.com,
 vivien.didelot@gmail.com, olteanv@gmail.com, robh+dt@kernel.org,
 linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, weijie.gao@mediatek.com,
 gch981213@gmail.com, opensource@vdorst.com, frank-w@public-files.de,
 tglx@linutronix.de, maz@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_131013_581251_94A661F4 
X-CRM114-Status: UNSURE (   6.74  )
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

This series was applied to netdev/net-next.git (refs/heads/master):

On Wed, 19 May 2021 11:31:58 +0800 you wrote:
> Add support for MT7530 interrupt controller.
> 
> DENG Qingfang (4):
>   net: phy: add MediaTek Gigabit Ethernet PHY driver
>   net: dsa: mt7530: add interrupt support
>   dt-bindings: net: dsa: add MT7530 interrupt controller binding
>   staging: mt7621-dts: enable MT7530 interrupt controller
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: phy: add MediaTek Gigabit Ethernet PHY driver
    https://git.kernel.org/netdev/net-next/c/e40d2cca0189
  - [net-next,v2,2/4] net: dsa: mt7530: add interrupt support
    https://git.kernel.org/netdev/net-next/c/ba751e28d442
  - [net-next,v2,3/4] dt-bindings: net: dsa: add MT7530 interrupt controller binding
    https://git.kernel.org/netdev/net-next/c/4006f986c091
  - [net-next,v2,4/4] staging: mt7621-dts: enable MT7530 interrupt controller
    https://git.kernel.org/netdev/net-next/c/f494f0935ffb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
