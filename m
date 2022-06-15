Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB79CCA47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 05:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvzQIU8XLchjEewfe7SmMrUf8Box10SSIYtBF0r8B6k=; b=buy1TYoW17gXfL
	eysUv5aAM4+JJbC6nWaELrNWenun1l3my/zGKj1I5Vl3kzAXVg5bzzZahfvJdh0or0WTBWRGuKMrt
	8K6ANftZyA39/y3jY2Gqaog7xyY4slwz73lQWSLS9W2misEy/Gm6x0S6ziO26mAGESVZFywfLKXR1
	OA9ATLtkt6lgbt2gLSpgISciIlflbyIBNJT5FZ87YzBSk6/c4vln2fQjUIl/2HxQqNmo90oJid2hi
	alK2tbhw+nDs4fJ1JgaUBNR/w99oXn1impRcSHrn876Em/Z02gGPfV3H/mwBVydM/CUVsKsni/kEL
	hhXNyUESZ2DdQBDxSQuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1LvA-00CiZw-Nq; Wed, 15 Jun 2022 05:50:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Luy-00CiVj-SF; Wed, 15 Jun 2022 05:50:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B3FD6177C;
	Wed, 15 Jun 2022 05:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C129C3411B;
	Wed, 15 Jun 2022 05:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655272214;
	bh=uOJq8k0K/tF8dz3zOSCS8OJ30XH24V4q7h1yz7qmYrY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YxlEJkVjxxO1vcO+UDoS/GMfo30Aez0eDAgfLxRFHrWrnfIKGHxOjuTC+ts0JSuv/
	 JC6xz8GULaJ8HF3wmvuwH6a5UNvooOu5fdoqZo7WN8e/yNlb2oM6Z3JEbNWDiADHNo
	 jTFaRNyVSF3GkuUiz0zvg+yOFfV3SLFheOIjo3Sv34/tb7QcmTVgifE3YLcoerFKGd
	 d3MU7DJV76AtmnIVr+0nGNxo8eOHbL8I25D7/r4zoweST3J0ElVZedruKwfHHapVQt
	 rRLqzDEY/Nxiu6yirzMGkdQeOI4BoIiOrapcHhCE8TdJ1EaHntbmo1zOzBEe0BlTp8
	 SvJ8MighoX47A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F678E56ADF;
	Wed, 15 Jun 2022 05:50:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/6] Support mt7531 on BPI-R2 Pro
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165527221445.3487.2646030857898317567.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jun 2022 05:50:14 +0000
References: <20220610170541.8643-1-linux@fw-web.de>
In-Reply-To: <20220610170541.8643-1-linux@fw-web.de>
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_225016_995299_A0EBCF88 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: andrew@lunn.ch, heiko@sntech.de, opensource@vdorst.com, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, mchehab+samsung@kernel.org, f.fainelli@gmail.com, linux-rockchip@lists.infradead.org, gerg@kernel.org, kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com, devicetree@vger.kernel.org, Landen.Chao@mediatek.com, sean.wang@mediatek.com, dqfext@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pgwipeout@gmail.com, olteanv@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 10 Jun 2022 19:05:35 +0200 you wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This Series add Support for the mt7531 switch on Bananapi R2 Pro board.
> 
> This board uses port5 of the switch to conect to the gmac0 of the
> rk3568 SoC.
> 
> [...]

Here is the summary with links:
  - [v4,1/6] dt-bindings: net: dsa: convert binding for mediatek switches
    https://git.kernel.org/netdev/net-next/c/e0dda3119741
  - [v4,2/6] net: dsa: mt7530: rework mt7530_hw_vlan_{add,del}
    https://git.kernel.org/netdev/net-next/c/a9c317417c27
  - [v4,3/6] net: dsa: mt7530: rework mt753[01]_setup
    https://git.kernel.org/netdev/net-next/c/6e19bc26cccd
  - [v4,4/6] net: dsa: mt7530: get cpu-port via dp->cpu_dp instead of constant
    https://git.kernel.org/netdev/net-next/c/1f9a6abecf53
  - [v4,5/6] dt-bindings: net: dsa: make reset optional and add rgmii-mode to mt7531
    https://git.kernel.org/netdev/net-next/c/ae07485d7a1d
  - [v4,6/6] arm64: dts: rockchip: Add mt7531 dsa node to BPI-R2-Pro board
    https://git.kernel.org/netdev/net-next/c/c1804463e5c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
