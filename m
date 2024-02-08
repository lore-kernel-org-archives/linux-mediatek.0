Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574D5C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 03:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/doEa3H83519NW6iO9CMcuQJUvcYQ+Q17gzlDv+umFk=; b=rOxnV4UkQ1IEC9/s/n1rVDaAJ/
	l5ep/3d0YyfjTZnVKacWjXOwU59kNz+mER9MiZT0SSuMFUds5BzYC1XxPc7TRd2A3xiZRCflg5sYC
	xWbt0NtDqMUWJyXyDi2iFuhZMTRbk7Pxrmislffn3Rj0kNsonW7JNkEx7KiILOd51HBNpkMuAMi1s
	Uk3cZ62rQoy6UQvq1GCABgG/TWSvF6kRr3uLVjvdHjVcooAplCgAKX5oDAyP3hTXpq8P0TSdwu1n5
	JuccGgzIUKJ902tq/s2A/G++6Myn9ItlQpQ3BQtpIs16ioaxE3uD/sr+u1fav6a2faYllzrnBbam6
	1coimSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXuoD-0000000CVlA-1SGO;
	Thu, 08 Feb 2024 03:10:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXuo9-0000000CVkW-3xKP;
	Thu, 08 Feb 2024 03:10:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1700ECE1B77;
	Thu,  8 Feb 2024 03:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 453E0C43394;
	Thu,  8 Feb 2024 03:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707361831;
	bh=QPH1yr6VHuRyaB6xH/FtQKMvMHLE/l58r4MMmJTwfmo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gsMbSDfezpPDvaH2NSZJXCJjbnoFukNxn4keKuVYtZzd3ZZbWV4NKGYtqxx+ujeiE
	 omGPpuHZtb/K1O6rZoESp9YcgrQ47/kZ6QWzcT/bjw/olF6td4Ia4DACQtJe8CxjZW
	 a2erQRvQFpDlE7uJhSoZIaiMEULipED8ibrd211ppS8b4rbiWMz0vn0qULIAg1elLy
	 vt2hUgmc2eO/a/zCeYgPKslzVR43JGZwxi1BuqHsxGJLu7c63xsatwTUkXSRIQG5TS
	 ogya1HH+8DPWjHSRvMJrwsjYZB7ZeESUrr5CWEAE+jdmfo/vGy3QtBf/kELl11DOrE
	 naz30cauu+0kA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F27AD8C97D;
	Thu,  8 Feb 2024 03:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/7] MT7530 DSA Subdriver Improvements Act II
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170736183112.28016.638375642700204813.git-patchwork-notify@kernel.org>
Date: Thu, 08 Feb 2024 03:10:31 +0000
References: <20240206-for-netnext-mt7530-improvements-2-v5-0-d7d92a185cb1@arinc9.com>
In-Reply-To: <20240206-for-netnext-mt7530-improvements-2-v5-0-d7d92a185cb1@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux@armlinux.org.uk, mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 bartel.eerdekens@constell8.be, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com,
 rmk+kernel@armlinux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_191038_179485_5CD981B8 
X-CRM114-Status: GOOD (  10.55  )
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

On Tue, 06 Feb 2024 01:08:01 +0300 you wrote:
> Hello!
> 
> This is the second patch series with the goal of simplifying the MT7530 DSA
> subdriver and improving support for MT7530, MT7531, and the switch on the
> MT7988 SoC.
> 
> I have done a simple ping test to confirm basic communication on all switch
> ports on MCM and standalone MT7530, and MT7531 switch with this patch
> series applied.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/7] net: dsa: mt7530: empty default case on mt7530_setup_port5()
    https://git.kernel.org/netdev/net-next/c/01fc42942e30
  - [net-next,v5,2/7] net: dsa: mt7530: move XTAL check to mt7530_setup()
    https://git.kernel.org/netdev/net-next/c/fd7929095a52
  - [net-next,v5,3/7] net: dsa: mt7530: simplify mt7530_pad_clk_setup()
    https://git.kernel.org/netdev/net-next/c/4eec447ef640
  - [net-next,v5,4/7] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
    https://git.kernel.org/netdev/net-next/c/4ea4c040ddc8
  - [net-next,v5,5/7] net: dsa: mt7530: remove pad_setup function pointer
    https://git.kernel.org/netdev/net-next/c/8c2703f55837
  - [net-next,v5,6/7] net: dsa: mt7530: correct port capabilities of MT7988
    https://git.kernel.org/netdev/net-next/c/c9d70a1d3d64
  - [net-next,v5,7/7] net: dsa: mt7530: do not clear config->supported_interfaces
    https://git.kernel.org/netdev/net-next/c/b43990bc552e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



