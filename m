Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF6EC3DA41
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jul 2024 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+ikbT8qcvfjRS/IMil/iOK3vup5x0S77gr2inY7X+s=; b=cuAizV0BUVZFCuVDs5Mp9dYvQn
	U4buNzcEeLujhU4qX8b6DN66oKn726QJzRku3isGkXvbq8d5H6FOaO61gpP1nESOlsKQ9ELA6NdXt
	dMTvXGd+Da16uKXyRTUeYor2Ul6NCDz2w1oYoLuzyqu1/02rTUJLXUoZlubafe2dhMHq746VScWF+
	gYGQQOJ7gsCxZiLbHF6J30H4SXMZ67BTDDjxODW6tiVlbMUpffDnzzRtyHinSAeml/4VNLnvNWW7x
	i7ZhMXElDL0sLXkTnXH8UknWkhJ5Favp7JoIlBXQBB4hptAmILsV5sautl3n+tY1kkDOBYE+L+Zd6
	TjMJhF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7qE-00000006lZd-0qAu;
	Tue, 09 Jul 2024 10:12:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7px-00000006lTg-29oa;
	Tue, 09 Jul 2024 10:12:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7420CE10C7;
	Tue,  9 Jul 2024 10:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B39AC32786;
	Tue,  9 Jul 2024 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720519957;
	bh=IgWdstICSsXjuEa4YtQAmHX5uWikGdJsKamOFEMzRLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGCWcnbPQ4ga/kvvoYn4vXbbjufVmKRYpBD3UG4sajUHKazgZJEKqWPKMeAS1+sUG
	 //n0MeOMOQp42aEyQWTZ8KLxZkE+99QMs9DVAyaKp+P1ib4MIjX70CzaIjA69KUGq0
	 k87CvL11YqfX0UmKgbZSLcPWcnER+UK4EAwSbRWK7mY9GZARiRvFNVBCGgzPpuKtC2
	 vLsh9UqxFEjD+qP4iAL8+vaf1E9xHhe0SzciEjZliOcEyYJZeZLVEV/BaYYICTMnUT
	 y+628Z/b2yEu0QVkq590Qb1SjUO0cw5t28oAfWstLWZxrOqrCkVc5VjyYgTcuv2Jd7
	 WTm9miuYLhGeA==
Date: Tue, 9 Jul 2024 11:12:31 +0100
From: Will Deacon <will@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Xu <jeffxu@chromium.org>, Leo Yan <leo.yan@linux.dev>,
	Daniel Stone <daniels@collabora.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] docs: iommu: Drop the stale entry in documentation TOC
Message-ID: <20240709101231.GD12978@willie-the-truck>
References: <20240709101055.27178-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709101055.27178-1-mark-pk.tsai@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_031241_752045_20225700 
X-CRM114-Status: GOOD (  12.42  )
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

On Tue, Jul 09, 2024 at 06:10:30PM +0800, Mark-PK Tsai wrote:
> The Documentation/userspace-api/iommu.rst had been removed,
> so should TOC entry.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20240709190613.3fd8b7ea@canb.auug.org.au/
> Fixes: d926e7c04843 ("docs: iommu: Remove outdated Documentation/userspace-api/iommu.rst") on linux-next
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  Documentation/userspace-api/index.rst | 1 -
>  1 file changed, 1 deletion(-)

No need, I just fixed this as your original change was on top of the
branch. Thanks for the quick response, though!

Will

