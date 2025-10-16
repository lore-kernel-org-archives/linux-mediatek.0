Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1FBCCD185
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 01:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odx4LbDYmDNZ5LSInguGvMqfRgd8oyj9cnwwDhdnzq0=; b=jPlTPcU7xpmU3HI4zdIofZhVI8
	uSuV72Q83yL3IfuPOopbIO8Su2ZZA2oCC7cENahW1v0LVG8tYcCgEJmAab5w6mBLZZf6/fT1ZJAMA
	VGhFMEE7/fAIWXIV1M+Sq1iAnLJ7UNUWcRkwHaft5YW82Ks7Bye87iCKlvHzvSw4Y+r3tY9KCknlD
	PI8ZsvkzHAxFd5EvfYGYxMJnZ5l6WkIw5edaLroLqG0z0XW8HOPrjV8iysDMFNDAszrOlR1Im0yeA
	/rlzBmazecM8rtMydGkkIQ7Sy0iNa9CvpTYkEtJ5rSqnu42Hbd/JUZn2ZN8+2o21dGjcPJINycBZF
	/ioKuBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9CM6-00000003Bao-3unA;
	Thu, 16 Oct 2025 01:00:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9CM4-00000003BaY-2592;
	Thu, 16 Oct 2025 01:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BA0462764;
	Thu, 16 Oct 2025 01:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627D6C4CEFE;
	Thu, 16 Oct 2025 01:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760576431;
	bh=1nSU2VJutd8xKbFho8sBZm+rC9jYH3ub9ZnyfZw4e3M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NZ7ZSfXT159Oh4mT3hyQ8+8r0zjNcrrGjnsPwQMskbShORCV1koAxkq5Plp2IhEdt
	 mcHaSiW2eReTQyQAwqORRhBGd4DPK8f/eirXg4JeRNncwBQRqHUk9157NZWXbzIn3Q
	 q2NRN4DN1LH1eP9KZobP8W5+/MRNsY84lcxgcvJafci/7+3tApyxmRAFWUePPY9hPX
	 +vu2SC5lNBV1G/UAxGMnTMzi1NzciArco/8r8P3U5CvHBBV6EVHf625mAn9rXwK5np
	 0hGeWBHqmUtRZw0UV09+4/l96UpmjDXtkupKeVr3dPoLkQAIPGHNVffMmuxckNw4SM
	 T3xSVntgFpRaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E26380DBE9;
	Thu, 16 Oct 2025 01:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] net: airoha: npu: Introduce support for
 Airoha 7583 NPU
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176057641599.1117105.16062969451575878802.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 01:00:15 +0000
References: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
In-Reply-To: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 13 Oct 2025 15:58:48 +0200 you wrote:
> Introduce support for Airoha 7583 SoC NPU.
> 
> ---
> Changes in v3:
> - Rebase on top of net-next
> - Link to v2: https://lore.kernel.org/r/20250927-airoha-npu-7583-v2-0-e12fac5cce1f@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] dt-bindings: net: airoha: npu: Add AN7583 support
    https://git.kernel.org/netdev/net-next/c/9fbafbfa5b99
  - [net-next,v3,2/3] net: airoha: npu: Add airoha_npu_soc_data struct
    https://git.kernel.org/netdev/net-next/c/0850ae496d53
  - [net-next,v3,3/3] net: airoha: npu: Add 7583 SoC support
    https://git.kernel.org/netdev/net-next/c/4478596f71d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



