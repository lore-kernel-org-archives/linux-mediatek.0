Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC0DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Feb 2022 06:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BSnM2UsXWfwzUGE3SiG8yJD0Iysy5X/KrUz6MkVtNM=; b=jY4AWk02d1fZt2
	LcWt6z/BKiKhoLf4P2GtETI9Z1snbQhW005dw0aJvHIExLR+Uu7Eea/Gs+bRrE4rTL5rdjSHhk8Lc
	PZxgKUBTBjWZWZg3tWUR1NJY59UpSE5v1gkCFFFHXYBVVPNppqnyMY7XGv1NBoSiAFUyTiteDAY9c
	WAw4r4rQDS8zbhXEsFkH5wY3rb8xCuz9bTlAj5iUziGtoMwuE8QVSnAa8JG8mOcMCWRz+oCAZ5+sj
	ZOCxENLAUcIGmRwjwWxgMVJezD6uhNbLZyLKpTXQCuxPoREQmEvkZeHP8Mr5z/s5PqV8H6t60Khkz
	Ofm7S7yW0flo9RZWEuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNqQC-007YDr-IM; Sat, 26 Feb 2022 06:19:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNqPz-007YCM-3Q; Sat, 26 Feb 2022 06:19:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8D1B3CE0B5A;
 Sat, 26 Feb 2022 06:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB15C340E9;
 Sat, 26 Feb 2022 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645856329;
 bh=cvyzwbI5HARqFp7JbFizipx8dXGTknMqqqUTGAQ4dbY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X/VL0230OLIO4M5oLHzzJZKdCAgFnLTWXxQroiwJhIVEMCN5kXXkuci+WfosgEEV8
 1sUzZ872pdaUYm6oNcWM5AbtEdPVi+/GQhqQea0yUfgoYY/YLvEstlhVvt1yR0Ls6m
 HSLadE9rtPuBw2gpIuu3Kxuc5E7LaP0RSy8s2I0SJnd4YDJszTVbf1yc0lZfXdgRCI
 WdX2WmHUR0z0GRd7fB44mFgXlKERNyqSOO9AWjRnm4B7W5n+xLzaLGH4n3aRmOtk0J
 9cApo5K6KMk+DDhbxfQvj+q1rcmS3EypZcDiQ9RQ+WHPOArPx6BldhjW+O3vQgvpwB
 W3kf42TomE4Ow==
Date: Fri, 25 Feb 2022 22:18:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 03/11] net: ethernet: mtk_eth_soc: add support for
 Wireless Ethernet Dispatch (WED)
Message-ID: <20220225221848.7c7be7f6@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20220225101811.72103-4-nbd@nbd.name>
References: <20220225101811.72103-1-nbd@nbd.name>
 <20220225101811.72103-4-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_221859_365252_43734A44 
X-CRM114-Status: GOOD (  10.69  )
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

On Fri, 25 Feb 2022 11:18:02 +0100 Felix Fietkau wrote:
> +	page_list = kcalloc(n_pages, sizeof(*page_list), GFP_KERNEL);
> +	if (!page_list)
> +		return -ENOMEM;
> +
> +	dev->buf_ring.size = ring_size;
> +	dev->buf_ring.pages = page_list;
> +
> +	desc = dma_alloc_coherent(dev->hw->dev, ring_size * sizeof(*desc),
> +				  &desc_phys, GFP_KERNEL);
> +	if (!desc)
> +		return -ENOMEM;
> +
> +	dev->buf_ring.desc = desc;
> +	dev->buf_ring.desc_phys = desc_phys;
> +
> +	for (i = 0, page_idx = 0; i < ring_size; i += MTK_WED_BUF_PER_PAGE) {
> +		dma_addr_t page_phys, buf_phys;
> +		struct page *page;
> +		void *buf;
> +		int s;
> +
> +		page = __dev_alloc_pages(GFP_KERNEL, 0);
> +		if (!page)
> +			return -ENOMEM;

I haven't looked at the code, yet, but this sure looks leaky.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
