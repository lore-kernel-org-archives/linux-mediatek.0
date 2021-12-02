Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 03:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdyytkGhznqx5r48uEIYNkyXzKhhL+mwJ97z254gBkc=; b=ddJGciM+opyfMD
	Nhy10eYrFRoZtd8kz7GviyK6kB86QXNYsTf6sJM7zymPxn2WB8PcBOFAGX5fRF//UigynioxnkB2E
	fLQaFjIDrHXJk2Oz1jUZmal/m2iQ+UITArKvfC6181ydXOm7WsL3u+hQgjpxTzx0j5HpmnghlJ9tc
	h8P5OdAUV4/ZjMUvNyQAH9ThxaimRxSnj0t+uD4/8yOwgv1aDeEKBIL4bpDt4skEA0tXgalTjZuoY
	mXC+triP84S9MDJJAwvBKr2EN0ZnZ7+ih7HaOnwc2qtcbKCXOjyUQnMzxiJeFJJUCp+HInMHXWVfS
	H/1kF+7ogegqFX75vZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mscKj-00Aefx-EA; Thu, 02 Dec 2021 03:00:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mscKS-00AedY-D4; Thu, 02 Dec 2021 03:00:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C9E9B8214A;
 Thu,  2 Dec 2021 03:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 339AFC53FAD;
 Thu,  2 Dec 2021 03:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638414009;
 bh=hDYWhvPof6o9IIOEXiRK5hQa70O9agXY5UfnOP66XgE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BSt2RqY1gc8wAycsu6r4KFRbU/8jKG6GSx/CsNtb5J8QoY+fjrU/5d4QFcpBdUvPk
 xotRmWsIuCjoEKa4ZgnekDnYkKNaNcovvNn7OqRwplC4UheIh72NAHCB9GEg8XfxA3
 WtBkxvXDFt16YDf2v3vc4LGLaUtioBo+AM64/Hgblz6vvJfEZaRbcgZbtvxfMfzjU7
 /FzzEPvAA3uLfxyPUmw2DiuBVuFi8C/5r5fsYZMsd88v6xGlLxr2ZFmmCzkwwnEwxY
 CI2rDp0JJ7cYWYpYhCazaSwGj6JADqMh7JcCS0Glt/HXDAhC50IREoh1xv1AIxl1yq
 eh47UF9F3+I/A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 18263609EF;
 Thu,  2 Dec 2021 03:00:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] clk: mediatek: net: qlogic: qlcnic: Fix a NULL pointer
 dereference in qlcnic_83xx_add_rings()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163841400909.24500.703686292422770664.git-patchwork-notify@kernel.org>
Date: Thu, 02 Dec 2021 03:00:09 +0000
References: <20211130110848.109026-1-zhou1615@umn.edu>
In-Reply-To: <20211130110848.109026-1-zhou1615@umn.edu>
To: Zhou Qingyang <zhou1615@umn.edu>
Cc: kjlu@umn.edu, shshaikh@marvell.com, manishc@marvell.com,
 GR-Linux-NIC-Dev@marvell.com, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, sucheta.chakraborty@qlogic.com,
 sritej.velaga@qlogic.com, sony.chacko@qlogic.com,
 anirban.chakraborty@qlogic.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_190012_619096_64DAB94F 
X-CRM114-Status: GOOD (  12.52  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 30 Nov 2021 19:08:48 +0800 you wrote:
> In qlcnic_83xx_add_rings(), the indirect function of
> ahw->hw_ops->alloc_mbx_args will be called to allocate memory for
> cmd.req.arg, and there is a dereference of it in qlcnic_83xx_add_rings(),
> which could lead to a NULL pointer dereference on failure of the
> indirect function like qlcnic_83xx_alloc_mbx_args().
> 
> Fix this bug by adding a check of alloc_mbx_args(), this patch
> imitates the logic of mbx_cmd()'s failure handling.
> 
> [...]

Here is the summary with links:
  - clk: mediatek: net: qlogic: qlcnic: Fix a NULL pointer dereference in qlcnic_83xx_add_rings()
    https://git.kernel.org/netdev/net/c/e2dabc4f7e7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
