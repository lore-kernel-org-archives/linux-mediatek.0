Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68C1C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnnXUxtUSJRq85iq8/+29DCIblER77ZNhHohZVpyL8c=; b=QiUGak77vBdOYhm4/f4a0V+C+8
	G5LEpjehiUy6NMNmr5VwT/hvtbu6mTypSuYC2lY8Q8RStAcwnDGbWpiOHaNQeDY9RxhwUPnHyDt/I
	kK9kuoGrkrVIKE0xSp5u/o67lQ/CaG0jDUsV002eLccJpEDh2qmt5BMZ9sh4bOehWyXS/sdu7u5+i
	RuccAItpbxUsm3VGc5sBw3et2ShlrbUJZ/wQvE1q9tRpfCpko7Bj0fo7hRv9Uj/6t7NjTRLZqcoX5
	GCg34Lhj1AYwt6Pc0tC6f/lTGUqUMcT1dmJawstBlznX5Me62li2ZYsndX3Mxlb1O5TVLAWfSmC+c
	ussmqzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1w3-0000000FToL-222G;
	Wed, 17 Apr 2024 09:50:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1w0-0000000FTns-0tgV;
	Wed, 17 Apr 2024 09:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A7296145C;
	Wed, 17 Apr 2024 09:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2538C072AA;
	Wed, 17 Apr 2024 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713347429;
	bh=tBFygEfgSUOLTCcaP5hAlsAek9UxTj79UaNMYkCENrU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S4VNWHbg0UIkFb04/UpCUqvZN9Au5SJjFlsCVGBIkENYVpRDtdJz91xAVMmda8XVY
	 uQZ12U7P4m0+G3aXiM1Te1ZcURvlELXIDoxUia5NFyoX8HpxvBCWAS/VoQXU7P5wjW
	 jroMfBLOqySTkRDiHJnK/H2ksghvy/nBsrcqwM6wIjOhNV+J9vGNzQ84joGa9JJMFt
	 PFgrH8Ed7SRtRWO0UGBYGbgdRLP8AOkgRyoDA176g1geYcpgmQ6tQ2TS4S15fbpwlR
	 O+rB9IalE23M6rO4gPtJ4mrDxjYlyUHONOuD5OZVKoXwUlSYtWty3HvFRp0T4AhrsR
	 EZaP73M64Gl/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF5E3D5B3FD;
	Wed, 17 Apr 2024 09:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: mediatek-ge: do not disable EEE
 advertisement
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171334742971.18271.14228801300401339058.git-patchwork-notify@kernel.org>
Date: Wed, 17 Apr 2024 09:50:29 +0000
References: <20240414-for-netnext-mediatek-ge-do-not-disable-eee-adv-v1-1-2fefd63c990b@arinc9.com>
In-Reply-To: <20240414-for-netnext-mediatek-ge-do-not-disable-eee-adv-v1-1-2fefd63c990b@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_025032_328640_A360D863 
X-CRM114-Status: UNSURE (   7.68  )
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

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Sun, 14 Apr 2024 00:08:13 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The mediatek-ge PHY driver already disables EEE advertisement on the switch
> PHYs but my testing [1] shows that it is somehow enabled afterwards.
> Disabling EEE advertisement before the PHY driver initialises keeps it off.
> Therefore, remove disabling EEE advertisement here as it's useless.
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: mediatek-ge: do not disable EEE advertisement
    https://git.kernel.org/netdev/net-next/c/af3b4b0e59de

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



