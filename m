Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F88EE49A5
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Aug 2023 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SDLI6770cCnww+DWXlT8l/Kzed9Rm3ApbXShZgSJ1U=; b=hciwfz8OwD1Qd2Hm4IVe2AiJIi
	xgOfyHegdUPznFqLzQ9g9dxstZ2PyB+0RPy264EX7ih0Tjj84AAH4z+xxQQdkyK6Koc5qyfEOAL71
	T4Eiq5Z5wqWl2yfwFAetcLRfbKLHPVO+ZMUzWI5mK7/82KsjPOYKVwchw2M9+P8laBsPLL4K9jR0q
	fARuUKs+kt8a07roV4E2EyES1gD7YfLezJuYB0JWADnSz7J3cMgnqJxd4G9zyVm3bnx+5oyzxXJOL
	DARCrsxLam2StDUaBdYlxT6AcjTKkc78mIgmkdIcayufbQyxe+1tYKhxdIJsMrMhpClEBW750g9dZ
	fEFAvocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXKL8-00ArAq-2Z;
	Sat, 19 Aug 2023 11:41:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXKL0-00Ar9W-0k;
	Sat, 19 Aug 2023 11:41:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8112961B83;
	Sat, 19 Aug 2023 11:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA02BC433C9;
	Sat, 19 Aug 2023 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692445307;
	bh=LKmKQ0xSbZIzIwfqFbMR61HP7pVuNaLztMJQtV/tx80=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s5ho89sUA59BNYnbFy+CaxKsuPq+fZY12YuNl9s+og6HoVU6PEIkMUbfXd2yc1L2v
	 Dop3+9w5ELa6Y3pxNuAYQ3r4U3sUmw4fhEg4tH9VKflvpFTDfjMMxb3awOc65PjpTz
	 PdnUgY5h9mHkIqh3/3McptNr5ea2tPv19qUtvo+o5rfrylvF1w0llbu0QVUjTxZep3
	 7FBEqwrfxqtkiX+PpMKX32ss+vI2x26QNTSHu2xV3O/pauFp5p086X+t4yBrr1d3kw
	 B0YfLITqWRRhGBDHsZWYrsIdvm1YfUDJS6L3qUuU9bpllD4rm2OPuLWPC0tot2yzg9
	 54wTk6SHXRQQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A759FC59A4C;
	Sat, 19 Aug 2023 11:41:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dsa: mt7530: fix handling of 802.1X PAE frames
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169244530768.26291.13426375569408099631.git-patchwork-notify@kernel.org>
Date: Sat, 19 Aug 2023 11:41:47 +0000
References: <20230813105917.32102-1-arinc.unal@arinc9.com>
In-Reply-To: <20230813105917.32102-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPg==?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, bartel.eerdekens@constell8.be,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_044150_338884_C9493BD2 
X-CRM114-Status: GOOD (  10.09  )
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
by David S. Miller <davem@davemloft.net>:

On Sun, 13 Aug 2023 13:59:17 +0300 you wrote:
> 802.1X PAE frames are link-local frames, therefore they must be trapped to
> the CPU port. Currently, the MT753X switches treat 802.1X PAE frames as
> regular multicast frames, therefore flooding them to user ports. To fix
> this, set 802.1X PAE frames to be trapped to the CPU port(s).
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> [...]

Here is the summary with links:
  - [net] net: dsa: mt7530: fix handling of 802.1X PAE frames
    https://git.kernel.org/netdev/net/c/e94b590abfff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



