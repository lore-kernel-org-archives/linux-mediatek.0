Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7D3E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2024 03:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI9+QubX3el/AzIFpo9cfj2ynCd+ummKfLn9gVahr9M=; b=YDOL6XNM/Bnr+hpp9mxYUnXWFk
	WQ8KHeDn2WemVBeyWHFXEAeD5j0vAf+lnOjYLGak3wOgmAQJAyzJGOOBef2e1SKrjwvxpkphGyElS
	qXfFfDvZr4aBBG5CxBwJQCxknaiAjDqbgmnhhoA0VFP57tQssp0kB44nT92r9mFQ/QDInpP7bhU0O
	B5mkeiKEkK0h+T7DI9WH10uYbH7VzXAJHrGE7oItltjmTOOYEf0S1XzUZwoz6tGCTNOx0NsrZ5qXB
	QxDdVHM9eWMtKzqI7nyIp6S1iQPNmdzeys2DUHgGa8cPmWmotDxaaCx2Sk8OfbRHf4CgmfJsfnHTS
	FhQ0MDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOTkn-00000003oVa-2Tmk;
	Fri, 20 Dec 2024 03:32:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOTiY-00000003oAE-3QCX;
	Fri, 20 Dec 2024 03:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A4E35C6AD4;
	Fri, 20 Dec 2024 03:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F81C4CED0;
	Fri, 20 Dec 2024 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734665422;
	bh=+rxoxI/51iCRUT4+GDTvzJHOnNeGePnj/c6zmS8zVHg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RkkDxW2gEpF5enaLndQm/9mcmH4M/EO66+oUc/tl0nEK50s+R9w2LN8ecbzoLF8aT
	 XSMv5LY8puzyrNOjxJamy2YfPGxF9LhScEzLFGLe4msI3XciBIX+0/nCF9pUeLdOj3
	 W1fhJsbaE8eLpCraLBy9W1z0AIiZoyZCe6azEh43mP/iZx+KUVkfq6KGxNI5k7KzY1
	 CjcijsR0sYQyB8NwIt/K81slNuNy3GjBRN2cqQ+c//DI/nw55Bo9dNWYqYix05fCkU
	 PY9m8vqZBGi95gJkXGAN0OZXXftuZUyRbd1lgg4okXebEFG5SBspxGCYyPBISvDmYl
	 FKd9M5U/j0YTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD3C3806656;
	Fri, 20 Dec 2024 03:30:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: airoha: Fix error path in airoha_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173466543949.2462446.3986917315473515090.git-patchwork-notify@kernel.org>
Date: Fri, 20 Dec 2024 03:30:39 +0000
References: <20241216-airoha_probe-error-path-fix-v2-1-6b10e04e9a5c@kernel.org>
In-Reply-To: <20241216-airoha_probe-error-path-fix-v2-1-6b10e04e9a5c@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_193022_898942_804FC00F 
X-CRM114-Status: UNSURE (   8.45  )
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

On Mon, 16 Dec 2024 18:47:33 +0100 you wrote:
> Do not run napi_disable() if airoha_hw_init() fails since Tx/Rx napi
> has not been started yet. In order to fix the issue, introduce
> airoha_qdma_stop_napi routine and remove napi_disable in
> airoha_hw_cleanup().
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: airoha: Fix error path in airoha_probe()
    https://git.kernel.org/netdev/net-next/c/0c7469ee718e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



