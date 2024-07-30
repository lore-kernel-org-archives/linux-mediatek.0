Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01E0C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 02:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW1t3MifvAW/FVrH3ZnCMZDZJ3G5ZQX4heVCPNnOJJQ=; b=b+/DakBL40ySBDaKp48lhPFGw8
	0v0p6XdFSpARssaRMV9jHRd8i1naLUklqV3SY7XhIa0QLfZleepamh1Izq78vjCpfQXOlTXqdlETC
	YhImqyBZE/JWWIlMov9WJu+lzSr5EQj3/eCn/lPRYKwg+ePIrhi+r8usI00BJmXQ3c0ct42rqEYec
	g2n2AK7EOXoKxiIRWFJ9+9bvDC0GaVUAsK63hMsmMf90EMKDjSW6wbmLmKhmTb8hhfR8c/SOWaE5c
	T/5vCgoEtT+p7QJTzALwUnwmdELAuAZcQz/WhOsQ8nzYhthzxQB+aWVqTQOXays8ek2lMTVOf+soX
	vMA/tZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYcGY-0000000DIX7-1fRo;
	Tue, 30 Jul 2024 02:07:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYcG6-0000000DIRZ-0VWk;
	Tue, 30 Jul 2024 02:06:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 41264CE01FE;
	Tue, 30 Jul 2024 02:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0E9C32786;
	Tue, 30 Jul 2024 02:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722305195;
	bh=LXY+kDi6JMe/6TkAfwSEh/KogLm8VrKx/SMDaXimoL8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LI5ezrIg6oUbRtnewXQuQI+kZUsvNcs+b1GyigNN+psXRdih7hLqIepwgEA3K3xAJ
	 FbVvosf+XX9hskZjxWbXK/a41oe5FxZy30/TMcMdziFCXPPUtvpyYlepEfuJc4+p6n
	 scPMnvEb0y4fxmrGDljS93bDHVFN72m5JaCUwkNDmgDKA2Ua5UQ8wOZl9IOxtyvZFT
	 wQaUlJvrPLd5JgIJ37738VZCtnThQUY5cZGtlaoALoSUxXkRW1Yx64bMsAoehU2bnU
	 9P6R0sNDVegJDAPP6ZDI7I2HJZEIY8F/SxCd77tEyQm86+itG573+7A75LcBZVKSjh
	 vtfumjhDOMaBw==
Date: Mon, 29 Jul 2024 19:06:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: drop clocks unused
 by Ethernet driver
Message-ID: <20240729190634.33c50e2a@kernel.org>
In-Reply-To: <5f7fc409ecae7794e4f09d90437db1dd9e4e7132.1722207277.git.daniel@makrotopia.org>
References: <5f7fc409ecae7794e4f09d90437db1dd9e4e7132.1722207277.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_190638_363651_6884A130 
X-CRM114-Status: GOOD (  11.08  )
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

On Mon, 29 Jul 2024 00:00:23 +0100 Daniel Golle wrote:
> Clocks for SerDes and PHY are going to be handled by standalone drivers
> for each of those hardware components. Drop them from the Ethernet driver.
> 
> The clocks which are being removed for this patch are responsible for
> the for the SerDes PCS and PHYs used for the 2nd and 3rd MAC which are
> anyway not yet supported. Hence backwards compatibility is not an issue.

What user visible issue is it fixing, then?

