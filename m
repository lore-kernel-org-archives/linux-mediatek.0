Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4E2C36014
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xLEx9ag6rRyJwsDWi2eXFnNE5uDiHwvjqDeRRFzSv8M=; b=hnTVpxCyU4Itm7aryI+pmMDbAt
	8JrzvRO8MXvxEJC9RPeGCQXFSlq8H7/SV8oA38eD3pCQlVlOYy/0mYQiPx6KSflO1wmR1hYY0l25o
	/AScUzgBoE6lGNiOXPBrqCtFhmUUMXOPIpbvHbFt+2AtnXvc2EeiWIsjHBbYvZ7IirIgUbht9sItF
	HVLpJawuegA1BVT7vJ6vtgtcDv3ARUz8xECvwHmEfgMtLO58JgbSc/ZAvhnlGQdfgTdJA8XWpFhGt
	XEfdKHoNTekYqReZ00zb5sLv50jgHqqDd19UDNGyrxzcsCyXLD/37mhb8xCVS+HpvJwoXwwOpYyQg
	8T8VnjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYVk-00000002Zgu-0ztE;
	Tue, 01 Apr 2025 10:06:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzY0u-00000002UaD-3FJN;
	Tue, 01 Apr 2025 09:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23CDAA435FF;
	Tue,  1 Apr 2025 09:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD2EC4CEE4;
	Tue,  1 Apr 2025 09:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743500071;
	bh=7lkAOLmurMCkLel+JEnAt0AfvmrS0keXEItR7INNDXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCeV6Q+/pvkhcx91PG1MjGJj26MDQSAzN5cUN18jYSX31tCdizbhkOdQUVKLQZeE7
	 Qocao8Czzn8TGft7RucqfYzeauAZx18r/0btTdO98PlUhxaVVfyPEXM0DskQPbNMml
	 EB/eo5sUh/OyMzJi0q3VPqBAlBm+lGndPYI4WUb6SgSmKUILXpAnCl11ryLNZDsJqG
	 wloIFVT+Vec7yd7goYUcENJGEy7PhnWECr2QEa0PtN3w+I9jWedofCq7OmjkZ81xbx
	 TWd6No/Ar0t5xZVx050FFRAaCWxjBK8dKFSLbho/6S7BQF7PblesHx41OWKrtv9N4y
	 wjPVPJ7sB00Hg==
Date: Tue, 1 Apr 2025 10:34:27 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Davide Caratti <dcaratti@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix ETS priomap validation
Message-ID: <20250401093427.GA214849@horms.kernel.org>
References: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_023432_893155_3A72D818 
X-CRM114-Status: UNSURE (   8.34  )
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

On Mon, Mar 31, 2025 at 06:17:31PM +0200, Lorenzo Bianconi wrote:
> ETS Qdisc schedules SP bands in a priority order assigning band-0 the
> highest priority (band-0 > band-1 > .. > band-n) while EN7581 arranges
> SP bands in a priority order assigning band-7 the highest priority
> (band-7 > band-6, .. > band-n).
> Fix priomap check in airoha_qdma_set_tx_ets_sched routine in order to
> align ETS Qdisc and airoha_eth driver SP priority ordering.
> 
> Fixes: b56e4d660a96 ("net: airoha: Enforce ETS Qdisc priomap")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


