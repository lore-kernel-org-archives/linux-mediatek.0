Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6033C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rS88NufrP3iGAeeyUMqFGODCgBbtMfiKIf6v9MVfpE=; b=oQcvq3Vcyzopyc
	eJpuDE+0yBLTImCkVdvq9tL8DH357Kvt6T6TVCCnEtp6lVUwb892/kG5FQIO2aqwrGiBySjuoHwmD
	xs67RUAPA67UQfoVIsKJt/luPDY36lQxJJdVFAM/GXD7yZQyjN8gDGz4pFVUiY8rnCHXQwGtSAS60
	f7aNczvBKjozk8D2El5FeCSZvDDY/xqkU0ivhBCQQ+tjj7DxF54BmjLptHJiiQslugVhDp4vnDF44
	uGndxSYRCc/qNcr+FZRYnxkdoa1Z8M3ppFw5u52JtFEl9N+TYDvKWCE2XSlVb3KwvzmTOjuGO7Krx
	B2f+DLavTAkSGXXdWYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJyqv-0030W6-V8; Tue, 15 Feb 2022 14:30:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJyqT-0030Jv-4d; Tue, 15 Feb 2022 14:30:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 62421CE2008;
 Tue, 15 Feb 2022 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EB1AC340F1;
 Tue, 15 Feb 2022 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644935410;
 bh=Ul9wORTglUXgvl28HPxbdqaB6WKzDL2m9BqXLWKhVyk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ng8qN/j0zgUxGme3kedt/cjhrGSre7Ku6JJNnlxRWJjTFY1k9hXXlrn6lXuGyfex1
 xZlcwg1am5CZprhKYZ1icOWdWNkEPCCTlpg+XC9pV6CwWra+QVjqQCtFcgL9oVEr9o
 mvkNYQirBRq5RjzU91lICzMIrSozLLPwpvQlZD4TyXYdWyWJEi/UsLiP1hbCZjphCO
 oEYCUL0UQWdbZkw47KavM7TmWeN/JuIQYl3bE8+1ZiqRXt4i9puDGMG78VdrR6sa8S
 va5/SHGRap3yFNOCCzieAlpbKIILrtK7GEPx5p+1Wf3FcE2LatMKmOyxkaNuY/AqVP
 1r4tx6r3K7jWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 34BA2E6BBD2; Tue, 15 Feb 2022 14:30:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net] net: phy: mediatek: remove PHY mode check on MT7531
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164493541021.26708.6388647130926392224.git-patchwork-notify@kernel.org>
Date: Tue, 15 Feb 2022 14:30:10 +0000
References: <20220209143948.445823-1-dqfext@gmail.com>
In-Reply-To: <20220209143948.445823-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 arinc.unal@arinc9.com, hauke@hauke-m.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_063021_418883_9B4D2046 
X-CRM114-Status: GOOD (  11.76  )
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed,  9 Feb 2022 22:39:47 +0800 you wrote:
> The function mt7531_phy_mode_supported in the DSA driver set supported
> mode to PHY_INTERFACE_MODE_GMII instead of PHY_INTERFACE_MODE_INTERNAL
> for the internal PHY, so this check breaks the PHY initialization:
> 
> mt7530 mdio-bus:00 wan (uninitialized): failed to connect to PHY: -EINVAL
> 
> Remove the check to make it work again.
> 
> [...]

Here is the summary with links:
  - [net] net: phy: mediatek: remove PHY mode check on MT7531
    https://git.kernel.org/netdev/net/c/525b108e6d95

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
