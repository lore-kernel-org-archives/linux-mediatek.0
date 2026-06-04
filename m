Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC00CD6E4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2026 02:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/e2tp3o6XwqB0JqbpB/82qzqoSQQtVzH5kjHR6BS5I=; b=w+dlBKRlPeRWFVeyZ18hJ0g6od
	1iVe6lr/J+QcP9ihU+t0Tm2wuRvF73Uo3ihjfZu0JJMc5477Buw94ucK3HIBXnCYLAierCMGdjges
	03BjGVZFxhRaLKDpgNZeL78IBuPIx65FKFW9KZaddFvp3K9d7GmOSPnheSCH/9+LSzSkz2PJiLc0j
	xpYyx1fIX9KO3KlxkDC0aXI28L4o2s4sEe8aYw3G5E78xQJ6xEvCrbWsarwcnU+7YDOLhN5279ijR
	kvHvv1Iv1PaxEDVfWUiPdE+0HaCR61Wryrk/lU3MAt9EUwONnI9wTBLxodzsvSDl8V4Hnk2RpU1pX
	JWk/RSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxNX-0000000G1Uw-2189;
	Thu, 04 Jun 2026 02:00:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxNV-0000000G1Uq-2g1p
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jun 2026 02:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA52F601F5;
	Thu,  4 Jun 2026 02:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4021F00893;
	Thu,  4 Jun 2026 02:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780538412;
	bh=o/e2tp3o6XwqB0JqbpB/82qzqoSQQtVzH5kjHR6BS5I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fvDcGijfOJ5Lp9r9vBegLx/CZMNo5x8k37nixDtqZ3BB5FtgIjGc8M31hi9T2vV7d
	 lbH7TtfYAH70IgzpyzeQF7Uy6ZiS+lNBL1I8elB0qPshCWJbUJwYVpoNrDa9dPiH94
	 QMS1YXl65HaHAEXuXJpG/yOJlKwE2DSDMYsCjfn9KvMiGRuGI+Halb6DnPZpEGbzGZ
	 3OuOahjwFgfxjS13QcT//wnUVJ8vDa/GUfISxAwNL6HYMpEhsgv6v/77Qk8kosSwri
	 2V3x0aMLg8mLH4z1BRjuObFlMtU3ztnFiTwiIW6SOBNwUrFpRylFcsDfwgWnZ5Ll0X
	 EX5DpfTHHEVBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0ADF39308E0;
	Thu,  4 Jun 2026 02:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/2] af_unix: Fix inq_len update issue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178053841338.2201066.2461366002485490345.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jun 2026 02:00:13 +0000
References: <20260601113640.231897-1-jianyu.li@mediatek.com>
In-Reply-To: <20260601113640.231897-1-jianyu.li@mediatek.com>
To: =?utf-8?b?Smlhbnl1IExpICjmnY7lgaXnkYApIDxqaWFueXUubGlAbWVkaWF0ZWsuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: kuniyu@google.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, willemb@google.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, black-ch.chen@mediatek.com,
 ivan.tseng@mediatek.com
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 1 Jun 2026 19:36:38 +0800 you wrote:
> From: Jianyu Li <jianyu.li@mediatek.com>
> 
> This series fix the problem that inq_len is inconsistent with
> actual remaining byte count when only part of a skb is consumed.
> 
> Changes:
>   v3:
>     - Patch 2: Align macro definitions
>   v2: https://lore.kernel.org/netdev/20260528110033.3327744-1-jianyu.li@mediatek.com/
>     - Patch 1: Improve lock usage in unix_stream_read_generic()
>     - Patch 2: Follow reverse xmas tree ordering in partial_read test case
>   v1: https://lore.kernel.org/netdev/20260527065342.2463433-1-jianyu.li@mediatek.com/
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] af_unix: Fix inq_len update problem in partial read
    https://git.kernel.org/netdev/net/c/c1f07a7f2d47
  - [net,v3,2/2] af_unix: Add test for SCM_INQ on partial read
    https://git.kernel.org/netdev/net/c/dd8975ad710e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



