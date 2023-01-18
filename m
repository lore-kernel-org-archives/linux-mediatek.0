Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20720C38142
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFNPWSDoDNOdJA7vLO1Yc8qRCx+HHXIaOvbt8FxG434=; b=GLITYte8Hb7/33fGR6W3Ck8MHC
	RnPeSg9w2xfbqdcFXL+3syTOAjser28FYOhWZ/77S9IbtcCoXb64HyWkdk/17SYkf3O/8NFhQ/ySb
	eNTy1y/ez2qUY/ri94LTOhG7TijEXpakzafS6iaQ2kQwxm4AAEuzEfDzprzfAWKwo2s9Y3AdikWpk
	WndAeurXfNMgt2VIKGqQ11lcEm4CoPTU/97d/SFIFVU5LZUN4bYjBVamQZB5ufcIpSb0zp2TJXfQc
	2pBk/7DfH9Be7BwCTearCP/CkfZ5TqidbWZaKiA9A+hNMGY/P8hGpoqwWvGJvmTqIlhr7SOTsXZAw
	mEy2XuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzJV-00GmdV-AN; Wed, 18 Jan 2023 03:40:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzJJ-00GmZZ-OC; Wed, 18 Jan 2023 03:40:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 450C6B81AEE;
	Wed, 18 Jan 2023 03:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1B38C433D2;
	Wed, 18 Jan 2023 03:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674013218;
	bh=LAEh1qjeJJ3YVp+GzADUviUyXXdjaMIyAqB9kh1X3d8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cLz7/cNXQ3WV7JrQfGkdGY3wR5Gk7CowU9fGOo5Qfk1W7eve67VpHaazDA4NkYpBf
	 Ep5DtxJY1f/46UyNY0DljFA91DZAHOoFA3Tk20yYudM/DIpAFqFqVMuLQ6J9nEpSFy
	 vfkflOtniiVkgn3TJXTU0ZnC4Rw+vNZK6zVflaCezisCASPbsfnM9GypaheK2gsA9D
	 MTxWQV8V0OvZA3TnIEiva1VSha91BCNNWXxNeEo+jLvgVTvqSTUjQWQxsEuBxo5tXw
	 a0vnjNyeXHnYqFcb3Gs3/p1ZzBJwEAs7APyFilUpgW62Mi8R5yDEoezLBFnnSC5QBa
	 U60lFiLKvpFwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4C45C395C3;
	Wed, 18 Jan 2023 03:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/12] net: mdio: Continue separating C22 and C45
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167401321873.20942.13534371074632308788.git-patchwork-notify@kernel.org>
Date: Wed, 18 Jan 2023 03:40:18 +0000
References: <20230116-net-next-c45-seperation-part-3-v1-0-0c53afa56aad@walle.cc>
In-Reply-To: <20230116-net-next-c45-seperation-part-3-v1-0-0c53afa56aad@walle.cc>
To: Michael Walle <michael@walle.cc>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux@armlinux.org.uk, bh74.an@samsung.com,
 nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
 yisen.zhuang@huawei.com, salil.mehta@huawei.com, thomas.lendacky@amd.com,
 Shyam-sundar.S-k@amd.com, s.shtylyov@omp.ru, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-renesas-soc@vger.kernel.org, andrew@lunn.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_194026_118405_B4060C16 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 Jan 2023 00:52:16 +0100 you wrote:
> I've picked this older series from Andrew up and rebased it onto
> the latest net-next.
> 
> This is the third (and hopefully last) patch set in the series which
> separates the C22 and C45 MDIO bus transactions at the API level to the
> MDIO bus drivers.
> 
> [...]

Here is the summary with links:
  - [net-next,01/12] net: dsa: mt7530: Separate C22 and C45 MDIO bus transactions
    https://git.kernel.org/netdev/net-next/c/defa2e541894
  - [net-next,02/12] net: sxgbe: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/e078c8b5eab7
  - [net-next,03/12] net: nixge: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/064a6a887f95
  - [net-next,04/12] net: macb: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/a4d65b1de2a2
  - [net-next,05/12] ixgbe: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/308c8ffd5a7d
  - [net-next,06/12] ixgbe: Use C45 mdiobus accessors
    https://git.kernel.org/netdev/net-next/c/ab2960f0fdfe
  - [net-next,07/12] net: hns: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/41799a77f4bb
  - [net-next,08/12] amd-xgbe: Separate C22 and C45 transactions
    https://git.kernel.org/netdev/net-next/c/070f6186a2f1
  - [net-next,09/12] amd-xgbe: Replace MII_ADDR_C45 with XGBE_ADDR_C45
    https://git.kernel.org/netdev/net-next/c/47e61593f367
  - [net-next,10/12] net: dsa: sja1105: C45 only transactions for PCS
    https://git.kernel.org/netdev/net-next/c/ae271547bba6
  - [net-next,11/12] net: dsa: sja1105: Separate C22 and C45 transactions for T1 MDIO bus
    https://git.kernel.org/netdev/net-next/c/c708e1350370
  - [net-next,12/12] net: ethernet: renesas: rswitch: C45 only transactions
    https://git.kernel.org/netdev/net-next/c/95331514d95f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



