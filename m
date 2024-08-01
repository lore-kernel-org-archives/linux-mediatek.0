Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B28CC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 16:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLLLSMlBcj1TL1A2hH6gj1aMehPQ9jKgelQSIwy15jg=; b=3lABvMn5CWWdS8nC6MCQBdsp+a
	2wIOJuyo7untapSjq6ZoN0k0G+01YvffbmTKSkkH9CU6O1Jbjd2229TQZAbNgb4/CaOaV/ysBZteo
	lYwM+aPhwiqTOjS2lLlVAJ7bty+e4cSelcnVe++kUX4fQeYXcVZZ4EFXATc4/9q5lR9L8iZhMLFKr
	JlnTFaexJXG/zwkax3BMwyIomc33yB/Wv02ehrWs9h5zRIXoY853747cvcCOHQAYX9uuLI99kNf6F
	BUJ190AWwiX3cbmN4bD32MK+s2KpDKcaXLfGhsdUBv1xhiJKce5MojBGIHGbhwJEI0QXZ+sVQk32M
	NYbOye5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYP7-000000060Iv-3TQD;
	Thu, 01 Aug 2024 16:11:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYNw-00000005zl1-2Lyd;
	Thu, 01 Aug 2024 16:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94C02CE1A51;
	Thu,  1 Aug 2024 16:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B19BCC4AF0E;
	Thu,  1 Aug 2024 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722528633;
	bh=SKNVY1pGpUiuxHoYtnVcTNVtUPGQji5HRvtNZEn9TR0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E9ZLEHG+nKAzwqcbL3U/mEhcOfJ2msFQGubiZHw2K/cIMgIV8i4SLzmFV05DK2w56
	 ql8gnZMmVo+7xAO6xt4mu7o75wN9w6bGtNNWNeauOf4ILfKcBj/H/T6lHIU4kC5Kc+
	 Lbz1R/237laOyuCR+ONiNAIpxT6G2EcSO/fFEvm0tjNOZtbkR0+PMuFB0BxToGCda6
	 qUEXgHkaX2b02l6sJKCuclZJ9GclS+bUZEmOwtykTrCejamaQYPkuElBzZcwflCZxG
	 /Dt3RiLF2/8nkyTYiyzSfvoyG7VoCpmBSY5pPdxhzA3b9RfLc+xDtLxmlybqIOmRGM
	 d3rd707HnI6CA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C92FC3274E;
	Thu,  1 Aug 2024 16:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: ethernet: mtk_eth_soc: drop clocks unused
 by Ethernet driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172252863363.25785.16861658663358543639.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:10:33 +0000
References: <b5faaf69b5c6e3e155c64af03706c3c423c6a1c9.1722335682.git.daniel@makrotopia.org>
In-Reply-To: <b5faaf69b5c6e3e155c64af03706c3c423c6a1c9.1722335682.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_091036_802577_7FF96B36 
X-CRM114-Status: GOOD (  12.47  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 30 Jul 2024 11:36:42 +0100 you wrote:
> Clocks for SerDes and PHY are going to be handled by standalone drivers
> for each of those hardware components. Drop them from the Ethernet driver.
> 
> The clocks which are being removed for this patch are responsible for
> the for the SerDes PCS and PHYs used for the 2nd and 3rd MAC which are
> anyway not yet supported. Hence backwards compatibility is not an issue.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: ethernet: mtk_eth_soc: drop clocks unused by Ethernet driver
    https://git.kernel.org/netdev/net-next/c/887b1d1adb2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



