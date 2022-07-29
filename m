Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD13C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mi2hXTbMwIdhZSHb8Gwh+/oSHN9SN2PB/3ESotz13IA=; b=NyqwUNTAMT2JbU5CLq2B63bd1V
	ZXjG67GWQq0z6j3jgAWWij3G0K1K5AlbAwhzgjskrfKJxhD6hiB6+yuofYW7QWeaYUZuN2W+/UAf6
	LUwLALvH0ZJIs9E/3NhJhnoRPPSZdTV4XB9E4kU7vCEQS4Ms+TABMrMUEa0sTAMqC3Aqtg0Uq52Rn
	ooWZCW0llAyUbZLQqs5WQqO+LUkYr1XHqLJ27kp9pZE34Xe2l+YhlxoRvV9C+uFJJNC8BD3PbaQBa
	uouOn7M6qK7UFDMjQcsBofzS+1c2CKOMVASv7ZIRtvA4lEIPQL8Uu6X8wkEQoJT8KU5+iSydAvhA4
	gN1uhbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHOCC-004Qbp-2v; Fri, 29 Jul 2022 11:30:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHOCA-004QaS-0E
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 11:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 64BFDB827AA;
	Fri, 29 Jul 2022 11:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46459C43141;
	Fri, 29 Jul 2022 11:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659094214;
	bh=YTh812N94iTAkMkctWnkTNZH59EScxVdZ0HIYLHdSBA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NREj1UCkXoRsGKKLkJF1IOboGZf+RN2Vp982hK06KhxgUQaN55wRmZtHXfgMojRad
	 +MHEZqcCq8dR4tUQQAmvLoDcIDKYuH0AURMzOK7r4ZgZ/wM2pGod44bT+Mnv74IVMJ
	 DnzeDexcdIxbOnn5mEvmHEE7vcTSrafuFHBmqfgoIJ+y/vpjNGXCV17/+9hxrAoX7x
	 Hky+psSwPdq7WpGnocKjkR8q5WTRw0xKhyHonPbGAMUeWUvgNZ6GLAve6U34ddGAx5
	 /tgXcEvtS/ezOfbmJL40gMWB0tWDXU3HHKkGpFKuly1hGuX0aPFh1mA+r1Sjf0oaJa
	 V9QiKAOu5JhIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 311B1C43140;
	Fri, 29 Jul 2022 11:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] mtk_eth_soc: introduce xdp multi-frag support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165909421419.27900.9288866445051799762.git-patchwork-notify@kernel.org>
Date: Fri, 29 Jul 2022 11:30:14 +0000
References: <cover.1658955249.git.lorenzo@kernel.org>
In-Reply-To: <cover.1658955249.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 ilias.apalodimas@linaro.org, lorenzo.bianconi@redhat.com, jbrouer@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_043018_208412_1A01CC63 
X-CRM114-Status: UNSURE (   8.21  )
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

This series was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 27 Jul 2022 23:20:49 +0200 you wrote:
> Convert mtk_eth_soc driver to xdp_return_frame_bulk APIs.
> 
> Lorenzo Bianconi (3):
>   net: ethernet: mtk_eth_soc: introduce mtk_xdp_frame_map utility
>     routine
>   net: ethernet: mtk_eth_soc: introduce xdp multi-frag support
>   net: ethernet: mtk_eth_soc: add xdp tx return bulking support
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: ethernet: mtk_eth_soc: introduce mtk_xdp_frame_map utility routine
    https://git.kernel.org/netdev/net-next/c/b16fe6d82b71
  - [net-next,2/3] net: ethernet: mtk_eth_soc: introduce xdp multi-frag support
    https://git.kernel.org/netdev/net-next/c/155738a4f319
  - [net-next,3/3] net: ethernet: mtk_eth_soc: add xdp tx return bulking support
    https://git.kernel.org/netdev/net-next/c/853246dbf5e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



