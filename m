Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F59D18157
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1bOouhGYp8qYUjvtk9VBz/g0FK7jRRodQ+2KCWlw7I=; b=k5S4b8mRRWGUFxt9cNNW0dr8s3
	2lqA5t0Kukh2VrIgEcMVcFooYRhIk2t1/tza7/rue6FLk63DTjS4fgPHwKSDNebpK9Pv00/SmHh6t
	FnK3+4o0Y9e22fssCIB/NwInAYywHCDa7t9JKOVJJkyMACRgxnSYRBVE7k8wEscYaNDGlnafJ3asV
	f6epHz534Lx3Psjoo9yFBxRP6E6t/Xu4dMfM9B+bwSxesYZYPe6+rL+Ev+QbkSKf6bo81iHB2La/B
	yfayuFWyhG9pNlrx9xEovnrIc+wG0n0YTLnXDcoT+hbSJhXwVhU1dSwu0ld2F7yoFtNDXHcNvIgns
	sN8miFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0VDt-00000006gkw-0Uil;
	Tue, 15 Oct 2024 00:15:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0VCT-00000006gZH-2rYB;
	Tue, 15 Oct 2024 00:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98022A42980;
	Tue, 15 Oct 2024 00:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69880C4CEC3;
	Tue, 15 Oct 2024 00:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728951248;
	bh=vC2js+3LTh37+eK6v22mAPM7Aj/mMz6+h5IByLtkN9E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KA8B/kcn+CyFsGvB5lRCxHl/oMJ1/+ytr1xDfxtbTs2DknFuUjJajsNy0pBQtNinE
	 aBThc9YZ1cFhAt31Z5v+RM/dhm2JAPTKuGtyuje64hxEH/H5VEHEbjO4USBbUN1fAj
	 guPIt3CzR7l2Z+1Z0iyzUflxo7LwX4BZfgu0zRLrp0OQKlnGPZAWBX+nVhbl7Gsjv6
	 QUT/nM9S1klJHU1VYvDFpllFdm+q/ha04BQtbSPGDMqXRkoJOlhnkVy9vfNjYfYlgJ
	 jQjJ7ODdnQfVsF0VXXApSdXdP/on+vs9Gx0cHlCCgG8uaZ6zjBRSt7o7Mfyx1NvgCU
	 8QE2ujuElZjug==
Date: Mon, 14 Oct 2024 17:14:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <liuyonglong@huawei.com>,
 <fanghaiqing@huawei.com>, <zhangkun09@huawei.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <netdev@vger.kernel.org>,
 <intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net v2 0/2] fix two bugs related to page_pool
Message-ID: <20241014171406.43e730c9@kernel.org>
In-Reply-To: <b1fd5ece-b967-4e56-ad4f-64ec437e2634@huawei.com>
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
	<b1fd5ece-b967-4e56-ad4f-64ec437e2634@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_171409_822076_36566404 
X-CRM114-Status: UNSURE (   8.59  )
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

On Sat, 12 Oct 2024 20:05:31 +0800 Yunsheng Lin wrote:
> 1. Semantics changing of supporting unlimited inflight pages
>    to limited inflight pages that are as large as the pool_size
>    of page_pool.

How can this possibly work?

The main thing stopping me from reposting my fix that it'd be nice to
figure out if a real IOMMU device is bound or not. If we don't have
real per-device mappings we presumably don't have to wait. If we can 
check this condition we are guaranteed not to introduce regressions,
since we would be replacing a crash by a wait, which is strictly better.

If we'd need to fiddle with too many internals to find out if we have
to wait - let's just always wait and see if anyone complains.

