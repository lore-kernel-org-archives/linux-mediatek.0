Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1365C25B6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 02:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCzwcNC3SWpaGLZJpKOAb5Y4pVlFP3eEBgIns2avPjk=; b=onOmk6YZp8InCOK9oeSiT9T/cQ
	X5H1n26kKx/LLq+cRi5Ss3Il8FxVDnJ9NMLCwkMG+65Z4ViQ5Y3cVVuR5Ilt4RCw0U09Q0fZ34iti
	DJBOeU1TsWhiU9nhEhfWMQdkdeXV1NZZezWe6sa6fDXEEp/hgYNhzfw/ICw/QQYlRas+V+5dG8YtR
	8WmimER+bZcuwVNGR0cZotKcG8zJTthnX/H0WY/T6rN4TgCjm756FLG+U3uDN5z5I+79zkqL/fiJC
	N136fUOEUggCWXlv8TUtyurrGJaTpPxnx9uFhtd8S8pF32YJyVzoAgYZCu/uEhQLxLB54E2CT4woV
	eU7+96tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv760-008eKF-2w;
	Tue, 24 Oct 2023 02:24:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv75x-008eJZ-32;
	Tue, 24 Oct 2023 02:24:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C28BC6289A;
	Tue, 24 Oct 2023 02:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8A9C433C7;
	Tue, 24 Oct 2023 02:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698114276;
	bh=b07IW6onHHyGfMZgKFIvnNFhOtkZkOOgJ9t2POWbmRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oy3/JmEHd9Z4kheIA9EKM6UApScmCdcCisvBFeijpylMGB9icb/ybF52szjNEsFNK
	 BsDsG6dV6iarpwc9ZpoPPBdwWYgB41lj5TEae4bLE8kbQEcHkip9FzEN+b4KLUPeNi
	 i/7kjU2HPzxUEnOtIVHsNSjxXqYT2aqUe0rZg7IWJjhpVtiGthUOTgkYhdBN5UcnZv
	 CYMNlJRywkXhSd7ef0W1v2d8kqo/XIiSKIOQfYCIuiU88NDnmL9ZDP0q6HfH/XS1NA
	 h+J821kmQdxrA/lY5pS3jvkT49rmvS8t0X1TMWLmV2TK+lFExT0LGsNX76dS73YFZv
	 5h2gbbKLSqDZA==
Date: Mon, 23 Oct 2023 19:24:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next v12 0/5] introduce page_pool_alloc() related
 API
Message-ID: <20231023192434.40f5ee98@kernel.org>
In-Reply-To: <20231020095952.11055-1-linyunsheng@huawei.com>
References: <20231020095952.11055-1-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_192438_042034_35F9A9E4 
X-CRM114-Status: GOOD (  13.69  )
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

On Fri, 20 Oct 2023 17:59:47 +0800 Yunsheng Lin wrote:
> In [1] & [2] & [3], there are usecases for veth and virtio_net
> to use frag support in page pool to reduce memory usage, and it
> may request different frag size depending on the head/tail
> room space for xdp_frame/shinfo and mtu/packet size. When the
> requested frag size is large enough that a single page can not
> be split into more than one frag, using frag support only have
> performance penalty because of the extra frag count handling
> for frag support.
> 
> So this patchset provides a page pool API for the driver to
> allocate memory with least memory utilization and performance
> penalty when it doesn't know the size of memory it need
> beforehand.

I don't mean to cut off the discussion, if any is still to happen.
But AFAIU we have a general agreement that this is a good direction,
we're at v12 already, and it's getting late in the release cycle.
To give this series a chance of making v6.7 I will apply it now.
If there are any unresolved concerns in a couple of days we can drop it.

