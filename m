Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF2FFF887E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 01:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI6/88qlhZ0cweXTNnvBg/3Dk3fOrWssgy4gxEQqYjs=; b=EvEA0AF5kJhGZrtLRmwyW0RsF0
	1G0hx1pvI3ucj3zRLeBbkH7hGkmbJKdiep7tgjsAAKXi7nc3ed8aVuAtzRtly8GdJN+XFwlr+NU7F
	SUqP39GTj8hVYd/xrCdb3LGHEbzQsOmcNKuDfCGRMKWVrQA7wZnqhgZJDgXdiwENYaGITfCcmoHbw
	bDUdCKUXR6eegot1B7CeY1LBUMLd0YGjQnzQdO1W/3fwTtUIhxCuVTZziFNnmAAqQCj2ESzCoIpAg
	GRF+frNbLmgaHGerkku+YubnlddZ+ypW4Zfed4ZUole/lD3D+Errhk9zn9EYpNzC4/45Kyiwn+wVL
	vRN3qHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFm5-00000004MSv-143F;
	Thu, 30 Apr 2026 01:01:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIFm3-00000004MSi-2gtS;
	Thu, 30 Apr 2026 01:01:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C24EB61330;
	Thu, 30 Apr 2026 01:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910EDC19425;
	Thu, 30 Apr 2026 01:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777510862;
	bh=Kop4YNUipvs6vp1kt9DE1V8i3VRKn2Vpku3AP8lFstM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QeZpOU2BZfJCl3y/7wzyVhwznzzTKL/dU7z5PLW13n2UBB6Rjcl3nZhhIZ0kxS+H0
	 N1rb6l8O0CX1Gf948BK1QrEa9/AnnBYo1s7r1fcTYgqYO/QDUkLI1S5mMrhP4hS6c/
	 7GOYwHtk7mNLWRe048uJ6j5eHrBXewisWeCxJIFKp//LU6IC9r41NH3Ke0SxP5BfXt
	 MjF7WK+MNbs2DRz5uMjHOqfpSe9VcjIUM/nKI1WAj/wV4aVepfDtfwO57Yy0DlYrrh
	 Yt+PolCIWslh7U0xqV0ZUf2GXUhg0+7AJdYGxGXNORo1d5akta14NuU0LfWAwq+06B
	 OGZKkXItouw6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C563809A33;
	Thu, 30 Apr 2026 01:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: Rename get_src_port_id callback in
 get_sport
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177751081754.2244169.1115345882578217600.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 01:00:17 +0000
References: <20260428-airoha-get_src_port_id-callback-v1-1-3f765c91c1e8@kernel.org>
In-Reply-To: <20260428-airoha-get_src_port_id-callback-v1-1-3f765c91c1e8@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
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

On Tue, 28 Apr 2026 07:23:38 +0200 you wrote:
> For code consistency, rename get_src_port_id callback in get_sport.
> Please note this patch does not introduce any logical change and it is
> just a cosmetic patch.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
>  drivers/net/ethernet/airoha/airoha_eth.h |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: Rename get_src_port_id callback in get_sport
    https://git.kernel.org/netdev/net-next/c/c06a2f2903f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



