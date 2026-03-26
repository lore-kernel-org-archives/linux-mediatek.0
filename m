Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E3710A88EC
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iz6Kx63iIsmMZCDFp4f6bceBdYx8kf2s18BrcmKZX0=; b=c3fWhf7+zMs9ST5kXPi5F++NES
	uBk5WLzTDMu2VyenFMOvldBfXahBoCF0Ki/whfjBGIf/3fhJEs5rMPgWrfVRHpcvocp4eqBLhI8D6
	Hj2e/JjS2MrLyP1GultedR6QUpNG+V3OkOWhz8vOhHzqPytS0x0YBrwMtWqEE/jfa9DKS/t+zDkDx
	bsofmwHbQwdiwDh5pMwSNSB63jwKL0X70oDmdWX5ORiEkJYXbYEn8dvjQUrX2vKih6oX2pmWPl4dZ
	7OdC450FKBFUv7ftNl+Aew4k62LujexEXuJ94VOQjZG3DYIq8rwT3cWE57V0KSHExegP6fI0vY3RO
	5xI9hs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oIy-00000005vak-1IqY;
	Thu, 26 Mar 2026 17:15:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oIw-00000005vZZ-0HD5;
	Thu, 26 Mar 2026 17:15:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72BAD4396D;
	Thu, 26 Mar 2026 17:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F717C19423;
	Thu, 26 Mar 2026 17:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774545333;
	bh=jvkDS9tKLVeEgF0DgkEhc5+lTjNn80rqHLS3xCz8V0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BDXTH51QoJgCKUhhoHf42bamFgq+wwWwg1N9Yig9JfaQ3gADMfymF5+pKFJZBgewY
	 scQZV+UZ1Twq7B/cvZGwTdphEYhvnqj1envTzFEZB1quSnoOAwsXV+D6CcgmWzSO3I
	 sNcM4Q264pAZgFkDgmoFWNG3zPjLGLiYXClrgzo/dqjANPgJ6I821qS009NzZkAV9q
	 b+e8Nh5yJ1KOp+KZ4C4oFIUMxq5q2iXPid9IYvcrcM057xWBWk36a+IR4lwec+qQBD
	 B6/NkJ4vU61QMiR2zZKH3k+RXdBxUpvHeuWY70qvzZ2G2nc7UvS3pGLV12cmDjkCkT
	 xJ1qQhQutGwmw==
Date: Thu, 26 Mar 2026 17:15:27 +0000
From: Simon Horman <horms@kernel.org>
To: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Elad Yifee <eladwf@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mtk_ppe: avoid NULL deref when gmac0
 is disabled
Message-ID: <20260326171527.GO111839@horms.kernel.org>
References: <20260324-wed-crash-gmac0-disabled-v1-1-3bc388aee565@simonwunderlich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-wed-crash-gmac0-disabled-v1-1-3bc388aee565@simonwunderlich.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_101534_121081_7E9D4A94 
X-CRM114-Status: GOOD (  11.52  )
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

On Tue, Mar 24, 2026 at 09:36:01AM +0100, Sven Eckelmann (Plasma Cloud) wrote:
> If the gmac0 is disabled, the precheck for a valid ingress device will
> cause a NULL pointer deref and crash the system. This happens because
> eth->netdev[0] will be NULL but the code will directly try to access
> netdev_ops.
> 
> Instead of just checking for the first net_device, it must be checked if
> any of the mtk_eth net_devices is matching the netdev_ops of the ingress
> device.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73cfd947dbdb ("net: ethernet: mtk_eth_soc: ppe: prevent ppe update for non-mtk devices")
> Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>

Reviewed-by: Simon Horman <horms@kernel.org>


