Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89ECC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 20:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puU+obegi/MA2EKTQqyHMKZes/ThDwpG5fUYX8cI2FM=; b=BIhgdMB8h/PHWa
	U4YDeF0rFg0tvCGg2UQjW1cp2lhiFMJgD5sMH6f8djA3R9dOVysOoAFQRQ2+IN7m7C7i4WaESZAr5
	3qyImbOM8t+havl0AKtwDwigobaAywjxoOyJ/hr0V3arL/D4qtw3brt28vIayt4m8qmdN5VaPhdsh
	mau8jCoztjLxf1SqT6JsjD8xHLvPLy+5oxUofdJaG1cBbt3vqHT30IY9cSEpQOkhi9ndYP+siksGs
	+4UibsndMp2cVHX/Xi3qk8wlwWEHIhlMqWTV6t88NWB8FKaZ9BFZTKMUPsA4MHu+ElIK5AWofZB4I
	F/sDtvGOoZ+WP2Obw74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvPag-00HPdD-IY; Thu, 09 Dec 2021 20:00:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvPaR-00HPUU-Kh; Thu, 09 Dec 2021 20:00:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 56224CE2831;
 Thu,  9 Dec 2021 20:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82D2AC341C7;
 Thu,  9 Dec 2021 20:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639080011;
 bh=CC42lOz3dSjTXthF3XhDSnDdabQHMrBqGRB87P6fUIc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GcqepBvWSYgQRwwc01jCgG1YpR8Ii02T8OjNpznu1O35UlIaqKeSvdOTkZnZsgwdA
 ao9/Qj1DXD641dIUnkS7jzp2oOqy/CMbjF9vcm/xciTJ0vANbM6UNnRNyhGiICpRKb
 mS304U9aFMhmvFyP5JQeRb4hTy2iFC2kLMgSBJH2CZr2RDxdCoKNaBX8M9m9gm8mMA
 rmVeZ8GWhUZlxpr4wsrjSDsNA1l8FiiTU4O4SDxbCbWWooQFhzAo9NL12OlW2KIM/i
 SP2RxtmoC+mytLsGZB1/drXKklBGYmuD6T12O+MyyCGAfk1U18UXO7O1O47wv+jr8D
 4ru5w0pNFCujg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 510AB60A54;
 Thu,  9 Dec 2021 20:00:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next 0/5] net: phylink: introduce legacy mode flag
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163908001132.24516.13773473862700421452.git-patchwork-notify@kernel.org>
Date: Thu, 09 Dec 2021 20:00:11 +0000
References: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
In-Reply-To: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: chris.snook@gmail.com, nbd@nbd.name, f.fainelli@gmail.com,
 john@phrozen.org, Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
 andrew@lunn.ch, davem@davemloft.net, hkallweit1@gmail.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_120015_904646_52A7B6AF 
X-CRM114-Status: GOOD (  11.52  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 7 Dec 2021 15:51:53 +0000 you wrote:
> Hi all,
> 
> In March 2020, phylink gained support to split the PCS support out of
> the MAC callbacks. By doing so, a slight behavioural difference was
> introduced when a PCS is present, specifically:
> 
> 1) the call to mac_config() when the link comes up or advertisement
>    changes were eliminated
> 2) mac_an_restart() will never be called
> 3) mac_pcs_get_state() will never be called
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: phylink: add legacy_pre_march2020 indicator
    https://git.kernel.org/netdev/net-next/c/3e5b1feccea7
  - [net-next,2/5] net: dsa: mark DSA phylink as legacy_pre_march2020
    https://git.kernel.org/netdev/net-next/c/0a9f0794d9bd
  - [net-next,3/5] net: mtk_eth_soc: mark as a legacy_pre_march2020 driver
    https://git.kernel.org/netdev/net-next/c/b06515367fac
  - [net-next,4/5] net: phylink: use legacy_pre_march2020
    https://git.kernel.org/netdev/net-next/c/001f4261fe4d
  - [net-next,5/5] net: ag71xx: remove unnecessary legacy methods
    https://git.kernel.org/netdev/net-next/c/11053047a4af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
