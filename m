Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F62DC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWcderytiIoV2ejU++eCMYzmEpBCJjy4utGxsIAOBG0=; b=dT4qywWxj3l7XZdMOrEB3Niwk0
	ASFWws94k6eyR1pSbleyPa9vNcqDiqLzOX45eQd9vwt977+NMnSeXBcKABPjlwP47i+l4H9hx5YAy
	d5MS4d9fpb9EIy6IsWEslJqRHBD3wk/t06cLLsrWC2SLxvFFYQEDZJSB94PmFgAW8Q1b/QIPx7/mA
	sKOYp9hmxrBazScfY16DlsECDNhMN+unNtsvD0F1sqmGzBQAC5MwkjKXMhrFstwltRtoQBdlv1pX3
	kitqduQYmvWLIIuvd/z6w37MwQRrnA3TuwhpQ8zEEOwVhetnqkD/9HDFCj6UJ6tjzlsuLjkgG4VWi
	SoJwa5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWCxA-0000000CAyL-2GHI;
	Tue, 23 Jul 2024 10:41:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWCwc-0000000CAuf-0ofO;
	Tue, 23 Jul 2024 10:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 210F5CE0E46;
	Tue, 23 Jul 2024 10:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 654ADC4AF0B;
	Tue, 23 Jul 2024 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721731231;
	bh=PGyVl1XEk9wsuy409pc0uqap2hLP+phvFbWFKQpZh30=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lBCpTBqeOwMG+KsHqvNxQGg/y6rLE6sIIKMoYdbJ23Xevd7V2LivEzfDlIPmTrGJB
	 JYOUWbG43qtlCX9F8EIchh3ZFT1O9tS19ZBd6SmtfK2Nk/X18RBM0b3xzu3NTxfY87
	 E4GER4DgRraKJFNmH0B0VRAB5vhX2yL754H0x61lf9XKwWOGg6cegEuG3m0yzKwBld
	 HbdgnuE1iWYrhd1SM3+W+mkscU16j0EvtZvalf2t673JM9NZRvZLVIz5vkchKsfyvB
	 8nkmpxRf+NlERG82hIV5SrOSBSQajCC8yrmeu5FusJQZjWy51YbFoqFJQDbBanQl3E
	 6yI0HO5HqNpfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 52940C4332D;
	Tue, 23 Jul 2024 10:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix MBI_RX_AGE_SEL_MASK definition
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172173123133.6377.16575807879324365123.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 10:40:31 +0000
References: <d27d0465be1bff3369e886e5f10c4d37fefc4934.1721419930.git.lorenzo@kernel.org>
In-Reply-To: <d27d0465be1bff3369e886e5f10c4d37fefc4934.1721419930.git.lorenzo@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 lorenzo.bianconi83@gmail.com, dan.carpenter@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_034034_431377_8BA53F99 
X-CRM114-Status: UNSURE (   9.17  )
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 19 Jul 2024 22:38:31 +0200 you wrote:
> Fix copy-paste error in MBI_RX_AGE_SEL_MASK macro definition
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/mediatek/airoha_eth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] net: airoha: Fix MBI_RX_AGE_SEL_MASK definition
    https://git.kernel.org/netdev/net/c/39a9c25bcdfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



