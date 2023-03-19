Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33114C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lGefb+Xa4d26ewdeIvYlAAp0R4jjGsMPIRosdhIGi0=; b=CU1+bwkP8JH33xY1Fn5/Rz+IIo
	i1z83O4wjHMt6sb9LChzaLKIv0Hv/A3zavXrBVEQIOiGZqK9t4wAKPOiS24/kz/iMlrvMcveQzAgt
	S6zGnZ0NuaAjuZcUVxlo2bvZBNxqVS1D4bE22xyK7Di/xuW2W2XiqSM4Inv6i6/q7tkWWW01C8S7p
	G82bUbmjHLwWkTef1V94uut9q+Kr4eu/keOeaHpuE3vRvo5lOSOLHqd9BaU3jF8wdW/Azg/5p4QNm
	1gStO/VRESiYmtlVd7Oq6GyUeU+luBMy1HvdvSOnBvTyWi8S7iiSI8k5F9FkuWu+hLt2TTLTw/fEY
	l+UjeSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdqm1-006RI1-1F;
	Sun, 19 Mar 2023 11:00:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdqlu-006RGP-3A;
	Sun, 19 Mar 2023 11:00:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E333260FAD;
	Sun, 19 Mar 2023 11:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3426FC433EF;
	Sun, 19 Mar 2023 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679223617;
	bh=wAMjv+OQaBXJ0DzFRZTo13CKHGO51sndjYWxpSODoV0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LHLqBnDqmheJ2y5ayl1U+OEBaxWeJCSaHsKCxcS9br6z1sTZvzbH4VmxOHF2efhPC
	 NSeqAmkYrKMmwFoa3pFZQbvfwCr7NsAPt3fYswTtBHUgHJeiQBmyiyJTLNZr7GIm1H
	 XZyCGsn9WqJxO6xo/H5ytLt2h4AaRpjoosfRPlX/roOtemddgdbD3mxnghvUL+Kphl
	 q1rlB788rV+Q/etpSOmWrHVLUvoTZEMGibgsLr/3zqpfp5dp9aQBYrq7eZnLtd297V
	 idTy2XTVZODyM/OYkcO24rRyeuYyDdufu3jXJXy8eWvkceP8XbVC9TWtwSFWnURfni
	 Ci+h7NaGJAGdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 12542E21EE6;
	Sun, 19 Mar 2023 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net V3] net: stmmac: Fix for mismatched host/device DMA
 address width
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167922361707.26931.13628628366196424198.git-patchwork-notify@kernel.org>
Date: Sun, 19 Mar 2023 11:00:17 +0000
References: <20230317080817.980517-1-jh@henneberg-systemdesign.com>
In-Reply-To: <20230317080817.980517-1-jh@henneberg-systemdesign.com>
To: Jochen Henneberg <jh@henneberg-systemdesign.com>
Cc: netdev@vger.kernel.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 veekhee@apple.com, kurt@linutronix.de, ruppala@nvidia.com,
 andrey.konovalov@linaro.org, tee.min.tan@linux.intel.com,
 weifeng.voon@intel.com, mohammad.athari.ismail@intel.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_040019_083588_CC2F01CA 
X-CRM114-Status: GOOD (  12.72  )
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

On Fri, 17 Mar 2023 09:08:17 +0100 you wrote:
> Currently DMA address width is either read from a RO device register
> or force set from the platform data. This breaks DMA when the host DMA
> address width is <=32it but the device is >32bit.
> 
> Right now the driver may decide to use a 2nd DMA descriptor for
> another buffer (happens in case of TSO xmit) assuming that 32bit
> addressing is used due to platform configuration but the device will
> still use both descriptor addresses as one address.
> 
> [...]

Here is the summary with links:
  - [net,V3] net: stmmac: Fix for mismatched host/device DMA address width
    https://git.kernel.org/netdev/net/c/070246e4674b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



