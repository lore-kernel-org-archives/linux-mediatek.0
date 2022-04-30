Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E079AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 02:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcp/qKY5YPMn2suT4/jAKC7rriQTjw1HXthtB16bqVs=; b=rl3+0m8KAQvKEe
	AGT71JLFk20fHh5+F8DYIrXUK9Jf9t17WXX/WqZBNufdAnCT3NhQl03M+9Wn7jw6sYskhc9/0h9Vp
	eS97EqG2H8jHXhgZ6RQswnkxNVHzdDnoq5q00jsEY4mYgTANPa4WUPKhUImYwunMwT3b8ccoFQ4ME
	EAvSpeu9AoNIdv0FBusYmjr52+DovGtGHfC6tMgla8fY9ZxMvpFAxfe5BfH3g5yR0Kf8Sno5eQD2v
	57mluuolr4GfDpvo2h+jM93ndHIXQ3A2Wm+8eQLkZWFcWKdhxEHZH9GVR3wTirwu6IxbCA8gQ15kd
	3r70XfOiHP9E2GFlkUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkd1s-00DQ8k-9E; Sat, 30 Apr 2022 02:40:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkd1p-00DQ8C-N5
 for linux-mediatek@lists.infradead.org; Sat, 30 Apr 2022 02:40:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 154FB624AE;
 Sat, 30 Apr 2022 02:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 734A0C385AE;
 Sat, 30 Apr 2022 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651286412;
 bh=hMXm0FDPBVaRAA0ihJM2dwRadf7fwAMo07DedxmvExw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uW2Yi+i5wpuAow8kgyPrTBwgzVcV+9Ddt0fUW5ZAwMqnYUPpUEzWpAWzdCVLSa25A
 //7G1ZcWoyXjZhzCn7YPs/giIXTGZXR6Gm9LP76ND9XbQlD1DfC5Ck5mMBops+ASYZ
 1hgfTQ4dXweY8DT42/qECBtrxuS2IXRPpyr9EKI2lqMETbn81IdvZjR5K63WyjTplA
 tip8BUUIZ9Sblc7brHTDnXm6VKEaDJEcQJW2qWqADZiqta1lYTuwwHdu4DGZ0R9KF7
 aQgQ6JYf62j5m7bhczsSMK5xwi7a3T3v6us5xsER2XIccFaxGKyvkytwDkHXZpllaQ
 TqUxaOZ0lO+/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 549B4E8DBDA; Sat, 30 Apr 2022 02:40:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] net: dsa: mt7530: add missing of_node_put() in
 mt7530_setup()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165128641233.32243.13238642734431611860.git-patchwork-notify@kernel.org>
Date: Sat, 30 Apr 2022 02:40:12 +0000
References: <20220428095317.538829-1-yangyingliang@huawei.com>
In-Reply-To: <20220428095317.538829-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dan.carpenter@oracle.com, andrew@lunn.ch, 
 davem@davemloft.net, kuba@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_194013_831154_25DA5788 
X-CRM114-Status: UNSURE (   9.48  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 28 Apr 2022 17:53:17 +0800 you wrote:
> Add of_node_put() if of_get_phy_mode() fails in mt7530_setup()
> 
> Fixes: 0c65b2b90d13 ("net: of_get_phy_mode: Change API to solve int/unit warnings")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/net/dsa/mt7530.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - net: dsa: mt7530: add missing of_node_put() in mt7530_setup()
    https://git.kernel.org/netdev/net/c/a9e9b091a1c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
