Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598C5C3A5A7
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 01:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGdk7Y7xoGwq73CcdQde1N1fFDLqA43D1j7pAK0ZJzQ=; b=G9eZyF5Sb82NvEktydubA7J7Wb
	ARA1INO5F9Ag23ie5xiPjCj7tsPUhsS/1zpV7qVCwD85L/6iOcArql6ZOQM2QPP2PLhqdDGhEylsR
	OAmKq3KSAZHWisp/k4yqRqdqfbiB6wBk7fZTvU1hLUlc6bWF+v2VCybdUKVRcyud/cCml8bn5xIwe
	gpWR6YJ3bY3mPKesrVMiOeOOaOTd7zKmGraoBvPtGVUE6jxRnw0pAEO7rdfE8tnRYeXPZq+mqavzz
	LhFBEIuxcBj8xhAzVwZJCv/MdOCp3SIFBQFoVLdwjlRUlV24ti5b71Bz2UnIbn9f0I9TY52hkISLS
	sycCxPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jAm-007PXf-EB; Wed, 07 Dec 2022 01:24:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jAj-007PVE-GF
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 01:24:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5785461995;
	Wed,  7 Dec 2022 01:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56499C433C1;
	Wed,  7 Dec 2022 01:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670376267;
	bh=FPdfUOVq71widnt/rP5bz8etf16EdqYElslpYiElRrE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gDTQhVdcwUpsUQNRZRp0lDiK1wnybP7LNLHIt0JBjkhSc0w10Tvd6mfIu7+wCNRg7
	 RE9UFt0EcEZl+mntSxxB7p93dX0EeMUzbIkiKNmNOTa99ZMROwAYdvBzVQQWYsSsdH
	 wVWVvL7/SYqEUCFb2tcnnZZ525qbQ5pmfyqyu4DYKCwOPXihPw2S5cUGFwWd/qFZzR
	 6sVSYEFCzN2aH31KZvrG78kd7PtmCYhiPes+kIb/GCzkpea8vWOtIvYeYe7euEhHqy
	 y6hSOOBPyqqlWnhQGJdyeROCg/ljvJdA8J7eJD0YVTCXfVXYTAKuCpWBN9HioAF1XK
	 74glwHapxtWiw==
Date: Tue, 6 Dec 2022 17:24:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock
 if mtk_wed_wo_init fails
Message-ID: <20221206172426.7e7cf3bf@kernel.org>
In-Reply-To: <Y4/VvGi2d0/0RrRW@lore-desk>
References: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
	<Y4ybbkn+nXkGsqWe@unreal>
	<Y4y4If8XXu+wErIj@lore-desk>
	<Y42d2us5Pv1UqhEj@unreal>
	<Y420B4/IpwFHJAck@lore-desk>
	<20221205174441.30741550@kernel.org>
	<Y4/VvGi2d0/0RrRW@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_172429_624855_22F4F217 
X-CRM114-Status: GOOD (  13.80  )
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

On Wed, 7 Dec 2022 00:52:28 +0100 Lorenzo Bianconi wrote:
> > FWIW, that does seem slightly better to me as well.
> > Also - aren't you really fixing multiple issues here 
> > (even if on the same error path)? The locking, 
> > the null-checking and the change in mtk_wed_wo_reset()?  
> 
> wo NULL pointer issue was not hit before for the deadlock one (so I fixed them
> in the same patch).
> Do you prefer to split them in two patches? (wo null pointer fix first).

Yes, I think they are different issues even if once "covers" the other.
I think it'd make the review / judgment easier.

> I have posted v2 addressing Leon's comments but I need to post a v3 to add
> missing WARN_ON.


