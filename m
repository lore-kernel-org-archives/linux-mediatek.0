Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D535C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 12:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKPP8q1aQ+TujHTz2moxgfZyFrTj+nw4wxgDaypvsbI=; b=vObxjiaCDSZ2dEwt5/ugB82YUE
	jITv5IY7ayQac2tQ7MU5lRZQde921uSUAPWYU9mtkHQs+UKtpMOZUE/W7gBxtidHJ9+QxR6lQK5qI
	4xNKavjBqXip0r3poRbzqJi6p5jzcfK6E/LLhq9KN14/Ib4Am6o8ecInxi4s6rhgTkkdijAZBRhrk
	1S8osP6YGUwSVvKr7lw5upsxkyjzdVhfdS8j6zNn3f960ufRsHAArOobhoz9THqvvhnju2/AUCTgX
	MADOsMYyvDictBdEZIpYNQ4x45w0oRJJHKRHmo64LC1TQ3GXEpewAkLXf/AhG4X9Y6Ne37czib/UF
	Lpvk238Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeEqh-0092eE-JC; Fri, 30 Sep 2022 12:10:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeEqT-0092Wz-4E; Fri, 30 Sep 2022 12:10:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 96F0FB8271A;
	Fri, 30 Sep 2022 12:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D849EC43470;
	Fri, 30 Sep 2022 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664539817;
	bh=Wr9kLRkpR89dsJoFBQYKEU+VDLeRWEFtjxk7UOSaQIY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GcJf0GR0bU7IOZnZi7DJA0OYE7pugV3SZD7osq3e1LC6SmOBOTHvkLfAeJCPzLlgx
	 KaTFe6EdbWne43W1pVCDxguRGzeOWcWzXp9kHBkXk01T0jtbXh8OeMT5HJQKU65+O8
	 oTUTeoYh+3oJiGjD59jnwW6YYT2+1E4mSMouo3JgkOFivkYMOC5sfpEAqUYJsw7s8L
	 9xgtby86T/5oa8QS2BxD42CvKbV7dm68RkBPO4vm7N4G4vCf28sndMHz5N2Dyq5dKV
	 NakcWPPqJMDKn/HEe5LYQofpCghNUUGNMzaE6wYonKF58FS/16483IbroiegSrCJ2h
	 U0E9Hm3LnlDuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6DD5C395DA;
	Fri, 30 Sep 2022 12:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/4]  Mediatek ethernet patches for mt8188
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166453981774.22292.11611575581235201348.git-patchwork-notify@kernel.org>
Date: Fri, 30 Sep 2022 12:10:17 +0000
References: <20220929014758.12099-1-jianguo.zhang@mediatek.com>
In-Reply-To: <20220929014758.12099-1-jianguo.zhang@mediatek.com>
To: Jianguo Zhang <jianguo.zhang@mediatek.com>
Cc: davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, biao.huang@mediatek.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_051021_346131_284F27F1 
X-CRM114-Status: GOOD (  10.59  )
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

On Thu, 29 Sep 2022 09:47:54 +0800 you wrote:
> Changes in v7:
> 
> v7:
> 1) Add 'Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>' info in commit message of
> patch 'dt-bindings: net: snps,dwmac: add new property snps,clk-csr',
> 'arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr''
> and 'net: stmmac: add a parse for new property 'snps,clk-csr''.
> 
> [...]

Here is the summary with links:
  - [v7,1/4] dt-bindings: net: mediatek-dwmac: add support for mt8188
    https://git.kernel.org/netdev/net-next/c/c827b7a3fed5
  - [v7,2/4] dt-bindings: net: snps,dwmac: add new property snps,clk-csr
    https://git.kernel.org/netdev/net-next/c/22ba1afdec08
  - [v7,3/4] arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr'
    https://git.kernel.org/netdev/net-next/c/7871785ce92d
  - [v7,4/4] net: stmmac: add a parse for new property 'snps,clk-csr'
    https://git.kernel.org/netdev/net-next/c/83936ea8d8ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



