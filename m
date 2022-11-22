Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29A0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 04:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fkfipHroXvh3+0PxeCTSBQI1r7e9mAWhsIEfqFxUJk=; b=qHZmr3c9QQ6kIoN33ouRhOwPkk
	EJxpodb7V+PmY6stDiNArzipBQvrHaLlGDmuaskOHrpAYuTDZAxRvBW4xSigH/w1ONFkrEtyptSXY
	0U/RYtYBV2kzWuR0Wg/gN5tqDwgV7HfAMK8KFb2hs18Zc4t621eWMRjEq/Kj9vnquqBSBb+BV7z48
	8XbPomURzRtu+LvvbF/YAaihf/DGrxM9o7T4Ve+Kd6aoNF6MULqf/ZZCVobKsWhsYqKBEXrH2d7uL
	xefDYIprNfu6EdL9uh1ASvI2vgWDv0Mu1vjyz2bomYgbhelbduBw4wAFv0ykXcZUKWLAlqBzuEGKo
	IXovuw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxKkn-003ejX-It; Tue, 22 Nov 2022 04:19:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxKkk-003eey-Tb
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 04:19:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD55FB818E7;
	Tue, 22 Nov 2022 04:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1DA4C433D6;
	Tue, 22 Nov 2022 04:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669090759;
	bh=HKlGIK/QEV1/cy7+Qe4uhlLUfMwxk79gwY7ck+rcOlU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kqcUm/rPt22k1sqpVY1uDRnnFZVpQjFfTiR15FfPpB7fmSNS7ZaUzbg6DXjKIvGWb
	 b4l9+7ICBMetXkpVdsnauTxQKlgszUQ47wIM3HreEstxHCl/T5jDzTkIi8HehKEu4U
	 INJphh+COikZthi4EuknXxUAfXyox10A3AHJgKcnJW9GB5lhx8ry50jzgEUcnxDKht
	 0kdEuiiMn/dtWmptpJiGDSwSNsu7zFrqypk/A8FVBS+vuI6Wquoph/DPtwYPP7iurN
	 oDE0/HigXmGLCgRmBUhftsVskVDOP5WQwfoySs+qk33oDM2L9PpwLU9PzXNd/kDY7W
	 TivgdB94vIPSA==
Date: Mon, 21 Nov 2022 20:19:17 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, lorenzo.bianconi@redhat.com,
 sujuan.chen@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 5/5] net: ethernet: mtk_wed: add reset to
 tx_ring_setup callback
Message-ID: <20221121201917.080365ce@kernel.org>
In-Reply-To: <Y3vrKcqlmxksq1rC@lore-desk>
References: <cover.1669020847.git.lorenzo@kernel.org>
	<9c4dded2b7a35a8e44b255a74e776a703359797b.1669020847.git.lorenzo@kernel.org>
	<20221121121718.4cc2afe5@kernel.org>
	<Y3vrKcqlmxksq1rC@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_201923_133963_C737BEAD 
X-CRM114-Status: GOOD (  14.03  )
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

On Mon, 21 Nov 2022 22:18:33 +0100 Lorenzo Bianconi wrote:
> > On Mon, 21 Nov 2022 09:59:25 +0100 Lorenzo Bianconi wrote:  
> > > +#define mtk_wed_device_tx_ring_setup(_dev, _ring, _regs, _reset) \
> > > +	(_dev)->ops->tx_ring_setup(_dev, _ring, _regs, _reset)  
> > 
> > FWIW I find the "op macros" quite painful when trying to read a driver
> > I'm not familiar with. stmmac does this, too. Just letting you know,
> > it is what it is.  
> 
> ack, fine. I maintained the approach currently used in the driver.
> Do you prefer to run the function pointer directly?

That's a tiny bit better, yes, saves the reader one lookup.

Are the ops here serving as a HAL or a way of breaking the dependency
between the SoC/Eth and the WiFi drivers? 

