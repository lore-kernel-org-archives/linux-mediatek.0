Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0078AE77188
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2025 23:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+t1a+Wcy+KRp/X70C+xsAph3Osz6Q09Wwfd7it6d6E=; b=31XmKdzpdhzuX2CH80cmcMw6Pi
	Xe+T/pAoGDSH+40b0vX7ZVyGkbw8KZIagAeOWIENkH6Yh9ZgPUQvm+sGIvj2eemrr7N341b6eUSXc
	2SPQpbuoKA9g4CJhHUzFjnWkZ84LGC+/gSwBbAKgqMECrONAZgVMYa/EcM07FQ/ThCPWchIlkrhZu
	a71IbRb3HlZ/3nGtCSLc7g6BTzXyN/hK+USvcOSk/taFbR7uy6b2jZAz9O4GEz0Exbz/Vp9nIPVXv
	M50DVIE5E60+xA6oszIGL46du4FThshgIgdx4FYp7Fw5fssFbNBA412ZFBmyUrOm0LLrb8MaLq+4O
	jVzneihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwuH-00000002z6y-0vvR;
	Mon, 06 Jan 2025 23:53:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUwt4-00000002yvY-1PaS;
	Mon, 06 Jan 2025 23:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58059A41F79;
	Mon,  6 Jan 2025 23:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAA0C4CED2;
	Mon,  6 Jan 2025 23:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207516;
	bh=Fu660IWX5S6t38fvF4BJ3mJpDywwH3eUN5CgaE2RF48=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=THtnK84Q3Oz/4hr7raXMxtb5YnvUsRTP0Z19d7W1LrVc020uM7dHfZQfaxiTBglrb
	 0uuuv4Ij3lvMxNaYs2U4xkdM1Mx/sGjqu1JF+EzVap0/mx7qJl607iIVwFe7HlG/s7
	 X14tjNK13QKsu2ZiViNL1koaVJB20ifxb0W3EaYPXmPLvd3Yw+D43CTpT1bSdEobVq
	 enX3QqiM+fai2TD9PUP4jYCjrP+vp1tAnLo3Mv9k74nhRw+qMFF8RVBP1HKE/Gn7Dh
	 zUjVlCwE6j30/RjhJSLQ4oMUTU+dCUPoDR1ZtkaF7VWo4Bdbpz0SfAdBVCoaM5Jkwm
	 nSJEIl5AN0w9g==
Date: Mon, 6 Jan 2025 15:51:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <liuyonglong@huawei.com>,
 <fanghaiqing@huawei.com>, <zhangkun09@huawei.com>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, IOMMU <iommu@lists.linux.dev>, MM
 <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <netdev@vger.kernel.org>,
 <intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next v6 0/8] fix two bugs related to page_pool
Message-ID: <20250106155154.7c349c67@kernel.org>
In-Reply-To: <20250106130116.457938-1-linyunsheng@huawei.com>
References: <20250106130116.457938-1-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_155158_450660_6A52E4B6 
X-CRM114-Status: GOOD (  11.95  )
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

On Mon, 6 Jan 2025 21:01:08 +0800 Yunsheng Lin wrote:
> This patchset fix a possible time window problem for page_pool and
> the dma API misuse problem as mentioned in [1], and try to avoid the
> overhead of the fixing using some optimization.
> 
> From the below performance data, the overhead is not so obvious
> due to performance variations for time_bench_page_pool01_fast_path()
> and time_bench_page_pool02_ptr_ring, and there is about 20ns overhead
> for time_bench_page_pool03_slow() for fixing the bug.

This appears to make the selftest from the drivers/net target implode.

[   20.227775][  T218] BUG: KASAN: use-after-free in page_pool_item_uninit+0x100/0x130

Running the ping.py tests should be enough to repro.
-- 
pw-bot: cr

