Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DA6C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 23:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXkVUIfgiSDLswKMZfdy+B7dZxSnpnDU6WuOdngfhn4=; b=igWZm1R6cpmJDM
	FbDVcelSqJ4zfzEl+ie3S+SrUGfe8pCZXCxFgOmmx5EY0D8IzpWVovHKRY79EgBgEwyXY+CxjGboa
	NqkjtX7fsAmglXcgq/JM4dhosVTbe/NaTnWpOi+kEhmXd77Msjq3MBDm2qiMp/YE8Tlc2UUuTN1KB
	0QksrrVhkPGJSe5jhLjAqWwxf77MpT5Lin1NYtJsgWlCuM4dqNSIKEdJJhfrgWFa/pq830vghkqWz
	02lV2xjgmC9M4S3ue8neTqc+82AWRN1TfXgE9Y2wWyP9tQLs2bUJklkUT71E6JB3rYws7rMGmMYDA
	UeUDLHoxQJ35zTI8nBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyiP9-009zG0-Oe; Tue, 07 Jun 2022 23:14:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyiOw-009zEf-AJ; Tue, 07 Jun 2022 23:14:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2BD98B8246D;
	Tue,  7 Jun 2022 23:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731DCC3411C;
	Tue,  7 Jun 2022 23:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654643654;
	bh=HyJ/pBoolQywSI16EFt/cD0D9gnRf8vXON8lajK+0hE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N46ZeFPhZrGOntfcSegxbZEKFrqlAdTxHgD+gMoUPhPncHMM8uEGZOjxi8Q+V/f6O
	 4zZ+GBKyTQMIqokmuf0/1ole1b2h53PMkgRafFtzuETA3haeq2Vimi/g2/RuCBDwni
	 Mlzp231tNQPOfvdCG0iv7epy1pIsqSMMTU+epl5bCcbJjGER99bnPsba1N+o5KNfrZ
	 IloRN+j1Pm3t/VGnVKEdQonjrA0MJeCyex04r1iG3FGJl90OyNgi9y7Sc6x23DJcwv
	 Jds7aHs+0vS1mnn+UjLgNNfKwqAhvAE1IT2X3D5C6zeuN0wgN2fMPqjaImlQbpa+ED
	 PVBZJI+eQ/rBw==
Date: Tue, 7 Jun 2022 16:14:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chen Lin <chen45464546@163.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, alexander.duyck@gmail.com
Subject: Re: [PATCH v4] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
Message-ID: <20220607161413.655dd63f@kernel.org>
In-Reply-To: <1654558751-3702-1-git-send-email-chen45464546@163.com>
References: <20220606143437.25397f08@kernel.org>
	<1654558751-3702-1-git-send-email-chen45464546@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_161418_550026_065A535E 
X-CRM114-Status: UNSURE (   9.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue,  7 Jun 2022 07:39:11 +0800 Chen Lin wrote:
> +static inline void *mtk_max_lro_buf_alloc(gfp_t gfp_mask)

No need for inline, compiler will inline this anyway.

> +{
> +	void *data;

unsigned long data; then you can move the cast from the long line to
the return statement, saving us from the strange indentation.

> +	data = (void *)__get_free_pages(gfp_mask |
> +			  __GFP_COMP | __GFP_NOWARN,
> +			  get_order(mtk_max_frag_size(MTK_MAX_LRO_RX_LENGTH)));
> +
> +	return data;
> +}

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
