Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A26C3ABC9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 23:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcmrTujHikIYSnIheBAwgW/QK2mlq3GiZHnRn+qVt0g=; b=cFevqYqFzBeku0ErmuorBBqTzT
	oozAePUn7TtPh9COVmYHlOKeII4xSAPySr3nhujizWgmFn2kvPhENclmum4NCltvToPjhkF9Yritw
	eA2vaxTb1lY6Dj+Fc5kU9oCcSopnFHbgeIH+Pl8ekdh4qy0n7i0GdsoOFMgOshMc1VxJxeknylWhV
	IwoxIOgs1Rn7f0DbqyQvIxc0d6WxU3Pp4EhwMfC5Rmv0gEaEtSfOHu5BpdtskQoiTB0dHK7gTI1QS
	aymF04yNBTBoXu2z9o/cwlj947QIKsRfovjkSVB2cDHE3vrfy4fNE/6jKs6r/RRPg7l4oTrOFPLFf
	E/tKEk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4qN-00000004sid-3Qew;
	Fri, 16 May 2025 23:51:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4oK-00000004sZu-3YIb;
	Fri, 16 May 2025 23:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7E5C5C5772;
	Fri, 16 May 2025 23:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4120C4CEE4;
	Fri, 16 May 2025 23:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747439391;
	bh=b6wGr4nm8FmvhV7tpeuwJouVaFkxQSU7UDHKGORepGQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JI1WicrfpAAd/Sa/1/MCZHdS33jVEdrHOV2wmp5eT9wukgNroKm2zw85ABQnMF9po
	 SQkkVQHjTFDGxJqXyRbV5Ah2gPnvuZf0gyyCIEJxoR0wSHAxTbYgb7M+DM1OfIaxJJ
	 +7ckNvnBJ0TZzE0qug38rEk7s4Lg1mlqAaOLC0SbpLqz6/R9C7gVfLJ5vufqADD2hX
	 sNZUamfCL4JSsoUmZ55s9qZBQyEnG9jAGjwOnsJSq+4qkYPUqBXjcleX/BeS97SkCN
	 Rqb+wKtAatJ4Y4xUIa9c7leAS9HfHcQ3y4gimPB+zYPkNSEqHUx+KIoQd3slFR0dJ7
	 casHz5V5J2qow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0933806659;
	Fri, 16 May 2025 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: Fix page recycling in
 airoha_qdma_rx_process()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174743942851.4098936.12041671721533040373.git-patchwork-notify@kernel.org>
Date: Fri, 16 May 2025 23:50:28 +0000
References: <20250515-airoha-fix-rx-process-error-condition-v2-1-657e92c894b9@kernel.org>
In-Reply-To: <20250515-airoha-fix-rx-process-error-condition-v2-1-657e92c894b9@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_164952_942044_9713BB8F 
X-CRM114-Status: UNSURE (   9.55  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 15 May 2025 08:33:06 +0200 you wrote:
> Do not recycle the page twice in airoha_qdma_rx_process routine in case
> of error. Just run dev_kfree_skb() if the skb has been allocated and marked
> for recycling. Run page_pool_put_full_page() directly if the skb has not
> been allocated yet.
> Moreover, rely on DMA address from queue entry element instead of reading
> it from the DMA descriptor for DMA syncing in airoha_qdma_rx_process().
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: Fix page recycling in airoha_qdma_rx_process()
    https://git.kernel.org/netdev/net/c/d6d2b0e1538d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



