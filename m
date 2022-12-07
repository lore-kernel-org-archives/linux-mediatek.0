Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D129DC47089
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 04:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ0qFTZ+aQj4klAsyz+R8K2SungfjCqIUDIxkr/4Nn0=; b=qdQtxeQUcgYYnXqoX3yg7UdOXE
	csRsAIocXEnQVhrqd8BEXxi4ltq+lVmwKzN2Rd/HFf44fK2N7sIDwR9Wx5KAoCaGPb1YNka6dF/xb
	TK8pyJ2PvdspXGFOPfp7RoKKJEBXm2SRIpYm9Qc7arA8r9cWjU4HzMDjJafeqnWX1qTncatz/4lej
	fjADnodN4Gi1gFIqh68CkQ4IBGfCsTmI84/4/Vgyqt1ebltFR3mliymbtCJAG20m5DDmJFvA08k2c
	CrXblvhQbVwYrBo8ujmq99tQLJP3vjVC4kjxUpjO+SZ9Y2045ouaxKhu2Evx/aYLbFseh7tfh0YA5
	v20qw4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2mO6-00AtYQ-6z; Wed, 07 Dec 2022 04:50:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2mNv-00AtIw-Tz
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 04:50:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00E1C61A2A;
	Wed,  7 Dec 2022 04:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 344B0C4314B;
	Wed,  7 Dec 2022 04:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670388617;
	bh=FvwBOBATcd5hKJ/U3CH4vx2SVxGP67PzTE/WQKj0TuE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oP+Uo60flmHQ0+7U/WzeXRLGC9eYi2ZPplmKV5uabIxuHpt2WG+fHQz7iiargPFnz
	 UtUSBjQWsunbkBfMN6OrerMYLsmX8HpxDVSK/uUHMDe3DIKLQs16sGVGQlrokABWGz
	 kvLRhhpknkn3mmcqoLXu7wzaPeL4FerPzm+PAM/sk+3w2iVtRQKmIM8H3FTZH1bPLD
	 CI9qCcoLA6uuzKw/BnaVFADt+IeuFA6WuwXkPsAq9Ot3Szf4VARk9OdmBMa/6mL9TX
	 Nkw4TkIgnETIL06LICRw9E9v4wIkrovXYkublacevxxF2wn5u/EZemLjb2MBFG2EZt
	 N5MOVRSJKVmpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1300EE49BBD;
	Wed,  7 Dec 2022 04:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] net: ethernet: mtk_wed: add reset to
 rx_ring_setup callback
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167038861707.25696.6418625611096340423.git-patchwork-notify@kernel.org>
Date: Wed, 07 Dec 2022 04:50:17 +0000
References: <29c6e7a5469e784406cf3e2920351d1207713d05.1670239984.git.lorenzo@kernel.org>
In-Reply-To: <29c6e7a5469e784406cf3e2920351d1207713d05.1670239984.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, leon@kernel.org, sujuan.chen@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_205020_031193_30C00CAE 
X-CRM114-Status: UNSURE (   9.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  5 Dec 2022 12:34:42 +0100 you wrote:
> This patch adds reset parameter to mtk_wed_rx_ring_setup signature
> in order to align rx_ring_setup callback to tx_ring_setup one introduced
> in 'commit 23dca7a90017 ("net: ethernet: mtk_wed: add reset to
> tx_ring_setup callback")'
> 
> Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: ethernet: mtk_wed: add reset to rx_ring_setup callback
    https://git.kernel.org/netdev/net-next/c/ed883bec679b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



