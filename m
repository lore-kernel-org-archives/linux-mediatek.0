Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD517C369DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 May 2025 14:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hg5kRbHN9APzmD4CFeAQVQLgAgOrsQhpvhWTfaBosD4=; b=PmT3A7ln7BRZga1vn+4V9MdN0q
	8VL3WGqPnhllRwoq0ggs1pjdaQXrYYQ5QZG7ZIOmH21MDTdj9KBqJj2quLBcR5kcyUuN9+djK8EJZ
	w7HpdpZ2PNPo+hY/WURHB/pX9T876r4y8S7iX47OW7DIpDLvfhHDr2wfuCkJknG+0Y0OZnaUjQKSp
	Pt/yjNQTYEDAAK6vDHyUIQXxDoZ6eFhx2aQ/cVT2PN87rdQecB1f9YHMz+Mc251OyTx5a9to5fHda
	qXN+grVoBCLKj4lT1dIvXJYCoROpGt1T070SL4X3NCjbgTv1f6TvaopTVXQ1A0sIJ7WeJEF34rVFG
	6HiU/ZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUdm-0000000Fv9Y-343s;
	Thu, 01 May 2025 14:11:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUbr-0000000Fupe-2Yhq;
	Thu, 01 May 2025 14:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75C6F4A475;
	Thu,  1 May 2025 14:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0987C4CEEE;
	Thu,  1 May 2025 14:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746108594;
	bh=w6CIXgt7nx6Z0oqg6zEu5gS7IZY4p89aV0ZH5/vmAxw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ujoo5b8evjzKvboC3q0CyiEUlH4nqHxTgA/OU4fKY6ms8rBAyd1CI2Nakbx55u+i4
	 Ueke15w2D31AYYC3+sPAEvWODGJZX/1uJ3mRi0M/0zDgIDU5yuSVXpfUJH89gXpefk
	 I4WE58wio8HUpjhH2QIHl8HCv+EoHsJqY2gpjvvDykqz8MU2qhtVRw+sFAUdWGA/Sm
	 l9pH2LlJ0oPlgfnnpiB4t9ybFBrNrbKrxFs0zWz06n+cqtROq9GslQg8zKrrwaRZI7
	 4jREUMvzYaiWEGdxKTsNWfX3axnGtiv/dWTDGI9oe6dx91Gxl5/zmTnHe26JbqwfwN
	 Dzy6i7/UMJI7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFD13822D59;
	Thu,  1 May 2025 14:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] net: use sock_gen_put() when sk_state is TCP_TIME_WAIT
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174610863349.2990404.8599127748454819839.git-patchwork-notify@kernel.org>
Date: Thu, 01 May 2025 14:10:33 +0000
References: <20250429020412.14163-1-shiming.cheng@mediatek.com>
In-Reply-To: <20250429020412.14163-1-shiming.cheng@mediatek.com>
To: Shiming Cheng <shiming.cheng@mediatek.com>
Cc: edumazet@google.com, davem@davemloft.net, dsahern@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lena.wang@mediatek.com,
 jibin.zhang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_070955_667649_D03BA872 
X-CRM114-Status: GOOD (  11.64  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Apr 2025 09:59:48 +0800 you wrote:
> From: Jibin Zhang <jibin.zhang@mediatek.com>
> 
> It is possible for a pointer of type struct inet_timewait_sock to be
> returned from the functions __inet_lookup_established() and
> __inet6_lookup_established(). This can cause a crash when the
> returned pointer is of type struct inet_timewait_sock and
> sock_put() is called on it. The following is a crash call stack that
> shows sk->sk_wmem_alloc being accessed in sk_free() during the call to
> sock_put() on a struct inet_timewait_sock pointer. To avoid this issue,
> use sock_gen_put() instead of sock_put() when sk->sk_state
> is TCP_TIME_WAIT.
> 
> [...]

Here is the summary with links:
  - [v3] net: use sock_gen_put() when sk_state is TCP_TIME_WAIT
    https://git.kernel.org/netdev/net/c/f920436a4429

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



