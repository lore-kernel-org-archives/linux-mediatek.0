Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2258C61DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WUjcqcef3k4HkFygJcgodSIJcF5sdiy2UeLmuCTMDI=; b=tad/R3eyi1h/7VWMctEa9OH+g9
	4+yU7Zhkl27Gqk5RpjzQcG5FaGm/zjbxrU3E6tOHrWUoNC2+QBDBHcvezoNoyj/vvim2PN7SLWVVH
	rdEaFkCCopvpfDaZQEcVWBgvZs7GsGDAM/sGYc1eW66GgmE9dkKttvvuws7TY+nDp3PP9ND0rjuBg
	a2RCCbu/6EclrP3cuTc/U+Y5OSnsbGJuUzIcLokdrTcbfJE2ssiEIk8Xe61XqvdESxI0iBnD5HRVi
	qVf+WUsA3L1pVpDwUcCWp2yKRZIKGEpbfiSjeHsxWSroKZSzhrhlhN7pACJuBMrKJEn5LQj95Qi8b
	8YuZ8VRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFx9t-00F4tw-QR; Thu, 12 Jan 2023 12:58:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFx9q-00F4sX-L0
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 12:58:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1348D60A69;
	Thu, 12 Jan 2023 12:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECCEC433EF;
	Thu, 12 Jan 2023 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673528293;
	bh=D3nneqHedZvyKHPM/6g/ukFvUrU8cEN4MzJmLMER4WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKgIOzeDfF66LR9/+ePXrH9jj5zH5Qu+kEYGRgxRaK5znqZKlNXVepAK/pD/bhnym
	 RFGBt0mLv9t6Rrpq9B5CxPXif0hrp+Yj4EX4KT0NyinNAKskgM1FKBzjblv1Lx5jjC
	 pqPhBKes99TzMlyJJZXBkwt17NITK7BCihKt4hwA=
Date: Thu, 12 Jan 2023 13:58:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: stable@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10 0/1] mt76: move mt76_init_tx_queue in common code
Message-ID: <Y8AD4jdyOpqrPT9a@kroah.com>
References: <20230112115850.9208-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112115850.9208-1-n.zhandarovich@fintech.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_045814_752871_923DCE6E 
X-CRM114-Status: GOOD (  11.15  )
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

On Thu, Jan 12, 2023 at 03:58:49AM -0800, Nikita Zhandarovich wrote:
> Svace has identified unchecked return value of mt7615_init_tx_queue
> function in 5.10 branch, even though it makes sense to track it
> instead. This issue is fixed in upstream version by Lorenzo's patch.
> 
> The same patch can be cleanly applied to the 5.10 branch.

I do not understand, what issue/bug does this fix?  And how can you
trigger it?  And why only worry about the 5.10.y kernel branch?

thanks,

greg k-h

