Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266ADC61DD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 00:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQRaLYDUxy93Hz6VAFpiPT/0NSOIPKw/WnvayVAwG9E=; b=VqzAT7PDuEx5cEURhjEgVQGdMN
	Q8L/qGcocrWuVppkAh2KW3VimJnsQ0DRpWGqgLgUdYXycjuY8PY1v/31o284IefzzOmHJXBnRcN/U
	3LxtFjajgnGeyrvPcqA0f3CcXDDohIdxgEAStWD9oydxfG5Sye7nvzTjiWrDsrqIXsLC0eMECHiyv
	8uf/X3yB4cxIlZBvfcPJJYcIaGl9X/Ib4lYEyoM65mYJaM9MU6kGDIziraE94g4RQ7Ok8ObMaH/bn
	acLw4QyzQaDLnMSg66lwC/OVeYzyQtPaQsSCF0A/MCOS06Ke9nFT3xYt046ectJso2KBvfLLh4OBu
	Q4N4bBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Hu2-00000000oG0-1F0s;
	Fri, 04 Sep 2026 00:35:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Hu0-00000000oFj-48qq;
	Fri, 04 Sep 2026 00:35:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5804D40822;
	Fri,  4 Sep 2026 00:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E217D1F000E9;
	Fri,  4 Sep 2026 00:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788482132;
	bh=QQRaLYDUxy93Hz6VAFpiPT/0NSOIPKw/WnvayVAwG9E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eNtntJC+ZaU5DuPCGwWC4NMYJuf1+vBiSpsBcsil3YZ/WegGG3own2Hi8iJ3Wcs6U
	 OXFgcfGVog5BiEDaue56KnV+r4azi9rCX+I2xLDr8298x4u3SFPQJfoI3y0gmEcRrA
	 bB09BNDPwatvEH9Hr+QStwvfZDfbhyb63XpSFtSI6IfoXwxjD01d1BATqwtNCG4KfS
	 zWi4QpQdhNTzCfcpe3bVA0MsBgongbtdAX1ADNWrl7hSj8z9LXFa9BeiCpnVT7xaGa
	 sIMSKIe/Lolj2BSpW/8V2kW8FadSsHEhbr7TGJaoTkIv6O2vs490WAE2fOlLzBd6gs
	 mIjZPKG9Sxygg==
Date: Thu, 3 Sep 2026 17:35:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 upstream@airoha.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] net: airoha: handle RX_NO_CPU_DSCP
 interrupt, not just RX_DONE
Message-ID: <20260903173355.62780188@kicinski-fedora-PF5CM1Y0>
In-Reply-To: <17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com>
References: <20260831234701.206021-1-sochnev.v.74@gmail.com>
	<cover.1788286284.git.sochnev.v.74@gmail.com>
	<17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com>
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

On Tue,  1 Sep 2026 19:32:53 +0100 Vitaliy Sochnev wrote:
> Whether NO_CPU_DSCP re-latches while the ring is still empty is not
> documented. If it does, a ring that cannot be refilled (page_pool
> returning NULL) keeps reasserting it. Masking it until a refill succeeds
> is worse: a starved ring never fires RX_DONE either, so it would stay
> dead after the memory pressure clears.

Since you're not sure you should probably add a timer to retry
later? Maybe the IRQ is not needed at all, you could just check 
on allocation failure if the right is completely drained or have 
a periodic task a'la fbnic_napi_depletion_check()

