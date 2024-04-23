Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E747C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 00:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oufkcFOaUoyOcn2jz3OBsYl4YSXgoPEfznLc8FToijY=; b=YyJEhrABjNWOnyqMvwJldrxl5g
	rezf0weaNLtCgGT8Ogh7bWwqBhHaTZ9GLOBswohEDwmcXtbf+FJzl0voKiFPbBgaCCNIXJ43lvld3
	v+kwrD79lgAyanj5WBwqGHTr8n7InHvqYd29RIUT6xLn22jVSi/9xApgxahjBpSyM5+GskVO4vfST
	0G5Jd+O6L6sfSbY9Hd9wcuuFHTre3idmNp8OShETdDezgodtl644LtUlOvFBRYmb6Bm9WgEaZ/uW8
	eaWzKcST5sr9kgZeXd4VJI/5GyWIrqkgg36LdmL3l6g/nRqTNiX4gQ6guIkgZC7prlWSnDqvr1Jfj
	l+G2HsAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz4PQ-0000000FcPz-0OAk;
	Tue, 23 Apr 2024 00:53:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz4PM-0000000FcPQ-1XS3;
	Tue, 23 Apr 2024 00:53:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3FAB3CE0ECC;
	Tue, 23 Apr 2024 00:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59BC9C32783;
	Tue, 23 Apr 2024 00:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713833593;
	bh=X6zsOWy7vicKD3IoC+qV0FUvApBvS4VYOoijstk0/7I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P1c/iUJUemQCwnW6hdugDormtGp/YS5xgG4686FaBFth9Rd82T/aiFkHs/Jjjoag0
	 b1uBhbBIm7keE8m6h68M1avbjEj0ALvXXDqSSA/H2ox+haEgQrmrggTFbNoVuPvZj1
	 aeYGg6hGRP2R3jUkvmfWfQ1SHgXM8UbGpj88JdCsmQykyp6FHsCB39DZlWn9UKVml9
	 xIGRwKyWinjbahItb0cyO+t1MInCXCKhgDfLwdA01yK5zYpXVQX+bmNj/PLAPXYzq9
	 8DUPbX2jBpa+lpXgt0OlgnW3Vz2hb1UphDkrdLAZX+ndxNpbyEXpsijfMiymYHfMTa
	 CJ7/7LhvhDWjQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49A93C43444;
	Tue, 23 Apr 2024 00:53:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: flower: validate control
 flags
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171383359329.888.2890410955575448362.git-patchwork-notify@kernel.org>
Date: Tue, 23 Apr 2024 00:53:13 +0000
References: <20240418161821.189263-1-ast@fiberby.net>
In-Reply-To: <20240418161821.189263-1-ast@fiberby.net>
To: =?utf-8?b?QXNiasO4cm4gU2xvdGggVMO4bm5lc2VuIDxhc3RAZmliZXJieS5uZXQ+?=@ci.codeaurora.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nbd@nbd.name,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_175316_633374_C8AC07EA 
X-CRM114-Status: UNSURE (   9.01  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 18 Apr 2024 16:18:15 +0000 you wrote:
> This driver currently doesn't support any control flags.
> 
> Use flow_rule_has_control_flags() to check for control flags,
> such as can be set through `tc flower ... ip_flags frag`.
> 
> In case any control flags are masked, flow_rule_has_control_flags()
> sets a NL extended error message, and we return -EOPNOTSUPP.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: flower: validate control flags
    https://git.kernel.org/netdev/net-next/c/077633afe07f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



