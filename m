Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A54D185F3
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nFZS1UJkLg9iLCoA6c0Xtw+m8UdCS3zUIquKWtOrOo=; b=xkI1yr458Xo7wEqMf91wqnT5Kd
	bdMvDY099iv81SK9CTYqBCa2pdmcC7coeKBD5/TBpfd3e91yKmCDOPZmPUL+H0s24muGq5+/bv7Zl
	5eTARqkgHCdckkCzpclKOEjFdRzjvw3xpwV0eSDgFhgPM50fnKAXPTCgwKwLwDapF93It7CsHvoWP
	3QpWp1z84VlQhFCN67mSj3ovLmcu3jugYkF90XuCDC4F+Aa+bSdzsEI7KsrLWvZW3pobCjJYwMlId
	AsJVlmwt8kWtG8fSxurl+D5+s8+0NcKz+tVunauq7D36IjaQ4pWoL8cpWfvcif1sNs84FHgHz61KU
	5RUmEo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpy5-0000000H94D-0MoH;
	Thu, 08 Jan 2026 13:22:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpy3-0000000H93d-47tc;
	Thu, 08 Jan 2026 13:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E13D60131;
	Thu,  8 Jan 2026 13:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AE2C116C6;
	Thu,  8 Jan 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767878543;
	bh=5VC3XO65xa/3k4GCT3RsZy0cYcsebKOEvEis61s4nuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKy9C0iPwki/PsgSXscFwuR5IKQkfr5AS7wnEqKjQf6oatQuNj/YzvQ0DogAa2h5v
	 SSL+uPUvxH7vidtqGhZoMeCOgXJVBanC6xnwcQQX1u1O12zrX2AVoH5NYqiGeiyhYr
	 ZX0PQo+Zqou4UJxVo29C+wirnYgOIHMw6tzGBKokOZYwlNEgY/+unc7ULCkyEjdY1G
	 f4W2VEDrB12LLx3AlcUCestFCmQJ3VEnDPHsChd5VjFzLLqhrMWDKxS8YeBNnQ2pXw
	 meMHqTl807NSIB2iNousQNqLG5fDi81KdOP9swRmeAmG1LU+GTBWKNmqzsu4yHgBvC
	 h594bYUdX5ZBA==
Date: Thu, 8 Jan 2026 13:22:18 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Fix schedule while atomic in
 airoha_ppe_deinit()
Message-ID: <20260108132218.GG345651@kernel.org>
References: <20260105-airoha-fw-ethtool-v2-1-3b32b158cc31@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-airoha-fw-ethtool-v2-1-3b32b158cc31@kernel.org>
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

On Mon, Jan 05, 2026 at 09:43:31AM +0100, Lorenzo Bianconi wrote:
> airoha_ppe_deinit() runs airoha_npu_ppe_deinit() in atomic context.
> airoha_npu_ppe_deinit routine allocates ppe_data buffer with GFP_KERNEL
> flag. Rely on rcu_replace_pointer in airoha_ppe_deinit routine in order
> to fix schedule while atomic issue in airoha_npu_ppe_deinit() since we
> do not need atomic context there.

Hi Lorenzo,

If I understand things correctly the key problem here is that
an allocation with GFP_KERNEL implies GFP_RECLAIM and thus may sleep.
But RCU read-side critical sections are not allowed to sleep in non-RT
kernels.

If so, I think it would be clearer to describe the problem along those
lines. But maybe it is just me.

> 
> Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Update commit log.
> - Link to v1: https://lore.kernel.org/r/20251223-airoha-fw-ethtool-v1-1-1dbd1568c585@kernel.org

...

