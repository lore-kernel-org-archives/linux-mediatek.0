Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96625C5DF74
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 23:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeLurHl48k47YBXiRQrPwq6QLHKVeqckCwiB1xJKzUU=; b=fgtgwjnLze3jIAB+OxLezaatAv
	K7Pmq/lxKMzYkkpApvm2PE04cgpWY3WtodBt7zpo43KMpAhZ6Kn854Ayl1oYM8Y+pCDpc+kKeFwMC
	4apAGzGB8bAS390B8Vw0x7Df63ZdoWYESvYGhNkkEnvHgYyiwgWy9thkkwjqyZAhb00eoFUn0t110
	q0rDlEu5sxGrlwTHwfkrLFkbQ0kolSmGtTCojDAMuG0N9OjZL6o7IhmnbgQ5i7BvBAAYlTUH6Ir0+
	8VGiUr690NO6V/jGayW+q3KfRksHKCs9hT27S54QJrOFhTk+6ya/5v4JcwzgyWFCZ3PR21XzBzN7g
	QVcSUIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww6ad-00000006yCF-3uov;
	Mon, 17 Aug 2026 23:17:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww6ac-00000006yBd-3Bml;
	Mon, 17 Aug 2026 23:17:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2336540179;
	Mon, 17 Aug 2026 23:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03B61F000E9;
	Mon, 17 Aug 2026 23:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787008678;
	bh=BeLurHl48k47YBXiRQrPwq6QLHKVeqckCwiB1xJKzUU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FkrxHe5nI/WdOsL00EjFMtJLAdf6WxL4CFwmMqrlweIpfOwYZKQAmxSdcok838mj9
	 kYmFVHgJc9hMAaNsuJI5Rb0rWzfrtF8q4Ya7b/8suiCyDThhqMeM1JqsmEb6863mYR
	 j1aimzw9Dc93A4O12hqtbuDFFeylw+18hQNMPUmg6p1nG9SQpUTNlKj01hTFqVetne
	 6UUgSGXzVgAAit4X0HhvD0EK61LXnZEcFMnX+P/WnXg+lfR/1RZXU6Jxlt724/EHW6
	 ZbEvIyQ43ezP7BJEvOzOrRQrQZggS9Feb+7R4zMa9G42j98w7vpE/SeGumE3JfyKsP
	 ZrsfrMPH8lGmw==
Date: Mon, 17 Aug 2026 16:17:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
Message-ID: <20260817161756.5fd2185a@kernel.org>
In-Reply-To: <20260817090601.1256389-1-pawlik.dan@gmail.com>
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 17 Aug 2026 11:06:01 +0200 Daniel Pawlik wrote:
> On EN7581 + MT7996 (Gemtek W1700K), mapping small caller buffers with
> DMA_BIDIRECTIONAL regresses NPU version probe: the mailbox completes
> successfully but WLAN_FUNC_GET_WAIT_NPU_VERSION reads as 0.0 instead of
> 0.1111.
> 
> Allocate at least SMP_CACHE_BYTES for each mailbox payload and map
> ALIGN(len, SMP_CACHE_BYTES) with DMA_BIDIRECTIONAL while programming
> the original payload length into the mailbox length register.
> 
> Tested on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996), kernel
> 6.18.44, including two cold reboots and sustained WiFi use.

To me the fact that this patch helps only proves that the swiotlb
implementation on this platform is wonky, no?
IOW AFAIU we are avoiding the bounce buffer so things work, but
the bounce buffer is still broken?

