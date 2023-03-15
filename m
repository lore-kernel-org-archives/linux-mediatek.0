Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4354BC76195
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iczweqCE9OJ3e7FhxM0XlLRdcXuD+dVqquTnL+tieI=; b=A+i90n5P/M6nUYrXagw10w62x/
	H4WWrsNixg+O58eKmQqGy4iXd4KJVjY7s4cwVsKMRi5faVedQMTF2ZwgOCWE+2xPKYkrYH5gDOhaj
	MyH7Big03B6/7fIOqaGzoIGyRlN2taXm8uDkc2XRKhQWHm/k1YQRPsuDFjQlRO34xICokLFeRxTiw
	PatqGUywOMJjhC/GJqMDl5QvWZz3HoJwUktGtuYojs9vkWOhr+FlLVvyVBg2IP53StCE3tfYWZmZT
	avX0LJFQFjQJl0dDqbZBSOh1gskU3wisJgjQNgNS0wScuBi6QdGTXF1P9KawI3Dep120aC2ZNhb0Y
	8y5ORLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMzk-00CqYV-2l;
	Wed, 15 Mar 2023 09:00:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMzf-00CqUX-0w;
	Wed, 15 Mar 2023 09:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08E6A61C4A;
	Wed, 15 Mar 2023 09:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB4FBC433A0;
	Wed, 15 Mar 2023 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678870819;
	bh=zg85Y3KVT7sBvQP4OrW5AAcolBWcX/lD9WhGvmRd3JY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uHFE5USFiTRb3GnTCINqQcMLR275M+LsaT0aY1M9D6oQbXTiuCvH+z4zS68mhnWh+
	 8xZXSnPaTiGciyEIju0JnitCBEZSGWoXj19RBdkqTHShiBOKDNd34jzjlsFPHdWNSy
	 fPXba8xwCjaOik5q5VlR4PJE6FfttOIqi0Tk83kJkut7lc+OJLkNAjsuJvkBfjAoM5
	 iiBZqbkFtv7j7bj4+RgfIWSyrEuGNLTNjxCLhHipxEB1QNPRWLgT8hjQCByvDTDFAI
	 hXPu8GAy2VBUWlVKTGo4CvyogxOXt4ZRC4z1mDDzEeoRAElf880TO4dxP4uzqJ0ox6
	 QwB31EeRhc29w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CBE97E66CBA;
	Wed, 15 Mar 2023 09:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] net: ethernet: mtk_eth_soc: minor SGMII fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167887081883.17591.12121593716328275431.git-patchwork-notify@kernel.org>
Date: Wed, 15 Mar 2023 09:00:18 +0000
References: <cover.1678753669.git.daniel@makrotopia.org>
In-Reply-To: <cover.1678753669.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_020023_408169_834BF7E5 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: andrew@lunn.ch, vladimir.oltean@nxp.com, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, f.fainelli@gmail.com, linux@armlinux.org.uk, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, devicetree@vger.kernel.org, Landen.Chao@mediatek.com, sean.wang@mediatek.com, dqfext@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, olteanv@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, lynxis@fe80.eu, hkallweit1@gmail.com, davem@davemloft.net, bjorn@mork.no, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 14 Mar 2023 00:34:05 +0000 you wrote:
> This small series brings two minor fixes for the SGMII unit found in
> MediaTek's router SoCs.
> 
> The first patch resets the PCS internal state machine on major
> configuration changes, just like it is also done in MediaTek's SDK.
> 
> The second patch makes sure we only write values and restart AN if
> actually needed, thus preventing unnesseray loss of an existing link
> in some cases.
> 
> [...]

Here is the summary with links:
  - [1/2] net: ethernet: mtk_eth_soc: reset PCS state
    https://git.kernel.org/netdev/net/c/611e2dabb4b3
  - [2/2] net: ethernet: mtk_eth_soc: only write values if needed
    https://git.kernel.org/netdev/net/c/6e933a804c7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



