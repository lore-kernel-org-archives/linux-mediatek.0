Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF27CC30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yW2fzE3+RjoSerGcQuIS9IaUSe+bimJ9NqEaiXcOkg8=; b=yri++1I4bI29oCOV223riRwc2y
	imaaFq5adwvWtTIcFwLtXkTPZLHDzKwgx1GW+CyWXMUWWgtuw1ohmve9CT9K10esQJ0RJTeCxHd3B
	ltMCVfQ2CD9OE0YarTz1vtjkLvxU7oYWin6Biu4jXrFMNZGRgCFTZcH11tSmEQar1ikOtjMjCZQao
	mAgPff1Jgi6djN5fgK0D8BBbLBDe7d88Frz/SMDrenuNve+Og6jhM3WQsIh/t97sS5useNDchIyes
	IjG+tqLLCGwn4n3M2SNZmm0I6yCrJy9cvC5x4Q5srtSrHzVFNPXtxJ+aEkVqVyfZ3eLAmlN8OxsZi
	fx6jiXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPN7W-0000000DO3L-1gkn;
	Thu, 04 Jul 2024 14:07:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPN7H-0000000DO0L-2zEq;
	Thu, 04 Jul 2024 14:07:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42FE062644;
	Thu,  4 Jul 2024 14:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3269CC3277B;
	Thu,  4 Jul 2024 14:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720102037;
	bh=3/qvQlW/P53Rcj1MyrqxxazGgI/iuShcKu8AoUpghDI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rfL5cptNuZ1YXnB62bWt+Nix3Ap9MUcZ1ZS6o33/TFp2HtT1tSecrsssyaAOTFt4A
	 EmBOicavSpHCQqARXP8ijEakwx3vcZb0SpRXdteOmMTstGl/Yc30eZHor+U37INq+g
	 wQCoKiie3eZ8m5+VD2/CPIEDNJjIZ4xAoJhR1DNpVl0U6KMZhGzb4HAWy6GV6e8Rvv
	 lg3I1UA1GpZQ2WoO1NTAoNwDUBQy4Yw+FR5UHxwHy/CkmUxJKs/ziwnCoEgTu7s+XO
	 c79QPdkoKv4/GClBqovNm7VWINTlMs3I8HJNkCrtaCKkw1BPctvUau984hSnls4vqS
	 99lDnNEETrKyA==
Date: Thu, 4 Jul 2024 07:07:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, pablo@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org, Elad Yifee <eladwf@gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_ppe: Change PPE entries number to
 16K
Message-ID: <20240704070716.118db29e@kernel.org>
In-Reply-To: <TY3P286MB261180E580D838704E6123B598DE2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
References: <TY3P286MB2611AD036755E0BC411847FC98D52@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
	<20240702110224.74abfcea@kernel.org>
	<TY3P286MB26119C0A14621AD8D411466A98DD2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
	<20240703164818.13e1d33c@kernel.org>
	<TY3P286MB261180E580D838704E6123B598DE2@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_070720_216789_947CAE2A 
X-CRM114-Status: UNSURE (   7.08  )
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

On Thu, 4 Jul 2024 19:06:29 +0800 Shengyu Qu wrote:
> PCDN means P2P CDN[1]; This modification already exists in a heavily
> modified openwrt fork here[2] for over 2 years so it should be working
> with to regression. Although a higher limit would be better for PCDN use
> case, but only newer devices like MT7986 supports 32768 max entries.
> Setting to 16384 would keep old devices working.
> 
> [1] https://www.w3.org/wiki/Networks/P2P_CDN
> [2] https://github.com/coolsnowwolf/lede/blob/2ef8b6a6142798b5e58501fe12ffd10b0961947f/target/linux/ramips/files/drivers/net/ethernet/mtk/mtk_hnat/hnat.h#L604

Makes sense but not a fix, please resend without CC stable and without
the fixes tag.

