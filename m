Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FFEC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Oct 2022 02:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/wgu8D6BnGyslS2RwMQCzh+lbCJc8Y4TAjoxjwn27k=; b=Q24lCuW4IS3C/ueLanCjVnArEO
	unf84+Y0/xS8wH12xYmp2+hbWvnuGWQjpwAj+644L3aHUxJU+dgOCJ+OawChgAEufKCRlVDBj4Z1o
	GvdBXNFLavxUL0i3eRadcZJDVsFxpBZNgDGcj4Ml6mCJI28cnJTYCgKZZfUt6BwYVkcXDTF61phLq
	upLXhCyFRVb1J6zLyBuJBOU/ZESaidqAyfZ0TQOR0joEY3ezkJCQNQb4HGz9FD4K4B+zxsl54xb4v
	wNagQHmJ1PhphJQm/qtq7+UbI5D2jc6NOB+PbfnNGcve/+AA0ba5VfnkpI0ww/8ggYLKkZw0dmk1k
	/ELPPfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeS7J-00CezV-K4; Sat, 01 Oct 2022 02:20:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeS7H-00Cewf-9m
	for linux-mediatek@lists.infradead.org; Sat, 01 Oct 2022 02:20:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E1098CE275D;
	Sat,  1 Oct 2022 02:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D3FAC433D7;
	Sat,  1 Oct 2022 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664590824;
	bh=v1Y3KSUbzDa+6fRHZWDYww6W7f4VLs63qATncEW6lzg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FtsgGxt7vVgOmUpOi1e5th8ym/9fqsCcfNC54UJOz4WqHPW8TZ+pg7S5QL4VHkD5s
	 XFwemdzLSM+am/4TTCvIAfomrX2a6YjcgBkcRuzuZOv/Chpu7pNss5A0IdUzlu6e9A
	 rKETVVU74O6YUMZQQ2mQDbbA8GQjgwVZZlv0zg/p/npAy2VKGCNyvvej9aoYeGvNBS
	 0sCtQugoTeMaLqktyIWrN/5CnXONjImpN8CrkaljI/qfhgo/+v53U3R0sN3j+osx6q
	 kcF+ujnu1yyE1ubEPSnaA+M+IOoDDheERDvmhQ7R4ohyZNuhsJJYCGbxep/rj4Y3c1
	 OjSIxn30gFsmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 011BCE50D64;
	Sat,  1 Oct 2022 02:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix state in
 __mtk_foe_entry_clear
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166459082399.26825.7869128536663169925.git-patchwork-notify@kernel.org>
Date: Sat, 01 Oct 2022 02:20:23 +0000
References: <YzY+1Yg0FBXcnrtc@makrotopia.org>
In-Reply-To: <YzY+1Yg0FBXcnrtc@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: kuba@kernel.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, lorenzo@kernel.org, sujuan.chen@mediatek.com,
 Bo.Jiao@mediatek.com, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com, ptpt52@gmail.com,
 thomas.huehn@hs-nordhausen.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_192035_542199_138CD3DF 
X-CRM114-Status: GOOD (  10.28  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 30 Sep 2022 01:56:53 +0100 you wrote:
> Setting ib1 state to MTK_FOE_STATE_UNBIND in __mtk_foe_entry_clear
> routine as done by commit 0e80707d94e4c8 ("net: ethernet: mtk_eth_soc:
> fix typo in __mtk_foe_entry_clear") breaks flow offloading, at least
> on older MTK_NETSYS_V1 SoCs, OpenWrt users have confirmed the bug on
> MT7622 and MT7621 systems.
> Felix Fietkau suggested to use MTK_FOE_STATE_INVALID instead which
> works well on both, MTK_NETSYS_V1 and MTK_NETSYS_V2.
> 
> [...]

Here is the summary with links:
  - [v2] net: ethernet: mtk_eth_soc: fix state in __mtk_foe_entry_clear
    https://git.kernel.org/netdev/net/c/ae3ed15da588

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



