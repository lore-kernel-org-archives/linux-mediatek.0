Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E722BC3DA66
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 02:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tmv6PJFto1SVryX29Ne5PdrpkVZgZrRnCDNhgjp7Vk8=; b=B5lgxpSeXQe1FBXyGddXS4WTdj
	myjH9XmpIBf7PwctiCZQnsFZwmYNi4bc1riqffBQxQHc5hzPUTHW4pdDnKMNewjaXjcfJzKINK6eP
	y1634aBbMI/aEWoWhN5uMK6/w7hp96FTxTkrOKNbu27GY8/pY4ln6ekjyIUEosDHqPteX+6zayEEN
	bpRq1IVHDpPIStejYeFSzGgsoNz/tTep8+sRWPlZdbCuoLqOvUNVX6HbAWdO3w8Li26jv9KvghDHb
	8t5q9UhB/jGzHqJ6ukd69Rr+NdOJecJPxzKG8AYu+DtZykgOPBZvDFpV3jFhLP53cLJ7yNKITLv71
	wXEG2+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ07B-001y8F-2l;
	Thu, 24 Aug 2023 02:30:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ078-001y6w-26;
	Thu, 24 Aug 2023 02:30:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 35BF2653CE;
	Thu, 24 Aug 2023 02:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 163D0C433CA;
	Thu, 24 Aug 2023 02:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692844224;
	bh=9Xb37OSDJN57bJvKF/3cFqqWU91ZHJ/cqmbZ1guvma4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FC/V84pP4Kluj8GF5Bg5IHVBAJWd1OJdu1XutdSouErp7c4EsaiT5lBnMFBkivf5f
	 /ewPNVv9XoGBEzn4ZwrrXYesNAB9oY00GoKL2UohT+TDrY49CtDl/sK3TkNb15zibx
	 +qOxyyVE0kGU1MPXBZgWXX2B1cBNZXwh390fqAF1lmS6Pqc3iK+LoYCMp1xIuHeehI
	 ynCVw2Knv7xDCTxzma72q9ydJEsqRWGvtV+aYx7av2GuTr06HmaMbo867mgP7rj1tP
	 v1dsPn1JpgHJYEfbx5HIdgOBCDd47P9a977LLAN2ubgBygoONPWrsDQqHnohivzCJ1
	 PHuVEjRp3MxiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EB4A7E4EAF6;
	Thu, 24 Aug 2023 02:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/4] net: ethernet: mtk_eth_soc: improve support
 for MT7988
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169284422395.2546.12287101492552231894.git-patchwork-notify@kernel.org>
Date: Thu, 24 Aug 2023 02:30:23 +0000
References: <cover.1692721443.git.daniel@makrotopia.org>
In-Reply-To: <cover.1692721443.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_193026_756464_B2956E8B 
X-CRM114-Status: GOOD (  11.27  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 22 Aug 2023 17:30:56 +0100 you wrote:
> This series fixes and completes commit 445eb6448ed3b ("net: ethernet:
> mtk_eth_soc: add basic support for MT7988 SoC") and also adds support
> for using the in-SoC SRAM to previous MT7986 and MT7981 SoCs.
> 
> Changes since v2:
>  * fold changes to commit they were supposed to go into
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/4] net: ethernet: mtk_eth_soc: fix register definitions for MT7988
    https://git.kernel.org/netdev/net-next/c/cfb5677de5ba
  - [net-next,v3,2/4] net: ethernet: mtk_eth_soc: add reset bits for MT7988
    https://git.kernel.org/netdev/net-next/c/88c1e6efb7a5
  - [net-next,v3,3/4] net: ethernet: mtk_eth_soc: add support for in-SoC SRAM
    https://git.kernel.org/netdev/net-next/c/ebb1e4f9cf38
  - [net-next,v3,4/4] net: ethernet: mtk_eth_soc: support 36-bit DMA addressing on MT7988
    https://git.kernel.org/netdev/net-next/c/2d75891ebc09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



