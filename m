Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E179109319C
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hl6/zegEj7IofXXqe2LmY5N5EKzaOz7U9fCQREQeZr0=; b=hTgixi0MQN++6g5XVje3GRZACr
	cKsxHr8NrkfeTu0LNJQL4inpP2tlQLgQqh0SqyPf2FBite7fgXsH///oo5Iy/Hr+cAZZNwL0N2ZBs
	gE2Ki4PZp3VTjpXA603eGYAbvU5Viqmi+GsvIfY0Gp9E4b9WjAEYLhW6v0ICsybvpfdsT2m+J2Kzv
	eRWKI4h8Umo/++3DQ0SCdpHkhqTjvV4pIVPBm7biP/6Pw8w6fLNh2iY9+EjodB2X6EoyJwwqFSZjq
	u5FR8sNhtCtwxETB9puWHhTyo1t/dMCJ1JUsZIrm3ZeLbdqgR1ZkqR0t6FXvWkM/R3Kw9NJcedlep
	l1WuXHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W0j-0000000CSdM-2IYO;
	Fri, 20 Mar 2026 09:19:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W0i-0000000CSc6-0fyt;
	Fri, 20 Mar 2026 09:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EC7F60127;
	Fri, 20 Mar 2026 09:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BFBC4CEF7;
	Fri, 20 Mar 2026 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998355;
	bh=JLKw73ohj/QWfUHrQUxCpAL7Gq62XIAzZiPnKSwJqhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ks/aEIW2RkRuah1iRt1pbQ2uxhWxOeymIEAkVo1q9pBfP0Lq78j33l9pG+AQMAmIL
	 YgKKb7LYyIPbskUm1PHE7HItIoT8puuK+etnLvCEq7bbExtL0CGlr0xJXuUYcnMaUU
	 l1td14x5KBuNNEKiSwK7p/dcSiVFVRRw8FMz77ZzmL5sna8+NMZ811Vw4H0TNdRG3n
	 PifvmechBcrs6FOvRVtkmituwlbZJ809PTHoVhApWZ23h9iz2IMQi82szXWSFEzRmT
	 zZLM/jBn4g27Fjf4xGzizxASRaPmvEGLTk/632wk9+As2GB0eV4OZ1I9gYp3bNPiXe
	 slh5EU/j4Lvgg==
Date: Fri, 20 Mar 2026 09:19:10 +0000
From: Simon Horman <horms@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH net] net: airoha: add RCU lock around
 dev_fill_forward_path
Message-ID: <20260320091910.GA2048760@horms.kernel.org>
References: <20260319032649.337812-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319032649.337812-1-dqfext@gmail.com>
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

On Thu, Mar 19, 2026 at 11:26:49AM +0800, Qingfang Deng wrote:
> Since 0417adf367a0 ("ppp: fix race conditions in ppp_fill_forward_path")
> dev_fill_forward_path() should be called with RCU read lock held. This
> fix was applied to net, while the Airoha flowtable commit was applied to
> net-next, so it hadn't been an issue until net was merged into net-next.
> 
> Fixes: a9af709fda7e ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

I understand from the patch description that the problem didn't manifest
until this merge commit. But nonetheless I don't think using
a merge commit in the Fixes tag is the best approach. For one thing,
it seems somewhat difficult to use effectively to guide backporting.

I would suggest using the flowtable commit as the fixes tag:

Fixes: a8bdd935d1dd ("net: airoha: Add wlan flowtable TX offload")

Or perhaps fixes tags for both a8bdd935d1dd and 0417adf367a0.

Flagged by AI generated code review, which also suggested citing a8bdd935d1dd.


...

