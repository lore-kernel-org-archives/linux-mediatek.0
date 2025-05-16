Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3F9C3ABC9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 20:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYVCErEtbfJsIIDDUGBmLVM7BVuMMw68glkia5FzCNY=; b=RQS4iboZSq8I7wNdmGVCxGjt+S
	yBT+mqf0CWPObvfvVxG6ijxlJFCCbvWDNXm6AYrrDabHaXSJijo1sNqhKoJCLjn1yROQL9K55rXNL
	qV8+fX2m/fIOcKptj7+/xxBWkS6ZGdH/eSi81L/zJ+tkGbKXH8HirOkL037uvYvh/Rrc6ga0kED8R
	hDwnzlmGhnS8zE6JPTrKz5wcPjdLibVEaU6CgDhJE6Yvc1yqnHAk8prY7V6T2KOyPl3+oVbpDWIuv
	qxR/shpIU91YgGXRFBdfS65NcfoShxl/EmSyWIV99+UvA+5QluznpOcuFq76c6cnCqguJxj73Wp5a
	gtr2NxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1df-00000004ZHL-04IB;
	Fri, 16 May 2025 20:26:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1Z4-00000004Yce-3O0Q;
	Fri, 16 May 2025 20:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7F88A4EA64;
	Fri, 16 May 2025 20:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24984C4CEE4;
	Fri, 16 May 2025 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747426913;
	bh=0eZbYvSMOyz0txO7McOUt7WBCXP3fLg51sadhpP/XeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mff0oXGCBELo0hzgvl1WaEJjdXKZ7PB2yucYnPxgvfRfJtsyfndb2MF2nqpMWRNd6
	 6QSwslLlHkotLfTgLKNJDZHKas5G61PIZ/7a43kJkNtGjgaIc8kTZS7vUdaNF6VwlI
	 4HEg/c7NAuCUCMiawrmi2SVkxEVnd8Tkok6WC8ytZqBAw3HWVws7GIwYuklMxNJe2D
	 RbBYKJALQSY4+ByUVtcQNY+Os6YPOLpagZk37B529LWkEru4lU5HBNRiNL+5zJEkcd
	 e6OVlAMc47gBuo8m5D+6j5sVAzDeDPn1nm1dvDPlhVPLU/RZXeGoh1YtJZ+wGyAX+0
	 HSJbIwqpTSQvQ==
Date: Fri, 16 May 2025 21:21:49 +0100
From: Simon Horman <horms@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/4] net: airoha: Fix an error handling path in
 airoha_alloc_gdm_port()
Message-ID: <20250516202149.GL3339421@horms.kernel.org>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
 <20250516201606.GH3339421@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516201606.GH3339421@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_132154_920790_B8B84BFB 
X-CRM114-Status: GOOD (  18.02  )
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

On Fri, May 16, 2025 at 09:16:13PM +0100, Simon Horman wrote:
> On Thu, May 15, 2025 at 09:59:35PM +0200, Christophe JAILLET wrote:
> > If register_netdev() fails, the error handling path of the probe will not
> > free the memory allocated by the previous airoha_metadata_dst_alloc() call
> > because port->dev->reg_state will not be NETREG_REGISTERED.
> > 
> > So, an explicit airoha_metadata_dst_free() call is needed in this case to
> > avoid a memory leak.
> > 
> > Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > Changes in v3:
> >   - None
> > 
> > Changes in v2:
> >   - New patch
> > v2: https://lore.kernel.org/all/5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr/
> > 
> > Compile tested only.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>

Sorry, I was a little too hasty.

This patch looks good to me, but as this is a fix for change
present in net it should be targeted at net.

  Subject: [PATCH v4 net] ...

And it should be split out from the patchset comprising the remaining
patches in this series, which appear to be clean-ups (or at least not
but fixes). This rump patch-set should be targeted at net-next.
And ideally, IMHO, have a cover letter.

  Subject: [PATCH v4 net-next 0/3] ...

Thanks!

-- 
pw-bot: changes-requested

