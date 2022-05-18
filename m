Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C6BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZyjZh8MT/0DV2du7QFDifwTQFZSt2vLsfYQaH53EyQ=; b=B6hbn5GtZ/BSQ6
	TeYGqKkYt+0nyL66Z4QR5kAIh0jmakuoQvAxvO1SKJTI9+/RLWHp6BKV0yI4tRkpeQWHijrf8yHA5
	r8AGUtQhM+iWjJ77PZx3svm+lM8k0Kj5GBZO8CwyyTCce2EcecVkEinPW/inQrICstzot+z7mdxP2
	1qvch1Py20ybSri6g32Ha3FYo3Uf2G+Ek7wfHb1Ie5U1Loi64uYUtBeSJLZv1GRWXcALV5xZ3lMVv
	CLUaTxJmFbBVK6Tp7/OW/uBYRZA7t+ClN/PeCXmkYt22mCGhjuf3SLSWtHL206CgkUrXOFZLUAOYJ
	/zSH74/aNMMlf/KCcFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrLqn-002ttG-91; Wed, 18 May 2022 15:44:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrLqk-002tsg-8v
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 15:44:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FDCC60FE2;
 Wed, 18 May 2022 15:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572A1C385A5;
 Wed, 18 May 2022 15:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652888672;
 bh=yqHK14+o4FTfkkq3NNmohwK2DnXpjOlfNvCu9g713i8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D7oyQgD++gY2In4fkrJy6/wEeR2tEK2wDl65xLcM5MpAi46HGeImLGsNj1lUDwHmV
 hWu/l4Ug/yIDE7cf463HzRXXIpFCRr11oq7/tHCyxtLF9ZWub++cm3DtPmADnnAzP1
 obt4GbFfEoE2VBnWuZzK9sQIw9esG8q45pOG3J91THIgAZ1a8tAYrw2+ddk+y75POq
 eZVQi5qNv0eI7PjEcS0R8OuMopiCIBlbVlmiKrP1BHl5zhLWM2uOvp2qIsp1XfefS+
 ZVcAd1YGMcPyZMyjhjS6FSszZVIGg1lTNYGJ9QgcG6Nj7ZmXkJ2PeIkC9GcCBlRWUq
 FaNWuQurkmTMw==
Date: Wed, 18 May 2022 08:44:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 11/15] net: ethernet: mtk_eth_soc: introduce
 device register map
Message-ID: <20220518084431.66aa1737@kernel.org>
In-Reply-To: <YoTA+5gLC4zhoQ0F@lore-desk>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <78e8c6ed230130b75aae77e6d05a9b35e298860a.1652716741.git.lorenzo@kernel.org>
 <20220517184122.522ed708@kernel.org> <YoTA+5gLC4zhoQ0F@lore-desk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_084434_400223_C96AE6C7 
X-CRM114-Status: GOOD (  15.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 May 2022 11:48:43 +0200 Lorenzo Bianconi wrote:
> > On Mon, 16 May 2022 18:06:38 +0200 Lorenzo Bianconi wrote:  
> > >  /* PDMA RX Base Pointer Register */
> > > -#define MTK_PRX_BASE_PTR0	0x900
> > > +#define MTK_PRX_BASE_PTR0	(eth->soc->reg_map[MTK_PDMA_BASE] + 0x100)
> > >  #define MTK_PRX_BASE_PTR_CFG(x)	(MTK_PRX_BASE_PTR0 + (x * 0x10))  
> > 
> > Implicit macro arguments are really unpleasant for people doing
> > tree-wide changes or otherwise unfamiliar with the driver.
> > 
> > Nothing we can do to avoid this?  
> 
> I used this approach in order to have just few changes in the codebase. I guess the best
> option would be to explicitly add eth parameter to the register macros, what do you think?

I don't think there's a best known practice, you'll have to exercise
your judgment. Taking a look at a random example of MTK_PDMA_INT_STATUS.
Looks like that one is already assigned to eth->tx_int_status_reg.
Maybe that can be generalized? Personally I'd forgo the macros
completely and just use eth->soc->register_name in the code.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
