Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E77C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 22:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgYBOp87BaDNqRuyE+5Sw9vBnVYOlxsByHLW7CrR3rE=; b=NabmMDnGCeUzHizUTYSxwYGWgf
	2CJoU+DeM21hMlZEGi1ArgdR7bbH6UuBgGmxlOy7Jvw45LWOSK4aneY7/ksPeErI//mMirByk8uUj
	L/4IGiVFRBo3/04du6vLNxtIylhmViTqNj31I0aKf3Rhoxp0q60tefPNvKpYC+nEq9fxyErx4H7oE
	HsOtBmnbW8KK4OH+70iIgSCNYPYWZnt0bLUAflaSC25AxBZCXbGdNt1SRQAH9DFL8zdZAUTD7pguT
	jB9ib38Gm6Prwgk+8xE8o7ZlHC7zz61VGGw8Y/7enQO3Vmy7XxbMUDdbq6vcc1iWQvc59+aI57Z/3
	Jtgq+FrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8quE-00374z-44; Tue, 05 Jul 2022 22:20:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qu2-00372q-TC; Tue, 05 Jul 2022 22:20:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7D9F5B81A23;
	Tue,  5 Jul 2022 22:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34CBFC341C8;
	Tue,  5 Jul 2022 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657059613;
	bh=hO8W+SqlzzWY0MFtfKjDaAWoxPd/3Fuy/QNL1MwRuIE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JCf3iPcDRemhVC3u0Q27/2BNmFjpu9gOf0/gcmnejIZw2xdL6dx2bDX6QO8TiUnaC
	 O55QGvx0NxQFrbFyZbsIPalOrABMufYV+zG6040DspJ20CyRavsAOtnYRQ+FbgR5EA
	 O7K0S6iqBq/syZByyHy2ePJSlephfbStUWzw/DWmI93naV88L8DXpXnpjQT+9ydAQI
	 HFNkFVzlp6GTVc2kgrz+dUWG+eKz0uwQ/kY6QPvHrKQHocL8TEJ7NSgmzenBVILa8u
	 BsUT8bNRKuD/0kz8GSbaZn7/2+NZqylKQ5x2DGddKFDPVUneVQtkrbW2oH0VHibgxu
	 oESy+gYD/nC5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16F3BE45BDB;
	Tue,  5 Jul 2022 22:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: Add missing 'reg'
 property
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <165705961309.16452.8847094115538179465.git-patchwork-notify@kernel.org>
Date: Tue, 05 Jul 2022 22:20:13 +0000
References: <20220701222240.1706272-1-robh@kernel.org>
In-Reply-To: <20220701222240.1706272-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_152019_119011_E8906280 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, f.fainelli@gmail.com, netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org, davem@davemloft.net, dqfext@gmail.com, edumazet@google.com, pabeni@redhat.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, kuba@kernel.org, olteanv@gmail.com, vivien.didelot@gmail.com, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  1 Jul 2022 16:22:40 -0600 you wrote:
> The 'reg' property is missing from the mediatek,mt7530 schema which
> results in the following warning once 'unevaluatedProperties' is fixed:
> 
> Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.example.dtb: switch@0: Unevaluated properties are not allowed ('reg' was unexpected)
> 
> Fixes: e0dda3119741 ("dt-bindings: net: dsa: convert binding for mediatek switches")
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: dsa: mediatek,mt7530: Add missing 'reg' property
    https://git.kernel.org/netdev/net-next/c/3359619a6ea5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



