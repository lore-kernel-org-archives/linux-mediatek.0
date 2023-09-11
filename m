Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FCEEEB580
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3UorbiQ7oQoLOGP9Vy6Qk5CHe9MvbFaiAnLuz6sKkc=; b=ssFKWxUwCvk7AguwqiaE4aMibW
	yddwVXQyYzMeMpU4fwWN5L5GHJMSVdhMcOWOEsh1bqyuq7VykJUt6zOkQAoRROTNpJb1pg/BTaSaF
	bo+cxPa2H43HPCpniO/Vql/NAnbmf6Qni9xxfy57NDNvCgTdOuU7bSWIzZ18AcJffRc7rGPwMlff0
	oCq+k/MSprTNFUrL5YbAsG/9cKaOKzdqzZVSWd9RMLqu6tLEBXIito3uMWTi9SGzHWmK4kvUrD+LM
	KcFBWTgP8OlnBVGAg+s/rTNgXc5f4RgLqsmBkzrRBK09Ze6bK5NUDpm1F3o9UvPU7T4Y16rD43M9D
	kbMHIHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbNo-00HPrQ-0x;
	Mon, 11 Sep 2023 07:30:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbNk-00HPpg-2L;
	Mon, 11 Sep 2023 07:30:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 07322CE0F87;
	Mon, 11 Sep 2023 07:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BCA3C433CB;
	Mon, 11 Sep 2023 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694417450;
	bh=F/eFclIfgLF5FOW+UKQadQ3L0RVkLh2WomP2znmNaJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=agBSx1b5pRY8gRBVMkDFhXrwuIybXtjtk6RGZGXVFY7R/fiso+PDPq9+SnlkbooSw
	 Mra3cFK+szkmxvErQw7Rlp6tXC77v1mUHnhxkPDQyP7N/4pK/wEedjl5br4ucNfmQW
	 F+3GrVH4kb9M40T9cfqDPm2g9mj0Vx6kitZYYX2e7PoO9iYo47HDeseguOGky5C/U/
	 TEJdzjWNxFo8otLAqJQP0bT5FOEVKlzneezGIQ1wwx4OP6AxYekAdljTrYyUlPQu5y
	 rA1tE4rO2DnG9BnXMAD0XVT9vqKscSoA5lAsvHJWI1SU6CiEjQte9ehLt2UrSgY7aK
	 4XC/a1PIuekZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EBF86E1C282;
	Mon, 11 Sep 2023 07:30:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] Fix possible OOB write when using rule_buf
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169441744996.31104.2679100450916464813.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 07:30:49 +0000
References: <20230908061950.20287-1-hbh25y@gmail.com>
In-Reply-To: <20230908061950.20287-1-hbh25y@gmail.com>
To: Hangyu Hua <hbh25y@gmail.com>
Cc: justin.chen@broadcom.com, florian.fainelli@broadcom.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mw@semihalf.com, linux@armlinux.org.uk, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 maxime.chevallier@bootlin.com, nelson.chang@mediatek.com,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_003052_947227_7434D7A2 
X-CRM114-Status: GOOD (  10.16  )
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

On Fri,  8 Sep 2023 14:19:47 +0800 you wrote:
> ADD bounds checks in bcmasp_netfilt_get_all_active and
> mvpp2_ethtool_get_rxnfc and mtk_hwlro_get_fdir_all when
> using rule_buf from ethtool_get_rxnfc.
> 
> v2:
> [PATCH v2 1/3]: use -EMSGSIZE instead of truncating the list sliently.
> [PATCH v2 3/3]: drop the brackets.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] net: ethernet: bcmasp: fix possible OOB write in bcmasp_netfilt_get_all_active()
    https://git.kernel.org/netdev/net/c/9b90aca97f6d
  - [v2,2/3] net: ethernet: mvpp2_main: fix possible OOB write in mvpp2_ethtool_get_rxnfc()
    https://git.kernel.org/netdev/net/c/51fe0a470543
  - [v2,3/3] net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_hwlro_get_fdir_all()
    https://git.kernel.org/netdev/net/c/e4c79810755f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



