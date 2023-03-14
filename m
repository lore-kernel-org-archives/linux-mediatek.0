Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B79C6FD19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 00:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8oVlIyRb3g9hitITpuyAJ2inpWGjISnSgyu0MdKIhw=; b=a1/yiptevv9BTtE+qHsEV6vX8r
	dG+rNepOnIrw9S+HB/1pRfrNw1be7u5cXPiYydj1FSg/1iL7U8O5kkVei1JIPg7/QeGCbMqMI1d3v
	dk5w37YrdWXmqnxUwVBoUVXEUZUjBiu2Rx0/sIf3/mftxRB3d4rPVcWYzqmosIf2l537eBoZQ8MWf
	Bu1vLBNaV92BVQsJlRE44snUfgdzaSlCFAes/iXi6xIao3iMvetRU79ubizmPw5G4BV0AfmDuAWev
	ha9HrlnPbQr8At13EhKzghtW6NxMkI2E2AU2OuZ6a/ZRC+53sdHbaFBiO7pBDUn022y2paj5OCnlW
	78ZOr5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbsFN-008OD7-6Y; Tue, 14 Mar 2023 00:10:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbsFC-008O9r-Rb; Tue, 14 Mar 2023 00:10:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCCB661563;
	Tue, 14 Mar 2023 00:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3899FC433EF;
	Tue, 14 Mar 2023 00:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678752618;
	bh=lwSrZHpB/2H3KGj25BHrgbq8Bljm/f9GEWsbt/dHqTI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oKn5ya6t2iobg/GAg+FG4/Ru8R6m48f55SKtsFOueUuCxVCaO+hiJOrYxRmlXJWZk
	 TU0ydkcxTJgta69faBgNpx5AyRKOc35Q7SQg9kkTHCAxZXiTVrfl8WBalQYPvYZl2r
	 JE+NCQQOlnkmn8oAtJhiFfnUPZkukaauznRO0MWgxxoKNQkknHXdtN/fBsqbKBPRhf
	 zeDoyitIfyBicarXLdPYRMHSTwoquxFHFcYUi1W2j0SRQyvSJiO+1h1cqyLuKNsYna
	 FNMyJv1zgQlNqiG32erH2pK/s/p10Oc6PdljqVkEPDpurAqqDOW3WEy529x8w2nPrZ
	 1Q4OFl41hzFCg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1C6FEE66CBA;
	Tue, 14 Mar 2023 00:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 net 1/2] net: dsa: mt7530: remove now incorrect comment
 regarding port 5
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167875261811.15210.2328160287953861315.git-patchwork-notify@kernel.org>
Date: Tue, 14 Mar 2023 00:10:18 +0000
References: <20230310073338.5836-1-arinc.unal@arinc9.com>
In-Reply-To: <20230310073338.5836-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmM5LnVuYWxAZ21haWwuY29tPg==?=@ci.codeaurora.org
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 opensource@vdorst.com, rmk+kernel@armlinux.org.uk, arinc.unal@arinc9.com,
 netdev@vger.kernel.org, erkin.bozoglu@xeront.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_171022_970758_A8DB635C 
X-CRM114-Status: UNSURE (   9.87  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 10 Mar 2023 10:33:37 +0300 you wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Remove now incorrect comment regarding port 5 as GMAC5. This is supposed to
> be supported since commit 38f790a80560 ("net: dsa: mt7530: Add support for
> port 5") under mt7530_setup_port5().
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> [...]

Here is the summary with links:
  - [v3,net,1/2] net: dsa: mt7530: remove now incorrect comment regarding port 5
    https://git.kernel.org/netdev/net/c/feb03fd11c56
  - [v3,net,2/2] net: dsa: mt7530: set PLL frequency and trgmii only when trgmii is used
    https://git.kernel.org/netdev/net/c/0b086d76e7b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



