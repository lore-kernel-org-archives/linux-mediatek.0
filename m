Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8656C7115A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jun 2025 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5edE6++HzN3Nzjso20D35ZUNuuvgj0lx7kcEPbqrsE=; b=Q0EHtp0LlEJla86X/o0cIvg9Po
	evTTbhicrvfv0ATUSSco0w8P3V55hQeID5CRNu+kzAn+YuevfJqRPRtxHs414mszuZ4zubCX1E6N8
	2XD8haFM4PmP3cqj3mHG8vpzu7DS7rsHGMTjA5AOsGs/Dn57aJczkVeZJuXkkseTTqlnplRZYUJe6
	LKcaoG2S1RwP9CZAgccKkHJczwlXTN6yKpksHPOXsEDFeazS2mJ6aZ414ObjRLwg2belfEJCXU85T
	q1P/9xA/nEjpuCnqHeOWYEhhRivQdypd5MH3u70utM0DLa5PyNsSTX5PDQXLh/KJwmL+glAnlEuCj
	gbWvjsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHVC-0000000DX7t-2BwH;
	Thu, 19 Jun 2025 15:48:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEk5-0000000D697-2YYf;
	Thu, 19 Jun 2025 12:51:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E07A60010;
	Thu, 19 Jun 2025 12:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FE2C4CEEA;
	Thu, 19 Jun 2025 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750337503;
	bh=jf4r8tgAjTvpdpKxRLoaxzrCAVbjkq3ldG/x5W5pyvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4MybcCJF1lABKI9a7riHG+6PTE0QcucL0hZ4M34wv7OTCvCZfZGuOo+kVnWC3cEO
	 U3FQisF755IPTJNMM7bMV4veMXVWtTvgRAH3xPcx5Rl9PAc7nFvKdUyS3L0//XKDK7
	 gwMj65vrO35mz3TYPzEQGtoYEdepRF/sHTm6eWTSBYDfh9zG99REXBoAc276RlFNPY
	 nyPZge73icoghlUhijZoJNNYxD3kQb1nyPjTImO8g3cmMD52koGLUiOI8EqZAeBg3k
	 DmHTzxu7+Wy7p0zbcPY36hQyfxL7swAY3+CARw3aGsRq8suXvvYGirKJKIJjshyKFD
	 D790cK1tdSZ5g==
Date: Thu, 19 Jun 2025 13:51:37 +0100
From: Simon Horman <horms@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux@fw-web.de, nbd@nbd.name, sean.wang@mediatek.com,
	lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org,
	arinc.unal@arinc9.com
Subject: Re: Re: [net-next v5 3/3] net: ethernet: mtk_eth_soc: skip first IRQ
 if not used
Message-ID: <20250619125137.GN1699@horms.kernel.org>
References: <20250618130717.75839-1-linux@fw-web.de>
 <20250618130717.75839-4-linux@fw-web.de>
 <20250619100309.GC1699@horms.kernel.org>
 <trinity-98eee496-129f-43c7-8d3f-4a77f4a183b9-1750329125336@trinity-msg-rest-gmx-gmx-live-b647dc579-9795v>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-98eee496-129f-43c7-8d3f-4a77f4a183b9-1750329125336@trinity-msg-rest-gmx-gmx-live-b647dc579-9795v>
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

On Thu, Jun 19, 2025 at 10:32:05AM +0000, Frank Wunderlich wrote:
> Hi Simon
> 
> > Gesendet: Donnerstag, 19. Juni 2025 um 12:03
> > Von: "Simon Horman" <horms@kernel.org>
> > Betreff: Re: [net-next v5 3/3] net: ethernet: mtk_eth_soc: skip first IRQ if not used
> >
> > On Wed, Jun 18, 2025 at 03:07:14PM +0200, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > > 
> > > On SoCs without MTK_SHARED_INT capability (all except mt7621 and
> > > mt7628) platform_get_irq() is called for the first IRQ (eth->irq[0])
> > > but it is never used.
> > > Skip the first IRQ and reduce the IRQ-count to 2.
> > > 
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > ---
> > > v5:
> > > - change commit title and description
> > > v4:
> > > - drop >2 condition as max is already 2 and drop the else continue
> > > - update comment to explain which IRQs are taken in legacy way
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> 
> thank you very much
> 
> i guess RB is still valid with changes requested by Daniel?

Yes, thanks for asking.

