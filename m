Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CE3C47089
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 01:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yb7lAULmPNH9P/rn7LWaaEwvo5F4byshCQcXqagpnFU=; b=HYlerbOSGHCLALD5stqH7GvVO8
	jEzMyB0hM+BrXrtuv8ms0mlOkJbmWArcb/gUS/ZPIX7wByGpJlv0EsBsYzl6bxl54FkvvfH/ASFtA
	ItHTP/yOIXGvGir4vTs7YU9CxhQouk0RsHLxgU67BrzaL5w0mzbdPOSyXzzdxDVHoUJqEapQ0gooZ
	z8sDU+qqHkrnPuCefzNVZWvggdIEH1UlrdyGC15jysYdbxe0Tec/uJskoPUacyCOhPxOCpJY730GP
	QH4a+omTh8dgsCDUIaxG+3rH68Ywca6iHsQSksjsWlKHK89L0kn+pi0g8sSKgf8vSEzjKYRWrxWRZ
	hIdzza+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2N0p-00F0LZ-Km; Tue, 06 Dec 2022 01:44:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2N0n-00F0Gy-I6
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 01:44:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29923614FB;
	Tue,  6 Dec 2022 01:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03559C433D6;
	Tue,  6 Dec 2022 01:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670291083;
	bh=SM22d4N/E+zIdAac9YNQCnzKGtuEJmhYYckf1i4nf1Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JqKCAuF5EOLgZagLic2ogHMa7Z48kXYx5KWxnGSoj1FWnI4F0+IYOuegRuoHdDUPz
	 XHxY9SRhnLgT4AxitiKOQg4UyDwapgIrEVtinIlflY/DgTUh09LbwpzSJUUMavAT6j
	 uN+ESMJeth4wdX0xxhmcxkMw+r8xuCn/r5zZaXDnm9YOS/9ef425vNOdUSl59q44QS
	 SjQgHO9C9HacP/yClknFF3twdU7xd9ZCcheWkkwjTBzSlziKeP1xY3JWRT+fAYT6i2
	 RkvL4lCjrm2QzyyVJsMn5kbqL703Hl+56tss3MZFQzm60kXRYAP0VQFlGXfK2sNCdP
	 atJjfLZafjATg==
Date: Mon, 5 Dec 2022 17:44:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: fix possible deadlock
 if mtk_wed_wo_init fails
Message-ID: <20221205174441.30741550@kernel.org>
In-Reply-To: <Y420B4/IpwFHJAck@lore-desk>
References: <a87f05e60ea1a94b571c9c87b69cc5b0e94943f2.1669999089.git.lorenzo@kernel.org>
	<Y4ybbkn+nXkGsqWe@unreal>
	<Y4y4If8XXu+wErIj@lore-desk>
	<Y42d2us5Pv1UqhEj@unreal>
	<Y420B4/IpwFHJAck@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_174445_671698_402BE900 
X-CRM114-Status: GOOD (  12.22  )
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

On Mon, 5 Dec 2022 10:04:07 +0100 Lorenzo Bianconi wrote:
> > IMHO, it is a culprit, proper error unwind means that you won't call to
> > uninit functions for something that is not initialized yet. It is better
> > to fix it instead of adding "if (!wo) ..." checks.  
> 
> So, iiuc, you would prefer to do something like:
> 
> __mtk_wed_detach()
> {
> 	...
> 	if (mtk_wed_get_rx_capa(dev) && wo) {
> 		mtk_wed_wo_reset(dev);
> 		mtk_wed_free_rx_rings(dev);
> 		mtk_wed_wo_deinit(hw);
> 	}
> 	...
> 	
> Right? I am fine both ways :)

FWIW, that does seem slightly better to me as well.
Also - aren't you really fixing multiple issues here 
(even if on the same error path)? The locking, 
the null-checking and the change in mtk_wed_wo_reset()?

