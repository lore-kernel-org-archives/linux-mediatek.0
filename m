Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93D2C6FD18
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Apr 2023 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgvNKCP1h6Vw0T51zOQJbGB+pr2cZNAeHUcINYGt6KA=; b=10R6IJeqap/qszTOZSZYhex82R
	erJSJOIV5FuEcdGHYOwmRtPnCOkf3hiPWjpgpb+aMgAUrz+ngFPamTaWqKTIDyN3nBkUfvw+iwT/F
	GcowO4y8DnJw4lMVXRrBGXXjGYDoatN+qpw8a9HXTiuiQtHEaaePkBIBt+JYuT1OcIqdN3EcnY7L3
	dYM/b6mj/8w8ZVVEBlsoeY4Ri3dRh+Wh4aPTFcavTXA1W7tPAswrSHMpyoJMO1VBCD9rfzhJWvYEM
	2eg8azaKqIzheesX+Oi7bzHci2nYeW8NPhVAbIRyr14fXiPSpebwLrIm3fWPKQ3fw5p89b7W1tDOl
	fPNWc/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqDAB-00Cvye-11;
	Sat, 22 Apr 2023 13:20:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqDA7-00CvxI-1I;
	Sat, 22 Apr 2023 13:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB9D6601BD;
	Sat, 22 Apr 2023 13:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 193C2C4339B;
	Sat, 22 Apr 2023 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682169620;
	bh=rNqJt/U2DV7UKK5IXLG+r8263C65IuFuKNAfZWXNhuk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MARTSRX7DCUmlPFHgkUi4Bvzba/MLqwBXnFyqT5hRKrs9o/bn+eHf3iG7h9jI3sN+
	 8ccZTuA2SAuZt/0vIcB6amWZe93lTSfX5zww/Ep1MUO9RPFK8+eLZ5r4U4Jfwp0nP5
	 473Nszs8PSoEML1VCh2Ec9tKUiPau6dcyuUg0H3arDNUClujouVTQKSHKlcaCDwJHV
	 fvHOEELQ0eDtiCwarmibZE3F3eOFhaSjftTpdWyS+t+eMXvk/0Irrtu2xr4aO0uzvZ
	 w4l17hhDORxaYz8xFRdb4G5BX69mv+GjR3wS1R0csYJdM8BLYg8VQjZaOZRF18Dqzz
	 LpFIY53l2ElFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EAAB6E270DA;
	Sat, 22 Apr 2023 13:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] net: ethernet: mtk_eth_soc: use WO firmware for MT7981
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168216961994.26753.10467952224917211812.git-patchwork-notify@kernel.org>
Date: Sat, 22 Apr 2023 13:20:19 +0000
References: <cover.1681994362.git.daniel@makrotopia.org>
In-Reply-To: <cover.1681994362.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230422_062023_500085_1E361E24 
X-CRM114-Status: GOOD (  11.83  )
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
by David S. Miller <davem@davemloft.net>:

On Thu, 20 Apr 2023 17:04:02 +0100 you wrote:
> In order to support wireless offloading on MT7981 we need to load the
> appropriate firmware. Recognize MT7981 by introducing a new DT compatible
> and load mt7981_wo.bin if it is set.
> 
> Changes since v1:
>  * retain alphabetic order in dt-bindings
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: net: mediatek: add WED RX binding for MT7981 eth driver
    https://git.kernel.org/netdev/net/c/cf88231d9739
  - [v2,2/2] net: ethernet: mtk_eth_soc: use WO firmware for MT7981
    https://git.kernel.org/netdev/net/c/86ce0d09e424

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



