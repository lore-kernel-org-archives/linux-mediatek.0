Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD941CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isRQKmcYnXM3ogb907maRjxRlrKYZjbFCjfhs6b8PjU=; b=4ObzrtyPSAqAygFoiIVgzgOJcu
	GShA3AWdVahvIs5TP+Gw82sCKY5c00RH45ThErcoVBl5O7n4UV9nAmi0GLE3o4mqSevbdQ6sbXbVt
	g4YCzxpxIqoKPpXYkDbX/50qmkAFJ1N0eNphz2LMvWfMwHaDIgAMFZwvZuhA50y2fZlavJ+0bW98u
	sOKFEoZBknQu8lNIz58uCKednL3KD38yrpD+Cy9rXZrHpfHlmdADxLZQZOisbN+c9taLYAdUmYeRN
	p0M4esx6JBEQHbdJhmS3+DcIqRTEDk/XOtqN2aazXzPWILHmtgjo2cjOUJ72pybIFdxEqSQ38vhUb
	hxVJ5rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNUA-00000002tQ3-1CEV;
	Thu, 04 Apr 2024 13:50:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNU5-00000002tMn-3f3h;
	Thu, 04 Apr 2024 13:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19042CE2BD1;
	Thu,  4 Apr 2024 13:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D5DFC43390;
	Thu,  4 Apr 2024 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712238627;
	bh=/e/3RELV3V5iO9Ru8peq8yOQty9/FY4WyCtQxbYjXRU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pBa4gmCHOsXrCH9G4RFkX9/3TAAYu8nMsfNewPXJWKR+5k2Jl26o0OH1ukghUSbBL
	 By/NVCfEfLKMHbZN/xisPjHMBSt4/bP+F5sQb9jRUojy2RhQ/V99GXRhBU2n/ijKwK
	 9VlyjVCSAdQO1xOVXzOjo4qIDEliz22c7FcqONVH+Ar6RwL6VRh1wDHHY2rVZBqYeY
	 fIIw6S1sK8dlaIoEZLBgfoxw/vbAoOM+be6PRKEZt2KQ2ddBRdfDlnt+q+viXIUvTH
	 BidPs0WqeYuZRtr3D9cN/hMphBrJLYWQIyV6iDpki4JRmpKSj26OCDdH6PgBZwx9Pa
	 GfJCdTnVwauyw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DB2FD84BA4;
	Thu,  4 Apr 2024 13:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: Reuse value using READ_ONCE
 instead of re-rereading it
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171223862724.955.4736478868030987627.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 13:50:27 +0000
References: <tencent_C699E9540505523424F11A9BD3D21B86840A@qq.com>
In-Reply-To: <tencent_C699E9540505523424F11A9BD3D21B86840A@qq.com>
To: linke li <lilinke99@qq.com>
Cc: xujianhao01@gmail.com, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_065030_158453_CEE91947 
X-CRM114-Status: UNSURE (   8.74  )
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed,  3 Apr 2024 10:54:00 +0800 you wrote:
> In mtk_flow_entry_update_l2, the hwe->ib1 is read using READ_ONCE at the
> beginning of the function, checked, and then re-read from hwe->ib1,
> may void all guarantees of the checks. Reuse the value that was read by
> READ_ONCE to ensure the consistency of the ib1 throughout the function.
> 
> Signed-off-by: linke li <lilinke99@qq.com>
> 
> [...]

Here is the summary with links:
  - net: ethernet: mtk_eth_soc: Reuse value using READ_ONCE instead of re-rereading it
    https://git.kernel.org/netdev/net-next/c/04172043bd21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



