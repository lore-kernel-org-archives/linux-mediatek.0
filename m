Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CE6C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 13:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udqk+zoF4qsj12r/IIuVnSg4tXX1EGaYbhpE4zany7I=; b=48Dlq0yQXTVAvQ
	hpAoriLFzUwRN4aDYtcOYlGq4yAXpiR84IgO8mVnJusTWXzpr8iwne3NKQtPmJZxux56mS5Q3M81p
	fypuGiJwtV/ts4Cx74Z70WzA5Ie4wBq9Y220Rjvm1FhQxJec9Z3/KaRyzKGOXZYOU4lck8Gz/wwyj
	8oaHe+43LUyl+LO8QMvAK4T6Vr7Yr31EI3TMSWge2l07Hs9T+0Mh/ubDb8RGH+pzj3vgBQghBKP4L
	2kiNQNADZuKTC/KR31bTf1UcpzuMcTOMXl2bqGGWkyUeOfTTfKUzV3MVDSNQ9NskaLjzhOdJwUdAz
	VemK5xrgzu6Rve5jVVPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUTfL-00D13x-1B; Wed, 16 Mar 2022 13:26:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUTZX-00Cygu-T4; Wed, 16 Mar 2022 13:20:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7AE7B81B34;
 Wed, 16 Mar 2022 13:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84EA1C340F0;
 Wed, 16 Mar 2022 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647436812;
 bh=tbcOFjyGFmBEwOjIh+3jseYE1fvFZySauTJiPWeHSxQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Gum5FAn1JMTLcenLuYd4xxPKwYN/TcLuars1ooFUTgakM/hpQeodftoHNBLqYRDP/
 r4x9h0/sJC5MHmJInTBtUpjs0iMHG/moQHxyv4RbEYnucVidanSQVkSn++BT611/Bu
 okPYd0KVL3soFDhwrHGgC6kaojRznvmTqVssOsdSqV6UTMBShUJYpUpVQqbGrQtGZb
 UHfpJQmYMkjp3P4Yt7XCoB/ts5RbLgVRXn5tKFeAmfY/H386ao84G/HtZ3/+NOzNJK
 luKf7p7YOdtAIjhjvnvWzJ2/KDDhciOQeJobgB8IOcyaRWR+eJMzR8EuyjnwChMFI8
 g46+zgsaItBUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 60947EAC09C; Wed, 16 Mar 2022 13:20:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v13 0/7] MediaTek Ethernet Patches on MT8195
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164743681238.18574.8037993673780755676.git-patchwork-notify@kernel.org>
Date: Wed, 16 Mar 2022 13:20:12 +0000
References: <20220314075713.29140-1-biao.huang@mediatek.com>
In-Reply-To: <20220314075713.29140-1-biao.huang@mediatek.com>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com, dkirjanov@suse.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_062016_285032_7D40C144 
X-CRM114-Status: GOOD (  13.78  )
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
by David S. Miller <davem@davemloft.net>:

On Mon, 14 Mar 2022 15:57:06 +0800 you wrote:
> Changes in v13:
> 1. add reviewed-by in "net: dt-bindings: dwmac: add support for mt8195"
>    as Rob's comments.
> 2. drop num_clks defined in mediatek_dwmac_plat_data struct in "stmmac:
>    dwmac-mediatek: Reuse more common features" as Angelo's comments.
> 
> Changes in v12:
> 1. add a new patch "stmmac: dwmac-mediatek: re-arrange clock setting" to
>    this series, to simplify clock handling in driver, which benefits to
>    binding file mediatek-dwmac.yaml.
> 2. modify dt-binding description in patch "net: dt-bindings: dwmac: add
>    support for mt8195" as Rob's comments in v10 series, put mac_cg to the
>    end of clock list.
> 3. there are small changes in patch "stmmac: dwmac-mediatek: add support
>    for mt8195", @AngeloGioacchino, please review it kindly.
> 
> [...]

Here is the summary with links:
  - [net-next,v13,1/7] stmmac: dwmac-mediatek: add platform level clocks management
    https://git.kernel.org/netdev/net-next/c/3186bdad97d5
  - [net-next,v13,2/7] stmmac: dwmac-mediatek: Reuse more common features
    https://git.kernel.org/netdev/net-next/c/a71e67b21081
  - [net-next,v13,3/7] stmmac: dwmac-mediatek: re-arrange clock setting
    https://git.kernel.org/netdev/net-next/c/4fe3075fa699
  - [net-next,v13,4/7] arm64: dts: mt2712: update ethernet device node
    https://git.kernel.org/netdev/net-next/c/79e1177809f2
  - [net-next,v13,5/7] net: dt-bindings: dwmac: Convert mediatek-dwmac to DT schema
    https://git.kernel.org/netdev/net-next/c/150b6adda6b1
  - [net-next,v13,6/7] stmmac: dwmac-mediatek: add support for mt8195
    https://git.kernel.org/netdev/net-next/c/f2d356a6ab71
  - [net-next,v13,7/7] net: dt-bindings: dwmac: add support for mt8195
    https://git.kernel.org/netdev/net-next/c/ee410d510032

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
