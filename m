Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D7CD1D887
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvYuhXQlkuX8kb7ZMaWIwZNGR4o4GQl6VYNilwOgM2M=; b=jXO8z5x5gMHJ2gRHY7trIdjsdu
	CYhhYqp5llj4mNtrn7AhjB+G2Z+2yJISV8HsGJn6cpurR/qTaWHmk02lORfLav7ELpuJqDgMJ6zel
	qVTAiS4FFPNv8MITv3sbTUCEZYY4AmsTt9OO5BCFUeUaEMBKw4orFgL+6zm8iEgHiSEDXFWGRvz8B
	LXEFtqWsXExd8Fh+BZylEHmB9v8pPhKbhfWV2jKfFzNUYGiL9FjjyqIInop+zcYO6nS4OStwfcfmO
	e5G/S0AKRbDLTbFhE0SQxhuS5vwjP1rYt56f5A1Sk/Xz5Ll5jCasF0868xtrJi+0gLVy6/X24s/WG
	S1mYek8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0kAE-00000008q5S-3tuw;
	Tue, 15 Oct 2024 16:12:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0k7P-00000008pWV-3xkp;
	Tue, 15 Oct 2024 16:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D26BD5C57D6;
	Tue, 15 Oct 2024 16:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D34EC4CEC6;
	Tue, 15 Oct 2024 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729008594;
	bh=uiNbKZymrQtXd06YpQ4Y9UYqOaQxvSWTKDoL7yi1U34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BncWv6f8nxxYbDxv+zumwT4cANZa+684oDXRaD2IKtNGVbffbdzwl+u95lBOk+7Lh
	 +RWHXZaqRcjbnYDkqsMbWeiOC6JEqF3SfUADHxqheYhVX8Y9awqxN9mh3F5ZK6peuY
	 spR5K/DOCyvsjeKfkQ5ieu8CbFtXiweJIyhNrkjTXzam2hwQSb4DwkTL+YpOkPhVW4
	 u5Fqi5E22kTdGnz0uLxaDsS7wrTwL+s4vOpQiVxB4H8EwzeyjQfcKP4SIUAc/KXs7b
	 egkcbMZhXxiljEMC6KuFUh44o6CTQbAx8ZTMtLeIqzTGvkvbUVAWFnshhVmwCEfauz
	 4T1PmY3V+ddvw==
Date: Tue, 15 Oct 2024 09:09:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH net-next v2] net: airoha: Implement BQL support
Message-ID: <20241015090952.6bcb5856@kernel.org>
In-Reply-To: <Zw6QUxpdnJtorc_e@lore-desk>
References: <20241012-en7581-bql-v2-1-4deb4efdb60b@kernel.org>
	<20241015073255.74070172@kernel.org>
	<Zw5-jJUIWhG6-Ja4@lore-desk>
	<20241015075255.7a50074f@kernel.org>
	<Zw6QUxpdnJtorc_e@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_090956_060931_70E4DD56 
X-CRM114-Status: GOOD (  16.84  )
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

On Tue, 15 Oct 2024 17:54:59 +0200 Lorenzo Bianconi wrote:
> > Oh, thought its called on stop. In that case we're probably good
> > from BQL perspective.
> > 
> > But does it mean potentially very stale packets can sit on the Tx
> > ring when the device is stopped, until it's started again?  
> 
> Do you mean the packets that the stack is transmitting when the .ndo_stop()
> is run?

Whatever is in the queue at the time ndo_stop() gets called.
Could be the full descriptor ring I presume?

> In airoha_dev_stop() we call netif_tx_disable() to disable the transmission
> on new packets and inflight packets will be consumed by the completion napi,
> is it not enough?

They will only get consumed if the DMA gets to them right?
Stop seems to stop the DMA.

> I guess we can even add netdev_tx_reset_subqueue() for all netdev
> queues in airoha_dev_stop(), I do not have a strong opinion about it. What
> do you prefer?

So to be clear I think this patch is correct as of the current driver
code. I'm just wondering if we should call airoha_qdma_cleanup_tx_queue()
on stop as well, and then that should come with the reset.
I think having a packet stuck in a queue may lead to all sort of oddness
so my recommendation would be to flush the queues.

