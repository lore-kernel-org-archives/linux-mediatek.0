Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FB7C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 04:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U3j7hSH4wqOdBO3aTet59xyKCFfbzxpZ7Q1SJSaPMc=; b=oRGWzbIkUPidrDukm430bf0/2Q
	ksPWzKBGDxzavCf2YV7lRLrMGXWGUqrpgOIUmZoMFYIzMMylf60/FVqmlWMnKo/iA/KFf0vhlZMQB
	kYZCgLWFjBaaHHBuSVA7+9EbVEQOfKPG+HrCrpAMoieAHMeIc86N7zdRRHg9TWlo2IMDDFkvAtjiW
	YSUr0CaWBQI/9VDZAoQ2Sc6i4kuwAFzGd+EGcksLVpWo9n0VX63EYYJua5OF1B0ZaglZC0hoCn0+p
	lXAw1+ynBi7He+TSdSQhiASsgA/E7G4ru4OVRM0DN923rdivaBwJXIeIcIluDejaZuik6Fs1D5FWT
	obW1jPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2PDp-00H9KA-Vv; Tue, 06 Dec 2022 04:06:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2PDn-00H9J6-Op
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 04:06:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 44F3BCE131A;
	Tue,  6 Dec 2022 04:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39FFC433C1;
	Tue,  6 Dec 2022 04:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670299573;
	bh=9U3j7hSH4wqOdBO3aTet59xyKCFfbzxpZ7Q1SJSaPMc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uw/Ml6Du6NcyFZ9wa3qD0fzoQ56XWq4dO8JUPuipzqE2QdLRvXGMqVyI3v1wcgyrd
	 c0Toj38+0QlYS+N2e/EJjjGti1F+mhnGcWkQUqbQOIhWPQwaBGzYEnXhNghu13hB8U
	 DQxN9zMXXq1B0nKS/MTwrJfU9jvs+y0t1b5HdNRCsX4uXQbGZ26Sdxq+0dDQuwDrqo
	 najZfHYLQ2OD+88dU/johwV+VquX6h6rpODWX3webeM4e60jQVWwgzaBBbVxnMbQrX
	 hqCnSOsQyQRdIYvaVliV1vLpInlWmaLZnHcSsba1fcnS6HmFKLDZ+Y5/V9VkhQnRH4
	 NEyZNiYx7FrOQ==
Date: Mon, 5 Dec 2022 20:06:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, Lorenzo Bianconi
 <lorenzo@kernel.org>, netdev@vger.kernel.org, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 matthias.bgg@gmail.com, sujuan.chen@mediatek.com,
 lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: mtk_eth_soc: enable flow offload support
 fot MT7986 SoC
Message-ID: <20221205200611.6b488918@kernel.org>
In-Reply-To: <70E22A48-DEE2-403A-975F-AD7D418B78CA@public-files.de>
References: <fdcaacd827938e6a8c4aa1ac2c13e46d2c08c821.1670072898.git.lorenzo@kernel.org>
	<70E22A48-DEE2-403A-975F-AD7D418B78CA@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_200620_010911_B48F68FE 
X-CRM114-Status: UNSURE (   6.57  )
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

On Sat, 03 Dec 2022 16:38:15 +0100 Frank Wunderlich wrote:
> thanks for the Patch, i only noticed a typo in Subject (s/fot/for/).
> regards Frank

The message from the bot does not reflect that but FWIW
 - fixed when applying.

