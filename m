Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1067BC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/BrWdXYwkpzumsBKB/YphpI+Jdg+E6KDqyGxyCMSWM=; b=ET1YxA8txMdKYff22fPOqlJh9z
	xsxzdHR37Ci8p36H43VeiODvN0y2Aev1fBLCBFcwaChdCSC9hqe+8LxYepmhKx1ZX5Rvju79imrTO
	IMfstLHizbSIMy4Xc/FP+aJPgjZGEbrSJ9Erh/cV2VvOJkRz/1ChvoJuUf2lwbQuEEDjqMZDXC9tn
	6BtlZ8tLI4u4PSexZewW5SrYh3/elHeSHqohjaCQF8eqmDLGaowKrHZHRIbc/Wlei2bRf9VCHqTaI
	Wh0Rk0E5Dnrt1aKcvynJlDOj447JtPoa+RegH+O3Cm8KFAKdL8T00m/YprRjVnMmAyqTwCgdEh8Q/
	0Icnlerg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkqX-004K3C-0j; Mon, 28 Nov 2022 20:35:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkqU-004K2a-AP
	for linux-mediatek@lists.infradead.org; Mon, 28 Nov 2022 20:35:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1AD7B80EFE;
	Mon, 28 Nov 2022 20:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31ACDC433D6;
	Mon, 28 Nov 2022 20:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669667715;
	bh=z/BrWdXYwkpzumsBKB/YphpI+Jdg+E6KDqyGxyCMSWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MuM5AmXPVp4aFBpJbABb4tugWQMqjP+5T97nDHOPjpPZkDOSTTHJP7nRPBJqN9kBi
	 0G+yN7B44aN9xwt6o6kHvODqXGHEFh+AppK1N3bfMBF+1pArIxmhLi5ruQGgLdDUov
	 wDRQDY1UpNxmIUBYHjgxnVObf5aGLHGBIOB360sPLd9qSkAVurpCXo1v1nktXFElE/
	 xHlmXjUlWj/Zun4lDcUX+aJszsgkOYjkSnbtfjg6PAzFPIy1MvTa+1UzYOccsDZnyh
	 N03dV82Xi4R5bLdiQoLauwqUqkZqeuQsupdx2wNyswynF+BIHLSXHaiIRd43LjCWyl
	 wGFYTNbP47N/w==
Date: Mon, 28 Nov 2022 12:35:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Sujuan Chen <sujuan.chen@mediatek.com>
Cc: <netdev@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>,
 <linux-kernel@vger.kernel.org>, "Lorenzo Bianconi" <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, "Evelyn Tsai"
 <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH,v2] net: ethernet: mtk_wed: add wcid overwritten support
 for wed v1
Message-ID: <20221128123514.44bc620c@kernel.org>
In-Reply-To: <36d6cf34361ba648ad307affb0371d94663c108d.1669259807.git.sujuan.chen@mediatek.com>
References: <36d6cf34361ba648ad307affb0371d94663c108d.1669259807.git.sujuan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_123518_534846_CE114D7F 
X-CRM114-Status: UNSURE (   6.14  )
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

On Thu, 24 Nov 2022 11:18:14 +0800 Sujuan Chen wrote:
> All wed versions should enable the wcid overwritten feature,
> since the wcid size is controlled by the wlan driver.

This appears to have been applied to net-next:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=a66d79ee0bd5140a64b72cde588f8c83a55a1eb9

Thanks!

