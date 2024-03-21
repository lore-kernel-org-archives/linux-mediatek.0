Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC0DC54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ruk5irpr+CYoEvRTvGyIi8DaE7sIZbUUwC7o4Txchn4=; b=Gb/xcX5d64CYiur5Mgw8u5RORr
	wIW1ebrL3qna/EiVbnPuLhRBSR1L4mdqeL69WFnEWYyjQ+5kcpWxb17r8HJgLtKZh8t2+33fbWdYJ
	LuNnI8OqzcMeeCBkvX7jMaontCcOWzSRViJAxIs4A2f0Cbpin99jEUqqtROUTUjCg9axczrcaB9TP
	pK4yTxx0Gl/RgVucpqfR3n2I3oFFImfw5IRLe1jOKRpS65pfrGVp/jpTXGricoGVgeuvYaTIDqWgX
	dyi2RGLQ94A/w/+rdZWVwwhA7lVmFgNG34E151IIugaHRiFRJfmuxzIOpf5v+OC/xcrI/kRY7uik2
	o/b2i3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGTM-00000002n4G-0O0m;
	Thu, 21 Mar 2024 11:20:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGTI-00000002n2S-3QzZ;
	Thu, 21 Mar 2024 11:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B3ADCE12C9;
	Thu, 21 Mar 2024 11:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C12E2C43390;
	Thu, 21 Mar 2024 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711020027;
	bh=d1IRr9TtFAq/n2fJtDW0qRO01a2/SWstmEFZu1BOraE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rhwb3exDfDWmBO90fT1a0fkQLgef4yEAzzKgEAobppkvMshOCR2wZN3cqDBmrtaOx
	 7c4y5T0NGz9+bGnVBzRyiVvFZTYEJ5XCayNNjUFxciIKD1kZBUKKl8AOdewq+s4Kt/
	 nYMA5ak/WYGfjjy1lzoa3aAcMZLxeDJUV8Knw92odKp/9MyZgFQwcVosjYtNw/W3dk
	 hW+H1+Q/gCs6H9veYwlVtjGbTIqD0jBTWqFM9oo7I+33Ro6NOcUjZjPfahjSG67hcS
	 avWM+6RxAyjlgb/R3UALjpEPhlGgKUbvX/YY2o+PdDZLWOC/Hy5bMUOvcoccHYOVE+
	 uPya8JOMmBB4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A62C9D982E3;
	Thu, 21 Mar 2024 11:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] MT7530 DSA subdriver fix VLAN egress and
 handling of all link-local frames
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171102002767.1229.13788293979924606218.git-patchwork-notify@kernel.org>
Date: Thu, 21 Mar 2024 11:20:27 +0000
References: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
In-Reply-To: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXkgPGRldm51bGwrYXJpbmMudW5hbC5h?=@ci.codeaurora.org,
	=?utf-8?b?cmluYzkuY29tQGtlcm5lbC5vcmc+?=@ci.codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_042033_064045_D6B09156 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, erkin.bozoglu@xeront.com, sean.wang@mediatek.com, daniel@makrotopia.org, linux-kernel@vger.kernel.org, dqfext@gmail.com, edumazet@google.com, pabeni@redhat.com, linux-mediatek@lists.infradead.org, arinc.unal@arinc9.com, bartel.eerdekens@constell8.be, netdev@vger.kernel.org, matthias.bgg@gmail.com, kuba@kernel.org, olteanv@gmail.com, mithat.guner@xeront.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 14 Mar 2024 12:33:40 +0300 you wrote:
> Hi.
> 
> This patch series fixes the VLAN tag egress procedure for link-local
> frames, and fixes handling of all link-local frames.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: dsa: mt7530: fix link-local frames that ingress vlan filtering ports
    https://git.kernel.org/netdev/net/c/e8bf353577f3
  - [net,v2,2/2] net: dsa: mt7530: fix handling of all link-local frames
    https://git.kernel.org/netdev/net/c/69ddba9d170b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



