Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A04C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC69960EFF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC69960EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WBJBjK5VoU518WB0BUE3tIkjcNg/osLxislbWor+ig=; b=2t1ySXLxDY7hb3
	98pNZ61/V/YyMAYKclbqkO/zza5o32qEw9ydwxmtZ5a+fzd6CxkjapHeQ4cOcE4TUippQVLBwiAbX
	1OIIzWrw1oUYLHbIZ90A2LxW1EShKgw49cPPlJNldlj7BNtroLll9rTi3PaSa8XX2T2HeFpPtSR2K
	GKI9fO6nZz2df/aCmaoeT0huAinMy4PdimNMXKZ3xKZX/ldlbO7sEbHmfAjfmP5KeoGPJ2Wv4flDd
	lnqg/gadegAQtlIFaKmQSUwav/K2VPR4GXXkoh++JcByRY/cYOBuAxZtEjLDIOJJKthHFUUoxP32O
	p2UnJXbQa7JwGEUXIwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBDNw-005Vpe-7W; Wed, 04 Aug 2021 09:40:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBDNg-005VjV-PV; Wed, 04 Aug 2021 09:40:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id BFD7C60EFD;
 Wed,  4 Aug 2021 09:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628070007;
 bh=QXpULJATBq1ZyXA3JX9FK+mWuomZpAHxFxxPXQSCX6g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JvmOqXldfE/BVuyTcMgRpXC0tK+0fyQ19jbtO/0K7LSUxLQYRuaMxmzwtvUV/JzlW
 3fJHgcVu75AyKAmUi9R+hLiuRYzuaTr01V/8l351dvdLalxjX/cWrC3hqdHwcmAdTA
 vOL7zsmZAlYoklbcVd09CT6aoE2saJbNfbEwWOxmXceqmj3XXYxOPmPUGvCGAlI9Kh
 zxo6k/2phGkRUgRh+kt/SiIGlC009iAMFnvGNFK54xWC0xVgKFKrxfKZg8QkVes9s6
 Znm+cOCtk8to8P74Imrl49luMcl7TrdlTtqVJKyDQzmFP00RZX1elQ6mK489SweGJx
 6EI5UE6Zih4Ww==
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 0/4] mt7530 software fallback bridging fix
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162807000771.29242.1625831528843804010.git-patchwork-notify@kernel.org>
Date: Wed, 04 Aug 2021 09:40:07 +0000
References: <20210803160405.3025624-1-dqfext@gmail.com>
In-Reply-To: <20210803160405.3025624-1-dqfext@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: sean.wang@mediatek.com, Landen.Chao@mediatek.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 ericwouds@gmail.com, opensource@vdorst.com, frank-w@public-files.de,
 ilya.lipnitskiy@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_024008_872477_D6C6603D 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

This series was applied to netdev/net-next.git (refs/heads/master):

On Wed,  4 Aug 2021 00:04:00 +0800 you wrote:
> DSA core has gained software fallback support since commit 2f5dc00f7a3e
> ("net: bridge: switchdev: let drivers inform which bridge ports are
> offloaded"), but it does not work properly on mt7530. This patch series
> fixes the issues.
> 
> DENG Qingfang (4):
>   net: dsa: mt7530: enable assisted learning on CPU port
>   net: dsa: mt7530: use independent VLAN learning on VLAN-unaware
>     bridges
>   net: dsa: mt7530: set STP state on filter ID 1
>   net: dsa: mt7530: always install FDB entries with IVL and FID 1
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: dsa: mt7530: enable assisted learning on CPU port
    https://git.kernel.org/netdev/net-next/c/0b69c54c74bc
  - [net-next,v2,2/4] net: dsa: mt7530: use independent VLAN learning on VLAN-unaware bridges
    https://git.kernel.org/netdev/net-next/c/6087175b7991
  - [net-next,v2,3/4] net: dsa: mt7530: set STP state on filter ID 1
    https://git.kernel.org/netdev/net-next/c/a9e3f62dff3c
  - [net-next,v2,4/4] net: dsa: mt7530: always install FDB entries with IVL and FID 1
    https://git.kernel.org/netdev/net-next/c/73c447cacbbd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
