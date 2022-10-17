Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194A4C43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwRm4J7gx5kU0yK0UCo7NTHFks3THAOO47Hnkf6owHA=; b=p4bgFLcClHYQmyFkhiFpKKE/fQ
	rmP0lQeK2Pg9tRIkP6cILAIRL4mOX0fxGaqbgjQZaeO6P6oVJ7sjztCb4qGgb9lU8FNBrVgK5TPFn
	CvhtJzgv/PjIcJ1I2WH02xp2iUM7Bx2L+82SSixt1T+XQSXTNZed617vIwXQJk99sFUzVTOJDr4O0
	Y93Z9mZnPf8u9j/qKi9PDj5CHVzB6F5WUc3CXJlJhaPbVzUHEpgpkp37sLSQZLlFkrLohaWMf56J2
	fBIf0c+OHDUkGyu4rln6S8J1PFTj6UyK/khlOHnsKHY+oUiG4DlL+MF5ANlovFHhEIBKDUrvQkVxm
	IPd+TW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLfj-0099Hh-IC; Mon, 17 Oct 2022 08:40:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLfW-009991-D7; Mon, 17 Oct 2022 08:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E889FB81094;
	Mon, 17 Oct 2022 08:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98742C433C1;
	Mon, 17 Oct 2022 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665996015;
	bh=5B9h/k6fvZ8XhtiJMKKeQKqbgIAM1tVeviJr8d119vA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZpoKFaJZ90WD9KqESHzDwZLjFDgCPg2qAAjw7+wSVb55OFC3v26phN+PRdIlAHtu+
	 zeVQvL5WY0qvNz5OziCioQxhLwQQ3hmSE1mbCgqXBqKFahN3KQh5uv6rZjHOo2Yvju
	 kLYFour9qZu43bwa0Bc7ija6DbaSvEQGFZ3mFrRffgh83mfKFypl4qyqSThXHzSw9h
	 WM7nyS9/g04+T26NPEjiFZs6wO6YVI9GAghvElA+n2SRfvaknoJC9eikTyZY19haVF
	 yzY7rb7X7aYl43rg8RMisJ5WR6cix/CpVxUCQ3NR2cA9s09lGe4RUILvY5C8aWmb8c
	 skSD67y6pFFFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6ECBAE270EF;
	Mon, 17 Oct 2022 08:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ethernet: mediatek: ppe: Remove the unused function
 mtk_foe_entry_usable()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166599601544.19223.5494089989228063967.git-patchwork-notify@kernel.org>
Date: Mon, 17 Oct 2022 08:40:15 +0000
References: <20221017064920.83732-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221017064920.83732-1-jiapeng.chong@linux.alibaba.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 abaci@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_014018_596566_28B43133 
X-CRM114-Status: UNSURE (   9.96  )
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 17 Oct 2022 14:49:20 +0800 you wrote:
> The function mtk_foe_entry_usable() is defined in the mtk_ppe.c file, but
> not called elsewhere, so delete this unused function.
> 
> drivers/net/ethernet/mediatek/mtk_ppe.c:400:20: warning: unused function 'mtk_foe_entry_usable'.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2409
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> [...]

Here is the summary with links:
  - net: ethernet: mediatek: ppe: Remove the unused function mtk_foe_entry_usable()
    https://git.kernel.org/netdev/net/c/402fe7a57287

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



