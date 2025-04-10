Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBE3C369A9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 16:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNiqWei6bVR2lcSyh/W3av+DrOCPLtgDwruDBvw5w8o=; b=3sNpNKRWpX1H1cYfyLSyOkytZr
	AjYZG3F4B0mK0Xax9KhfvtnU/zEAXnoDwAIkkF5loSUrNM9KOl09la7htIn4YELWSYGzwM1FzBfjW
	PxyvXR20b/u/iDbhUqaRaXdsa3e1DrkUmOWY2oSd3B5PoUHxbD9ctNF7dfNHeyeF79THnJQToHF3A
	UKCP92YEXvP3JGQHl8SDwIDSOuFsBN8OicOJE077k6BfpjMeTL19dfvzuQ+2Qwu8aJjW465DK1/Pw
	vEGFjQ//sPZWTWbbLqZ72hkfwPq2hzOsrogjGP+7dNoXXFHfQ/PpPRhEWzmb+fpQjH2bXHgKD/Re5
	qNS7DY5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uo2-0000000BCqq-1JpA;
	Thu, 10 Apr 2025 16:31:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2trX-0000000B1oj-3jZg;
	Thu, 10 Apr 2025 15:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CECFE68448;
	Thu, 10 Apr 2025 15:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F3DC4CEDD;
	Thu, 10 Apr 2025 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744299042;
	bh=5zcV/CG8AMLAy9luku1LD5mAKplEIFPVlXKn8cKy+bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQLDv9fwNtDQlftYK63Xa1crTz3K3Nb0427ADYfWdru0Tigrvr36sJaABKHPdTC71
	 hAp8Y5dINwauilTu0E+12AsgghiralaNUR0SqRMla/1XR/Ktnr2GgVfjGCjXazY6Xq
	 Y7M4I6Nt3PGeHCu7f682d50yN1rMzvvC3ahQQOn5VdhdpUM0FtdCTKwDoc5AI4J5+d
	 eL4wHuU93NEBJxoRY5BTPkGCUTnuAAUG8EffgU3+4o+wsHrcZiu+yQ25ZPtJD+Txap
	 N804kSYEPBb14q0T8oF6BfXE0OW1ni0A27NHMAVJn2HBYw5X2aNpf4LTyXG9AUtlK8
	 VnQbMhmImmIGA==
Date: Thu, 10 Apr 2025 16:30:38 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Add matchall filter offload support
Message-ID: <20250410153038.GT395307@horms.kernel.org>
References: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-airoha-hw-rx-ratelimit-v1-1-917d092d56fd@kernel.org>
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

On Mon, Apr 07, 2025 at 09:59:04PM +0200, Lorenzo Bianconi wrote:
> Introduce tc matchall filter offload support in airoha_eth driver.
> Matchall hw filter is used to implement hw rate policing via tc action
> police:
> 
> $tc qdisc add dev eth0 handle ffff: ingress
> $tc filter add dev eth0 parent ffff: matchall action police \
>  rate 100mbit burst 1000k drop
> 
> Curennet implementation supports just drop/accept as exceed/notexceed

nit: Current

> actions. Moreover, rate and burst are the only supported configuration
> parameters.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

...

